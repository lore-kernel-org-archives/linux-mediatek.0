Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE749FF8850
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 02:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=; b=Sm+hNyf6eDRg4HmCUcU1g6L8oQ
	T0mdqgzf1H+weLEwFeuLvmZnOQQsmNBzAFu6XC32DR/kLwqaNm5WEhLZ3pCgHjDdi4sOYyy0FLT/o
	hF2pAcNA7NIKB50boXTM3NF+FyI9vmRUgvIuPaSxjIoHWPp9e5nIQkV5quSVLiUul52Sp8E3eTWQL
	S0UyOyVXvW4pPCC3MuEzdsFcuqBaMj9vCymtWI6/YVcWWUUPxpvhonSh9wC+YhxB1al8NVVXi2Jr9
	VBIM3JCXoWnCA5L3wl9vZhvWaLNxV0RTyQq8lru/KMp1fLnITq1r3sdjYkAaOpetN1ZnL9K+bFzho
	hKWTW82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBS2-0000000G2Vl-3PxM;
	Mon, 27 Apr 2026 02:11:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBS1-0000000G2V8-23PY
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 02:11:58 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c76b9efc299so3891519a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 19:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255916; x=1777860716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=X2ndQ6L9qC9pVy9jOqF0gdA4yxKqqg+HaICzLmhcC8Mh9NvVk5PNImzL5xEetK4TTK
         QA6/WBa1tDcUjnIG3rn6vyMWIgg8siwwQTXs9gcPizacFaYUuz+l0OuY8YgYifSrE03e
         30ktRiKmiEbbd5zCQA1wKxvJZ++iD2XZDKWzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255916; x=1777860716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=qxERrxmZ7jVzVuiER98ueleQhdhAlpWRk1yI/vjYfg26QUdTfFEUxXihO+piCEg0XC
         /hTYok+a8c+JzlFKKVSpJoDx5x+x9F0j5KZnBpqCjSxYLB2DK/Ay0y2p8OLl8UoBoN7S
         r7PTvtar2d51IWjrxVsNaNrWlh8zJQVp9aEofx8NHvy42GI/ks9zO0sAyxh4pBP9dGYi
         x+1v63NZD+AWHWQbyxEZqzj7eAXZpzyfO25LQPj+3RLLPZPIrK/jnjlacCHqXnInlgs2
         7J6aeo0JQFYvPHKcjwRuZjhL7mLswNz1hgnYC3G1rapAoZgwEubGSama3bdNkLFdzdHa
         GFdw==
X-Forwarded-Encrypted: i=1; AFNElJ/lUjTLuL3hdz0eV6bgbi3J9crEy4DfOHMaaTGoY3hr9MLwuNbLhH0jDQWYWXho24QlDoV25qxb2l9mStSsFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5somOlhyeA1WXX/epTaIxE6G8PAD93ah9TvjqcbWHaQgp7yHK
	wt8YWQOL7nun0Aly8x7tKLpj3j5RB7zZImkOf1uOsdIPwmuDGbKkUq6Bk7paIASfKQ==
X-Gm-Gg: AeBDievhmkFagyNp8JE644LJZZIy8BDz5BgXQ13vcxTupDo+uOsWq4Bf3cENLZguMTM
	hJ8/p8LC4y37YKGaHE/qY3xY8LGEA78AXXDfMe+7qS0NjAiYstGSzw+16o/fgqGOwPbC8DCD59W
	0ORMq/bFS/1s+FTtXSQq5TDhAurqwic/uQ8ozyNs/sQekM3FO3J6ebb4GQbapc/0QblkGXSZY5h
	JwQhwA8uG/ggddqq8eLcP0hZg6XaaON3NlVz6vrDgaE7HdEYaE7oubEIa1huI2M3bm5oyLJgcx0
	OhbEtRz0livfp7677afzEDWsBG+WAa3ev0KczfB4d0fRpQk28iJpXuDzcz2oCvhSI5pxjbRBiXq
	zWM3LkBnmOry5xJ4ODKuin8R8dG+yinx3I7dGf5wR+F2/p3JVXkJWuyv4jCrE4DBNth25vGFy9N
	LCqZatxjCEcEjx3M4kJSIg5p4RpGA5dWRtSr5wCQZKGDeIDpQq48K0GEb+/2yKaP/p0InYlUQiZ
	miG2PEL02Za3FOQvRw=
X-Received: by 2002:a05:6a20:158a:b0:39b:abdc:4215 with SMTP id adf61e73a8af0-3a08d68e0e4mr46011148637.10.1777255916491;
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm31234668b3a.16.2026.04.26.19.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
Date: Mon, 27 Apr 2026 10:11:46 +0800
Message-ID: <20260427021148.2049555-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_191157_527455_D422CC0B 
X-CRM114-Status: GOOD (  12.68  )
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

When support for multiple EINT base addresses was added in commit
3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
masks for all base addresses in one call. However the "base" parameter
was left around and now causes sparse warnings:

    mtk-eint.c:428:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:428:44:    expected void [noderef] __iomem *base
    mtk-eint.c:428:44:    got void [noderef] __iomem **base
    mtk-eint.c:436:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:436:44:    expected void [noderef] __iomem *base
    mtk-eint.c:436:44:    got void [noderef] __iomem **base

Since the "base" parameter is no longer needed, just drop it.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested.
---
 drivers/pinctrl/mediatek/mtk-eint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 2a3c04eedc5f..47ac92ea98c2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -246,7 +246,7 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 }
 
 static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
-				     void __iomem *base, unsigned int **buf)
+				     unsigned int **buf)
 {
 	int inst, port, port_num;
 	void __iomem *reg;
@@ -425,7 +425,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
+	mtk_eint_chip_write_mask(eint, eint->wake_mask);
 
 	return 0;
 }
@@ -433,7 +433,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->cur_mask);
+	mtk_eint_chip_write_mask(eint, eint->cur_mask);
 
 	return 0;
 }
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


