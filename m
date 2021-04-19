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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545C5C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:35:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4126101D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB4126101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/2SdupKEhMkF1XdQpM0lB2RUPWDB+I17OWCgph6U+FY=; b=RDJHZiA/ZzX+uPPjBdgpRA4FAr
	3fYL+yswY/cyc8pWi5J9fnmBZ0onwIiYTHqN/Mj/qOutzcdRXX6uJ5pEftWtefIJjU5ENKnktD4EL
	Y770nRQ+HPPDYAglJf1f3/6P25qjGOTyHb5+rZgWwNwhDLAWT6ZelC96+11DHtVq9t3md2vZ7bfvs
	uvVTrmCmR9RaYmNbzCq1ijNqPIvBNZvk8hnqyk67xM7SdPECMinEjGJ5SatOVu7gz4x23Kg3Imhtc
	9dr1NAMFFScveG176RX4R0Qbx2fWS77DV4beCx85jB7BYgZLX3uqoEn6A3TG44bOuHYYuPt7coL3G
	9rBPAn8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQJT-009Z5j-EV; Mon, 19 Apr 2021 09:35:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQJS-009Z5J-12
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 09:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:From:Subject:
 Mime-Version:Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=8WNrhjLyGdyDWHM865ZCSJ0+zVt77fNMyFmGjFGrnl4=; b=QomYXTmOE59/DLz54Dfy/NaKB0
 IPVeHZkruG4qAkelahGjLNWMRsjZlolf/gk8oMo4NcWnQ8dRL76vqJvCw0Iu4QNBrer/EgIx1zzLH
 i/Eu+Z0Z6rzCw2jacn8X1taygTMVSaI9LV4bCV59tiZGYLY0oqmobf400FsAjbRa2TyCFy/auXFzn
 I6vtwYuR19uUhDQDPBh44O4HvRTQCXyXvR8LtPrtNNKUIErSw7+xEWpgqGMlXJw4v1xqXcVPnenXq
 8Huz6Mw6Odj1ykt+/Ea4vnj3IHoHxOLm/sVYm3a41/fQGtLgu0EzSQI/98PTDXpd43OxHisMe5v41
 JhWPDCjQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQJM-00BEWF-NA
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 09:35:24 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 s34-20020a252d620000b02904e34d3a48abso7090079ybe.13
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=8WNrhjLyGdyDWHM865ZCSJ0+zVt77fNMyFmGjFGrnl4=;
 b=CAEt3s53rOTQrQyMSGDziVgDrIyTUMOlQuNe0Tk+6QH1Nu046WxDAwSUeb9ImRFQGA
 gwnNZctQXHXthNf0nIiNzSkO1yyVNd7JyYGFcUiZSM9ode7MlEr2n0iXKxYwbcx+Pzh/
 XvMNKjhb+Xy5sy5L79ZtyNattUmxFOurOIWY/cOiNtuYyIlCXDo7f04rUtepM47IF0Mw
 PVSBmF+iSKx5R4XGmgTO3FgwzZkKtfzMhr1ftR4qXtZcwydVWlaKh9BOJWbQz6CuUEKD
 DfhH7sdV8GxzSOQXKWz58LIze6jme/Qq7B9mGDLtpkm/RKrg9sDrte+mRbFBS6BgT481
 Jt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=8WNrhjLyGdyDWHM865ZCSJ0+zVt77fNMyFmGjFGrnl4=;
 b=r0Z90311FNmdQXqKXANiSEl8DuoHM4U4j1YjS/bcIumov0udZnB5rS/p+pHNQJ/8lP
 Etzh/Qwk6OrS91cJU5IFbMYA1RMYqfRyKbdwj2IqgQl7gLhNFcgjDWhy40UGwAESGNej
 RwmpFXUB6XGg2HtdyqL/322a0w4sT7fr9a2/gn8sqtfQnerQDBkJEzqErDkZRWnpm7L0
 y6W/e0L4fBMpb4aoK7pqXq/a05ZA+6BCo0A4U65eiKfC/Y9ufMd6Kmsfoho0ifvyXxBt
 ghprSw8zqUZO3mq/aolu8TuL10B8BJk2Ax5wa/irxObJl3w05O52r0fl+i4AXRKkCRaw
 70Fg==
X-Gm-Message-State: AOAM531U9FMA4K/JK4Vgg6chPzIcNTTC3D+sIizM2yNCHmEvRmqvKrtU
 PnUaq+jOM8g7HftfSrS5GOnrJ93uBmXE
X-Google-Smtp-Source: ABdhPJzBRm7VdHEJmg0TVEqWdqGpo383048pfypHGJSkLrWN945dqM4Gi1tsqSwWKdDgxo8u869CRLRnuG9a
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:907f:7138:4a1f:7db])
 (user=tzungbi job=sendgmr) by 2002:a25:c754:: with SMTP id
 w81mr15258408ybe.492.1618824919014; Mon, 19 Apr 2021 02:35:19 -0700 (PDT)
Date: Mon, 19 Apr 2021 17:34:49 +0800
Message-Id: <20210419093449.3125704-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [PATCH v2] pinctrl: mediatek: use spin lock in mtk_rmw
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org, 
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com
Cc: alsa-devel@alsa-project.org, tzungbi@google.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, andy.shevchenko@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023520_799479_A580D204 
X-CRM114-Status: GOOD (  13.28  )
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
  [snip]
  max98357a_daiops_trigger+0x8c/0x9c
  soc_pcm_trigger+0x5c/0x10c

The max98357a_daiops_trigger() could run in either atomic or non-atomic
context.  As a result, dmesg shows some similar messages: "BUG: sleeping
function called from invalid context at kernel/locking/mutex.c:254".

Uses spin lock in mtk_rmw instead.

Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---

Changes from v1[1]:
- Snip call trace.
- Use _irqsave and _irqrestore version of spin lock.

[1]: https://patchwork.ozlabs.org/project/linux-gpio/list/?series=239749

 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 5 +++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

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
index fcf7c3eeee4a..fc79b3a7a188 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -57,15 +57,16 @@ static u32 mtk_r32(struct mtk_pinctrl *pctl, u8 i, u32 reg)
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
+	unsigned long flags;
 
-	mutex_lock(&pctl->lock);
+	spin_lock_irqsave(&pctl->lock, flags);
 
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
 
-	mutex_unlock(&pctl->lock);
+	spin_unlock_irqrestore(&pctl->lock, flags);
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
