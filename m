Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7341C54ED1
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycRQ4tmEDiwX7t+LGYo50gU2UJ7TlxKomKy/ZNeMpAQ=; b=rd3pGHFuM4S2ritszc5hkR4MdW
	JFi7dG6rvoGhtfOk/trH3Phcr4PGzhqU9NsnWMIvmAI+f098ExqnxUdkMizRzGpgF143Ge3acBpHK
	mw/WUV54mfICEt8qDApMC9fOveGcXVB/y0vIwJQMKhw5AJq3Dom3Wk/5RqTDBHgxsQI8uWBDBf2XP
	8vAz6QyDDu9fpInh/RztdRVrAWgej/SbPMlLYKilhliXvBV7iF1pM0gSd/+Ti/QSv4b3NpqlmQ5Bt
	9BpVUpVLy+F/gSIaEZA3Uf0DMavXGBNWCgRkqNmchwvpM5SPwVU8yn9V3Ua8RIHA/7qcTU/R+OLYJ
	gAe+hi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjHQ2-0000000FEd7-2oj7;
	Wed, 28 Aug 2024 12:04:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjHPj-0000000FEam-0CIF
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 12:04:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wv2yf3nplzQqtV;
	Wed, 28 Aug 2024 19:59:38 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 62B2C14022E;
	Wed, 28 Aug 2024 20:04:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:04:28 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<ulf.hansson@linaro.org>
CC: <linux-pm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next] pmdomain: mediatek: make use of dev_err_cast_probe()
Date: Wed, 28 Aug 2024 20:12:30 +0800
Message-ID: <20240828121230.3696315-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_050439_770428_44CA19CF 
X-CRM114-Status: UNSURE (   7.69  )
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

Using dev_err_cast_probe() to simplify the code.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e274e3315fe7..88406e9ac63c 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -398,12 +398,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		scpsys->dev->of_node = node;
 		pd->supply = devm_regulator_get(scpsys->dev, "domain");
 		scpsys->dev->of_node = root_node;
-		if (IS_ERR(pd->supply)) {
-			dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
+		if (IS_ERR(pd->supply))
+			return dev_err_cast_probe(scpsys->dev, pd->supply,
 				      "%pOF: failed to get power supply.\n",
 				      node);
-			return ERR_CAST(pd->supply);
-		}
 	}
 
 	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
-- 
2.34.1


