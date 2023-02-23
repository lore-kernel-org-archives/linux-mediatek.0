Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F405EC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu2ko/I2+FIAVizMpk+6MoW16wk0zrb3QEtaQNGzMgc=; b=XfiEPjjoBJoeqNxmphMh/Ub+LC
	AhIF2BcYRZIjynmZi+eBbTThXnca51RcMy7TQ90W3+4z8N0MUNPb5hj/PwEwuoHbHHywp4LdTH4Di
	32HRC0lNH5aohWD3BfWk2HTiPiGfR7hAo/np+dxnCARz+Vx1SwfGSaiCziaw0Yt4tuAb9ZHG7AE0A
	b8cVHkmdxV5WgSzBCZSydpHqsJcPB/X7O8CU2MzMkD37BOC85svlK1VBh45yHROT5wI4D3jfo5Qwk
	oU4zzADY/xh1QUJCynxxVJh6oxyb3uXsK8LomG/lfaOby5FrTjIJGW60DtvzScvhNvC0eIcGmtfjw
	ghi5Pmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBmq-00GUXs-OV; Thu, 23 Feb 2023 13:37:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkT-00GT0d-FE; Thu, 23 Feb 2023 13:35:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08D39660220D;
	Thu, 23 Feb 2023 13:34:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159299;
	bh=X9j7xcxPWqqju4SwMykvvaoqD5cIUMh5cTk3zCzxcjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ct53OBIozlhWIY3U/hyAhuOh03mRrpYYSm5EBI9k2O1t+NmARG3qpK6MZq7Usp1a7
	 e3Fk357GSQz7mhlI3a0J/hSn5f7MgDOuWhdNIUsV3Z+CYohayKPPJRRHaPxL5PYWRG
	 9t60KGEUMw9N+JwvU7WsJBKwBzAMyF9Sh3ADLSseFNb0hduGBvGL/FFJrt1nZ2nVPD
	 S+OqEa/NcM5b3j8sfa56GsBACsyTpHarPuCc/4k/2x7uFgdlIaixZrqrnSWNQr5+rq
	 s7IWJoofM/siC9v0IpFNbNlczNwXdmns2AGOm17TdgEDm5ybSdeschCbrp8VeszaZj
	 3oMABsiIUQRAw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 07/11] drm/panfrost: Increase MAX_PM_DOMAINS to 5
Date: Thu, 23 Feb 2023 14:34:36 +0100
Message-Id: <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053501_767117_2609C140 
X-CRM114-Status: UNSURE (   9.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
extra power domains required by the Mali-G57 on the MT8192.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index d9ba68cffb77..b0126b9fbadc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -23,7 +23,7 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
-#define MAX_PM_DOMAINS 3
+#define MAX_PM_DOMAINS 5
 
 struct panfrost_features {
 	u16 id;
-- 
2.39.2


