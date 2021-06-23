Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7589DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376806135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376806135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4K/CAxbSR0uJSNH3T0SZasB3lJ/1bNmoFy0mLTKM5Cg=; b=K48fDXeZkvykZU
	6cMePvlIcjfQO/yeyTX9ubne7TVTG7755v22nAYw2ssAmwHPNAz0i23+g07Nb5vanecyWH+853btV
	UmOCdRbPPLB0NXLrmmWxCKDxNoLVQaGC5b3r44qjlYdrxaYDqqT34Sapk1aFjPvzqkwFgZNrZ9zkf
	UplwX94ZVOc26WSxLLGzMAJ1VnJ2vF/T4bxbm/kG95/vBOxuAeQrO6EdrOPzMXzj8hvsB82Rx8YDo
	osxYFFRmejtxprlpi6fHivHcMtbyPAg0q4guHuGadh04QcEa6yuaBX6dz5jFG1qsQSHYQ6qExDs+V
	uEhd4/u/2RCK/3q4KMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvtNt-0097vW-4G; Wed, 23 Jun 2021 03:17:01 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvtNh-0097tb-5z
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 03:16:50 +0000
Received: by mail-io1-xd29.google.com with SMTP id k11so1602658ioa.5
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNHvzLf0dcW/N6FElJHvK7pa8tblzF8RnikMkbRhgqc=;
 b=KQwcWOid5Pg25LdxM1xepkGdITvCc6T4J2R85mmaB7bkIDgEu1T3tUPqT8MEy5vA9h
 awLokaFnKYGx8ttgdD3eDRN6oRIVYzaJop/uieA9G8GVKWcwTsUdlzIhGG/4/KJOod/C
 nGRb+nO7RJRfdqUn6xsuvR1kT7ydpHkprJjZj5dfbLya73340P2sXFpIprDJxL330aet
 6G/IAqswlGR2LuzlgMxhl+IW4O4MVkM0ciptxyZkbtzCxGlYvo5gFgA6cCpVHOraGigP
 KBai2YEbQRC/28ruDaE/G+JaQ+pvYiGypu2zLop7AlD4MD7Hu4vAagJyIms4YAp0ZuWM
 PJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNHvzLf0dcW/N6FElJHvK7pa8tblzF8RnikMkbRhgqc=;
 b=ZXKUGDX15wtqz8S4lqMw5IART1ay3l5/nHmc9KUSpcX54A0fbJxZ2NLHwnQQUDEax+
 2FgN/ZEp+5NLv4Crhd+pYwe8JU+Smjp9fDaC+zIGyMOfCbKHFK6a8PitW5en2p5I1F5d
 1kBLs5F0l+xM+0pYWl+JMZS+KMSmCSZ4OLu9pPqyLcSfhGS2X9Vk1FWQWXFQqIo39DoJ
 rqeGUalbpousBmMRYroenq89B/XnVsbh47CJ/qmoUZiyDAJR/COa9/f6z97ERp26AwVE
 ie+Yw8psTkpG36FoYqPdVskj8zLAutAHi/1ViPKhqroNc4ZfFTCCC1Aiw5cE/Xx1ABZX
 ZmyA==
X-Gm-Message-State: AOAM5312kSgUkoOsZBMtiaBdzHXxwoIEsiagg4JxHqB2ObPy3Dqhl+yk
 r+MDEDx6w/tg40rNUj5DjFru6s9L3rHdJ2lNUGucCQ==
X-Google-Smtp-Source: ABdhPJzuf9M76T2J4lfBD21OSbpR4YazJiU8J5HoMfr50/3o7cqXmpWlJ0s7vQ3MoUekR+xDG4MYOY7ygI26fPtNhGk=
X-Received: by 2002:a02:cc04:: with SMTP id n4mr6934723jap.50.1624418206565;
 Tue, 22 Jun 2021 20:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210622150917.29137-1-Christine.Zhu@mediatek.com>
 <20210622150917.29137-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210622150917.29137-2-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Jun 2021 11:16:35 +0800
Message-ID: <CA+Px+wX+HatxQVhsfFG2vHfCL9-kVTHVsCyB1=SbhinqaTKfgA@mail.gmail.com>
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8195: update mtk-wdt document
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 inux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_201649_249280_4349F400 
X-CRM114-Status: UNSURE (   7.20  )
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

On Tue, Jun 22, 2021 at 11:10 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> @@ -13,7 +13,7 @@ Required properties:
>         "mediatek,mt8183-wdt": for MT8183
>         "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>         "mediatek,mt8192-wdt": for MT8192
> -
> +        "mediatek,mt8195-wdt": for MT8195
nit: would be better if it still reserves the blank line.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
