Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sKot2yKYIuUz9oz5o3b/Zrz+tzRNC0o0nXr3y8mVKk=; b=DOfeaWmR4HWxxd
	4hN2uu6r/nHX6ruTNnumQfgh8njuwdGfxtipmPDb7auMUOaXk660fsUSAT2h0krp3custOvcFx3W6
	CsNnJSR95X3/MLqJuXWEnaeiE4Emvhc2IVCPfcTnCIqQP3kkaKPSlo6zhBYe2OvJBiGZ83P0bxuFC
	m2O+fWmpN+kUrjT+w6jSCTTGejTtYNL05tTnKiL/JeOk+iJxaSPt/+8vgzdA15VZtdF1enPLYshw7
	O2oF7J06b6h4xfTgPJdZdsODkN0W9o8NEtCxSyajGjNg834GzV3x3NsZr8mJ2hG2m1d2WHAEfrpYc
	lL70k9nEPe/m0i3cfn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTsL-001sR2-4Y; Tue, 23 Nov 2021 11:22:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTrT-001s6P-5O
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 11:21:20 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso1870715pji.0
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Nov 2021 03:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mq8nc34v9wy9BHUcdNCchv5TcJtzwaMW4yDN1UOKTXs=;
 b=JpDT/+FDBCbI5IBaWeaKfzyOwUUOyTt+Vw1ovqm0zuzKZZrjqWO3dJqGL1pzmsZRcz
 WEzphSwzny6i8imySPh8owk0bZ7mV09ROF7m2cIZELwxwLD3zWFbiIveEf0Sy/YacdFK
 n/sQubJ/NkmPIgp5pbeN1xtI08xQWQungcwqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mq8nc34v9wy9BHUcdNCchv5TcJtzwaMW4yDN1UOKTXs=;
 b=el5etkj7EB/W5LU4PvTchRSuMhK9lEL6ZRtConsP+8xEpQPnQhwyKtOt+fa4XhULth
 6V2KmEI01Jk9tGt0Njg3Yvqk9S/5CBKiodpbgurL0gUkPCXnzf3GiYx09k6dUQ1FURM3
 m1LhUlFrA4mJrzILLAP0RMa7xQBKyfmVrUaXs65dk7WczwXswZUn1wBxwqZ37Af1YzrN
 0SEbgmDyReInpBORktJTRt7b0ywZwXtS7/rBbc0koTWTkXdXoGnxc5RtNrS6sJws/8Ov
 HPQ08U9hb0HDOvPvPxKZw79Tph1RRGqZNIcCmHE/6j+Bh7jK6H+1oJj1PVRtis5ocxQz
 aI7Q==
X-Gm-Message-State: AOAM531JNQ/82J21JTGwX0OJacMNsqG9X8ixTZoplxLcIt3K8tbHuHw/
 zWWn+i6m5N1bQtI+pY4wkjfOOQ==
X-Google-Smtp-Source: ABdhPJxp5J8vQC13ZWDo2EQlaskUNOPku9PaqV5etdp5QIpELJ9fUxb88Pk4hXN6hRe8tLOckb6fGg==
X-Received: by 2002:a17:902:7d96:b0:142:87dc:7dd3 with SMTP id
 a22-20020a1709027d9600b0014287dc7dd3mr5260273plm.11.1637666477920; 
 Tue, 23 Nov 2021 03:21:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:d1ae:c331:ed2a:15e9])
 by smtp.gmail.com with ESMTPSA id 63sm11093914pfz.119.2021.11.23.03.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:21:17 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, - <devicetree-spec@vger.kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 senozhatsky@chromium.org, tfiga@chromium.org
Subject: [PATCH 3/3] arm64: dts: mt8183: use restricted swiotlb for scp mem
Date: Tue, 23 Nov 2021 19:21:04 +0800
Message-Id: <20211123112104.3530135-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211123112104.3530135-1-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_032119_278091_A6C77710 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use restricted-dma-pool for mtk_scp's reserved memory. And set the
io-tlb-segsize to 4096 since the driver needs at least 2560 slabs to
allocate memory.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 94c13c45919445..de94b2fd7f33e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -109,9 +109,9 @@ reserved_memory: reserved-memory {
 		ranges;
 
 		scp_mem_reserved: scp_mem_region {
-			compatible = "shared-dma-pool";
+			compatible = "restricted-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
-			no-map;
+			io-tlb-segsize = <4096>;
 		};
 	};
 
-- 
2.34.0.rc2.393.gf8c9666880-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
