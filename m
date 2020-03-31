Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE7AC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD767206CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kpdDTh38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD767206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXRzjOF7WDpppYVkf/9M82DpIpezfUkWxqDKeXdlRZk=; b=kpdDTh38S8aRT7
	TXiYXSjjY9312blM7V4/B9+jg2GB5gApYZtRGYC4BjDVu/D21bjd1RHbpykUsJT66W738Z1z7dK+I
	CLE4AWlWm0RtUol29wGMWRGeNksgPSs9+N7bOc7FZSME3MFm56mG8qPNiG2hSEJa2YPuYTdsKWI/T
	lL+SGnfeZvge8NgiKDSG3MX3ZuNTqsiPDnKicmYlwia76YPwxKs9qy07b6Afn+8BY6lnGUCOtft0h
	odCB1mWH96rFsiKUQNkh6XOPGpeAycR8YlD6Ik3JuQMkvzfRpCyBldECezTsyDDhx6DL4xbWTmXvy
	CcDDvDVOymwa8PNJzdng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJOB-00088P-Pz; Tue, 31 Mar 2020 16:05:19 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJNp-0005YF-Ae; Tue, 31 Mar 2020 16:04:59 +0000
Received: by mail-lf1-f68.google.com with SMTP id t16so16928857lfl.2;
 Tue, 31 Mar 2020 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=syOLKzNXFPPoiu+XEmdedHAFc5eZxcDg8mJBSIFf8lk=;
 b=OtYC3e/2VoLEmDAXvzgOP8Y43uMW6TQ6hJGbdqTNz/dj6e6o6LxzPNqyzYPq3X2JZ5
 GX7QtEGN5OvPkzbKzrRTswJfSTU7928jZtldrp67zMKHyGkI0uflgdTCzotIUrDGD/eS
 KOhKgHdjPPAXOfaUd+6/PvC9uNPdBijVpe94HiUto/arP6Jhrnw4wRruA7B+zko7rSyx
 Ej3+4jnTEWE+btXK68t0twfO5kSaCMMgzCUWM1Cfdq1hhIjuQ6h/lts1RXAxxaG0JAiq
 lVTGC0Nxq7E/xQFwIppArRqyUSw5E4c2WiU+GqWSbxasBFwpbPGh+tClELF3cTvXQMvE
 EnDw==
X-Gm-Message-State: AGi0PublX/laD7B0v/se0EiGzsfHvAwUeMK1pUWEOKw7fUpd/jOyJXm1
 oz73BNGiGg4cCKjP4mPbK9Infx+iiDY=
X-Google-Smtp-Source: APiQypJ8mfeXZWEwnwkJHIaJySP+O1CetP5MrUqCMv3OJnF9VKm1fj7Z3L6vmcuRh8KhdPfLWQtvhw==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr10105816ljj.145.1585657392367; 
 Tue, 31 Mar 2020 05:23:12 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id r30sm9734521lfp.50.2020.03.31.05.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 05:23:11 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:23:03 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v7 03/10] lib: add linear ranges helpers
