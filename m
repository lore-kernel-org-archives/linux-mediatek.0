Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A567CE7D10
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7arz2GOR4HIAXAfbaFzx9rN3NGNRkgqXFpAbKN4p48=; b=fIRmpwKGCOc+OE
	Xlq1WS3Ur0RSRGPELfGkixOfYs4f0dbmsUK35WGitXj2lMBn0r8fUarcqhvEMGmxxxx1+rWAEEnf1
	r1Ry6eoebl98cANnGmqjDEzu01Ipm5wQiQ0UczhWq4VFoPsmYCavXa/oHiDZilJtwlCVwU37iwdkV
	aGTlruNlZcDpzdIIzDY9jyhC7secMwROgqAYyQZPdjMbxnIsFy9d/N/88IUbpvpQPIqL+w0oksC+G
	4agJnJ9yMA7PuM0WArUA8YvL+K2gjWMMXyqQ7GnLsC01PxfRHY5iWm/KsY1lGJh4YJOTFwVyrqcdC
	y+dBgUxN529WJBYvDHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbJS-00000002ZUW-0a3s;
	Tue, 01 Oct 2024 11:45:06 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6O-00000002WPs-2Pin
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:37 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6e7b121be30so3593876a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782295; x=1728387095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7arz2GOR4HIAXAfbaFzx9rN3NGNRkgqXFpAbKN4p48=;
        b=ZIjlw9zDYm9tmj8H5dr487hj+HOPOpy+EeyplrbXTTpH3ShHRlzXhvqVz526H5pNXW
         NjJoUfF8T2OPB84BG+/jVxbGn7BxnzIXfe7x85oUnR2OubruzL1rDfmtUQ42TjgiE0sr
         KhlqFe888PcJPcX7acxUCCJbHOopeHXhwXoFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782295; x=1728387095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7arz2GOR4HIAXAfbaFzx9rN3NGNRkgqXFpAbKN4p48=;
        b=wLULDBz7Rn1IlmB4mE9gxY0UvMZCPl+gjrFI1bUGHhVmU5XCxueSPc0TKKBXHADSys
         szYn97shhrQ8DoeyVb+xKFEOQ4oOz3kNRKIxBguE/s/hJYj5Pv5kvPcJ95mCcuEjNxxM
         s3qFMvvvkhfTYk0QIdRdWlR/EWkm3Z62n3GnxeEsJAs5aj7bGMirN1SgLoS2affbZnsj
         Vf7mazeyQrBaYcHlO43qjcq6AnlMEMGknDwaDcCrYrzMxSmpfRdEnW3gs0xxZybytaIX
         oyiwOsEQZliFyhbN0WwxQcs2dOMa88hb6BjcaqXZuCYXXjfCWqN0aLMe5PtnLA3VArhx
         K8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ID/KSMPNSoyX8xPEQOwWFMaQ6xG0w+v+fG4X7Vp9cgWfeslhASxfh02CA0BQvsfwTizeqJgi57eJlppLpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXKnVm6JRRz6XpQbViKkC30NDr/1agLBlu17+3UQcjPdPGC9vU
	H87HFtX4Ah/5L02NOQYYu2MG45jQFxP8A21vdqGNo9Ner+x6Eogo1UhYoJmASg==
X-Google-Smtp-Source: AGHT+IHdeJ+m2YdxFmcKkDEUnn9huq/Q65T1UQKcTtMSHmlkaYTIq2vIz4YB7usbL5TVj+ABMTIHsA==
X-Received: by 2002:a05:6300:668c:b0:1d2:ba9c:6d9f with SMTP id adf61e73a8af0-1d4fa69ed6amr22343842637.17.1727782295442;
        Tue, 01 Oct 2024 04:31:35 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:35 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 6/8] arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
Date: Tue,  1 Oct 2024 19:27:24 +0800
Message-ID: <20241001113052.3124869-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043136_647989_C2E6843A 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek mmsys is more than just a clock controller; it's a
system controller. In addition to clock controls, it provides display
pipeline routing controls and other miscellaneous control registers.

On the MT8188 and MT8195 SoCs, the mmsys blocks utilize the same mmsys
driver but have been aliased to "vdosys" and "vppsys", likely to better
represent their actual functionality.

Update the vppsys node names and compatibles in MT8188 DT to reflect
that and fix dtbs_check errors against mediatek/mt8188-evb.dtb.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69390da9cfe0..790315c1bdb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1779,8 +1779,8 @@ mfgcfg: clock-controller@13fbf000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8188-vppsys0";
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8188-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
@@ -1797,8 +1797,8 @@ wpesys_vpp0: clock-controller@14e02000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys1: clock-controller@14f00000 {
-			compatible = "mediatek,mt8188-vppsys1";
+		vppsys1: syscon@14f00000 {
+			compatible = "mediatek,mt8188-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.46.1.824.gd892dcdcdd-goog


