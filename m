Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9406CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URewZP1CjuEapcOrKzsC3z8bnfBtBnJFc+7fenwYvsw=; b=jtadvqHS2SjivlIuA3sPmlY+tD
	AXXONGQpnh4RlJiqH5pL4bcaCj/cvLPy5WfA/MmFxJ5gqQ4rc1ipdACI1YI2k4X9PyE+av0923Wdm
	XxSANWtcSw+FBbiLO7IGLSZK7UjwRPRo7UluHQzmyN3MpI9CvKY/e7SoheXArcECYBMhUycnUE0RP
	qbBWWeBTjybD80vCUUtqFXGaeq3sjyxXcg37vJYfKlwivSxUgWT0qxvmqNRIyHhSoHLEHafG0kZiX
	p/Y/N3J8EDhlUNKmV9u9YXn12qMdzWK1G0s4rwXFse5e58dZpOGBix3Q2y4G4aykFHEyBK7D0nJAl
	BfgTqfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmOP-00000003hQc-0Wtm;
	Wed, 04 Sep 2024 09:33:37 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsK-00000003YlY-3gSm
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:00:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7141d7b270dso5096506b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440427; x=1726045227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URewZP1CjuEapcOrKzsC3z8bnfBtBnJFc+7fenwYvsw=;
        b=aWWjiwj4dQVX4Oe6pfaUk4ZZla53uWsFDnzvAEgxSJhasttd2puWlpkUXDjtCtSnWk
         f85EnPlp+FvqmfGvAk/VhJ0W8jLX4wHSWYij4LNSaLe7s8+Q/L7LGqOTvUQEpmvBrzGe
         pbIsyMuoNMGgs5HVdp6GNAu7jxfZbHHfeYLk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440427; x=1726045227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URewZP1CjuEapcOrKzsC3z8bnfBtBnJFc+7fenwYvsw=;
        b=oCrsoLukR4k3Ni4RzFFmWNdOT0jMHmf2Fj2BaFOkjQ+rQxAHxfEUTcToXrB7g+PzIx
         9s5AjbO37rKoeEV6brPDuEtxSe79vNI6V3AthKqchlojfQhk9DiBmIMiSOz3hzbXrU7d
         mgvvQsTqei+LPZtNcfAzLzcjtCLlVVWk8YS2M+XrcRPUEZ/p3v+ws9sJGmBvY+ffvd2d
         LyrorKPuMgXsOkH64BlXzTH9DatcVaJV0BYk/m9of1eXXuGX4C9wNQ29nWjtYUX9ncG0
         FpR9Fx1vGF9nW46W8qLht7ORk1BJQxvFACSJJjqo891s8Re9po7R7E0mHjZjLomo32PD
         I0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbVVd7Jk1xxz2o0/NTc39xXhvO+97TKTP/AmuaD36Pd1t+oF06rc7Brq55AdDLIvf6M3kaZfW1Ss/t0K3QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYp8TuL0fQPbBTqmOZyT+KJ5LeQ5GPc33vWEG1yyzmirxMmAqc
	8xRFbg6obv83w2n6Lo7bTBnVSGyKNB4yht+Tnt+9H3nFZZqIk/jgojzUxdVm6g==
X-Google-Smtp-Source: AGHT+IHf+4oWltICBIad0flKpZyWzPtxz5hqcWd60IFNv00gyZa3rQlflgcNL2YbqnsGxF7j26kYgg==
X-Received: by 2002:a05:6a00:2d05:b0:70a:f65e:b13d with SMTP id d2e1a72fcca58-717449c6427mr11999072b3a.27.1725440426991;
        Wed, 04 Sep 2024 02:00:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v6 01/12] of: dynamic: Add of_changeset_update_prop_string
Date: Wed,  4 Sep 2024 17:00:03 +0800
Message-ID: <20240904090016.2841572-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020028_927730_0995864E 
X-CRM114-Status: GOOD (  16.85  )
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v5:
- Collected Rob's tag

Changes since v4:
- Use modern designated initializer for |prop|

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..daa69d160a78 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret)
+		__of_prop_free(new_pp);
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..046283be1cd3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.46.0.469.g59c65b2a67-goog


