Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EC2C636C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6976101D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E6976101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5zT1dHlIA91gMyxvWPXl85Lgnwd1N97J/0oFMJ4rn4=; b=rvcV8AD6FgHpjx
	CNnuzmy8cX2Q+bTajR29zuE1GCbbJk1efK5HoIyEf5yqXtZqyGKyo/kQmbTESVWOYOc8whVdrHGe0
	+GGLWhq31phSaHThhRO1Di+OTdtZmS8LqU86gLYqC/WS5iH4QukfLjsLhINpSbHVjLWG+S3zQjZts
	z8BqSkCcV6KxcsT05Zjxs9dSmMSIzU58jM6oLCCO/F20+X6PEFGUHVMXB9fkbOM8A0CJynY3GiSsQ
	aWo+GMwykeIbJiEE5pqi46YfNUNeB0ZuIRSivTdriAV+QWBYhBN0IrWVof4iZ9Nz4s2+hUTKQvwRs
	WxO8dF65Dx8u4CVp28Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5KBX-008MEJ-5A; Mon, 19 Jul 2021 03:43:15 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5KB8-008M7Q-1s; Mon, 19 Jul 2021 03:42:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id o201so15244690pfd.1;
 Sun, 18 Jul 2021 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=D/8BXP3AYSUmd4JSaASlNyfM0Bl3cbjpR8eC0fxHe+FIHiX0BT6loaPC2z5syM3wQi
 aP4Ykw7YzZnqL7w1UV/qFyJTeuwQjM7fqRjP5wkg0qK3VyfYA56JVxIKSAsWOjOGLZza
 6jCIugmS1tT4wk/sKtq06twvtkr0jS81HwQsb4b4DhEQumhClbWBM/tY/GAxq16ETF/G
 1pK4s3A4Lim5UVZn/NsZ+Pfr+21O4j8qB0Lz9j+gZLLg2s4aKpOTkdHm8QkPJvxh5U0V
 IYmyWydD/KFNpbY+k7cqhlBQ0nnDyz6LakgwKQta8pAvDCEtSpHWPfbD9W2RHLbrZzxV
 8uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=Fie0X7SQJ+fvM9BWHtbjZWrEsE+K5NnXS0XeLXzVM/0u6200vn+4BgsAxkOaNnjMax
 oLXeli/pfXttt5sHPri/QxlOAEWIDNi3vKPJn8BIstW7rb+f98dPPP55kWmjQkgJHXEV
 RRtwCaUypx1jlgpOpXWZbFpbR4SCQ4cU+bhObLjEKdmIVUAytKP3AfYamdx2Bu/K1a2B
 VCg/mXRVCh2A4E4ixr3c1yORkOPugUZGodwVw4SkJfJtU6HM7YuJ0ytkQWycPDj73GCn
 4kNUvndOysPeSUK5JLykWsTwKVzPAvygOuCkey+JXdRTr2MHCPuTZckLQU2jum8WNvM2
 Bj/Q==
X-Gm-Message-State: AOAM531RoL4G3CgJEvB/p4jjr6hU9zQxSOMx7NQZccw0lYkY8AXEm3Ry
 jZO8zi1k1I8AWtRUnPbVkbY=
X-Google-Smtp-Source: ABdhPJxh1gCosQbN6iuToKSHRV624TaQLLlFEGQdSr/6pNsMBX731uOYH/mdQme4MO9Gp94rUFpWJw==
X-Received: by 2002:a62:dd42:0:b029:330:6bf8:b02c with SMTP id
 w63-20020a62dd420000b02903306bf8b02cmr23315961pff.67.1626666169333; 
 Sun, 18 Jul 2021 20:42:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:58d:ffe9:427:42b0:88c7:1ff9])
 by smtp.gmail.com with ESMTPSA id
 c12sm17949448pfl.27.2021.07.18.20.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 20:42:49 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 sebastian.reichel@collabora.com
Subject: [PATCH resend v6 1/3] lib: add linear range get selector within
Date: Mon, 19 Jul 2021 11:39:12 +0800
Message-Id: <20210719033914.16990-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_204250_193193_DF02B123 
X-CRM114-Status: GOOD (  13.84  )
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
