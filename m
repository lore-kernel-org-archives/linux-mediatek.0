Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A77CC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 05:22:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91CF861090
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 05:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91CF861090
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cag8etwR99B/gPUqIQtMFg9rACAOllmLBng1e/ZDWuI=; b=av0tHYY0om9bIO0A64iVdwhz8Z
	AAmuKfAoLauYEbuP51RFBZEg7AR0Pjr5PZhlon0Fat1zCL5B9tNJlmn7tpED3SlFvW7gyQS2z66X+
	MujsxdebaM3cfWnuiZhd5BhfhnCVnK2OF60k3xCBmdvZrt/D+CO3sqlWeWGR88CVKhfwjRqfvF748
	CGqLgT+J8wLTg4qbb6HNiSkZXr66xYSAev61vVlVB7i3s9qid+psRWBuZtu+3BImezLbZ1l5RyFyR
	zBIIinsQzw4OSS5GHufjpHfSnAnZYguufbSeehUv46WbvVCvcrSV4gggiEM26xMXD+dxw/LW4HnDN
	TrMxwkvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYMML-0098u7-HJ; Mon, 19 Apr 2021 05:22:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYMMI-0098tn-AF
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 05:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:From:Subject:
 Mime-Version:Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=; b=k3Q4cZxWEPPFp6zTsAK9Qy+s1i
 WSWq5wpMJVqTjWlQQzvmf4yzGq7jXpjU/XdTh/dV7oPiskSg4w67JhWxHJdsupNETCXYmmB5JWmmL
 7KQrlVtp4F8+Bj+kH3Vk+XZ5sc6YmVdcx/RRMp46KzuCPeA/AvzIMCReAWgrLH/H9zSxKEwQDERfN
 cWkbwENXBzk0cbhbnCt1VzPa2aHf2ceMbKSDQnOzOUiCAEE8kuIG42QvkdnnZSxW7AFQjKTH7yqqa
 +DQ/WUozychEesYLdihTEE7WaUNUeopu/Yzk//ZZwHYBlFiYRcsov8uw2PKF0BkgPBvy5IGGBKDKa
 1RTL3WyQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYMMC-00B0tI-FK
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 05:22:05 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 j184-20020a6255c10000b0290214249d921cso6033032pfb.17
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Apr 2021 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
 b=Pphg5mXOZuX6oJxCRM8EBukui/4NuJxx07jOJDaZz1oq1vh72/E4kIv/Afhn6yyAcR
 EfMdqJvIT67EtmxeEPcppHNgvSaIQPOIWJEKuAvixPXl6NcyUGtSYF2ZOumOjk2NKp7e
 /gPLjB7hfPzcBXywKFCqzY+pgCwsh4yuzTFPt4gBvldEG0jf2Eg5ZjUF4azjaFlsZbtQ
 xqnx/wTz86t8j22AGehRmp06JWUlH0D8OubZVltZ2Jq+ZUyDzdm9SsUffrads5P6bSb7
 zJbv6Ewjm3nbOqwseOVLNuIztevd8+pl8nABP/jwcrxuT2ucfO4javgEgVWTw29tqmMx
 YWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
 b=oGNXz3OsagdOm1QclCI7Pu8jdnixIkmw73+DTFQDqC/P1cF+Rs6ATIFdy2/LtAbz0q
 F8x+xL1GNGFuf1R2J+Yr/ohSAaDcjwJpa1hM/QnWovuBWVdeaYPUUgjDmsgTTKdxbBZI
 78dzjQDdUBGpWYMmvO/duTntzMLhClq3qDKUzXmOZKD/Jm72pEm4u+8qMHNLqMFHyyPK
 r+dIaUyxDnoo4064pt2zNT97dLcDnTF189IDg2RyN2Tlq/C6jiAUMJF1rHCxQA8SjhPV
 aXync4Ef4z/o0h8ABbdO3g76X36SgwdrwtZOQucM3YcvwFZCpN6igVrLrlRcGgcV73ou
 gNMg==
X-Gm-Message-State: AOAM5335SKhbGDhJlhV/3bqn5yUK0ouxW1GRxgaQ4zyg/VH6XIplUjnD
 Xg4WH93JDAvS3g3IVebJSTl673nCJ+w7
X-Google-Smtp-Source: ABdhPJzi09lEATgb9ztaNjHZI+V7lwptJqTFm+vZoxp1DMfaZ2W5dklVTK8P6wG5Z0mHX0ArfOEsBq9To+nA
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:b01e:e82b:cf1:a8ce])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:e2d7:: with SMTP id
 fr23mr22096275pjb.29.1618809718810; Sun, 18 Apr 2021 22:21:58 -0700 (PDT)
Date: Mon, 19 Apr 2021 13:21:36 +0800
Message-Id: <20210419052136.2475373-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From: Tzung-Bi Shih <tzungbi@google.com>
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, broonie@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
 tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_222200_550604_B10057F4 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
mutex lock in mtk_rmw.  However the function is possible called from
atomic context.

For example call trace:
  mutex_lock+0x28/0x64
  mtk_rmw+0x38/0x80
  mtk_hw_set_value+0x100/0x138
  mtk_gpio_set+0x48/0x58
  gpiod_set_raw_value_commit+0xf4/0x110
  gpiod_set_value_nocheck+0x4c/0x80
  gpiod_set_value+0x4c/0x6c
  max98357a_daiops_trigger+0x8c/0x9c
  soc_pcm_trigger+0x5c/0x10c

The max98357a_daiops_trigger() could run in either atomic or non-atomic
context.  As a result, dmesg shows some similar messages: "BUG: sleeping
function called from invalid context at kernel/locking/mutex.c:254".

Uses spin lock in mtk_rmw instead.

Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index f77921957f15..3a4a23c40a71 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -619,7 +619,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	/* Copy from internal struct mtk_pin_desc to register to the core */
 	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index fcf7c3eeee4a..9ffe01a8ceca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -58,14 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
 
-	mutex_lock(&pctl->lock);
+	spin_lock(&pctl->lock);
 
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
 
-	mutex_unlock(&pctl->lock);
+	spin_unlock(&pctl->lock);
 }
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 65eac708a3b3..13836bb188b7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -252,7 +252,7 @@ struct mtk_pinctrl {
 	struct mtk_pinctrl_group	*groups;
 	const char          **grp_names;
 	/* lock pin's register resource to avoid multiple threads issue*/
-	struct mutex lock;
+	spinlock_t lock;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 48e823f6d293..85db2e4377f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -970,7 +970,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
 	if (err) {
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
