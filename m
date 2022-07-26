Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6386FC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLmXBmXpkoppDfTtAvBwk8nEStoMnKWgBeb5vEaDP80=; b=VnGwHe6TUaLx+RaEK2knkbKhKp
	mP/qztdry0IkaLEoFuFOZLrjLB4ZNotuULV0AruP+IAr3l2K9i7MQcpQsoLq465cKbYTEMGtNU7CN
	syPV8rmGuBmHNRKQ5kBjGZlq6JUodDbCEaGsbg2orOSuXgLr2SYFld9n4/bwnmLLX3s6FeDZRe4PK
	eXEMkvEYq20/vfvRULxnlDtz5uLjxn+EGEFTap1SxkrSENPm7b/mk8cDAMtBi8tzhVzAVOcgryNgE
	vktemtsWAz1IrWfnHWOCl2x8AkMQiNgKW+WL2AyYSMUMXJHZu6fpMVy6z3W5njAIoG+hEWyFE/J+h
	80sgfPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLO0-0007jN-OO; Tue, 26 Jul 2022 14:18:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNR-0007TB-3o; Tue, 26 Jul 2022 14:17:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6675D6601B25;
	Tue, 26 Jul 2022 15:17:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845055;
	bh=J9b6/urhItRjBm3nPg4B1bDfTVM2sZCWw+pgg0y0QmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eU64ltO89iqfLkpis1m/3c+OTw3RePXolf/ehCW9mbYkG8dCg6wMicer1CnVFu1Vz
	 HJuOq/yR81CCiv+I5tG51QvePQzLKHdi9zEIgM4hBmZywlkaCuWS9BpRbheGBKwE/w
	 ZOADhP3G0GX+gyrWESnZn/H9wBzQ5HsdnR12ixWz1JuhHXbDv1LLoMQvK1Pp6aYMto
	 nngOqnyvPvTyFNqMOCUhwY3JNteIFh6xZK7TFqlI850tRO15xaNk0RnERT6KnE4Zk2
	 ZmAmr9HDUIpk+Kh7lHAOx9dPUzFPmtbfAyn/lmG7hxhyiwwTDu7kT01ETs5o5FLFe9
	 EAelZgzg6iHLA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/6] soc: mediatek: mtk-svs: Drop of_match_ptr() for of_match_table
Date: Tue, 26 Jul 2022 16:16:51 +0200
Message-Id: <20220726141653.177948-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071737_396119_79E409DC 
X-CRM114-Status: GOOD (  11.73  )
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

If CONFIG_OF is not set, we get a -Wunused-const-variable: dropping
of_match_ptr() solves that issue.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index fcf246a6bb07..80d0bab1a045 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2840,7 +2840,7 @@ static struct platform_driver svs_driver = {
 	.driver	= {
 		.name		= "mtk-svs",
 		.pm		= &svs_pm_ops,
-		.of_match_table	= of_match_ptr(svs_of_match),
+		.of_match_table	= svs_of_match,
 	},
 };
 
-- 
2.35.1


