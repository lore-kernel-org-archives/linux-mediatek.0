Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F1606A33F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLcZdh1S;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d0oR7YLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=; b=JLcZdh1S4r67ER
	3/9OUnQHclErIxswkDNgQwvltBWakZ9t0ECPd1neAMaBfzEXU8sgh6m0Vd3cdjT754Pq0sDvpwL23
	Yi2gHGMrTmAooVfOAFBXQP4DhB5VPpl+RL55paT7IMdZA9c7A7n4b1UFnudJY9oZ2PnQVz0GZeG5C
	jOMP65wnPX99Fojcp44VsrjH95roxFOYqWuyaVUwkBJmXOg5E5i75sgDfEIrmrCZ5+jEcxIcT2PsV
	fDNKoQPwjgi7z+pZXEf2bI4r5RyU0B9tS2+63+aqsA4EZEWB1ZdXouRnu1X9UNShgux+VCiJqxP9J
	Wy62dtAX+hmXA9CJPEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7P-00000000v7y-1h6W;
	Mon, 09 Nov 2026 14:13:07 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7K-00000000v3w-08be
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:13:06 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-37000e7234bso831816eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233581; x=1794838381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=d0oR7YLyEEf9x8GbxwCV5Y/xSpilVE/DzyWxj9yKZFqfvOswYbTnDn+Pph0bZ7Hmcm
         T+fVO8Rrg7iPvfwhY01YpYqc7H50cBOhMOcVkLO/ZZte3N8F7netqITBAjCgcGmvXzNN
         S5GhKBuZRbJ3lDDUDZ1q9SskOwbKNMM42+Cjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233581; x=1794838381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=ezx2qeEQoXzDWZG4Gk25U7if+387Iu0dtGU1/gqTNZR9ju48GrXcBCpgXhkNtYqnUG
         rYmrLYundZ8ZEu27TqJTcAa+pq03CNi8M/B20/3M8ti2Xpbbhw0/z1SkseEvHXOW1TnB
         IyieTQBWMOCWBqiW5KwTqGkKCcH2L2NKbZPu9zFpQ6NZTSMNs65EHU1dRbXjjeyNVsyr
         WbEVydJ53owzhqaLbK8OPZjcIrRA3H6/ERdMljuQmZJgjfT0VpRIuQS7w27gAkfhNiz/
         8DxlDPCwUacyYE4Fv9ebdoqLoCTapsOCvDIvAlcZJifHkxVdsTv+8D6eyJNUGoMJs5od
         b71Q==
X-Forwarded-Encrypted: i=1; AL+hErGyMCpiC/C42mRxrOFHkQWHGHKAY/YkhFxwjrub9oaSsW2pdfbbBA9taLPK+wloBR40oPMYbsO/JdRIfrDDpQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/6kr/kUtDk1LjcaUpMDWSf2UgOxGDskGPROFDbXPXLfhQhM6W
	z3QQVy/hP385rN7EF8yMt4oHqo4BleBUxZnAtP/vzWrWnkKo5MqGNxofRBm881+ykg==
X-Gm-Gg: AYBFou3oR8ywCiA2T6dX/PA9mbw5a1xgwr+PNfpg2tBYGcZBkL8iNgU6JVyJvUQLyIr
	Nl1Rqg+XGk67y0mxi8TeDiVWntGAdndpLxwYlyXT3PtT7+STkSDVB6tkCFs4Gpkaux+4T2qw03N
	hcwGFraARUbXm5TxhuVtm/BEoGDXYrHwT33+igZJ+Mai+J0jZenJpwJmlbU+79RtWdauUEFz2hr
	gKitu+60wN6U2juwfQ9YTOCau50DvObUYuRzoTZJzNLpjnm7C7yQn6RExXNiIyQnIN14ZoANawE
	FFZHShQyMcfK6GZ0JvxPiFSQwfSL6QmepzPuVX89aXB6X+1kZNNtcRj4e/tmZwOdPQOHhPnfI4+
	60riJ8f+WhTOJmbJXzOspdiDLS44du4b9JGrE3ebBAGkHYU0XCI1LV13tQ9BcPLyXV8/7Ji6qYN
	xLuJFLh2lB/xlcCzPfn99/IBeDGwNzFMK2ckWP1eewJgYiDGQ30xppE+I4HqxLFenhxYeuTAMvy
	NDtILC41nxr2DHEyAVTDi54u2u95S4yFj7CCzzc3FMkdIwnOnWu7vTyqTX7g3FepCbi4ARi/jqR
	FGR7NaBd/lUQ0Qig6lDqw6oyWmxFBkPi+3i/fJw10GB9oiv5JZE+vl/b/YuE
X-Received: by 2002:a05:701b:2618:b0:189:ff2b:b194 with SMTP id a92af1059eb24-1b39fec8a89mr5374626c88.16.1794233580747;
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b375603ee8sm12930496c88.9.2026.11.09.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage ranges
Date: Mon,  9 Nov 2026 22:12:32 +0800
Message-ID: <20261109141233.983830-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061304_967537_81052041 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DA9212 regulator voltage ranges in mt8173-elm.dtsi are much wider
than what their consumers allow. Tighten them according to the MT8173
datasheet's recommended operating conditions, the CPU OPP table in
mt8173.dtsi, and the ChromeOS downstream GPU OPP table. The DA9212
output voltage is programmable in 10mV steps, so the new limits are
rounded to those steps:

- BUCKA supplies DVDD_DVFS1 (the Cortex-A72 cluster), rated for 0.72V
  to 1.131V. cluster1_opp goes up to 1.125V, which the DA9212 can only
  provide as 1.13V. Limit it to 0.72V to 1.13V.
- BUCKB supplies DVDD_GPU, rated for 0.93V to 1.125V. The downstream
  OPP table goes up to 1.13V. Limit it to 0.93V to 1.13V to match, even
  though it slightly exceeds the suggested upper bound.

Comparing the voltage ranges against the datasheets and the CPU OPP
table, and drafting the change, were done by an agent. Manually tested
on a Hana (Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 579ce73de7ad..a1cb9230158f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -315,8 +315,8 @@ regulator@68 {
 		regulators {
 			da9212_vcpu_reg: BUCKA {
 				regulator-name = "vdvfs1";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 720000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <4400000>;
 				regulator-ramp-delay = <10000>;
@@ -327,8 +327,8 @@ da9212_vcpu_reg: BUCKA {
 
 			da9212_vgpu_reg: BUCKB {
 				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 930000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <3000000>;
 				regulator-ramp-delay = <10000>;
-- 
2.56.0.455.g6c5a503b38-goog


