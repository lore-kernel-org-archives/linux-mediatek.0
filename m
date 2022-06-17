Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F16C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xP1dszP6Pf/DLYtdfT+DX9hgMklnUEP+AMtDVPBRI4=; b=rIyFIecqZLDK5ptqC+N5qX541z
	lIU0dpHWYLt+RVsWlQgaqnUWWxmKhq2ygBnzL0e46Jxl1eoEAKYhASQ3ON2dXF2Fh6ZcSQB1GFY7w
	6fkmzLlTIWmS+9vo8lIPcDcXE3lIygEPkb1P4TkdUucTSFtgLA8PByr088AGImRiNKI7lXioQS7YK
	edT7J36oQ1yqJBT5NbpSeRjxeqHYUuURF6khF4ibEJK1O/74CHKXAiSKjfe0AlmBx8eBT2RaL0wNZ
	L0tzcqqUp8zNHpME8lek3MgI5virU1WqMQqcLAJBiE0mCK7nMA5PAP2Eox7VMRu/YID1xdC5OZ8YR
	GITBqXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27wo-006anh-Q3; Fri, 17 Jun 2022 09:07:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27wS-006ab3-EV; Fri, 17 Jun 2022 09:07:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5714F660179B;
	Fri, 17 Jun 2022 10:06:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655456818;
	bh=ZfN+iTTLkYxGBt09zpT++//W9d1lWZqfDMoUcHkoJt4=;
	h=From:To:Cc:Subject:Date:From;
	b=f7iK5VEv9T29HFlRTqonK9vtRFO95AyzZhZuByVucqefPKF+PvoW7JgiWlsicT+Dr
	 xEmQ+aTajlU9I3vRL91trcNTSAfX1MQCag1dy9Ib2k64s53VdQQ7V2E9XuMOIqp7wH
	 lzFQFTllEDFeiDW2mPIC/3x5NQdxaJAiTer5/jZakHpru8RNrdQy84KoltKKIgN/Kn
	 aAd94p/moTtU67du2IGfu5z3ltiwuogQ9h9D+/zEpscKCnmEbDiRIB4m3Aby2IRoD2
	 LNkuv31jeCX1BJCO4l/BH3t5JPF/HC1SR3jdMrWAdJOLUX+cfR263DWiGO/U1YLjb8
	 TqrHwzT1U5dVg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: viresh.kumar@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	rex-bc.chen@mediatek.com,
	jia-wei.chang@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: Add MT8186 to cpufreq-dt-platdev blocklist
Date: Fri, 17 Jun 2022 11:06:52 +0200
Message-Id: <20220617090652.56247-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_020700_685520_95407E70 
X-CRM114-Status: UNSURE (   9.30  )
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

This SoC shall use the mediatek-cpufreq driver, or the system will
crash upon any clock scaling request: add it to the cpufreq-dt-platdev
blocklist.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 39b360102f3a ("cpufreq: mediatek: Add support for MT8186")
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 96de1536e1cb..2c96de3f2d83 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -127,6 +127,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
+	{ .compatible = "mediatek,mt8186", },
 	{ .compatible = "mediatek,mt8365", },
 	{ .compatible = "mediatek,mt8516", },
 
-- 
2.35.1


