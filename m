Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4968C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuteRvmMXEj4iIj0Tuf5/47GSMdBZAJPxo0q3fMhuOw=; b=P3oT7EB37Seo7/
	FhPfylBKvIivXNOIwuNKhpwjJQI7lsNJypnXZGBMlzmsvtQRAKR2DcDzvo1EK+hpf7NQ/ZMtHT+U0
	rBAA7GFstvctBVZ1/V+GmWK996k04ViNwK3WT4uw6o0ILAzmJdiMgl9NMcsV4uwAufW2qt/qUB9WC
	uMn7f6ThzPs1MDFyPtE+MRdPFcahtkCxxkR6r64JZiqjyXaNjH3AZUEVaWqmxllkwBkCUIaS+JUae
	l9ONH1KxFJbkot3A3naRXHcFAmpcyc4AzzBJAalnOWioza2wqMlenwpXVUvEK0m/6QlokISWFfv1a
	Gh14wlV2OH2wOwVP9vsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOVj-00AoPe-Ha; Fri, 15 Apr 2022 16:09:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0K-00AbOf-F8
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t1so11061910wra.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8lmuusreyEB7Gud7csUtw7tpltYDp61Pfem/SE6pZk=;
 b=Td7opDcQaMHI3JFBSWitUPOiGjC1BZcN+VXkNxXfzTacxCPZd+RlBamsom/P6pj6hg
 EQXrRuHGXiNXFQtSrR3QL1QbiiNbjPTITd8XdGNJyB82Ht5mkqdGh5NTUY6JlXUr5pcI
 1GhmEzwbf39+IAX+BfrK0XFv21dUff4s5Uie+EEAFN6tGnT8k7GalPtJr0bbWKkJ/t+I
 LCf964j2RpBGLIc9wst5Vwsn1c4F+klbJrplVP42wMIlCUMJwMzI+m5JAQXDMcnvfCSy
 EI6YeGHcj7aHLbpDBaAkPXjZMQojCrSqhAnsraX9fvf0KOLJVNgLWd+mzHnJMKoTfYCv
 CaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8lmuusreyEB7Gud7csUtw7tpltYDp61Pfem/SE6pZk=;
 b=MeEKrnaCOCCOIyCy9H6YUByOJnIe3zlBGgKaiHKAL2rY/wt5tx1E7j7HpAqCzo5t/Z
 iKMNxqRVEZFNtCj8Hm7se+dbulYHAJ1dLW5pHmhC+lOU1dc/momya993teKWHSe4LTpu
 OwaeH7zmA/KFV5S+hWJJVmXdHCguaxAnMawnGDzdZXkR7L7ZSw55kZXYoIXIVAJxp5B2
 YDSltFwkYb1+l1Xj8Jn9Y/ul5E0AHWRDXr8ats13qHTgUSTr7qd3pE2SG/6q7Ia16Z1Y
 08JVg8wS4yWr45qygJiPTN2cjB7Al7Et+5u+jVJe1LUXFqvYm5uq1ioOSlUedfYjLif4
 cMug==
X-Gm-Message-State: AOAM530ACMLqdasevjjQ8sFjzgMWobiAzAdxRWxD5pSK4AtyHUjgGxmD
 n9tCjWxFgPdXk5Y4CEmtQNQ+7g==
X-Google-Smtp-Source: ABdhPJyicB0kEbhTFgNRydBA+wCxkMiQhnsXg+5hKIJU185vpb3FHT12FRvF9HoZokb6+MthOFW4HA==
X-Received: by 2002:adf:d1e3:0:b0:20a:7841:b9b4 with SMTP id
 g3-20020adfd1e3000000b0020a7841b9b4mr4299001wrd.61.1650037018548; 
 Fri, 15 Apr 2022 08:36:58 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:36:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] mfd: add missing defines necessary for mtk-pmic-keys
 support
Date: Fri, 15 Apr 2022 17:36:24 +0200
Message-Id: <20220415153629.1817202-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083700_527849_F7D66076 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Add 2 missing MT6359 registers that are needed to implement
the keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 include/linux/mfd/mt6359/registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6359/registers.h b/include/linux/mfd/mt6359/registers.h
index 2135c9695918..2a4394a27b1c 100644
--- a/include/linux/mfd/mt6359/registers.h
+++ b/include/linux/mfd/mt6359/registers.h
@@ -8,6 +8,8 @@
 
 /* PMIC Registers */
 #define MT6359_SWCID                         0xa
+#define MT6359_TOPSTATUS                     0x2a
+#define MT6359_TOP_RST_MISC                  0x14c
 #define MT6359_MISC_TOP_INT_CON0             0x188
 #define MT6359_MISC_TOP_INT_STATUS0          0x194
 #define MT6359_TOP_INT_STATUS0               0x19e
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
