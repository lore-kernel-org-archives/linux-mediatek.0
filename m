Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF8ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k98xHcx8LIPGVP0kPjUAh1AHHL+3f8QtEI3GBp8SnEs=; b=O3QPfFBPNfvCfV
	FFWBX/3IKe2MDNchku3S64RY5IoC/TqDUo9AotovL873xH+MvgJrJJ40+m6BUueGEN74XEGXUqX+x
	g6IM8E1FdUOShgaxS9sXWvOnq14rfCd8JGBtv8n+ZrPUkneXPc0M4aCkAFiDLnuuE+EDeJ9RLHmAX
	UhNYLn6VLdVR9Xcwu3J+D4AcwfZxv9+34zAUJ9Ul4x50/8r6HPYt98LbpdyyMjP+5VSf1qfcOoRXo
	+rrwAzRjpiGisClXAzY+SxXTI3h/aLcf7N4L7GdBdhQWTsa15vAhagp47Qd35Flq9GeoytjCtkXoq
	cZfy+fEdt3+HT4mBFgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snewH-00000002B43-2OJH;
	Mon, 09 Sep 2024 14:00:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncP9-00000001dBr-0yTB
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2055f630934so31437135ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880678; x=1726485478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k98xHcx8LIPGVP0kPjUAh1AHHL+3f8QtEI3GBp8SnEs=;
        b=C2N0VW4ShhCja0IO3UiXmwEjJUhKQUesvo0NaJaZ2uv2Hu4+CmhQg1oEm/O33s4Fu1
         neqa7ykS0K+V4I522+B+ju2JWru56i+gf0TzDc+4/vKAu/xe6pamfMTE5O6V09Tt+Rf1
         CWWvLQUYHP3REimZFulGcETgjny1kmsbYEjd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880678; x=1726485478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k98xHcx8LIPGVP0kPjUAh1AHHL+3f8QtEI3GBp8SnEs=;
        b=BvM9sCkH84T8UcF/gBMuTT6bNHypGBH8RpXR62TVCIQkltjhSUoZGXrTM6xbhzdeQV
         f01Fm8uPa0nVtsEu+aYTKxPmkATXvDS6MtzUM1pjXCk9iZ3FX9RTTXOWJ2iwfN8vwXS3
         cVG/u6bQ1FTKjhbWpV+mAYr9bd3kriZ17csydFb4jDPqpf3whetduuRRADlTjr148iv+
         Hb2pADvotJ1hwbgh58hHeYJhzoELFNccT4yPRi9ypIG1wicMYfwdA6sw90+63cM/FCHQ
         pbpa94d7qIlvJXB5MtppZ01USWI7gRVY7tJYRm3eMshc1fWUA65WKNohOpEKv3z4TPP2
         c8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWjzXHtJbaRhMVKz+h5NaDYKDY55zX/e/zAGvt+iFaKrNHnzLDvkphHGyksTuI4Q/qF4oxKFz1nKjOTiWYQig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5RfWsoX9/hLpGZhPpVR8aJ7y2YSnX5cO5plZkf10qVNAidIw/
	S3jpJgVF0YL3pjIkPZxN/6VXkDHZ+Ph0754OL7VyKPUVcjiXKv3/dgTPiCAPLasXileMJwByddc
	=
X-Google-Smtp-Source: AGHT+IGoS/wNfT96ErEpO6j2A4iVl+SSYkCw9fl18EPKIdICyKbSqkOSzDP41poSrNFHrcako0/RMQ==
X-Received: by 2002:a17:903:22cb:b0:206:bbaa:84e9 with SMTP id d9443c01a7336-2070a7e5982mr90617095ad.47.1725880678168;
        Mon, 09 Sep 2024 04:17:58 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:57 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 04/13] arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
Date: Mon,  9 Sep 2024 19:14:17 +0800
Message-ID: <20240909111535.528624-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041759_287844_47C97ABC 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two hardware IP blocks in MT8188 video decoder pipeline:
vdec-lat and vdec-core, which are powered by vdec0 and vdec1 power
domains respectively.

We noticed that vdec-core needs to be powered down before vdec-lat
during suspend to prevent failures. It's unclear if it's an intended
hardware design or due to power isolation glitch. But in any case, we
observed a power-off sequence here, and it can be considered as an
indirect dependency implication between the vdec0 and vdec1 domains.

Given that, update vdec1 as a sub-domain of vdec0 to enforce the
sequence. Also, use more specific clock names for both power domains.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index dfbc50c878c4..445d30eee2a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1078,20 +1078,22 @@ power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
 							#power-domain-cells = <0>;
 						};
 
-						power-domain@MT8188_POWER_DOMAIN_VDEC1 {
-							reg = <MT8188_POWER_DOMAIN_VDEC1>;
-							clocks = <&vdecsys CLK_VDEC2_LARB1>;
-							clock-names = "ss-vdec";
-							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
-						};
-
 						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
 							reg = <MT8188_POWER_DOMAIN_VDEC0>;
 							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
-							clock-names = "ss-vdec";
+							clock-names = "ss-vdec1-soc-l1";
 							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
+								reg = <MT8188_POWER_DOMAIN_VDEC1>;
+								clocks = <&vdecsys CLK_VDEC2_LARB1>;
+								clock-names = "ss-vdec2-l1";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
-- 
2.46.0.469.g59c65b2a67-goog


