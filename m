Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22147C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA59B613D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA59B613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5zT1dHlIA91gMyxvWPXl85Lgnwd1N97J/0oFMJ4rn4=; b=PrPGb+S3sEB5HA
	3XZ+cOYC0CJ9J4qmLokH8I12B5wcGAuNloVHgOIkVX94lu0w2vSQK+hSifev4hP0I70xOE8wXbXlv
	mOtUlkphNejsvZL7U+mr1IOQB7HE/otJ0BaklhPYJkTUH0puagGKDICIndxawtQJkVbxtB0qwCFwf
	LtY+yqasp0GPCFh8MutWr512wy46OpnO0Iyh13gOHBqhJVorVe8j5fdpR694ACGu1uAyk+ly+Y7kD
	YbDJtXdNUU6MDNCloBoTVkz8F21n2CNjb0BGBuQ0MwGAhbfByN3VxxcR19bkmE9xJaFVXTqLgUC1C
	UwilhMPoUcrHMM95HXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXdG-00DKP0-6Q; Fri, 28 May 2021 08:14:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXcI-00DJvh-H8; Fri, 28 May 2021 08:13:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id q16so1273631pls.6;
 Fri, 28 May 2021 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=YuNG0cSnJzP07WQH1cBbi/A+4+mjzR3qehA/1Mv7hmmSGLgeHWMmEu8F7RVgdM7qVx
 mprinDFWUuLOVsQyAnS74xwQNRJXdIS97S87KcynFgYCSKidRKtt7/JzlH4DYeVJfQMR
 cfYtRa5bCFUz0lNu3FclM9I9B1ogqM/H8ub9J9hrI7e8N2DN607JOOVLyK+ZaKznQR61
 ehamUCFqbnOEKprduupYQSKLc/B74TYVdp+UkJzfbffvradmooQlXk2qDxWbefTGEwU5
 kUm/cLT4uRP6AAsPkL0DWGdXf3Zlay5NsdAzTXJ5iQ775k5IMOJ4Tq5AqPfkvJdYRSCj
 fJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=SkrnvimFHLhAjD5F5+EgeduAx/X1XFmNIjzlILbMf7PO5g46J0yFMbVet7o71QrbTf
 OTRvDZuqEBWudeW154WzD35wHqvQ439UMfxep0HZ8NgqrG1rIxh3oxLCkRQjIdM33Xgh
 3BFS30TWUd0Xl5FIXmFkJfFZvmzuhL470MEsX83nZhQc9QR5B6dyBq1gKjwWfhzp/elG
 /04g/tNRlpYIEc/XhK5qL2GkqTmhQZawYZAw4eLA75+CIacOajv61L7bf8G4xkbqdvfL
 Oin6FgXHumpgGOnLx3vFJ6Ns1svO5B9QONPQ/5qynFPndJrjF2gI2h9ebCRvc2zZNmpf
 oA8g==
X-Gm-Message-State: AOAM532fDKGYKnw1uBWWmd2dzuD8klXNqIjjzUV7MzKauLcFnyMls25l
 ZMHwjmUXfbxZcTDjelhgXmY=
X-Google-Smtp-Source: ABdhPJyyvweGFW8Eh8bd+eKcXVC2wzxMqNaQ8UYzWiDHmVDfiTCarncao5MD1si6ap7/KLnwBjFjtg==
X-Received: by 2002:a17:902:d2c5:b029:f1:c207:b0fd with SMTP id
 n5-20020a170902d2c5b02900f1c207b0fdmr6965759plc.45.1622189593759; 
 Fri, 28 May 2021 01:13:13 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:3194:b541:419e:4878:8a93])
 by smtp.gmail.com with ESMTPSA id z18sm3846594pfc.23.2021.05.28.01.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 01:13:13 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v5 1/3] lib: add linear range get selector within
Date: Fri, 28 May 2021 16:12:58 +0800
Message-Id: <20210528081300.64759-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_011314_588407_2CB307AA 
X-CRM114-Status: GOOD (  13.45  )
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

From: Gene Chen <gene_chen@richtek.com>

Add linear range get selector within for choose closest selector
between minimum and maximum selector.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/linear_range.h |  2 ++
 lib/linear_ranges.c          | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index 17b5943727d5..fd3d0b358f22 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -41,6 +41,8 @@ int linear_range_get_selector_low(const struct linear_range *r,
 int linear_range_get_selector_high(const struct linear_range *r,
 				   unsigned int val, unsigned int *selector,
 				   bool *found);
+void linear_range_get_selector_within(const struct linear_range *r,
+				      unsigned int val, unsigned int *selector);
 int linear_range_get_selector_low_array(const struct linear_range *r,
 					int ranges, unsigned int val,
 					unsigned int *selector, bool *found);
diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
index ced5c15d3f04..a1a7dfa881de 100644
--- a/lib/linear_ranges.c
+++ b/lib/linear_ranges.c
@@ -241,5 +241,36 @@ int linear_range_get_selector_high(const struct linear_range *r,
 }
 EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
 
+/**
+ * linear_range_get_selector_within - return linear range selector for value
+ * @r:		pointer to linear range where selector is looked from
+ * @val:	value for which the selector is searched
+ * @selector:	address where found selector value is updated
+ *
+ * Return selector for which range value is closest match for given
+ * input value. Value is matching if it is equal or lower than given
+ * value. But return maximum selector if given value is higher than
+ * maximum value.
+ */
+void linear_range_get_selector_within(const struct linear_range *r,
+				      unsigned int val, unsigned int *selector)
+{
+	if (r->min > val) {
+		*selector = r->min_sel;
+		return;
+	}
+
+	if (linear_range_get_max_value(r) < val) {
+		*selector = r->max_sel;
+		return;
+	}
+
+	if (r->step == 0)
+		*selector = r->min_sel;
+	else
+		*selector = (val - r->min) / r->step + r->min_sel;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_selector_within);
+
 MODULE_DESCRIPTION("linear-ranges helper");
 MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
