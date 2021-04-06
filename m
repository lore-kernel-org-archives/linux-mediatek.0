Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95471C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:46:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE15613C4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE15613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Zj+4w/zGptS3qwxK/jQ/3ZF3DF+wfnbol4cOPpFUaE=; b=avVMEQDqxAoPKq+zz5Fpsurw+7
	mR2xUMl5n3dxmKpoKI0Ux9615W+gv5hrYY5VeldUG7M2r3ExntGDdavGsVqNutVtFJJgi554PIJIm
	1PhgmBlM/KgKGDkCS4yff9bJlUAtSxFbhSXVXy0laOoh5vYDblKdUfypaXxa2msAFoaCA5pUYYpUa
	cLTJIDXluIoKWW1NwW2l/3+TDdEsZ6v/87vlr18Br7TJxJWi0NNB8dkc7a4gklIOmnpES/Da3wTiD
	PAsui301M0smHm/x4a29l0EgTsvfq8UHZEb15+EceVhXJ8WRGR9Qr5rDM5PC4pSYPn1jMtfAPrmQ9
	19n1OLQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmyA-002rv4-Vl; Tue, 06 Apr 2021 14:46:19 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmy6-002ruF-Ty
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 14:46:16 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id i2so20821152ybl.21
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
 b=giIt6BWIWMwL+8oWHNwVESB6kfvJE2Hmau2LQVK/qOvPwuVEBKftkRZlFONM4nGfoF
 Hf/3c1QQXU1V6LSOxXw1m8k1LrR5PqMpXkizk0pt2yxTS2VNowkZ6SXdp7lnqTD3G36P
 DfFnoQCzXpXGqSfvu8nyoT3dfIcQVDUz7hkC9HBCD50BIfK6GTOyruWVW2MGRGtsKlqS
 +717WzuUfV63wlvhHPAOm1OQKLr9d8jar0vqcjCLaVwtoMvwR++xHQXqUD0eKiREtED1
 KH7HytuHx9+jM5UHZfehajQldXI3Ey5Jq8TyimnuZ2+Udhr92HChGO5d4JgRFXoTo73v
 cylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
 b=CSBS/0O1R/PWFi2fwMYcIkyeQd1jVcDFj7Uh/oSPfBuMaiU+McPmFYylVVg8v7YdwR
 bagX/M2TDVWEpbgQRRsz8JJqbfHYDbhHZLDJhSbehHVLMkZa05zdIDA2XAw49ontpYHF
 wSBLmy2VbfEt5/hzVDS3bcq4urakWtFslky5kwYgX2gomAjg4OicrrIsTgZf2epJVkFG
 HwBQ+t1W8C+WXPkhbNNmxzUMBdnSGG5MEPFBYjm5RqXSuj7H54J+BUOsq09wiu9bSZsk
 kptg2aSSNgv7uTrkE69sz7PT3vBimFJUctU4ravHlITeH1TbRjwZhBSo+XEy4COvMON8
 sM1Q==
X-Gm-Message-State: AOAM5319pU7UyjPz4f1rJeOu+YymEMO3Nk2OATdgu/ro+OzTipC9RaJe
 v3u5qaC0xPTqh3qEOjcG9cruQcmDLWoU
X-Google-Smtp-Source: ABdhPJxLBPH5IlbJAcEx+YiWk14ww+bmR7OEBrrGRnZpj3rZAnOKTtdeTjOnpEQ5A5YxHscwtF3PTCwuzler
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:9d56:89cb:f993:7b46])
 (user=tzungbi job=sendgmr) by 2002:a25:e90b:: with SMTP id
 n11mr38157321ybd.467.1617720372864; Tue, 06 Apr 2021 07:46:12 -0700 (PDT)
Date: Tue,  6 Apr 2021 22:45:40 +0800
Message-Id: <20210406144540.3467756-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From: Tzung-Bi Shih <tzungbi@google.com>
To: sean.wang@kernel.org, linus.walleij@linaro.org
Cc: alsa-devel@alsa-project.org, tzungbi@google.com, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_154615_215262_A0036203 
X-CRM114-Status: GOOD (  12.54  )
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
2.31.0.208.g409f899ff0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
