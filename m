Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CECC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:37:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAB46052B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAB46052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MgYErEVObLIQGh8abNWCyJ0po3i7tgnRaZ/CscJymCE=; b=EwkWrv9yWn+JiV+4WjqJAuVnM
	ommceQceEEf5uFQkIz5ZYwM/U1P6++cXyFLTVtXKmjycLsNGzpUyZM0ALqYaNPEbb3csnEcLNoBhC
	Zn0ntGpZnXffLMZNQ31E1sEtJ70TT3DvvvtJbBtSjL63HAJ0iBaqLOrk6yAsIpobaOB51WlN0bjiA
	aKRc6/pTobMkwoo7YSIVaxZh1fr++mNb782P7LrTr3i/qqR+opwZxUYVgKq3qNYHQKcH3bgW1Xm8i
	emydgTMPnJ4mFY/ubS1l/ErTgl81tKSjOsTjb9FVDKBBQ3h34e4ebZZC9EKXy0EJhKdMKLrLVCcsK
	6+tIDORVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGPk-000lF2-Gn; Tue, 27 Apr 2021 05:37:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOd-000l7J-D9
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 05:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ch2oBLC6NQEww7nsJ+lCH4p8Gxy8IDtfp3C2k0cWO+A=; b=qEnowNM29Ss24lSGN25blx10Xm
 bOnurUAqtESLtTAYu1Y865Hx2u/cDR2MirHZ2Z7WaEnL8uauh5x48FQaeblpe9q8SDxyPo10XjYWf
 X1oim28tZHSKI4rk0NcWhedivWIraxVNvuwhiCKUhEjstTDgbd3dHAM02ad6lzYbCKFGbHeVQHKj7
 hpmx/x+a5dlnoJdr1gMST444wRs/53rUZK0+AmeCPK4Zv2Yy1yKMS4Or+Jx3ijhFPCVEcXZbSo6HB
 69Do02FXaarm+UnBi4tMvYksVIkEPVDW3pyM+VUssKCCCeAI0KblZiD4ENFyZN53hqX3VlSo83Y2H
 VlOuMYjw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOa-00GSDw-VY
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 05:36:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso779201pje.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 22:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ch2oBLC6NQEww7nsJ+lCH4p8Gxy8IDtfp3C2k0cWO+A=;
 b=iDT/mscq6c4jBDu4qaDzOe3nXm1ALmCUYfi+kLqFJOGJboFHaIsHKm5eQHmbuEaUsi
 e2pm1psA/gibSKNBQ3QDGIwJaA0qTniHLFxuyTSeDExIYdYDSY0aUtM15Ab32BvDrU3X
 Fqw0WP+vbOmWk1ZVtLuq3op9CLgo0pp9ZczUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch2oBLC6NQEww7nsJ+lCH4p8Gxy8IDtfp3C2k0cWO+A=;
 b=gFGM0ga3I8KUeMnz3OA0yIkDsYEG2RQK4ahpFAHhWqMeofo+/RSRaUtFkocgYYpxh5
 BMXd3S4+7phI7Ma32MMW6n3e4YLSMfhEla4cLk9Z6dBFmyNeXNGImmsoG54ig8A1Dg1u
 NZPvb4awuBSGmLKXeOOZfSgfTYdljWpPRKDLjTN3TpoZRqaXSaL/PSmThfRCj3m1Mtv5
 4uRKHDEBOHt8Ike2x/oK045eWWAIjhSS5WTfMYJMrgR+Fj/ISKjTIEHFblPqUUNgUde8
 XwSJShypBNyL5VijPLbGZ9FVtgEvcKm9UJ7WygkrnFYJRyH2oNlKIbF5bk4CgO2zXNlS
 +eaw==
X-Gm-Message-State: AOAM530KJJKPtzpbd3flzlA+XdRuYe8FLwziAbiqC3Dvn4hCP8O5j6XT
 EXnliYIom5sgBX/DjwLKlWpUCw==
X-Google-Smtp-Source: ABdhPJx+gZbECjl99mVB5kXeY+H3By4RaE8KMXOPfabslEPl1PyacDfTdB7lt1pkQt0cn6pfYCGwgw==
X-Received: by 2002:a17:902:db03:b029:ec:94dd:b6b3 with SMTP id
 m3-20020a170902db03b02900ec94ddb6b3mr22246181plx.69.1619501788150; 
 Mon, 26 Apr 2021 22:36:28 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:36:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v20 2/5] dt-binding: i2c: mt65xx: add vbus-supply property
Date: Tue, 27 Apr 2021 13:36:14 +0800
Message-Id: <20210427053617.27972-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427053617.27972-1-hsinyi@chromium.org>
References: <20210427053617.27972-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_223629_034942_4E569372 
X-CRM114-Status: GOOD (  10.61  )
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

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
