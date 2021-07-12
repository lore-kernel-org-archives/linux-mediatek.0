Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F31C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 09:38:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2B36108B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2B36108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvIVckVxD1N7hGuZnMgktUVFio2oFWi3IoHwseMmZTk=; b=n1WWFyPjX091UD
	EDxEVt+lqQ2TnXWuHhsErTwwtyHCSdqQkUnfJyMm4TYs/gJmFgPa53X5h0Sv3+LO+AKCFFKcv1aHy
	EgT7qC75cmm1VkLtsnx2ubMQpu/y6cvp7WKc4qPSs5MBBAskZtYhg8Kzll1Q/OSXXoN97iDhnTLZy
	rAZ4p+kyUe5daTUSra+vmS4Oa/AIg+wdsHQWXWwrKxuO5hDIVs9u8QD7vsFmhuXAxtjOEPWBTEzFW
	Wc8PUk09+AqaM4/BN9de3FFGEgnT4E6R9zML0msdgl9q1uGgB6uolzLIwFl+fW+ajMbRG8cV8ltyI
	j/MtJSmtDgz+ndBBl2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2sOM-006lZ4-NF; Mon, 12 Jul 2021 09:38:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2sO9-006lWn-G4
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 09:38:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f30so42129192lfj.1
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxJCUCjSlgXxGDjLXHj9U/H++hzbmhE6H12woYxnzEo=;
 b=kEXIVazNxdPeQjIQRJkZ34NK8TOWTN8cN3PTg4u6h+qBpMX/8NP2QnXimoDsrD47U1
 Nx9WHbWZ5zUBwObZWK89MK5QKklyaL19EKODkPwj8rr8NhSRf6ZHb7DGRkq9nGOS6W6s
 rlmPcHBaJlpyL6qugKjw7qGyQhPNR06FjEh2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxJCUCjSlgXxGDjLXHj9U/H++hzbmhE6H12woYxnzEo=;
 b=Yh9Mjjuyb01rYKzURpBC8W8RZaYD6gq3YaUPoBIiwcsQrEX7naJ9QFaytRTyzALSLY
 XPcMO1FHW+EptiFxTiDmnuDtnYO8+LVjS1C3DDoldlrrFpr20TkbWeLwPK+qeSsGw5qp
 jyAQ6/b0u0g9RR/TciCg73AJlaOTLhOAhLrdoKNwYUTnOqs4YxV5OQV8wY7XVVDYTc7c
 5cIOuk+1i76P6SZacQeXcMglc7blrSampTsNY+gcE5p7YWvKLGgrLxFerqWFtAZwQlN6
 40qyz8tbbxhqSw6Yz3UG65tY4vJeIIM92sta+zkx6Ofqp9cCwu4CQSWNfLKFo4zIF4XV
 QCgw==
X-Gm-Message-State: AOAM532Q2gxj33Shq8rZF8a4kj+qYBbqv2vTYnDJSMpfHeZB/LHQfVjI
 a1tDtB8bYoWLFY9kvbHIErU5jGOp3MkrmXJghep1NQ==
X-Google-Smtp-Source: ABdhPJxQC8DmA5HEXaqu0oHdMTjSbon83tv6yVWxtwXNhe/ty5TRr6RQ+xzlTDU/2wgHcAMAinpsKbdHUu82InisZBc=
X-Received: by 2002:a19:858b:: with SMTP id
 h133mr20580359lfd.656.1626082687405; 
 Mon, 12 Jul 2021 02:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-3-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 17:37:56 +0800
Message-ID: <CAGXv+5Hn2YE5yhX61z375vzJufsYyWNBkB07zMUqcPty0YxAaQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] clk: mediatek: Add dt-bindings of MT8195 clocks
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_023809_562851_4423EB30 
X-CRM114-Status: GOOD (  12.64  )
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

Hi,

On Thu, Jun 17, 2021 at 7:02 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 clock dt-bindings, include topckgen, apmixedsys,
> infracfg_ao, pericfg_ao and subsystem clocks.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8195-clk.h | 989 +++++++++++++++++++++++++
>  1 file changed, 989 insertions(+)

This is a really long list. I don't think all of them need to be exposed,
especially the intermediate ones in TOPCKGEN. In such cases the not-to-be-
exposed clock indices could be moved to a header file in the driver directory,
or simply left out.

The Allwinner/sunxi-ng drivers do the former while the Rockchip drivers do
the latter. The Mediatek clock drivers are more similar in structure and
design to the Rockchip ones.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
