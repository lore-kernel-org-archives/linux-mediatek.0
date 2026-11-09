Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61461606D819
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fHtzr9W8;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q+P23cMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=; b=fHtzr9W8cvfHjL
	VKddDAzbZP++o+9CrD+n8vsCUI0Y/sjSucsonii3V+TLqGNuA3YcVB9grtf9gJ/wOpA15N1Nl6niR
	C6m826LbZ492MDpBKdQr8KfBrrfo8lt08yzAD5uRb1I/i+XueDrnyQ44pugcfmP1LYZXEnMxzK3KZ
	saythaV+2UK9a0cX8LFjJzaisnh34gG/8+wvCBVg+688HDW09ijshV8UE+f1BJdhDaM/3WnklUMY+
	bdwPYJiEU3y2aGTFoNmZP924UvlSa2Fs4SHMwd4hwL276dwvZxZxqhliV3unPRlnkW2UMAkO1Pmnl
	qgmQqwyyymOvqgD/fXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7F-00000000uza-0NOR;
	Mon, 09 Nov 2026 14:12:57 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7B-00000000uuz-1h7G
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:55 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b244fb7fffso1089816c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233572; x=1794838372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=Q+P23cMQuB7VOMoULaG+hOOl1NDgtIM7f0GFc9OJnl2B9RyUnA8KDUtnvufc3iGaVO
         ALaw4AbO3h/p9fY4akGWdzuYPfRxk6+fCDzISwcB+OwM3Rl5e79uaVdiOsWZlPl+f+YW
         YYqBzQj7qDFuaY3q+XuligMqpf+x1oXmQiOOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233572; x=1794838372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=VL44u2I4gi5jvLtuG0ivvGPPTU/5MR1svj5DWQIqpEplbnVWX/JFiOB7ZLUgz0zck9
         mSXxB+GShFRU/n07RIlwHM4Zp5oyPLmfOvKBvhNWSl6MTtqpSd/zNTx3FuIEuwPEa13f
         JIrJWymz7iVbBnTe5i0GziY66/XDGOEVLzyJ7nsmT184guU/9GAV8vMUvpLdgIHobsLT
         8aXtAOjwtt2JhVBugPuZEgn/7j35HDngqzJJbUtBUmmsM4fwTlZGaicJiFQy9sPGcyj8
         UVptVCac5puKGF4QxJVLyfa373N1HYQdFFLjKuPXErS17LyPDQYSilF1qG28cChJV7dz
         AFQw==
X-Forwarded-Encrypted: i=1; AL+hErGonWaRkXkP2A6bMejuNbOFZKR3u9ENtgwN3lSFjkkyCC84gTZ62mZDsoEbv073nEBcnYSBIfW85i9hi0Saiw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/gknGz58oSooYKkdrnh42D924QWYXt+azC6hkpqDsegIl9yg7I
	Nusxy2kkZBG3yOfAo0kVLAtJaHBQBT4ce0et9g12egkzKxSa9L8m47UiZ/Qq7gExUQ==
X-Gm-Gg: AYBFou1FnHBvwiBwiYAO/r0/RQIDyWvDZPQsSpIAh6tvyR+FpA/Ehjy+0UgXV4FstyL
	HAsdod+7R7gHipNeFzYdw74K6PS4Pt5xJBrhbCcqNLEYHRoBu+0yQS+1K0FXxnflkEsUPmaEE47
	QRo+02ELNTEfdks+/l5nq3jIwQqqZNb/P4IcG25zSzGdNAW5ffpCh1mMaKZwu64dGvw25NShvOo
	0jHxRC8Umt5JqYfuvvtdB7LOiue/qd3Hfix5zGCXESW460Z9ZrkVUBXFheMaQY+7vR5Pbg1Y0tF
	H/Qc6g+uiAGRaXyY2et1l2xVVohlTSjnL7acnU6cdGkFFkyKpk37bUpMTJWo7U8cjNPsQF3iM3e
	AaZqW/ooM/o20zmMAWRRcMdzzBHxxoAp583IynZ/4tLXIxlJ2Qhd1DBvaXyjBMpX0F3/z0ImOK/
	5omcXrEvsWAdD+9IXFUIW2SD9+D8WimbyBS6rgZgdbCfL2iNPSYgZX4QOVvDScSYyhoX6ExPEmp
	knfEl1snuS4SRFEH/IRFFowbC0J2VptZE3veG+dlNgA64CmyuWpwFzPC017sTtp1fHAfMOjJTTP
	vreblzw5Mqqb5cTDYSpO3g45xVaJI42TrOn6FKU2Y3mMC0r6otFE6oonpmT8
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr6517005c88.11.1794233572139;
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b37560d95dsm12254569c88.11.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
Date: Mon,  9 Nov 2026 22:12:30 +0800
Message-ID: <20261109141233.983830-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061253_715405_C0A4225C 
X-CRM114-Status: GOOD (  12.53  )
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

The default names VBUCKA and VBUCKB don't mean anything in the context
of the device, and don't match the rail names from the schematics.

Use the proper names from the schematics.

Manually tested on a Hana (Telesu) device.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index be6e6fd7cd36..c6751adb1c2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -314,7 +314,7 @@ regulator@68 {
 
 		regulators {
 			da9212_vcpu_reg: BUCKA {
-				regulator-name = "VBUCKA";
+				regulator-name = "vdvfs1";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
@@ -326,7 +326,7 @@ da9212_vcpu_reg: BUCKA {
 			};
 
 			da9212_vgpu_reg: BUCKB {
-				regulator-name = "VBUCKB";
+				regulator-name = "vgpu";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
-- 
2.56.0.455.g6c5a503b38-goog


