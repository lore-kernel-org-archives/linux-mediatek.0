Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4478BC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=; b=zQhdLIpj1YzF9EqRN2/9fnNX6t
	szc2nXR9RcbVK2268RJOfmmrmZj0OaHxe30w4+B/Cq1j60sOObZDlc7WE+KKxrN4n4MxcpQe6JCm0
	UJ6MVY9F16zhl5sPrk6qAoMcL3DzupU6hInieAP3Xdos2WQA+FFUdcRisUJIiULFOgETBFGyZ6vtC
	sQWpwHhHcdZUJac0q8t0t9/VBYIgYl23SUoFxccFRml96IFGb2LNqdaFFThOt8CIfnsLXbHkI3iwc
	6EJX5+Mkrf9udyC7q89qvL/vm8BgVssZH2PAHYnDo6K55eDU3Xu1gq/EjOF8bVyBcHsaTrQJgJqKZ
	1tpvuYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgX-00000006l6C-3ccL;
	Fri, 03 Jul 2026 11:03:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgV-00000006l3R-1MlS
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c82538b6b0so3489215ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076631; x=1783681431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=PBVxETL1aUr9JiEouAI/bi+y6uLTGpdSaWGI1sBbGbmBADL+vLh4ykmKm3c21WydAS
         RJgxpvRT6nMlL9hhBIE9h4HIMPDs7xU+vUdhPekgTkFuUMcM7K53rp5KyivuvQ6uRFzn
         keF7utGfzHtJzJDX8jFLKYKnpm9jaHpSTc9WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076631; x=1783681431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=jVJVdM3rTzJ4o4A2/c4/jb2OOtDWfUlRJmIeg2gazVxXlv9fya2nXcEkOl0Os/xXui
         rQM3qiC8/nXU2+9X8T+p5N998s++T/0ZYru52FRqyp2ol3pLda5tqdqZYaZRkEPDPMFx
         iv9P9HCiK6JG+U/HqrZEOGi+eWTELo19ZxYTsHN/D5qcD4/GBmTV7FXLkUBK0y5O0ksc
         5W+cRuSFVx4FYL7rSff19cbn8rxsVoNyj+klfqORvdxKb6cE29nR8HE7OHXoskZPobZN
         48MYUgW3X7NcQfJn7L7ReTR8DlwRvcYsd5HMLP/3nlOvZlmxuoiFmZJ9b4c/bjdyYdt5
         DEKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Z1Hf4ax5DuH8T8ylhGvEyCohhLx1VQILhCxywHNi+Kc6PJbxgbXmtPu9YoViebPu58W+lz/KWsa0XeWWLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0akYDZE9zJDTSsPeZFg4M1CBXjp//c1qWMjLxblKtW76iBsEd
	uNkvWXUF5aadKUdtEVPI7XMogZowGsFnHImbdXcSX3SpClw0sRff8ibGpOMh1P/T4A==
X-Gm-Gg: AfdE7cnXABE3STrj+0Hmwi7KFPaHuIacIy9QJV9LI5udtjgLXbUymkMj0U2LsJTUZoY
	BEZpwCWGHRcdekH04p+9WfwpLUcOGfU2mNnsxNKTkpLKc2/9Gqh5rI9fXhSPB6udbL2gLIVNU+U
	Ih9xnzQBQr7bHqnrIeR6VhQY/1w3YRiSaT8isZ1cRN+vGKcIynevwME4eMr/5nFy7h/Yi0nhXXL
	GmOcHzL+1SCWUIdwvJ0oitq9w6TKKelNVH7VdXnG9qalZpyYcW1X8enPfY1YVlKuoE4OMpG8p/A
	ThtSUxJk94ChH8cE1/UJTz59q72LW7PDveJizZb68ZZ5bEKsZK2hKLyVM/mbqeh6U9JUpG1Kkmu
	LC7WV+L5YfEV8s+8LvbdCl/1IGFwuBHWBswxhMldMNAaMazz4tro9Cpu/1/H2U5Z/Xna1vtbKyR
	I82jyGCA1F6Tjum5Fcl8CcvKyJa3EGavoo+/H4zusvrC+DYj+glkobrxk3f0XZlIUpyM5dpQ==
X-Received: by 2002:a17:903:2383:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ca7e8d9f8fmr111666555ad.30.1783076630618;
        Fri, 03 Jul 2026 04:03:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
Date: Fri,  3 Jul 2026 19:03:04 +0800
Message-ID: <20260703110317.1283411-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040351_378078_2051DA52 
X-CRM114-Status: GOOD (  11.52  )
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..5a5eaf85d5db 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


