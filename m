Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD8C001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 19:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yXWmRapdmWSpOJGcCnf+eTbv0hwO0eR2fATZocuX9i0=; b=GbwiG3ie59zp/1luf4Wxk1JBdd
	IAyn0cjN0uA/olMIHv/RB9kHcRQgkJNXuzxaz+ahmgWUaEMygZoylo14sS66E4TTbVwwjYTddfFfz
	zjOADn2BTkdvWcZpTvHMYH4lWgMbuSnxWbF/h5bfTx56Y2ZrGerocFXx+q8/+68KkhyXX5hcgFBGC
	IBAGmQUWfUOldDHU/iAs4DHfqAguAoGq4ul4++OdPwmamkQ4CS940+ua6bGcpdTo+uy0ziKuxcexh
	s9prySaeP3kgEGgPdFpM62aOWo5gcKmYYlkPsp6ELPMIV+dlksdPcEWpyFcW7lZchMhQWKzfZyIFx
	rMaGkvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXom-00BSmy-0M;
	Fri, 11 Aug 2023 19:29:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXoj-00BSlj-0N;
	Fri, 11 Aug 2023 19:29:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so21180345e9.3;
        Fri, 11 Aug 2023 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691782136; x=1692386936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXWmRapdmWSpOJGcCnf+eTbv0hwO0eR2fATZocuX9i0=;
        b=M4zMHdklTi41Vs2EVIqzFP2uvzg71K+uZTT7l1mwsTIvPH7npW6JMwx+UepkXInA2Q
         U3aTBo6YuIKIw82euChV6xBdwwQPGA3nRTfc6Omf9XUBWnzctWHOe2ZD9WVM45y0Q7Cj
         azumh/Tu3XaF+dnqtICRy4ld5RAE3SFxYN7IFo+2r37jC8gBeXV5UAgKJA7fHMnHvVvr
         Lpvp+rQ+9rC+/j7rGuviRy4oY5Jlm58VyTaLLuisnaErMCR560KlYf4H21ZL0hz4GvFJ
         9oy2ToFc1t/CDvu8Psl5qCBO39bybfdeyZdE5XY6y0bMp9GgQ1rAfodrqhhWMLswYfkF
         gx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691782136; x=1692386936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXWmRapdmWSpOJGcCnf+eTbv0hwO0eR2fATZocuX9i0=;
        b=jeS52noplUxiKFTaouh4+7+3XmlI6m0b3M0j9V5Vn8I8JT/1Q3VmDLRNM0+npphInv
         dxF/gv1IQe2kDqhUzkNVVev2necnhfHFGxaPymepyE+bTD3/BaZeC6hSt7yzU3uCpr8o
         pHZDsFk3cMxdYxQz7CSNMrV8lpuFbz5OzeiGgnOlR22u+m14JaUYrb4oZhRBZbWFzBdO
         +XUp1Gz6/P+jFmaNqkYWg1yIFSbNW8rSFko0UP/7uCVQ4n9m6ZurtOxIHO4NagqLmjgv
         GMbDvc3G8/tl4Y7k9hO0rxnPYzVWqs6FJPLFpB1T0o3ZAXUsY6aK7oF2nXC4Qg+v5obQ
         n0dg==
X-Gm-Message-State: AOJu0Yy6il2etUKnhyGH7Vt7WBo49C9NDNfEXNSAUTQseytMwLXxRPyh
	HK5aLe+vuyXlG7jLV0j/xsSVHns+9BWUaQ==
X-Google-Smtp-Source: AGHT+IFbYgQt8ICnMPepR4vjBncTPqeCwItzMpL0iUVa8ME8CdhVjlBBG5eEBluNJoJzLV9WIwI0EQ==
X-Received: by 2002:a1c:7c10:0:b0:3fd:2dd9:6d58 with SMTP id x16-20020a1c7c10000000b003fd2dd96d58mr2153458wmc.26.1691782136239;
        Fri, 11 Aug 2023 12:28:56 -0700 (PDT)
Received: from localhost.localdomain ([92.85.190.61])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003fe8b249df1sm1871152wmc.41.2023.08.11.12.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 12:28:55 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: rdunlap@infradead.org,
	void0red@hust.edu.cn,
	daniel@makrotopia.org,
	bchihi@baylibre.com,
	aouledameur@baylibre.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	rui.zhang@intel.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	rafael@kernel.org,
	alex@shruggie.ro,
	Andrei Coardos <aboutphysycs@gmail.com>
Subject: [PATCH] thermal: mediatek: auxadc_thermal: removed call to platform_set_drvdata()
Date: Fri, 11 Aug 2023 22:28:47 +0300
Message-Id: <20230811192847.3838-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_122901_160579_F6D744DC 
X-CRM114-Status: GOOD (  11.17  )
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index f59d36de20a0..99a1c35c68e7 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1283,8 +1283,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
 					      auxadc_phys_base, ctrl_id);
 
-	platform_set_drvdata(pdev, mt);
-
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
 	if (IS_ERR(tzdev))
-- 
2.34.1


