Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93977CD98E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 05:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=; b=FGWiZSKPn81HusIKIpoGCDuj0p
	DTnY4se4t4kmsxstSS/J9vrKUSRg6vsulxMKWgmrgvc5gytX1o7UWTztnYaSru+5wduxvxNj6cS40
	qOkZ0txH/MV02Jd3RJoE0Ba3ET5/HGrBGFQAtKJ3/zxEiS7jG19B1olhekMqG9OGL7OD9nLfTSb44
	7Te9gSJ4CFY7CbamoXXKtuOYRk3BgOjQjQOQdiZBEQ4CQEiV5lElXLQbrPszQzVZuzT+lTpCCDOCn
	c3WxpOnbZ/YepfpYgskmPF9x90mpss0CvrT4jQoi2cJVyZTK0IYDbNtWmwbxDXYQN+ouEPcdTLj6b
	cfnYWb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjBl-0000000GfpV-08SM;
	Wed, 17 Jun 2026 05:51:49 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjBi-0000000Gfoq-2AwG
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 05:51:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8419ab3a297so2384849b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675505; x=1782280305; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=;
        b=Z8qpz9buVFOiTutjs6LP7cPXRYfGhB9xhbJmklNHHk96XXy94Xv2Wsr9JM8+9+hQd1
         uaHxha+3iSDfGsBNWxsetWyq4evJblQU80D1mYX/TXkERs/UOKBaBMFbKnqXZjA+9mZO
         N2QgXTlBTgthS4YY+azEeJ2NNY7Rya/un4Dn1WZbHVCn7Kxeq2LXOOuDsk076x8Wo6fU
         VsMiVuvzL8FA+wQuGjk06rWHo8lvwRvTC7dVMpDc4/Tm2757rj3N9vtCHLV5gtWUzhVX
         4AuEhpQz975tM6HKByBINT/1IaywZZe3t2NsMTSFrm3QdGKa9+JP9iNAV8vczKzKjNvH
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675505; x=1782280305;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkxqiQ4zP5GBX+kUzVlvAXk0Z7GWlJPzsDOx8k6B79A=;
        b=o9KJcs5fnPQp25UY9+sNNyoExNrrs1Y8nOMGqC6w1NMrtqJEWbQwF5b24vOHj/smX6
         nTsDffgV5b6xu4XQrrHMP+0NiFWgx6uEflY01xOV4+gg9juKX6TuKEvZwWFUdUmou36q
         1NK7xjhAPOjbsUPgNKLFvLm584ZAupPz1gqZDnLUx1HLDS03SaWYd5Ev9nn9Df1+ZHuA
         N8jsJsoitvksL1EFmGuocKc4zEDf9nN4phJ6qwU36xL+FdiHjHh9AeRUz9vd3pdnVSFl
         8qp8BSlNxTYRGUisC9EglBclTxHTXf0rWcfzLFgc4VCEXynhXMkxmFwDZv4HYraBReY8
         B+2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mJduABQFp5bv091G8aeNcUImECMuTYUjSjZPGxG1ooIlzrZ6b+MWaMmNrdxbPaInhXpiWwqZWWiljCwq1EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV8QP4tbs0X7nyn2gzkF+EU9JpjRWc/C4zh0GAHiqnlPdH70QY
	x24AW7UehfxXPzD1TMdYgXQ+vv91gNsBr1hHHBkeZQz6uHW9zGg/xrjt
X-Gm-Gg: Acq92OGK1vAo7cVejI/A1+2Y6DvTwf8C4p8r4JAAsGLfPoJwweijVEh9kKBP1p0DrEr
	qJHz8jmmyEA7pJrZ6nRJqvTxqM3jqpL+ACc9GfV3n738x5RYfyT1xcoMONCvMbRFe8L3h1zFINL
	ImVGLlwQTZYiRKBf6jyepeJe1ewXLThzjNp2qgCtAMfmW5PenlFhlR+34BCmqmI/2ExJANSxX+M
	1zEaIeFZE5VsLuv3wB6lFPbpNMqJI88FGE4rKOH59e/N83verI8izUQcutm491brpnfP51m+0hk
	fQTvabKwrq/OGwywMzuaNbMIqvjsil5j9IAkmfp4PiMs7iYGFQM3vDl04Z5JaPsVl65YNLESKZX
	GDevby/oFr0wX8reOtGk6OiDxy1vESTCrkPbVtsHwLzBvO/eLEIyjuQC0xcuhBhHSiDFiVRqXsl
	5CqymnjA==
X-Received: by 2002:a05:6a00:3925:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-84524444c85mr2332894b3a.8.1781675505554;
        Tue, 16 Jun 2026 22:51:45 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc87sm13810534b3a.4.2026.06.16.22.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 22:51:45 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_ppe: Fix rhashtable leak in mtk_ppe_init error paths
Date: Wed, 17 Jun 2026 13:48:13 +0800
Message-ID: <178167550101.2217645.14579307712717502425@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_225146_559321_FB589659 
X-CRM114-Status: UNSURE (   9.25  )
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

In mtk_ppe_init(), when accounting is enabled, the error paths for
dmam_alloc_coherent(mib) and devm_kzalloc(acct) failures return NULL
directly, bypassing the err_free_l2_flows label that destroys the
rhashtable initialized earlier.

While this leak only occurs during probe (not runtime) and the leaked
memory is minimal (an empty rhash table), fixing it ensures proper
error path cleanup consistency.

Fix by changing the two return NULL statements to goto err_free_l2_flows.

Fixes: 603ea5e7ffa7 ("net: ethernet: mtk_eth_soc: fix memory leak in error path")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 18279e2a70..8451dc3fd0 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -918,7 +918,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
 		mib = dmam_alloc_coherent(ppe->dev, MTK_PPE_ENTRIES * sizeof(*mib),
 					  &ppe->mib_phys, GFP_KERNEL);
 		if (!mib)
-			return NULL;
+			goto err_free_l2_flows;
 
 		ppe->mib_table = mib;
 
@@ -926,7 +926,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
 				    GFP_KERNEL);
 
 		if (!acct)
-			return NULL;
+			goto err_free_l2_flows;
 
 		ppe->acct_table = acct;
 	}
-- 
2.51.0



