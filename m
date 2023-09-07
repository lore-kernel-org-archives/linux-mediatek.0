Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E8EEE14DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSXuGn3O+qqWl5LwJxGEkPc7y1T0Fvv+zmkZqiAv3bo=; b=vaQgTMnGCdvieh6AuPDKIGR0bR
	BxwjfDPCSnwiaLiUqpVLHmwo53C9EKHhIC5G9ievb4BwjesJcClyidB3Vmm4ubjZPD0gD9h0TXe2+
	/+RrD1sSK1zy2fZv6zugosBzeWhfjo+jL0WXWcDaysYiSLMHVB+d5O18L6Ti1tufBzpblNFp/LELa
	O60wETkOZHfvB19qig0cHdMbA+Ni+5mCMqCOswveq2i3i7IjrBhwu3uMUn49hYN3exeH4jeIc920i
	JSK4A3/1HVhoRF4JMKlKujo8fG+BmJU/8VEHhSQKx4FbMjo8prvsXuBYGN3fu/ge8Zk8mMjQbzcX9
	HzCj5mHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjp-00BjB9-0J;
	Thu, 07 Sep 2023 09:55:49 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjj-00Bj5t-0a;
	Thu, 07 Sep 2023 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uSXuGn3O+qqWl5LwJxGEkPc7y1T0Fvv+zmkZqiAv3bo=;
  b=Hx88vk+kZ/st88XSOfMxLqrNvqFC5gz0Rjsu9FnmuxDb6Ey9n9iNx7X3
   5mvlWqUzb578CukZIhvBvScfv1YGt5HhmEmohAMwtUhRjDPRCDgZnwHdn
   65YFgxzTg0Odnf7stkK+lMg7TbECQQOmUA50DEcI4rbfx/H5A9Ng9f7GJ
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324671"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:32 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/11] media: platform: mtk-mdp3: add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:21 +0200
Message-Id: <20230907095521.14053-12-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_025543_537216_CB2A6316 
X-CRM114-Status: UNSURE (   9.20  )
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

for_each_child_of_node performs an of_node_get on each
iteration, so a break out of the loop requires an
of_node_put.

This was done using the Coccinelle semantic patch
iterators/for_each_child.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
 1 file changed, 1 insertion(+)

diff -u -p a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -1137,6 +1137,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
 		comp = mdp_comp_create(mdp, node, id);
 		if (IS_ERR(comp)) {
 			ret = PTR_ERR(comp);
+			of_node_put(node);
 			goto err_init_comps;
 		}
 


