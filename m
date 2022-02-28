Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF711C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nu9M45mlcKad6MCIIl5SSEinX085E85ExLsIAh7t1gM=; b=P06tTrF0ICQQcl
	16X8IMxid1yk0RODonUEI+3M5jrKu43Gm8CUd++bB/3dRYTQv0DdPr1LBS4w1Zfx3got88huWJk8a
	EHxMaqFBCqoFAOkw+7ocUQToZmBBy+k+rJFXZs5/EUk7O6scpgXc07V9A+BErx8LYHx914ZbUHCVy
	XAfOQahZnuK9Ix5foERI8sO9WELNQ19Ao8760Pi6P33jZtq/Xb+IFq0JJXg9jdoBhEPne3ZsBl3F5
	LBX8jMIvqaFCGqIWXndYdmxogVzOlPZ6pCHhej0KMb9/SvpREhagb7pmxq6eo+pq3m5+yndo4NI65
	OhL+hmP6rlEPBKcm6fkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeCA-00BroN-EU; Mon, 28 Feb 2022 11:28:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdoX-00Bfv5-1h; Mon, 28 Feb 2022 11:03:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AFBC81F438DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646046214;
 bh=ZYOkyKhTLblEx5A6tAm4rnRxc2pAq0nxLXlrxOhf0xg=;
 h=From:To:Cc:Subject:Date:From;
 b=IJw4OrE4rZEHPPIPGnIdrxytiUhI42Bm5/d/7/YiKOFqXj79YQCDDNO0+TZOk3te7
 bieZDMd8vCRNgAv+tiV4AJMER8yt5P9OexCN8eOcAQphEe3/wPUrDiFfPv1Ken4j+X
 +afEBBrLDtQVUeIHfgc6b5XzUNwbE8vKzTorBKICWnvuHfMRBCCj850Egfq8qsRRVo
 97KxRqN+MJfMIBpeMWmmiXw7V+E2DPtBhn1H25BE6POgciapnYY8mtQfbGNv2F9vi8
 NyCtDyKAXqgLQdak/ciVPIugM47AzuwAeBzwh9vkGJ+9q1qyu5NT5FonJm875V91al
 BBdL+8U3USB/g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski@canonical.com, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8173: Add gce-client-reg handle to
 disp-mutex
Date: Mon, 28 Feb 2022 12:03:29 +0100
Message-Id: <20220228110329.245366-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_030337_260378_4FCAD18E 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

Add a gce client reg handle to the disp mutex to enable MT8173
platforms to use MediaTek's CMDQ for extra performance.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 291db4fcbb25..9eaea1156e25 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1278,6 +1278,7 @@ mutex: mutex@14020000 {
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_MUTEX_32K>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
                                               <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
