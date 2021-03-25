Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E15BC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 09:24:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47D861963
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 09:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47D861963
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DybXMgO2draTYS+cTLXQ8GmFxjb5g4vOrQGlz6BuL/Q=; b=RiMrO1aW1XbKr3bi8jmNzEu7a
	ApjEaULf+emsgEXvIm6OqfBaIUzNRZ3sNQi3+zjAq7zJtojEVVqzdUCwYfx2zGRFIdcUOwXRh0uc6
	SxeD+xaP5icWx/nJ+64TKnVPXDCgab2vPbO3tETUk9/eRNDxpLfHlNcO+5OJcDy5n0217wSTFQX7M
	EIXbc5jOGBjr9UlblCdk9N0Buh18nSwrlVDdKWPGn/CfgYGsAqCWNlkNomtYF6StromHyKpeY2MB9
	oZtlIvBS2ByA7pxNSj7h4+voWzZiInfHsigFgtiWIWztuaKqLR8lps72ZBsO0VHrzbd1/nPKSMGfu
	gDugmlM0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMEJ-0014TY-LK; Thu, 25 Mar 2021 09:24:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPM5S-0013Mt-Nd
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 09:15:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 75so1471038lfa.2
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Mar 2021 02:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQSUS0sWefxNSCHEC1KdchHT6ruHmXruWSe0jguDBe4=;
 b=o57KpS/SVqgB4aa8+prMDX4/0f/sQZGpgBQ8t5UkMLPn5Qn3CNlhP1s7Y7cH4Uk0Yt
 5+aTgDlMtpj8VahIttojhrrqsMz/i3HQcvat2q+Z9IlJEJlzy4HXE35AMDJMbCm+Fwag
 qFIWd7dGn1Dkpw/9bBN+AjxUmjgcMmvYPGwu96VWRx3Jk3pOWVzsmR2MflpGxpsR/+zI
 214Nl9OF95l2M2We75WAIh54bzfBMQE0D8P4KtGSM+lKlRhSnbRTreADGhK5Iq5E6anG
 Hinv7XgoNn7ofg5sU3fNhh/jDogg7F6goe/WLIVqPG5zG3KvOj4ZK71BAHaib2103KXC
 sl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQSUS0sWefxNSCHEC1KdchHT6ruHmXruWSe0jguDBe4=;
 b=WM/7jpXIHVFNP1BMHQndXP/QzRn7Qzq16xTcNqJQjp6JZCdRZFZLQ2y/JgLU5tiVgN
 93oqF8U+xPFMJaYq4dWLED1d+S33apUEDasK0WzWyd4yIhBP8b7kJZATEWKgXfiGzdjd
 E/Y/7quQaVF6YX879bX0l1b0yd3rYQLkPDKorhnVlz/m1+NBDKF8cATwz5CiaR9Bvf7o
 cFDCJGulSsQIZlelbo6aQPIkBmHYMRcPZKkaYkkG1/tIK1q4IvNYzB0Yu8bsSYlTXLw1
 RdOYrahAm939GERrc1JlJUV26gi9WYQHDHCznUoE5TUnfcFOFZ69GRZ6YS6xYrq3rDRi
 5rUA==
X-Gm-Message-State: AOAM531A0Ttepehqbdm8Bf626DnoL92r84cvykE3yxVlzGrjz44NNJkU
 i718F7r5ECgUBWBVmJU79xOjf8mjh33q/csmrgLdw/z/8lGNblwk
X-Google-Smtp-Source: ABdhPJwItH2xIo9/hQ0G/Dsu3MfocBFrbbbYJg+8rqc4pz2dbpv/HCAoF4I48/Ib6niSpMgouHHNNiCfW6MgVKURop4=
X-Received: by 2002:a19:548:: with SMTP id 69mr4426509lff.465.1616663729558;
 Thu, 25 Mar 2021 02:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210321033150.15380-1-zhiyong.tao@mediatek.com>
 <20210321033150.15380-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210321033150.15380-2-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Mar 2021 10:15:18 +0100
Message-ID: <CACRpkdaO8YEBo53uUuUpegjFTwaZbtWtbKTUynAX_55p89Dfvg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream@mediatek.com, hui.liu@mediatek.com, 
 huang eddie <eddie.huang@mediatek.com>, jg_poxu@mediatek.com, 
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Erin Lo <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 seiya.wang@mediatek.com, sj.huang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_091531_502284_AFA4F120 
X-CRM114-Status: UNSURE (   9.68  )
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

On Sun, Mar 21, 2021 at 4:32 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> When multiple threads operate on the same register resource
> which include multiple pin, It will make the register resource
> wrong to control. So we add lock to avoid the case.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
