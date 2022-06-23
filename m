Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C1ECCA47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeiSTA+gYS5jxsN8dxMnH3udDz0uwz0c2aWxcvJlZlg=; b=dUnMC9TLaMutYBX+s06WtTfO1K
	EWruyEyc5SELCswwqrxV+pbXDEqzdBwlcH/g1xfKGhQcCDZROY9SlmcGJVOZktNiES6xipE6Met/3
	ysvElYsVFTtI7qYce0v+tAiRQ+saWWmS4PNbGAnWDTKLGBfEkMq3Rbr5hticZPQx9nt5OPbDrj7tp
	rxjl3DSbyi3jjTpM+DUrkRl+Jr4IzXIyOeGkLswlTwyMbAqpVewYDCGlruBXS6P/Al+GuxWWeO3xr
	CwOlZLdyQwakAM07rnHz/c9DkwdULjGKPpkDk7Z0v4nXjGdYot8tk4Gjk3Lz1Sbrpkb39TToYeBYZ
	a+zClqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jn8-00ES10-7w; Thu, 23 Jun 2022 10:10:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmn-00ERrm-CR; Thu, 23 Jun 2022 10:10:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A520666017CF;
	Thu, 23 Jun 2022 11:10:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655979004;
	bh=fdj/NDREE13nXimTiZFPKHxqmbz8mAHTy/iF6JaIN7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KbhLxup9FZmSqGXBELMNjXZopSuyFCH+mOrVqAHuo9IseIS7pouJiI0NaKBxt3pZU
	 KfGuMyfOxV4BQUoUe/2HsTR4sxN/RBZ8h6R7zoVdKU59whUASk6q5r6VHAanB/wKpV
	 roAilsWSIgfpgQQSPD5XTKvIpATfhLcEr7+kEtwwvR5gBJDFQzgauAqMoOHRInP71V
	 EGD7PH8TMKZyUNMSaDx0H/K8+FFLWgQqNiVPQEJUvG+fKqK6gJrn3gWydLZhVfmfnB
	 /fH3TqVph350nKJnE9KIbdRdmvNZp5xWU703CvaYtwEP6LO7lCAhWWOh5DDhcxv06I
	 2U0c7UmlIs3Cw==
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
Subject: [PATCH 1/5] soc: mediatek: mt8192-pm-domains: Allow probing vreg supply on MFG0/1
Date: Thu, 23 Jun 2022 12:09:47 +0200
Message-Id: <20220623100951.21153-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
References: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031005_593391_4DE1BCDA 
X-CRM114-Status: UNSURE (   9.51  )
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

The MT8192 SoC has multiple MFG power-domains, exclusively used for
the GPU which, in turn, requires external power supplies: add the
MTK_SCPD_DOMAIN_SUPPLY cap to MFG0 and MFG1 to allow voting for
regulators on/off upon usage of these power domains.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8192-pm-domains.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index 558c4ee4784a..b97b2051920f 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -58,6 +58,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8192_POWER_DOMAIN_MFG1] = {
 		.name = "mfg1",
@@ -85,6 +86,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 				    MT8192_TOP_AXI_PROT_EN_2_CLR,
 				    MT8192_TOP_AXI_PROT_EN_2_STA1),
 		},
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8192_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
-- 
2.35.1


