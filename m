Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BDDC5AE5C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAsuYrChTQ+mBfJ8/Sih8DwoRlV6uZI64nyaA9Bhlv4=; b=dXTd1dAnXWR/d/NUaLHUyPOOTn
	BbHzhEXaO6P8Dv5lJuBHxtuGPliW5CTvF/fixmUFDv+oElUjaOl9Qx6Dl5dwxLpXn+j0XI1FUL3fF
	Zydxkg87fEutkElYp6NlAVVMs9T97tp9IF+te5Nrle5HGctVEgPClVJVS3cAvmcUDmfVKm/jZzU+T
	U9vxugjh+s+7G5XIqCfHRjVbwkwNVwBRmBSUe/8aZobUoMxyvhNbm47pKS+zxWvzQMa6vHbe+WwT8
	DeMwZ6bUZGiTKi54aYu397jwDkX2udp5nicQSzDKHHQe8DEpEePgmWbf6OUlznwyFGafJpGQOUNBx
	QN6Zm76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNm-0067WX-0I;
	Fri, 17 Nov 2023 09:43:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNB-0066yw-09;
	Fri, 17 Nov 2023 09:42:50 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1AC936607392;
	Fri, 17 Nov 2023 09:42:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700214167;
	bh=8hsTcNhO6pxrVZKfxLeF/xkr1pZ2hVQ5uEBZ0ICc55k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+fSvUnL1gj75KYI3HpvktkOA9JG35A6afAdiB0GMjeNvERRDLUU9sxaYdF7SLqXF
	 PM4N6PFFRa/PIZIpbo6APiwiOFlgOt/G+3TPzbMJ9UhEehZgsLQL2ryhLSNaum7mmf
	 57nD7DDKll2bNedL0eYtKI4fDtsr4rV3jE1JD2qL7Bn3hr3fq5L3KEYSVX95KISL7i
	 DBs7UBkNsSwRjXTElIj0tvSe8PRhHzcPNdTYLxgEhopjq6IdkyklMHvkPi31XGN+Bp
	 LTPgFFXwD7EZTm7gDPWg+0L6/m/twAJCDzS4sjP7Daha6nuUgqLupaQ5qIGT2njfwU
	 bVYx39Hy2l/fg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v1 13/20] soc: mediatek: mtk-svs: Remove redundant print in svs_get_efuse_data
Date: Fri, 17 Nov 2023 10:42:21 +0100
Message-ID: <20231117094228.40013-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
References: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_014249_248016_E1DBDF0B 
X-CRM114-Status: UNSURE (   8.07  )
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

Callers of svs_get_efuse_data() are already printing an error in case
anything goes wrong, and the error print for nvmem_cell_read() failure
is redundant: remove it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index cd5064683506..5fd9884dd20f 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1822,8 +1822,6 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
 
 	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
 	if (IS_ERR(*svsp_efuse)) {
-		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
-			nvmem_cell_name, PTR_ERR(*svsp_efuse));
 		nvmem_cell_put(cell);
 		return PTR_ERR(*svsp_efuse);
 	}
-- 
2.42.0


