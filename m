Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDE1C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:07:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6031221E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttxIaAfK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzrIr48F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6031221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1kXYQbMSnxYStcTTL9eFhN1Xsqvg8kKsHAL+PxlSCR4=; b=ttxIaAfKDdRJkmNQfHyw4qR8+w
	xxCjK4IaQpqXZwjaZbWK8ZDXajCuqoT4iixQLM0fn1VwINblHLSvIgYeGOyD1EPzmH5SFQJD1GpI+
	mGhbnANzgQazYN/1qvCCfs6rfet5Ke9ml9AjRIMnbGvO37bLQKAEnC/QuYn4WiC3Eh53JAEG0J5ZZ
	VzElBg3kBi1cLvtGnMGV1lqLRm3xQ4+5hrhroGVOKpYGyLnn8QA82xgdoPbd0gUCYNdOyEnOjdrF6
	YhZra/rnflTKqMeoVNPXgJqhrCzzC2NMkcQoSejDKHsayXs3SG9gnSzTznm/9cF85A7uXfFsGlmQj
	wtOoNRBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8RH-0005mf-Er; Mon, 24 Aug 2020 09:06:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8RB-0005kk-Qz; Mon, 24 Aug 2020 09:06:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id q3so2599094pls.11;
 Mon, 24 Aug 2020 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kp++64cFXoszqvdcGzZqbmMOiF0qCRzrPOcwqiRIH6Y=;
 b=TzrIr48FY0zex/ejY2gCW04OU2O1usoehaBy5gcEmmrUyUYbvqvI+3oKvhhZQp4kyQ
 mFTrCkSopwsB8H6TmtQZZFOpZmn282T/LKYkvzIZVfw3qherpuAR4bBMongjVlmYG+FK
 cXP4C3lgSid/wpWk8JJnip1Rh0EXubRSbPzTETF0EjBeJAq/SrwPiKzQ7pBBdf6Qm3Mm
 RHR+/V+FtgiCdlXbrFskyFGbtmiaJgZq3VAUvXokr3qrlYD2J9o/Tnpi5U/1GXTf6IG0
 zoKDxyPlRjXLC9/zrfeIMABcsYZ8a2d829BOikzJpw0MzVUBnyLgBxpd0FW9y7s7uF5s
 CDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kp++64cFXoszqvdcGzZqbmMOiF0qCRzrPOcwqiRIH6Y=;
 b=tS6ubyUIU4Q0PhqrPtW8M+M3LXzntyPshRfr5L5qRNFaPoAlPchzvT50BUYfUtPczh
 e9DHYZeP504M3e4bgTFfMkMemVN7VaCgrqPLFKZoHKgWAlE+vLXbJYrwB28+rCLjuuct
 sa8j+Ct9Wb+m2qva/LjOEDNgT42/pOJ8Ia0pOaPdA2ZTciAkYkSGM0iKtfqXRdqGU4dm
 FNA+Mq5z35/oFcWW3vjDpxqz9fiGwo7drgxsIGTvR3XjX1KrNxyNHILmGwesZwbE7FTt
 AyMPo5dA8gyi1oMfc4+AVf/DyIE2vhT9gg3XM0N1X2RPXz/772sY0LOkE0tdAR1v7Sge
 yKjw==
X-Gm-Message-State: AOAM530IRK1vLYmKAw8UFagS3Y0wHSTZYmF88MVRqgGJOzkgwERiX9KE
 iJm2HBEUoOhFvBYKu8DviX4=
X-Google-Smtp-Source: ABdhPJxc8UQkEFUD/7cHQQdo6BbNeb0PLjrl+ad28GepWqs3Ps+4ZyL+XjvIJB27Fk9NwthuMX9GJw==
X-Received: by 2002:a17:902:7790:: with SMTP id
 o16mr2939439pll.299.1598260003543; 
 Mon, 24 Aug 2020 02:06:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:484:931d:1b34:35e8:fe10:8c7a])
 by smtp.gmail.com with ESMTPSA id c20sm9220988pjv.31.2020.08.24.02.06.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2020 02:06:43 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v3 0/2] iio: adc: mt6360: Add ADC driver for MT6360
Date: Mon, 24 Aug 2020 17:06:23 +0800
Message-Id: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_050645_950393_39D0257B 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: gene_chen@richtek.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In-Reply-To: 

This patch series add MT6360 ADC support contains driver and testing document

Gene Chen (2)
  iio: adc: mt6360: Add ADC driver for MT6360
  Documentation: ABI: testing: mt6360: Add ADC sysfs guideline

 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 |   83 ++++
 drivers/iio/adc/Kconfig                            |   11 
 drivers/iio/adc/Makefile                           |    1 
 drivers/iio/adc/mt6360-adc.c                       |  359 +++++++++++++++++++++
 4 files changed, 454 insertions(+)

changelogs between v1 & v2
 - adc: use IIO_CHAN_INFO_PROCESSED only
 - adc: use devm_iio_triggered_buffer_setup
 - adc: use use s64 to record timestamp

changelogs between v2 & v3
 - Rearrange include file order by alphabet
 - Set line length constraint below 100
 - Add Document for testing adc sysfs node guideline
 - Set compiler 64 bit aligned when handle iio timestamp


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
