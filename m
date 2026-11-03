Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A66606A33D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JycXThAh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=m/uCbS3O;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ForU7Ac/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=; b=JycXThAh7BzTp2
	RhhpdbJ0xEcPtmeCOoBxzwL/9ntm3GydiAm9Vxn4xpoLobLx0czHBL4SIyfedyRsuWPX2Wx1cpQHR
	sJEN0QtWLZmum575L+dxUGWvbLO2s1EI6FKLXTGmelwMZarmuzzFJNIz1rwVUBSWpFoQqkB67PTPd
	4ghpJY97BwRInkWM4Jzs7Qm3XyfTchpszwLPKrm4k5vFnG1JAmevwcB75K9GxAEKyiPxOM63NpE9W
	zq+xS1l/vxflilgOpIAtFQP8VTp/15R+nl4UuyhDT4A8JoFUb+9IsCk7FyPiPPMkqNIUq/WJdSWuT
	aoVRAGO8IyYBs6PyKsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ag-00000001Oiv-0xJS;
	Tue, 03 Nov 2026 07:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AL-00000001ODV-1ZGx
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=; b=m/uCbS3Od6cQA4DeukZxEwC5kB
	EyoHRXXK8Zh1XbASiTKfjC6EOstD23kFTHmk5/UQR6hepFXmKHz28fv3IiwCX6jpbziPw2Ri8KwR4
	xfYAhK+LqSGrd/bJ+gaU4BYwgkHFWeEwlUWX83lvafopblnMwbAkTJhI0n+jn3h4Ao8Hd23qu/SQG
	f4hsZKvsTDdYnpuYK82AIxua1FBFsTmV/cBSEDMqKQqNF/aypISkfAjhAUM7PmdJ55n20r91vsWrp
	4dTf9iNAe3FOJW2IeqdpVRHmtCPoM3WtFyFYtRqdsyQw4ddjYMNPrhvucwnL02usETl/yxG4kvApX
	FqNFTMJw==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AH-000000007ld-0hOu
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1984942a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=ForU7Ac/mHYw8eHIj39ByECAb5/JUJz8xbkfYNoyh2OaIx0XjYVczYYFr3gcltaXI8
         iNqWKlHEXwVNBpznXpC/7Q6SzdFAChMyp1N9cTjLKEt3SjudSh1xj86ANzZ54xN/IsWV
         M4wXOvwVzyWDw7+4QfgAeImVDnF1YbxGNuFDdslVFS0MobC9x2WqA6tB/jlhOZc7K1fX
         C3IpxVF+H46AqKlFJyhDJt/cc+beklzsNnOrZlQBDW13TpokrTan0j2n0Yn8HCGKeCyd
         brdc4ET/KYMMw3kvMyChMLiSIzEsAQXUYVgzCauH/fefdurqN0bW5mY6CU07BkhoWwjG
         ZpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=k1pgq3myfQMk4hz2o2Wy3DL/TW1eGPTnzJm8ZV5I56+g2rcYPR+veMI2uu64ApRd8u
         BEt/+q8+cRIZUNS2iTc/om5zVaVfGN4a+7BBK5hLoABMPKp3BQ1TsLWB0e0wD7dIhF81
         poYOtFquER5Y+dLI8+2sZrpnjlMIWbfS7+NmusX6sbud0g2P3k+AaDpsSfkIMMOX0SFI
         ovBzahq3gVSfd7IrrCo1u44+QYMdqpHMC/a+qSo7BLYpFmdBqZIQD34P93PfyaKjVfPb
         nh+ZhAxKcAHa46QVHLYumlKF/R9n3VfaiockRRIe2RmV3ueDLDmcOS2rwxfzNYmNEElX
         iJkw==
X-Forwarded-Encrypted: i=1; AKwUvBz5yDEMIgwZXxFMTUrw1xBlzu9KREw3Wt2dafAzDSZOnKtPDpY+4R6DENh1jJqNkKkKn9FYBC3M+jW9z4uTHA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/BoDDcn4ojtBYBsjAbBx3/5TiMkaw3aixZej+ftn8fccsEUD6q
	ulWz/H8sWHwxJjKf9Oz5JaCygHFPxyyCeVCB4nnN5F82jYmDolIWiBOU
X-Gm-Gg: AYBFou0zOqn9+BSRLK0aGXd235JG+1A36AtGfAkTpqELVRWa3fcQgIlHY9Actyk0HSC
	AwZpqpb2gW69h4VI5hqmnDndmK2DYOqtl2uuZp2uAzPqIq+gyD5Mk2mbb72FfZnvPm2jg2bSFZ+
	WLVGpKnVbHgS896uhakA1y/xJX9JL9VkbLwbrOxIMIE7tYVYw+WpeXvAgozBsw0NzI7aZ5GZ9JU
	pm1X4Ymok4lxQeL+T1TzBBLu8QaIvEShEF7+WoqjCYXEtL2gcuDZeDzdcWNcyLyMnzCd9ohLUEC
	Yy9FOgMq7yfZVkNMz1LwNT+riPDl/mCyPxixlJ3USYT4opYWdA8VL0OD26nRLsCMgcmL5yaTd0D
	pAdQT1a+oVPF2zGwcTCXaIrsTkvWSxdBhJM3S3fKwfMJo7FV8/LwSU0mhfcITWSbLH/jtDZjH8R
	17mD8afLvb4rDu9eX1wEXm5M4x5YJ3m2yiEtMQSFDTcmlBPTOekpvXsEaUkebKYXBupTcHBZJz2
	/Z912Cg2ifgKefQK2ntPRE3/q51yQtHe6SXWPPSZ3M3TELI+0rQNGX9V8VSBv8bBv7rzOnIwWAX
	lbIUaUexRIMTq8USnAkXOTBCvRHWw81HhxTTiSeDo3WB6tBx9TtYPn7GolQf2/1vuGTM85M2oRi
	Ru0oeC6HxSclESziBMlhaUFzgYqo6pUizgAInjsyZK1l+JEaNtIYGLeCdCVxB8n6++DPX68DTRU
	TFyMA=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074241_911394_C7600556 
X-CRM114-Status: GOOD (  11.04  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0


