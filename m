Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C6C11F64
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 02:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF3D61CD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 02:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF3D61CD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ/rJtiRq/cu3/eR7xTGtCSKAMI/ebgatzGHEr+SOLQ=; b=T68UsxMfKgC8W2
	nP/kRCenNVMZjRGPj7v3soUe17GT9n0BCnahq1VvXhcxwFtUJUB5UQCIP/DF89nlrNtWB2HVQrnqm
	UF6gkAnvK4w9HAffvR6VV5QQbEE4V/K93ai2GkUeEp2oVtFbMLcThl5ldsQMI0JYSDrJzerlsquY0
	S81o3N7aVrOfCo9srAUhYyh2tmZo6FdNYVq5u5nC9fIndRhK/khR9Lnq/4ZLsA00GpEHZomrqOpPO
	8Th/QTyRxknExlp1GR4p5YYasuu4ZbK58nGp/PTdK/4mE9rzRzWPg4ch4TA98LGcX3BfHWIZ4dKUG
	yq7dvRa5ntzdaCwC6Y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly3G8-009b0A-DR; Tue, 29 Jun 2021 02:13:56 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly3Fw-009ay6-EC
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 02:13:45 +0000
Received: by mail-io1-xd31.google.com with SMTP id a6so24834089ioe.0
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 19:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcncWXlDetcYOR5cxpoHR6LBZHK6k4JsfTUcGr7lEAY=;
 b=oH0bBjWOO81W8a/L6iXurUAI6ixFtjz6ToQGhDLBOmO7m0qNn2JY8imwqEqkUOsJgb
 EE/p8bWvP7ak+HW/yUa7XkN0wziLHFqgZiJSSL6UULw1Fp/eDk+sB+njiA4W5jLyLh5m
 e8NW3GqJ7oR14mpH+E4/IxYmmAVxiCfsohMNN1MqK4jtimirxaBEfUKyq7jOzrRODKTg
 QwDn6pYZ7qNnFDLc47E/L4bKxpCylujJdIlXVihpxnRNY3vdTqjfeuitvCKuCxkRTQ2q
 nqtCp3ULPQmKpxG2AS05R+byNzKj7KZhAwVAgOiDkQcKh6FNTA04MRyZEaOfv4BBcZyU
 XiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcncWXlDetcYOR5cxpoHR6LBZHK6k4JsfTUcGr7lEAY=;
 b=az6O6rwCLP/fe9aqw2MpCyGnfKUO0VjxiTrdvTk+NwwDFWQ46pvr/NdhEUh94y+OdO
 iVBnT2CmAaUv/w9Ybh44tMadQ0LSZ51O4jTA/9WpTes5YVjnBRU8ENfM8DOcu+kABCtu
 tEm7DuKO3JY3CBvCagiKMsd2QqBX6jWGkPyYprK5RUooKKRr8Y1K4opr5uk2aCH3re0s
 YV6R1uaUkwkl7EmhgPq98UO3gnYLA5Rl767DXtWPi3g13mT5lq6FSWY/D2u93FuLqFMs
 zfkMGYL3DhJPFOgM5IxKuX95d8m9ErfldIMZYfVaHXfq1jwtXSLRg+QOMuN7eLVImXeV
 sK7g==
X-Gm-Message-State: AOAM530qIiug4vKC4NuiogSTG7ShVammXF57Qlu9PYt43HdxVTxsVzZn
 yobKdqbBACQxzsYQX+359Mqn4dKW0n67uFqpbRPvAYduvdY=
X-Google-Smtp-Source: ABdhPJx6MW16x6OLxQk6NypGbyMZlz+0sgCozwnDG28+XM6Z/8kDLeMpPr0LcPhWAxEg/47OFX21/HUOVP6vp4W/Ol4=
X-Received: by 2002:a6b:2b04:: with SMTP id r4mr1928898ior.195.1624932821270; 
 Mon, 28 Jun 2021 19:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-4-Christine.Zhu@mediatek.com>
In-Reply-To: <20210628113730.26107-4-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 29 Jun 2021 10:13:30 +0800
Message-ID: <CA+Px+wUDSDjLo4qePN=o6JPb=Tv=y4vqZqjFO2ZBEPJrF8sxKA@mail.gmail.com>
Subject: Re: [v5,3/3] watchdog: mediatek: mt8195: add wdt support
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_191344_537103_595A9136 
X-CRM114-Status: UNSURE (   7.02  )
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

On Mon, Jun 28, 2021 at 7:39 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
>
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
>
> Support MT8195 watchdog device.
>
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
