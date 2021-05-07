Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E4AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3BB61040
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3BB61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SQFFrTHC4uvNRZd9IT/MSu5wUcte0YfDC1YLot9l0bk=; b=WZft48J2sWaESh7Hogp0LKdCV
	shxOB2xMHv+TqcTDV0QB0N4RKOfGAPrNjRu6nolbPE2J09xky2UM4MHbkCU+c9wNGW+WTV8ljBJLR
	rlHFQeAPymrRDEfYqiJKPo//Zl0viGawTQkeuu5LyfcdLuqx+kQ38A/qt1t4n3eYAjE1IRfYUC1Rs
	6wXmR8HN4WW9yqX908kKatnllqCxNPKhDMUZRcsqyAFC1VLTVH2EPY+Bqke1Ny3aTzSVbIJDsE6J2
	JivJqMkHpw0+UohMRW9S08c9Q1JJfHbljlktNL3T7gE894KsKSg7PRJ7MTQ0/2OXf9VX/xsHLHlKN
	/h8WXPsDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0Jn-0077y4-4s; Fri, 07 May 2021 13:14:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JD-0077qP-I1
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 13:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kikr9ZhoRbpRt9r742gt6H3+Tb3lJblPdN6YyE6SQsY=; b=0J8Ji6sVzsiZNHJAUPEBxqvbQo
 /Bc7dWwvJ7tDFROCnTocDa3KDKGYSAucL2tVT8tiDlpRc0sCZxnmn5/bceIrpqmapoAnHMlKiUn4d
 PUugv0+pQOwKx6OujtgV3vXQmBDlxIer6bvuO89mWrb1r3bomIoJvC3aUULB4nP5BzFDuc7fMc9/Y
 VAWPkFLJipo9r5usGE82TEgyWhWGJE5kiZeg7Il0xwulg+4igBGjpW64Y4Fuc2uKrU4GtvP7nYXzr
 gPR6ThL4DqsbEntsgQt7/HssKzNDRfUvbLgZlNWDR6vM/mu0v60gPWH2qfxRf9p4+OOV6YDH8Ut9a
 38U3uGSA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JB-006sYn-2q
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 13:14:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id a11so5116160plh.3
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kikr9ZhoRbpRt9r742gt6H3+Tb3lJblPdN6YyE6SQsY=;
 b=EAvHCPHyHbXHiIiNsXn2M8do7dMCJUcobH25Fpf1g+s7gllEtWszn+qb/57yyeQQmp
 CBhSV5miPj08lzUv2duZT8QDmc5As69tht5584Xf6Nh8y2dwtdK8QJ2ot5p1Qz9zsFgs
 U8IzCzmwdrhPxHFILcqqaB0XfofyPavr0uwkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kikr9ZhoRbpRt9r742gt6H3+Tb3lJblPdN6YyE6SQsY=;
 b=BbHDZ+nMTjAkEbcoIPTDFsC958fwQFBEGWrv8W73v3Hv8QQ2xo0h1puiFkNn+j4HQq
 ypnNTnnvhuiLrDHJPFTNm5OrHkdz3npsXdFrHNO5IJq9aJt0nbKi4Dg2+aESxa6tHIlg
 RNt9EQiZA0s0lbSQX7BrSptcQ2ZP39Aafr03rSqj/29J9bR/OV1+Iw26SqGwNqEEULiq
 tlbEe58iQhzcPTSV/1v564Kfvqvdj6V+llAUgochLEUXl4MeR/Yc+oFG+mQjgfYwmtwJ
 fqZp2IggwJrbH82yOqDMi+slddEsy9bmb0thlg+MRurMSSB186bVTF5uJOPU3oy82pNZ
 Txag==
X-Gm-Message-State: AOAM530NrbIk7Ca2nVXvjZD/H+WU8crv2LjXsTbYqW4WnzIzm1pkfpgM
 cQkyn2MeG7GE5HXApcrQCDcHFg==
X-Google-Smtp-Source: ABdhPJwXqN//d5LHFxyd15ybs67ak235z16Nesh7tNZdIpgwmAaqvd1c9pGhWHrfZAv/rGknYi/i1Q==
X-Received: by 2002:a17:902:8682:b029:ef:d2:4311 with SMTP id
 g2-20020a1709028682b02900ef00d24311mr6293896plo.4.1620393259946; 
 Fri, 07 May 2021 06:14:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:711f:8553:a124:a19])
 by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 06:14:19 -0700 (PDT)
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
Subject: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Fri,  7 May 2021 21:14:04 +0800
Message-Id: <20210507131406.2224177-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061421_129955_9BF17791 
X-CRM114-Status: GOOD (  12.57  )
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

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..22d1d14b5de5 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
