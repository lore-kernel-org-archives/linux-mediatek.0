Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB90EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 07:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D9660FC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 07:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90D9660FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9eOAGvKxBkXKK0YT191wsWXEvTzydBIwalsjCgRi1E=; b=xv6nBHx1nTZUrG
	F1V9iJSHSLQL3PI9X8TmLHyAk5Q1AjsmL3MCNU3GyPexSr27SoplrMdYGNuc/wfXHLrF9/d1aYIbm
	ZIb9kURbB/j5abXFQKZANOjy7Xh3EatVQHbS/1y7JPelU8HFVX1NAK2p16a8i6/KRmXTuFWJwC2PS
	/KnpoSg5KJPb2cx9QEoOWOUOAvzSJy4XtRj8J3NcDhz7vv9nKD1vY3KQ3eSVe2aQg3yHkUxsVGJgn
	U+GP7rWqM4wjGvTWbp97zvExOETKsbbqP7vB5d40Edz7w9lL8jtJ0DY158DSBziZvJ3oso8ZuLF9L
	oJEmw60rJU9OXGDW9xQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDiT2-005rx0-Ic; Wed, 11 Aug 2021 07:16:00 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDiSl-005rsl-7Q
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 07:15:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so4185993pje.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qePfP9EW1GBUzq27srhUsJLE0N5J6Kl3GGrYQK3Z8yo=;
 b=n+UWQMgmuQmQG2EekPaRfL1GukjblvdMdl3L0W6t76rUyL8BrVBwyk/RqRaD8LUFYf
 i+fl0JsX4mgRuhpoDAoy2mEYgondaqor4wwFp6xWnsggtcaYJpiEqRLYfWdRvANUSXCI
 ht3i6jqDk3nZ2tnpEf90h7o7iJuoKdtB7h868=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qePfP9EW1GBUzq27srhUsJLE0N5J6Kl3GGrYQK3Z8yo=;
 b=Lyg4AEjBzV6hzJNXOK9iqpBCbwKbS39gX3lUgK/HMnlvjxTwtrxi9zuFo5nGR0hLxr
 W0Euc8eixqBcqQsA/dgo7Wo1zkW90OvefUlT39smkf0G/0F57BhIhzCJIbhgFkInlgpZ
 RJcrCZpu1sfxQyJ7g0C1B6yVE/Y2L1FjzFaUKSQNSRo26WCb50KeC9yUCMeTPdfV85Qr
 ZTUxFLuHpPkJqJBmKIO04hGDfebeJLKRR1TWsUDdgtavr+Pih1NFgeBtbATVdTOV3N0t
 pNmbG+nMSYnDvLfNuZxbXaU6THD4t/GdLHn8IHwBOajPW2+TRKTZJNKGe2BvacBxZwi9
 x3Zw==
X-Gm-Message-State: AOAM531ojcI48C2Ktj04D3X/C2jw3b5ADNBuClkQ8HruGJMeos0EsJBi
 bp0zdmAj9sVoQXGuGN0aUCN6ew==
X-Google-Smtp-Source: ABdhPJzkGjGYw/o1M8iFsyfy2/UuALOcoJa9U79ngqCU1NfSSOdr6MzNBX3e6S6NeHAjwCmoYcqpoA==
X-Received: by 2002:a63:f011:: with SMTP id k17mr407314pgh.391.1628666140516; 
 Wed, 11 Aug 2021 00:15:40 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:8289:6db8:5ebc:e97e])
 by smtp.gmail.com with UTF8SMTPSA id y4sm5532773pjg.9.2021.08.11.00.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 00:15:40 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: enric.balletbo@collabora.com, dafna.hirschfeld@collabora.com,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mtk-mdp: make mtk_mdp_comp_init static
Date: Wed, 11 Aug 2021 17:15:15 +1000
Message-Id: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_001543_321163_5F166724 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This function isn't and doesn't need to be used outside of
mtk_mdp_comp.c

This patch depends on and is a follow-up to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=524929

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9527649de98e..2cf8f1864f8c 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -234,7 +234,7 @@ static const struct component_ops mtk_mdp_component_ops = {
 	.unbind = mtk_mdp_comp_unbind,
 };
 
-int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
+static int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index e3d6aef52869..aa6442cc8c1d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,8 +21,6 @@ struct mtk_mdp_comp {
 	struct device		*larb_dev;
 };
 
-int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
-
 int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
 int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
 
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
