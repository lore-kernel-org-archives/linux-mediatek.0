Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0541C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 08:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A4722525
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 08:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A4722525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F0XnPJzK1et0DBTrwzO31esMTR5jlhjq0MwfU+O/BWU=; b=RtHY5XPaQ8oWKT7ailtgNsQ06
	lnhV0MvfW5Q1deMFfV9nF420/j1P0SWXgmuDMAYYRpuWPi6WA00g/Eg41oFQgcaSS+fA5y8K+4smi
	aR83ed/Z2+ddXEqGxK4xljwRxGkgN4Tdme0dAN6XHDjOJzydX3VRYubCYbbJOnOxV1kc7HHfHM9Qz
	JW+KH0YxeUGtk9m9vNS+29eRK5Ghlpi4kh4ywrb7s2KSs5LINOq9gf1fMLFzGCuhUisHuKxY29tYC
	OBLvSfopdJbo2jgDv51x/HVAjKDUpR0rlnrOOYJv8z9hCjuixUN7Q6+0rpydMubm4601smp0WbX4c
	41qWRtrLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6h9-0000bp-3a; Fri, 04 Dec 2020 08:44:03 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6h5-0000ar-3n
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 08:44:00 +0000
Received: by mail-lf1-x144.google.com with SMTP id s30so6610082lfc.4
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 00:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KET1E+zuak3FlCY4zF7z/1ILHVvC2UNzSxg2qMKY1c0=;
 b=HxSx5uVAmmhLrfNvxVpDEfIm79FjWwE+/pIOwU9OCK4itu6RvC3I29vkt6XN+XnlQO
 35qbSosF0096esxtPaOnQPzrtaaFB7ldlWwSM8k6l7VOnau3V36cTZM947r6Yy5jxp6j
 V/UltUuV1NUcCDh14YfCLi2AQKk8jemX3ddOis+X+igZvQK39fa643oOfJrBRyI7Cdbb
 paw/zZAVesnY5ei4at4uYjHLTYCaHAvyWaqAf0sGcjOPfNlnYoyO7Pn8kbXazuKA3Z28
 OYVHXUhRguDKlf0ec/j9CbVkRgRlnWXbPEL1PlzphOt8/IImroG9s1ne8Axif63KivuQ
 WtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KET1E+zuak3FlCY4zF7z/1ILHVvC2UNzSxg2qMKY1c0=;
 b=epRUjwMJ+0HXywr0mupwfGlXc3Bc6/4hz09g4+5Gp2TqfZ4ZV1qnh+9pqAdVQRhVoP
 iQppJUcZCUM1DB75mBbyaqzrf91/0/f398Um6HlXpMmcsKpnh4hlULzlExUWjjQHt1x7
 f0DNVOObE8jm5YpXA1YdFZ9nqa3mTVMigTV3tQI78QvgXwEXSs7psC/V5VigJ31G1hqP
 E1bxNoN5L9w/WqUbjkhsCGVS0IBN6sPFzm1wLh3cN7dC1VyqdDJoKQJL2QRyrTvFm0wS
 rvDwINCZ7hPjFbsEdsA6bSxMbuYXJ2O5haGxYS82/zKlgmoyB7ohj/X0W+/JaXsT1cD1
 ZZ4g==
X-Gm-Message-State: AOAM532q4c36PPOPxffHEw7Rw3Mc8EsTwElyUaQl/Ulvbc4fIYK3QL7g
 2rM65KdbdDrrVBCzmNDPm4gehLpcRHkpuxlNLX+vUA==
X-Google-Smtp-Source: ABdhPJxSmtAp/6oFP6JQUcOPafIUSq25E/Xy3Sy4VeE2x4VQ+ZmXA8JyQPwmPHVM/WpFq9Ryq05QtDCFXaeHkuFJhTs=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr2768677lfh.260.1607071437123; 
 Fri, 04 Dec 2020 00:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20201120093058.7248-1-zhiyong.tao@mediatek.com>
 <20201120093058.7248-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20201120093058.7248-2-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Dec 2020 09:43:46 +0100
Message-ID: <CACRpkdYbVbgUEvGk4t2YHieUaFvMMg1EOR8opuCqm-w4wCYCOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix low level output voltage issue
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_034359_512425_A7E65757 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Biao Huang <biao.huang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 hui.liu@mediatek.com, seiya.wang@mediatek.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 huang eddie <eddie.huang@mediatek.com>, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 10:31 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This patch is used to fix low level output voltage issue.
> A pin is changed from input pull-up to output high.
> The Dout value of the pin is default as 0.
> If we change the direction of the pin before the dout value of the pin,
> It maybe produce a low level output voltage between "input pull-up" and
> "output high".
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
