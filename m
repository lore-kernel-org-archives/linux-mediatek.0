Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F7BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95JFI3t5tzea5C3bBX/GI2kh0xSak+21TaQ80pe6mjo=; b=Yo1VGtC+Lr+KMPk85AAqszXbM5
	fugPRfYsCL7OQVSP3Ep5kswJAwm8INOBGl941NrwlWkydE2NMk7XZTzTv1ZGub9sqz9MiJW1fhscN
	0m1zxMnHAsjsw5xZHdxdSHcbdYNeIY8qHzWVN/Kj5F1evIPzhvgQDbLL87Kfj4toqadlNb5jKrRWz
	sTVqnos0fSCfZBL9GOswnvsIFJ/r0AEOoJEAmcWylyFzi9L6HYf28Q0i5Kho60GBni1gCHVyJiUW3
	+11+yU28bpt6yMqTzb94wSTVpz16p2YsWjd1ZF5Z4ibV9qK1d1rvMFrmNRvAVfUAxlR3rrPqEy+LP
	Am2iw9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jng-00ESI2-87; Thu, 23 Jun 2022 10:11:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmn-00ERrn-Vh; Thu, 23 Jun 2022 10:10:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 467BA66017B4;
	Thu, 23 Jun 2022 11:10:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655979004;
	bh=CoBtqHoaJ3crvrFEw2/iijyoBgcPexhypiGbzCdpsQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kk6kNeH/ymNQtWIUdrryOOACFxxYI6sdBOrYPVwRB2Do2i6U6qxFK/zAb7sLRgJE9
	 xUhM+HWCZJF0xcxUe7r7aMc5ro+MNopm0iE8+pE4jGfmkR75dOGq2Qwi8z3C4/kYFv
	 Xb50jnDqvB+mbV605xxIvO3c9vPwscpIoWBXkU/JBRA9DnyB4YWLF58puDmG7WN3q1
	 Jbf4RnjRTqegmU3BBxkTDTFpJj8I4ocDurd9xlPUdXmMw31kVzZ7uG4p8OyHDFx9my
	 sPZjvweyKwmgqJg/xjPZLcJiOpSyiufF7xC4YTsY7iy5g1droDJBL95nOW+BnbGBx0
	 8afLewG6QLrDA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/5] soc: mediatek: mt8183-pm-domains: Allow probing vreg supply on MFG_ASYNC
Date: Thu, 23 Jun 2022 12:09:48 +0200
Message-Id: <20220623100951.21153-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
References: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031006_186421_CC17D6A8 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the MTK_SCPD_DOMAIN_SUPPLY cap to the MFG_ASYNC power domain in
order to be able to vote for GPU-related regulators on/off.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8183-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
index 71b8757e552d..99de67fe5de8 100644
--- a/drivers/soc/mediatek/mt8183-pm-domains.h
+++ b/drivers/soc/mediatek/mt8183-pm-domains.h
@@ -41,6 +41,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8183_POWER_DOMAIN_MFG] = {
 		.name = "mfg",
-- 
2.35.1


