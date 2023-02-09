Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BC8C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5nOJyxJwVyTDsDVXocGIO+17IABv/8jaO6RNufzijKY=; b=Tvqj9xLLToBonJC7CU2Kh1P23X
	gDtEBMfwfE7QykD5dWCr4HnC6Mbk32b3gqItxKfeDk7Wyo7fsbRivyW97uyTJFZLzfeb2VOhOTjAS
	8g2CcXzTo1n2UEEzPZ7Pbs7b/D05SYbrBKJB3ZFEjhknPAgJSd0IGHD4my53FQxg2CtZBB4qvAZ5e
	PLqBpSZQAvNOopfGoxp2G04gVJOckAYG9ggBSKzt4kIxWH0S0B9vSdKvFImyDYtKbnN+70D2r9XkB
	OCNMeQOhQYpViMgUE4silOCycfPuo7OUZvA7EbJP4BbCDTvolo9AErhmc4yp5m6pI226ZlVtJR0t0
	h/h4K85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9in-002PJf-Nx; Thu, 09 Feb 2023 16:24:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9id-002PFu-9h; Thu, 09 Feb 2023 16:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D628561B11;
	Thu,  9 Feb 2023 16:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9E3C433EF;
	Thu,  9 Feb 2023 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675959858;
	bh=ylKCMMud2Zsh10OZZ6A3WtVHDEvxQmFf8psavqmf5og=;
	h=From:To:Cc:Subject:Date:From;
	b=Sny2gS7ZYNfyI4GtLmyH+FcNKMId23prYAZLOUStaE3eMwh+J2MfIfdo3ms3wZh+U
	 QtI8VFiTLOemvDMhLt9s/XnHGvp7Npxj8OoJjy99++imPHPj6CK7f3S9S1MFB6tlzF
	 Ae1itnhlSaJH/szbTGshwlx9uVtBMb3ccBGe0vS5WP+gMTIhjeG7kcAQ0OWRAB2kqG
	 L4m1Do7Gxwbqps57FO1yDF6cpZ5YYkN0F7KUokdbBdlGVSH0JxzRnDUgh3ifo42NpR
	 6MwFXsNoyIZEQdctQcYa/09b6rNo6/GwegaB6zCviJPzuBeC2EhJLC4ArsMggEgDHc
	 0t4+FZWvCmP+g==
From: matthias.bgg@kernel.org
To: matthias.bgg@gmail.com,
	roger.lu@mediatek.com
Cc: nfraprado@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH] soc: mediatek: mtk-svs: delete node name check
Date: Thu,  9 Feb 2023 17:24:03 +0100
Message-Id: <20230209162403.21113-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_082419_395146_4D53C96D 
X-CRM114-Status: GOOD (  11.90  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The function  svs_add_device_link is called only internally from the SoC
specific probe functions. We don't need to check if the node_name is
null because that would mean that we have a buggy SoC probe function in
the first place.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/soc/mediatek/mtk-svs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 299f580847bdc..a7eb019b5157d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2027,11 +2027,6 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 	struct device *dev;
 	struct device_link *sup_link;
 
-	if (!node_name) {
-		dev_err(svsp->dev, "node name cannot be null\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	dev = svs_get_subsys_device(svsp, node_name);
 	if (IS_ERR(dev))
 		return dev;
-- 
2.39.0


