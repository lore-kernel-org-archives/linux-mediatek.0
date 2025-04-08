Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C05C3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=; b=0+ojYtIXUfU3TyQ6kRwlKP03Sd
	S/TYMzXd66XrzPBaetZ76h09AGMIS9SzGkU/VjI2sZ9HjNJ1VOJxl6Ul4g8UrSNqtGZpAk/TVI+SK
	40Rem77ZETUf9JcTs3Jr1/gF7Sgijew47y2dyK28wccymr6WbHlEOgRzWvUyV08ivfAzbZrodNQGM
	QJXTDGd+8IFI6+N0oFR1RjdvYgnyI8FlolJT58o7sMkMaF2KhIsA0JTH+ztxqgY9Xk5OF2ypXthmX
	eLTC2qg5pJW6nk0mL1ZrLxfgxanIA2/aFlvL+8+pwaO8UflrCSBLpSUwwS2PKSNavrhhmcZsnIFb9
	FghE+iRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Hs-00000003RxN-1o11;
	Tue, 08 Apr 2025 09:30:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Av-00000003QOf-0iQK
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 09:23:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223fd89d036so62261485ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744104200; x=1744709000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=VqRzcteSR5MEBGl/6aG0GyFzdhRObtO6YMaSYuBzZ9Hzqex/g7LcsANQIyfArS8fas
         YVw5fhtRwC3nXpDo5WkVLtr7yg4/fwXGllJRPMo9z7JxDu8Ly4PTxdhvBRjomOkFg1Y8
         sXx2+Ypt4qaT8cD/b5bSJEqev0jCISUzhyPVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104200; x=1744709000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=L7SG4XMKfz7HfJTIPPkKngjCuxzpmH91upS2IM4xKAwAt293bDyglqf6fL6O86uKU/
         PbnPEQ9j+t/dvWzNoE+6Qv41fo2djPMs+8rkGTJB8rvjgmQ90frrOMBCJIaeZ9ToWDg8
         88dINO4PmQwrNtcVy9YA/4so3wTaLXkaKmkgXLLMYIu7dYnGzZ1BPGT5VsYywijHpRio
         IZM++0DR9KunwT8bIEq9AGad2HY4XdrFNW005nyKmQMDZ84ZkWYAWE2WTzzsVi4q3R9b
         Vv93v61sk8dbTRRyhPzy4y9eCNRh/jpRKCwTqoky4byyc7wOt6JdxiCvLO35QdLUnb4q
         sqFw==
X-Forwarded-Encrypted: i=1; AJvYcCXblbZmcxH7R85tOnazJ5x1sX5kQGizKwnlFW9sv/WUXhkCPDtcKTnUcCTHrLyFZtX1QYK4ttOlxmuAGKkVeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHYaLws9QjHSJjO3UoIQIWWBZFSpxQAeM610Mooj/l0oSkqKbs
	JyV3flzr7Tcq/COLkLvCS9UoLr3M+pyUm17FKXzlDjFPcchT3gS8SgT81avcbw==
X-Gm-Gg: ASbGnctW7Y1hZhT6vL2p2tjCob/FN55xkU4Ze1rWzlreKPH97gn/33zdI8H8ukJ9ZbT
	CD+sdOli9cINBQCL3Vt7oB6WJ74AsySteqUt5BflgQtzJJN7rBJaZRxnpd/WtW4T7cvcm2rspNK
	ViW/TIv8h4jmn1NhbbrwSoo0PVvHkZ7Irw/CZ31TmIwiK5PAJEziE3PFbmPDfG+nBKcwuZxAvbP
	PqK4VyPNKI+KSHS5xJWcJbqy1MEjQz602u5rGgFDdvIpA4Ousi1ONkdWTtuERF+F7MM5mWM7KcO
	cV6EkaBsJLyv+D8g72qNuY/vFRk4l7AlK7HrXQFp9x72Ft1Wuts+S9+LYLz1Dlo=
X-Google-Smtp-Source: AGHT+IGPhkSRb5R3PVNGCzYv1a6SJZoNU3t0aIi0QTJm3JWsa/HB1uZ+jzdpdKOIXFpq6puPuDXpRQ==
X-Received: by 2002:a17:902:da85:b0:224:f12:3735 with SMTP id d9443c01a7336-22a8a06b38dmr169101945ad.31.1744104200152;
        Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:79d9:c941:96f6:ac1c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e477sm95651655ad.122.2025.04.08.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:23:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Chengci . Xu" <chengci.xu@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
Date: Tue,  8 Apr 2025 17:23:02 +0800
Message-ID: <20250408092303.3563231-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_022321_237662_18C86F70 
X-CRM114-Status: GOOD (  14.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Based on the comments in the MT8188 IOMMU binding header, the rdma0
device specifies the wrong IOMMU device for the IOMMU port it is
tied to:

    This SoC have two MM IOMMU HWs, this is the connected information:
    iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
    iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27

rdma0's endpoint is M4U_PORT_L1_DISP_RDMA0 (on larb1), which should use
iommu-vpp, but it is currently tied to iommu-vdo.

Somehow this went undetected until recently in Linux v6.15-rc1 with some
IOMMU subsystem framework changes that caused the IOMMU to no longer
work. The IOMMU would fail to probe if any devices associated with it
could not be successfully attached. Prior to these changes, only the
end device would be left without an IOMMU attached.

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys0")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d3858..29d35ca94597 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2579,7 +2579,7 @@ rdma0: rdma@1c002000 {
 			reg = <0 0x1c002000 0 0x1000>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
 			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
-			iommus = <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
+			iommus = <&vpp_iommu M4U_PORT_L1_DISP_RDMA0>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
 
-- 
2.49.0.504.g3bcea36a83-goog


