Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4994C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A2261263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70A2261263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WOwKxNKww7wemdO2vd8cBpArbmVq4XNP2+urmRBPDf4=; b=yVzGbezkLJnfMp
	qhzLViv4CohDVfkZ+qvcmbbrsi6X4aFFMuTShH56OlSM460lziaqD84PWIv6s+hXGjiAuPfoA410y
	TGIGtMxDDGpF/59Ozlrz4ruZ1hHSF1Bb6lXl2eNgkQz17tdCBGfPQdqL9vjUtDHRZt2hExhwbiBU+
	toLxiMbe5a8DKu3LyosvUC4Kyuw/Y68PE8mdLcV7o63NevZxNPBSBjokPwTjAIvZdRddeloqSm2Rq
	wNbDmBy0Up84va22Yp91vEsA/gBTc7qtdbIh8PvS3yU4jqh1m3QHGNvWyK0nf67jl+3n+Vw+yfmXI
	fhCheJk185a9IgXycV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8L3J-00EaFk-9A; Tue, 27 Jul 2021 11:15:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8L3G-00EaDP-9Y
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:15:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d1so8105327pll.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHNyu7k4UK63DVq7rOYoExZI6cBgQIh7p/Fi6u7I8PE=;
 b=DGLK8ZaGcLZ9qrMkM7KdMWjTsFlwbZzg7dIvgy3A8POI0ux2QLqiOutfmPLYOEy4S3
 SP9jaEuFOZwpSipJm9CdJ26hVsVcFyDj2KUHgIZUqc0dxdkxJ7F20hWTGNo4LjSloYR6
 76hzq7Dk1EiJMfPvfji7Zk5dTMsT4XQXW9j8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHNyu7k4UK63DVq7rOYoExZI6cBgQIh7p/Fi6u7I8PE=;
 b=ROx6UJfBsA+UFqqyQ2laqfcSgv6Vwz+j0+Gxh00DWRywTFubQA0I8LF0fdYEWN2xyt
 H9yICOERq4Ow3B5UcFL67AYK2/EgosxgvV+PbjRQUxr23FpPjCBbZfyPj1zvPIHnd0K8
 c2pmvzL58QzsT4Yvk6LeL3huGx162BVHzi9+6bGTQvi1LbGk6m06hwnT+ku37HsktfS9
 S4AkiQYI9P46Tm3/KOSaSZfP2/WSoAbDV5K+jpaD0FzfIG9ofDkbYUvHXhf/4wI4eTXL
 l0ZGDuT+IYLa3NKs0beT3rJvgwzk6PWbFyIrYH7m82CwAKpeg8kbn1tamf1JYRAB700+
 P0dw==
X-Gm-Message-State: AOAM533L9JrtPADCTBFdxLmZR1AjDaKWrwpekNC6VIEB6MNqZ8r5uMSu
 55Tjsx8PtbeYFi7vW6SoZOWYnw==
X-Google-Smtp-Source: ABdhPJzIMWQIKWL3D4AB+HqQObX91XCw/5cAdIwjOgJtQrBbMGoOuLOom54j+toKSzvKj0sN+PeEJw==
X-Received: by 2002:a63:5344:: with SMTP id t4mr5589835pgl.372.1627384507409; 
 Tue, 27 Jul 2021 04:15:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id t1sm3362305pgp.42.2021.07.27.04.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:15:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
Date: Tue, 27 Jul 2021 19:15:01 +0800
Message-Id: <20210727111502.2506311-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_041510_411929_662AE937 
X-CRM114-Status: GOOD (  11.57  )
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

fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
allows the use of aliases to number SD/MMC slots. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94fc..ed499e17b6570 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,8 @@
 / {
 	aliases {
 		serial0 = &uart0;
+                mmc0 = &mmc0;
+                mmc1 = &mmc1;
 	};
 
 	chosen {
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
