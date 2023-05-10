Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60633C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/LAmKF4DLtcx5felrrpNMnAfkFOO/8RdGO8zQwg8+es=; b=XYyZLTNLRty3P42V8ewER7FgUx
	0e2CoXerSHobOEzIZ5hZYBqs2egIg65h5xyCXn8otax/UAKGhgoNbcncdCvCjERymHFVlFGRpxwpe
	5BKej8IiBSCINIYBN9WamQiFZdLjw+aC5npIONYoutxqJJlU4BJPhs7k2zLbvfxPexiKv0rgWWZjJ
	mbeRQUgW/9KQAyg3BKTXvwgtTMMbGvWGsdCmwvRLcWqqH0Bwe9z+TFaicOfuxC/UcYneU0mWek1fy
	LI0xQNEfj4RkFlZ2thVn1yJrz4PFvkiJGPBYWJUjPuNVUgJJU72L4xaTA0oQz59R93lr7XE9Tj2T0
	1LZttiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwoKR-006jIp-1b;
	Wed, 10 May 2023 18:14:19 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwoKM-006jHK-22;
	Wed, 10 May 2023 18:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=/LAmKF4DLtcx5felrrpNMnAfkFOO/8RdGO8zQwg8+es=; b=T1Yq4crw8JW3+geXEFxaOBybrw
	eo0UatDttiInVbKyCe0sPqB4kg6n5jZ6N5MVpywpG8roXOqRcuoDtc82gYa1beSxoaKgRz9V+egRm
	4o6VF33Zf9wtC3o/q5/laqNEvMtyErKiC0HxMoo4Tp2wobdwGY8qUmNJNzBarKUhrngcQ+zRDeqTc
	IuKMhCtLp0hSaGDzcldSXVgyBE1QtK6SrAVpbKo14VhOBo147Vfra+RlENffr+k3Ki/QN7H1+lZqs
	qAW01qg0rxLuEPAUZgWfh55dfQHPrMWQ3706c+Y4T5rcCu4OyACjSUxqgxtr9ESG9M96yAujEQVXK
	9q12+9TA==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pwoK2-000oTu-1n;
	Wed, 10 May 2023 18:13:54 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next] net: ethernet: mtk_eth_soc: log clock enable errors
Date: Wed, 10 May 2023 20:13:50 +0200
Message-Id: <20230510181350.3743141-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_111414_677256_52D1F5CE 
X-CRM114-Status: GOOD (  10.79  )
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

Currently errors in clk_prepare_enable are silently swallowed.
Add a log stating which clock failed to be enabled and what the error
code was.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
v2: reflowed long line
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e14050e17862..ced12e5b7b32 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3445,8 +3445,11 @@ static int mtk_clk_enable(struct mtk_eth *eth)
 
 	for (clk = 0; clk < MTK_CLK_MAX ; clk++) {
 		ret = clk_prepare_enable(eth->clks[clk]);
-		if (ret)
+		if (ret) {
+			dev_err(eth->dev, "enabling clock %s failed with error %d\n",
+				mtk_clks_source_name[clk], ret);
 			goto err_disable_clks;
+		}
 	}
 
 	return 0;
-- 
2.39.2


