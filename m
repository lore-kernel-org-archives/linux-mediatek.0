Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E1E606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZTSpSw8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gQHfU8f2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2PWIBII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=; b=EZTSpSw8UUdjH3
	wb4UFkYx3o5HnpROT7MR3SOZhF1CIomwDl/2uwXmOdIiwUFsWmeFKUcMGPWznNhpe52sAGwqF+/PS
	/yTZ+WeHEOc75fL8YQ4FQL5ZsLE0ANOtaVimMSnSbph2J5Fnw3imAOEgEdAbh7b/BaZ1wHpu7yjo1
	Td+dqrFM06tbAYiadooYfAiBI8X6GEKfZhxPQozuJyBUNWZgGWktMtnGbHRIAd00IBPUPBwDT9JfV
	wOJJuFSbo2x2ExMw5Pg3NZRFWJLOqPnjHXxXQ9qygZFt5hrO3zTdQP6wW9n8CAMN/pVdRvciSRX1I
	Q1AL3sVFmarZVN75qxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AM-00000001OFR-0cBo;
	Tue, 03 Nov 2026 07:42:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99U-00000001N66-09iy
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=; b=gQHfU8f2aqv8Eo+jzPyRWaXu9p
	OQ9n86fxUSEqEux1OzMG+lhrKvxu/cvb1BVmolt95EKt9xsO1UW9X7/3+KgOuzFkk7xDqLYvvoHo0
	NhYCsjCiBDeuptHNAjZeUunTQ56sFchQ0rVUGlcXD/Q819WEL/zERetPGxBbc5BYiK06M9/qG8XB2
	tjdXkB+swczOqLXR8nm6alhUOph+1imhLhzwFT+Mn8Wmg8y0TqNjbZqbelzFBK+gRbJf/UmbQdDTb
	gkPSXo9aeqH/cK3JmrFqkGTu6jKzEKUdhE4kZh6KHNiH/B9sXCsttoiBDCmuOa3k/PgBMklokuPoX
	q0oe2AEQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99Q-000000007bv-3ljL
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2312433a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=n2PWIBIIo8oJu6Ax4DHZAU+fbjQnSq3qeQeBMmYXHPKGqyTjql4sny5EWo21fBNCyE
         0Qv76ILibNu/xHu1XR/PRsImwiZUCK6aMZNb0XCv8GuzQaR1RcicRqiEoNYm1U5jVy4+
         CADOgsa2eZtjbGGhEWEWcukw6UCue2yBxAqMP+9YIFkqqQlOsUxxN6s/sQM7gqMgZ1vs
         Mu4SbbEZFeN5opsaSX3QaotquAVHF73Nw2mQB+HxqRon0w/Nj+6ARcS3h15SvWRnPz+L
         S+tYO+arVKsOe4kQScCGZyUPW0VtCtTY3ymKJcfvWz38xOz/PPOSPshku8wjVHmgUvE7
         wIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=Ss7cKvyNNucH/laD2g1hUxSYqH1gMu6ss/hanZgKdmlVNsHyc+VRE8qSMgwfcc8L0V
         CGv0h1Qh4Gl0bveO5c7oKqInWecyfA/LqCBSgG7FWSiTZQMxPy1YMKr67OSo6spNw1J1
         QsNwlPo7Poq+dsqFZyIHDOOO0qzTNVTXmMfl/E/arz1qnKJDAlKLrTEJFl9hU2+Vglpt
         Bzek9OSR6pBcAtYdiLJoAhhvCjWO04M8dAgvkA1Rwd8wG7tm9JzWyqbNrwVQzkdM9GU3
         hWkMxnk0B06OgoUcqc2/p8sos62SezBgkgoHdpBn53KDTDJJLi27cuQnReEMwiw+PSwe
         6VOg==
X-Forwarded-Encrypted: i=1; AKwUvByMtKUX2F91fS3M0vkYOQm7KeuS2qZHgFIFPGJ574osY/5b8FSnue94vBymQMTAts2yynRE/BVfjMWnA31skA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8mS66/z4l8XS6Shy8PUgSzS6s2grsOMZipq6RhpK8fj8OPKC6n
	2Iy+cFsaMOt0hGv34JvqWDESuW/ilPvZ0/ARcYyYYKXrWwnnw84YTy5z
X-Gm-Gg: AYBFou1XRV8HoGm+rU2xDG0eHCmCA5cLzzNLDWRJI2gfKwFSdhjBfjCvbJs/ufmCazC
	yQ/7hs+M9EO2Bn6wkwzG6Lp8AvQGgEYL8aoSrSyZ+I+lJfrkpsgijqlrl+NqQc5Z3wg+x1Oy4x1
	gAVtf3fZU1QJKbIVJ3By+fjbA7T2nf04DPehK73Dk6BavgcLkzW+5CBd/5NPR5PhUVKB+gHT1cw
	jL2mAxBiAzwa3uFyPLv9gcZpkA1EcJYBHaO7u4Qvf01AoWYiM2tDu77WomcbP4KRKd1oTYL3uCK
	QPNbOQY8dSR2xDYBOmXwNkgmXyvZ9rUkDrZqW7ttbrjLYoeU2m8FcObmUbQ8L0vRkDzLK92rzUA
	A5EN2p22nPhUtze+uNm8uFlZqa1fotycoHPU6hLtonUd1jk/arlpRRsXF1UCV3B2pjCJX3Nf5Br
	jeId0TTF3CEULOyoDqYInzid1BHaVhnx6KHmGYE9yLfKJUc7nHAQbhrsQBwoxbpWAC+IlZAGwyS
	aqTkNu9IDa1/Af0B7cycrnvnPeauypR2VaM7sgJVjGsJwr2btvqbatfmTaQcBnw9VpIU1bcMVFu
	PjVui2fi4jMCjgnhZ6V88/SD7dGDmSaQWiPa5fVe4tnZqsCubMFoZFD3Nm9SERB/KKstcDKczzN
	jVb7qxuKdecsyMWf/Z+zEM4C4ApXTn72rJnpKnMqBJLFRUD+SVfSbV/QdYSoosUKA6tOuFi2XXs
	/+Zcwv
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074148_997765_1D9B3C02 
X-CRM114-Status: GOOD (  11.43  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
+			link-name = "Speaker";
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


