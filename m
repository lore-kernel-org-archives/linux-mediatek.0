Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F76BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 19:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6403460E8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 19:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6403460E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spG1M4cmpjcfbapp8yMMeLXA/C7T7tzWV6nvxEJExSI=; b=V7bMH+0sfw3vc+
	GB3OU/o3gwiJ/ItYLMg1qizJFz4sCBCtMpImOvNi86aWSFhvanga5uj6uSFc2DKJ5M9sTS+9TAwBn
	hRurgbFY30UKRVD7CCsf9/vkymHWXU4JMI8vddlAnXvEMLQMVq5LssDxZe3Ct+c+4M5MC6fjyvl0E
	7YanrvQ/J4bDRH4DY1i2bwTAegORbwxoiIKJPbtsHcT7kTGVUfWboOki/uVzgiY6MtnItXEiTiF4d
	Fm/sNsJTIJG269diZ7X+PZ250S1VohNJ9Y3BW713Dl9aNiP5E8satMvoV4HvHa6cwr/QMqhuXsIYo
	/e37KTFy6aUACjks3Aug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQDua-006tse-18; Tue, 14 Sep 2021 19:16:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQDuW-006tra-D6
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 19:16:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id j1so358985pjv.3
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Sep 2021 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=WFOT59cCtymWMfL4SO8+d5Xi0mJUHh8WtafGla+6Fjk=;
 b=fFUtYwDyRmbrGZNDvI6UWZKiCmvMlSwziL8cwdTH2CeDOMkrl0eIUFq46MGgXn6YFH
 HGQLkqHGMV9AZNAeU0yYflwmP0+eTNGG+pVCkUkHxH2iZ4O8RO+Fkoal29xRSbFn6+rl
 0WNChNpZliAfyDd/ac/zMd4FTcuGjGgJJb+sBG071sH6ZtZpLWMfRfdtK5Uxs847Rjju
 Rv8IIaPAXGwVwd/qZaD1SvQ2SG6R1+lvIwkaeehJikFPSIL+FteKeRgluGaEMTMuPFRD
 PyF7GYPeIxp4iAccTJWhSsk8Yl6f+6bs0Bq7l4hnAnm6qNskanPWTkQQ16B+G6i/eg2e
 zykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=WFOT59cCtymWMfL4SO8+d5Xi0mJUHh8WtafGla+6Fjk=;
 b=EP2QjyPcQtVZ1w44uDWkdeS4FIwawd9oLoK15pUYuKTfCBVWG4bCmQAbcwLwUNUSKi
 Ise40JYBZfjrebtZmjfoMmGQhPAWa6ftM1P062wfMk+z3l9KYDOJXuvdOHmKsv9CJ5xN
 UmPipGh8jm9fXz0wTcwZeVQxpujWczLEtL+TsUkt4jXJ++0ajjcE+Af+5XxhtbuH4LUK
 4WIOwqxPUYaZq4av3uAmsSnV/RnTLCWb3G7vQWsk6rkkIltRsaVF2XePucTKJyVTkz+/
 vb+1I1uvJ5dJjt9gick5xGrZ5plFrfjX9LkAKBYqngvjMXXXIuUsfbmByO/gAkAJ3a4H
 4HiA==
X-Gm-Message-State: AOAM530HZhjWhbFqeCSFyMW96SMjwMGO3TuOxepKfuvcv0dtpR7ArXnL
 5GwWZpDyWtP+n2fbJD2s4nF4SA==
X-Google-Smtp-Source: ABdhPJwXvhp6LRKLX8SxbopWpgdpnqaEzIdnzmExTZ7x8IVkYopo45xSAT9ofirlyG0sr+Upl2o09w==
X-Received: by 2002:a17:90a:420c:: with SMTP id
 o12mr3897532pjg.101.1631646962604; 
 Tue, 14 Sep 2021 12:16:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d13sm11034666pfn.114.2021.09.14.12.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 12:16:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Mattijs
 Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
Date: Tue, 14 Sep 2021 12:16:01 -0700
Message-ID: <7h4kan7ytq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_121604_507985_3B811337 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Dmitry,

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>
> The interrupt logic is a little different than other PMICs from the
> same family:
> for MT6323 and MT6397, we have one interrupt source per button
> * for MT6358, we have two interrupts lines per button: the press and
> * release interrupts are distinct sources.
>
> Changes since original v2 at [1]:
> * added 4th patch with device tree enable
> * cover letter title prefixed with 'input'
>
> This has been tested with evtest on mt8183-pumpkin on 5.14-rc6

Any feedback on this series?

The related MFD patches were merged already, so there are no out-of-tree
dependencies.

Thanks,

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
