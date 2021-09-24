Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80326C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FAF761242
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FAF761242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnNV4jZLOJOUyI9doaIkq6FlsnsyQ3NUdUeyjGnHQyU=; b=aXwOCw4x+W3Jey
	IcjTLg5DLlKJr+44dTErmp+djmtCyg2MpxB76eIeWi+C7GCqHUTaP7DdT4U4id9NLkon3+pOjhB3M
	hEK2EribVnhQbkpq+3QsTQ0qbG4s0OLDqR08+8Pbi8k7W/njnaIJPErUd/bPQB7ntCUniynmx6oRH
	FBQUwPcwGiC1nrwyu2A8SD0ZbDZ+UNX2wCcEG8Us/1ztsR80m29wYpI7FfZcv6Ome9V2x701vmhhy
	qA1cXJILB0MS+4iPhCJv6TjlHObQm8srEqWG2PWcJv7YG7FSp/k19EN6RAJK7DZIRMWGiPB2lr8K7
	CLHWkONwjOU8pspY+rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTh04-00DiK8-44; Fri, 24 Sep 2021 08:56:08 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTh01-00DiIc-F6
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 08:56:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id e15so37527162lfr.10
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Sep 2021 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nucC4Uj9fJVb5i7ika51MrVjuU9L1cZ58hKW4COSfs0=;
 b=ZifWl6IBuejnQvj5NUQi9mbAMQRXxLvXAUVeVj0JtdwtZ1yoR4bgtWUyjnAK/NfimV
 zsTHM9Oxtq4zsxaXXQusEaPP/fyOB01VN7+rWJSroQyG+xGcxvjv5OMbI9QPz3cJQpz5
 XXs/msnMkNhJuyAUNl5FVc/cXcmI8+/83k1xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nucC4Uj9fJVb5i7ika51MrVjuU9L1cZ58hKW4COSfs0=;
 b=YId3iyNsrXFWSBoDeFPUi5BD1R6R7tJBDtuarYONJ400DREu5DJDDSpv75ScywUpIt
 YHCOKUaPG3RCMfHt3N80E7E0FuKPLqWb0wMKu388cSubJG8iVW+inYP6zfZNUoUmJHQ+
 rM4HTJaHbA/k9js0rmhmEuHkCnQou+b2+xR7fsHQWHxGQHf07DOD1mCheMWgLwEBMkjK
 Lytj5ajJe1YYds5DoGaADNamEWfXosC6E1kH8qseUQeNaxDRVcQH8EQT6JYI9yTi0Qxp
 T9wTH30jMnu9+71QeJMFCo2SmB67gpndx+OIDhsEZScwy8+IRk+aq7DjHzQ/O0/bxxE8
 OEPw==
X-Gm-Message-State: AOAM530ScxpZaLGHv0jaJXw2ENUajAASc0+dmuoQo9UHJ+bzyB3OLNBU
 K7IdH+LVOa2UhI1bjiOD3DiNCnKRq6vi2pzFcy8p5Q==
X-Google-Smtp-Source: ABdhPJzTyJNABZRhRQ0xhI+mzCIh0W3gHxvAozxJ7wQ2NzcOsXrNReK4oWoG+x7ejEM+082rbzdkEEt5NWU2yOOzl9k=
X-Received: by 2002:a19:c3d3:: with SMTP id t202mr8426817lff.678.1632473763632; 
 Fri, 24 Sep 2021 01:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210924080632.28410-5-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Sep 2021 16:55:52 +0800
Message-ID: <CAGXv+5HXS29-QHhqQ1L7PCwLMBXWXixmSEkyiq-1t5s8zMvGkQ@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] pinctrl: mediatek: support rsel feature
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_015605_560198_5DB224B0 
X-CRM114-Status: UNSURE (   8.39  )
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

On Fri, Sep 24, 2021 at 4:07 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch supports rsel(resistance selection) feature for I2C pins.
> It provides more resistance selection solution in different ICs.
> It provides rsel define and si unit solution by identifying
> "mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
