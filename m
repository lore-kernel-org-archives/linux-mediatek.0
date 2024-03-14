Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0A7C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pbVy7NoY7OufDgTKnt1OrX99Guwn4e6EhUTxvxCdoJM=; b=PrjfbU58MildyTtNhxSod+dNJx
	SssNvXQg35DyPJowIq2svFy0gVI7a3W9Fgr33Da+AkGxhya1B77HfhAoGed+4vzqZRh9Xual6hB2Z
	iX1lJDApavbo+CvSUKtXq/A0t8eahjkA5Lia9CgldamkDUp1s3oGu1AYFi/SDkuIqIyzMz6GUMGKv
	yiZ+6n4aXS1DA9NYTXs772pAccLNFei2Nin8R0TT7PHlIgrRVI+aRIqDZO6crM+UZinO1xHUML27W
	KoMiE900P81wI3D6QahlqTQPWNMpbWk9+TnfTqPhsebMx0+mqBuCH5gfwXTPYXeCTmYjUD7c265C9
	eAXy87cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjI3-0000000E5Ep-0ZNT;
	Thu, 14 Mar 2024 11:30:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjHz-0000000E5Cz-0AK9;
	Thu, 14 Mar 2024 11:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710415819;
	bh=/MuuARPvl5mfIdBAlNrafkAZafuB245jPxJZSyx6idw=;
	h=From:To:Cc:Subject:Date:From;
	b=CuJ8yOW9pw0uAsUmCYvkNZdFBi/1RE27tG8Pi6DOmvkn1OiKYf3HdwlfPXIfD2cEZ
	 lwWt24Sgrz1khmBPZzmIpj26FPdIbbzPUJEJtTpjXPNoy7/74NZ66gyyK95dGPzMt4
	 6/bnWOi44dCUfR1UvsVlQkePKGCa9lFD+ovRrSjudL4jhMZQjhAER1pejfOA+7lMfJ
	 0RvAd5X/1P4qbhIN9ovzjdQntWPMzK5Z1JO0cIIRwwPgrPxYXBiJdYNfeBFXrD+hgr
	 h6prBjryRaB0nze11GSihwHAT8UuvNYHwT1Ocd8LPmUqgygg84IiNXpaW6ziLQBsBw
	 pazBSiu+xQMjw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E51F73781F8E;
	Thu, 14 Mar 2024 11:30:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] soc: mediatek: socinfo: Advertise about unknown MediaTek SoC
Date: Thu, 14 Mar 2024 12:30:15 +0100
Message-ID: <20240314113015.121940-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_043023_330373_2B8ADB54 
X-CRM114-Status: GOOD (  10.45  )
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

In case we're running on a MediaTek SoC that is not declared in the
socinfo_data_table, print a message stating that and, with it, also
print out the read eFuse data: this allows to easily add a new SoC
in the table, granted that its actual soc/segment/marketing names
are already previously known.

This is especially useful when booting an already known SoC that
already has socinfo support, but has a different silicon version
and/or revision, hence different model information in the eFuses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 42572e8c1520..4494cca1d075 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -144,7 +144,14 @@ static int mtk_socinfo_get_socinfo_data(struct mtk_socinfo *mtk_socinfop)
 		}
 	}
 
-	return match_socinfo_index >= 0 ? match_socinfo_index : -ENOENT;
+	if (match_socinfo_index < 0) {
+		dev_warn(mtk_socinfop->dev,
+			 "Unknown MediaTek SoC with ID 0x%08x 0x%08x\n",
+			  cell_data[0], cell_data[1]);
+		return -ENOENT;
+	}
+
+	return match_socinfo_index;
 }
 
 static int mtk_socinfo_probe(struct platform_device *pdev)
-- 
2.44.0


