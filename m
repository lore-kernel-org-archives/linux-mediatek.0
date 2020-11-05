Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259C4C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 11:50:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3F02083B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 11:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="drrc6Hki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3F02083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UTEGmBA9lXOHKU+IXHKS0gEBRpRtNdWJdiBJkYZ5xfg=; b=drrc6HkivBansPU5/X52XuLQrb
	nYi5lN2Adh0U6Cg/67n2U5zLmbJCX9w2t7PMJrnP3nDP4UUIoetZ2hM7nPtO5gyoy4HmwNQWVVS36
	DJ8F8OWswdT8GZpjYac4gqL2c5UFt2RpTR0ei5PeLx5IJPCY0bvajaQ4S1+0GQ0HvTxNUQ0cr+arm
	OfWKDP0oio3v4uQHS7uh1bs8MDj6Upl0DYG2kxbQ9PtZVppycyr0uaDWb20Hgop46waJwYjQQ7CzI
	lD2hbxxJPCZ9+mrkqZu7vDkhrllt4ymVYpoJhbs20ToGjY6K5z1ZJ3mSzU7RMddbcCkM4lVLiKHrq
	g4D/MUGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kadmu-0004ew-0Z; Thu, 05 Nov 2020 11:50:44 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadmo-0004cT-9n; Thu, 05 Nov 2020 11:50:39 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CRhfJ1w3rz15RxG;
 Thu,  5 Nov 2020 19:50:16 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 19:50:13 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH -next] ASoC: mediatek: mt8192: Make some symbols static
Date: Thu, 5 Nov 2020 20:02:04 +0800
Message-ID: <1604577724-24687-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_065039_111702_505C2D95 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the following sparse warnings:

./mt8192-dai-i2s.c:2040:5: warning: symbol 'mt8192_dai_i2s_get_share' was not declared. Should it be static?
./mt8192-dai-i2s.c:2060:5: warning: symbol 'mt8192_dai_i2s_set_priv' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 53c560e..5b29340 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -2037,7 +2037,7 @@ static const struct mtk_afe_i2s_priv mt8192_i2s_priv[DAI_I2S_NUM] = {
 	},
 };
 
-int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
+static int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 {
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	const struct device_node *of_node = afe->dev->of_node;
@@ -2057,7 +2057,7 @@ int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
-int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
+static int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i;
 	int ret;
-- 
2.6.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
