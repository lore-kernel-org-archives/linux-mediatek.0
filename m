Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF512C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805CF613D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805CF613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5zT1dHlIA91gMyxvWPXl85Lgnwd1N97J/0oFMJ4rn4=; b=dxt+IT08uOc4QD
	5iKbiQQ/KigbV1VGvc+5pXmuBDzhoq+oIa4GL+N91CaDYgTBqAC/mV7kJ+F2j2YuSZNiJ2P6boiRk
	Dt5rGZGrzmkFzxaOMJ9diw8AFoqv9hJbU69iSoKFQeV8KG0kwWG3bz8Fer/CFJBaIVFtAkKu73XKF
	bqh985YElIo5tno+e1aKDKFrvWSs/kSd4xubv0/bX7uiLIbostivBSyGYClos+93OajQYKlDddr59
	L9wlBQOOw2CO24oNbm4iDLbFL7LJiqh6KlwMhqjMlQUgDYw2z6WMoibG3oZIexe6o6RRFvIL2P2N3
	ACrE3sWS9lFy3zQbtIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KOS-003y09-4j; Fri, 16 Jul 2021 09:44:28 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KO7-003xvC-1x; Fri, 16 Jul 2021 09:44:08 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 62so9455787pgf.1;
 Fri, 16 Jul 2021 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=PkF4Bg+X6thh6odEagABVHDS93zgXLYDVuXIgHLpLRgWKl2eO6mUsHpQDJR0S/TR28
 GTdWg7Vk9m1FrDcL6LfpBkfCt4r3G8kwVlaaXs5jOgKAsMmxCa1aawox/6i0KWccDA2T
 s+qMhsESxwmJLgdDY+QRH5Rv/s3Sa76UIS8JoQo9JVsV1al97fXBhXnK+nlNorvShxxq
 mjQGjCoivVoCawVYwFAN4U5DovjTXqBw/LpjcPfLtBLXO/RCbHWZkQtIg0n+hM/rLrX1
 +prcbMatEmrETpXuir6be+pMXM4cLoeNW8xwzeHD2zr/gLIbTmDgL2m9RQKBAs+j9z7f
 bhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21xAaUHWeHof2ecP/y/d30huoLiokvMxn5AYQcuGXfg=;
 b=LIbSE/i5/WxIBikpbY98z9sSthGroMngTrdf+Xl9OPohcDayrHPhoQYLUvcVh48LiN
 SBFkq24U/7BYO+zps8CYv80F/THPiQ2y5l7+52J2eTLc1rX7AFdFKv6clZT53fPJA3jw
 S+R12e5hMQFIQTdeUdROw95KKWaJ2KYeN/fqJ2lZx+XrVpYu2q/U3P7sv65G5kA6qXuB
 5mTbl5HhMQMRIV8ztQ6ToQDCCJqt0WbE/3mT/O4K2U90iLLeL9vWj5XKWjb4/sAJG3rR
 sJ+onnK7EM0nX+NWS5mVzOh/b9IhsFprICLxBu1BTI8tDij91HBkmd/148vHqB9T0y/3
 o8Vw==
X-Gm-Message-State: AOAM53236mLCbiig2BaZBQ/kY5bGi3D9ffgWqHPwHY1x8He0/MkCbLrN
 UAkeAleEWMFjW58PmWYhezQ=
X-Google-Smtp-Source: ABdhPJxGn610wcvIiaFktkXpBqAtlLzue4VdsC1KNppymkvBjMHE8VESjy/S1QW4XHusNkvKXdh/pw==
X-Received: by 2002:a63:9d46:: with SMTP id i67mr9152288pgd.225.1626428646322; 
 Fri, 16 Jul 2021 02:44:06 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m21sm9508800pfo.159.2021.07.16.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 02:44:06 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v6 1/3] lib: add linear range get selector within
Date: Fri, 16 Jul 2021 17:43:51 +0800
Message-Id: <20210716094353.140536-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_024407_137952_C45AB610 
X-CRM114-Status: GOOD (  13.51  )
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