Message-ID: <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_090457_477866_DD64BA50 
X-CRM114-Status: GOOD (  26.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org,
 mikko.mutanen@fi.rohmeurope.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Gary Hook <Gary.Hook@amd.com>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-pm@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 markus.laine@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "GitAuthor: Matti Vaittinen" <matti.vaittinen@fi.rohmeurope.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Tal Gilboa <talgi@mellanox.com>, Changbin Du <changbin.du@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Many devices have control registers which control some measurable
property. Often a register contains control field so that change in
this field causes linear change in the controlled property. It is not
a rare case that user wants to give 'meaningful' control values and
driver needs to convert them to register field values. Even more
often user wants to 'see' the currently set value - again in
meaningful units - and driver needs to convert the values it reads
from register to these meaningful units. Examples of this include:

- regulators, voltage/current configurations
- power, voltage/current configurations
- clk(?) NCOs

and maybe others I can't think of right now.

Provide a linear_range helper which can do conversion from user value
to register value 'selector'.

The idea here is stolen from regulator framework and patches refactoring
the regulator helpers to use this are following.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

No changes since v6

 include/linux/linear_range.h |  48 +++++++
 lib/Kconfig                  |   3 +
 lib/Makefile                 |   1 +
 lib/linear_ranges.c          | 246 +++++++++++++++++++++++++++++++++++
 4 files changed, 298 insertions(+)
 create mode 100644 include/linux/linear_range.h
 create mode 100644 lib/linear_ranges.c

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
new file mode 100644
index 000000000000..17b5943727d5
--- /dev/null
+++ b/include/linux/linear_range.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2020 ROHM Semiconductors */
+
+#ifndef LINEAR_RANGE_H
+#define LINEAR_RANGE_H
+
+#include <linux/types.h>
+
+/**
+ * struct linear_range - table of selector - value pairs
+ *
+ * Define a lookup-table for range of values. Intended to help when looking
+ * for a register value matching certaing physical measure (like voltage).
+ * Usable when increment of one in register always results a constant increment
+ * of the physical measure (like voltage).
+ *
+ * @min:  Lowest value in range
+ * @min_sel: Lowest selector for range
+ * @max_sel: Highest selector for range
+ * @step: Value step size
+ */
+struct linear_range {
+	unsigned int min;
+	unsigned int min_sel;
+	unsigned int max_sel;
+	unsigned int step;
+};
+
+unsigned int linear_range_values_in_range(const struct linear_range *r);
+unsigned int linear_range_values_in_range_array(const struct linear_range *r,
+						int ranges);
+unsigned int linear_range_get_max_value(const struct linear_range *r);
+
+int linear_range_get_value(const struct linear_range *r, unsigned int selector,
+			   unsigned int *val);
+int linear_range_get_value_array(const struct linear_range *r, int ranges,
+				 unsigned int selector, unsigned int *val);
+int linear_range_get_selector_low(const struct linear_range *r,
+				  unsigned int val, unsigned int *selector,
+				  bool *found);
+int linear_range_get_selector_high(const struct linear_range *r,
+				   unsigned int val, unsigned int *selector,
+				   bool *found);
+int linear_range_get_selector_low_array(const struct linear_range *r,
+					int ranges, unsigned int val,
+					unsigned int *selector, bool *found);
+
+#endif
diff --git a/lib/Kconfig b/lib/Kconfig
index bc7e56370129..411ab2d2d800 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -19,6 +19,9 @@ config RAID6_PQ_BENCHMARK
 	  Benchmark all available RAID6 PQ functions on init and choose the
 	  fastest one.
 
+config LINEAR_RANGES
+	tristate
+
 config PACKING
 	bool "Generic bitfield packing and unpacking"
 	default n
diff --git a/lib/Makefile b/lib/Makefile
index 611872c06926..18c3d313872e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_DEBUG_LIST) += list_debug.o
 obj-$(CONFIG_DEBUG_OBJECTS) += debugobjects.o
 
 obj-$(CONFIG_BITREVERSE) += bitrev.o
+obj-$(CONFIG_LINEAR_RANGES) += linear_ranges.o
 obj-$(CONFIG_PACKING)	+= packing.o
 obj-$(CONFIG_CRC_CCITT)	+= crc-ccitt.o
 obj-$(CONFIG_CRC16)	+= crc16.o
diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
new file mode 100644
index 000000000000..52246325f9a9
--- /dev/null
+++ b/lib/linear_ranges.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * linear_ranges.c -- helpers to map values in a linear range to range index
+ *
+ * Original idea borrowed from regulator framework
+ *
+ * It might be useful if we could support also inversely proportional ranges?
+ * Copyright 2020 ROHM Semiconductors
+ */
+
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/linear_range.h>
+
+/**
+ * linear_range_values_in_range - return the amount of values in a range
+ *
+ * @r:		pointer to linear range where values are counted
+ *
+ * Compute the amount of values in range pointed by @r. Note, values can
+ * be all equal - range with selectors 0,...,2 with step 0 still contains
+ * 3 values even though they are all equal.
+ *
+ * Return: the amount of values in range pointed by @r
+ */
+unsigned int linear_range_values_in_range(const struct linear_range *r)
+{
+	if (!r)
+		return 0;
+	return r->max_sel - r->min_sel + 1;
+}
+EXPORT_SYMBOL_GPL(linear_range_values_in_range);
+
+/**
+ * linear_range_values_in_range_array - return the amount of values in ranges
+ *
+ * @r:		pointer to array of linear ranges where values are counted
+ * @ranges:	amount of ranges we include in computation.
+ *
+ * Compute the amount of values in ranges pointed by @r. Note, values can
+ * be all equal - range with selectors 0,...,2 with step 0 still contains
+ * 3 values even though they are all equal.
+ *
+ * Return: the amount of values in first @ranges ranges pointed by @r
+ */
+unsigned int linear_range_values_in_range_array(const struct linear_range *r,
+						int ranges)
+{
+	int i, values_in_range = 0;
+
+	for (i = 0; i < ranges; i++) {
+		int values;
+
+		values = linear_range_values_in_range(&r[i]);
+		if (!values)
+			return values;
+
+		values_in_range += values;
+	}
+	return values_in_range;
+}
+EXPORT_SYMBOL_GPL(linear_range_values_in_range_array);
+
+/**
+ * linear_range_get_max_value - return the largest value in a range
+ *
+ * @r:		pointer to linear range where value is looked from
+ *
+ * Return: the largest value in the given range
+ */
+unsigned int linear_range_get_max_value(const struct linear_range *r)
+{
+	return r->min + (r->max_sel - r->min_sel) * r->step;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_max_value);
+
+/**
+ * linear_range_get_value - fetch a value from given range
+ *
+ * @r:		pointer to linear range where value is looked from
+ * @selector:	selector for which the value is searched
+ * @val:	address where found value is updated
+ *
+ * Search given ranges for value which matches given selector.
+ *
+ * Return: 0 on success, -EINVAL given selector is not found from any of the
+ * ranges.
+ */
+int linear_range_get_value(const struct linear_range *r, unsigned int selector,
+			   unsigned int *val)
+{
+	if (r->min_sel > selector || r->max_sel < selector)
+		return -EINVAL;
+
+	*val = r->min + (selector - r->min_sel) * r->step;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_value);
+
+/**
+ * linear_range_get_value_array - fetch a value from array of ranges
+ *
+ * @r:		pointer to array of linear ranges where value is looked from
+ * @ranges:	amount of ranges in an array
+ * @selector:	selector for which the value is searched
+ * @val:	address where found value is updated
+ *
+ * Search through an array of ranges for value which matches given selector.
+ *
+ * Return: 0 on success, -EINVAL given selector is not found from any of the
+ * ranges.
+ */
+int linear_range_get_value_array(const struct linear_range *r, int ranges,
+				 unsigned int selector, unsigned int *val)
+{
+	int i;
+
+	for (i = 0; i < ranges; i++)
+		if (r[i].min_sel <= selector && r[i].max_sel >= selector)
+			return linear_range_get_value(&r[i], selector, val);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_value_array);
+
+/**
+ * linear_range_get_selector_low - return linear range selector for value
+ *
+ * @r:		pointer to linear range where selector is looked from
+ * @val:	value for which the selector is searched
+ * @selector:	address where found selector value is updated
+ * @found:	flag to indicate that given value was in the range
+ *
+ * Return selector which which range value is closest match for given
+ * input value. Value is matching if it is equal or smaller than given
+ * value. If given value is in the range, then @found is set true.
+ *
+ * Return: 0 on success, -EINVAL if range is invalid or does not contain
+ * value smaller or equal to given value
+ */
+int linear_range_get_selector_low(const struct linear_range *r,
+				  unsigned int val, unsigned int *selector,
+				  bool *found)
+{
+	*found = false;
+
+	if (r->min > val)
+		return -EINVAL;
+
+	if (linear_range_get_max_value(r) >= val)
+		*found = true;
+
+	if (!r->step)
+		*selector = r->min_sel;
+	else
+		*selector = (val - r->min) / r->step + r->min_sel;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_selector_low);
+
+/**
+ * linear_range_get_selector_low_array - return linear range selector for value
+ *
+ * @r:		pointer to array of linear ranges where selector is looked from
+ * @ranges:	amount of ranges to scan from array
+ * @val:	value for which the selector is searched
+ * @selector:	address where found selector value is updated
+ * @found:	flag to indicate that given value was in the range
+ *
+ * Scan array of ranges for selector which which range value matches given
+ * input value. Value is matching if it is equal or smaller than given
+ * value. If given value is found to be in a range scannins is stopped and
+ * @found is set true. If a range with values smaller than given value is found
+ * but the range max is being smaller than given value, then the ranges
+ * biggest selector is updated to @selector but scanning ranges is continued
+ * and @found is set to false.
+ *
+ * Return: 0 on success, -EINVAL if range array is invalid or does not contain
+ * range with a value smaller or equal to given value
+ */
+int linear_range_get_selector_low_array(const struct linear_range *r,
+					int ranges, unsigned int val,
+					unsigned int *selector, bool *found)
+{
+	int i;
+	int ret = -EINVAL;
+
+	for (i = 0; i < ranges; i++) {
+		int tmpret;
+
+		tmpret = linear_range_get_selector_low(&r[i], val, selector,
+						       found);
+
+		if (!tmpret)
+			ret = 0;
+
+		if (*found)
+			break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_selector_low_array);
+
+/**
+ * linear_range_get_selector_high - return linear range selector for value
+ *
+ * @r:		pointer to linear range where selector is looked from
+ * @val:	value for which the selector is searched
+ * @selector:	address where found selector value is updated
+ * @found:	flag to indicate that given value was in the range
+ *
+ * Return selector which which range value is closest match for given
+ * input value. Value is matching if it is equal or higher than given
+ * value. If given value is in the range, then @found is set true.
+ *
+ * Return: 0 on success, -EINVAL if range is invalid or does not contain
+ * value greater or equal to given value
+ */
+int linear_range_get_selector_high(const struct linear_range *r,
+				   unsigned int val, unsigned int *selector,
+				   bool *found)
+{
+	*found = false;
+
+	if (linear_range_get_max_value(r) < val)
+		return -EINVAL;
+
+	if (r->min <= val) {
+		*found = true;
+	} else {
+		*selector = r->min_sel;
+		return 0;
+	}
+
+	if (!r->step)
+		*selector = r->max_sel;
+	else
+		*selector = DIV_ROUND_UP(val - r->min, r->step) + r->min_sel;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
