Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D41CC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 07:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DA86120A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 07:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62DA86120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3C459wM+A0E/tOULW2ntJ9Rk2OMgjUR/w/AMkVFLvs=; b=exTfggOpRZ2zol
	oPGpq3z5GYO6gw9BekaX4R71Rx+39ixC/WnKQ5Huy8CFR6+WI6dqCClg4HtQiViV2J/yQL/VCftoJ
	r/Jlqq9dZ1fGiSo/QzJ5+fzf5H+hhDlvP5GcXC+dWnqK218p/ak+ueSbD2/RlR+TWNcgpNUWrBxr5
	hM1i3nK0p/+eCrt0VyHbR/3V+ipgf7VkPLjO3eFTnlmplxqOuCf+CfOUYyvPoHXAOnAQzkI3RZN8S
	G7dYIATG10uLkJhzbAMS9R5cQH99YW2jAIFGwqlfCOINSj7+FB62H9tGJA0pRocKfzu/iVOW8gMVs
	PZRZ3hn/GgXMuSj1HPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3vVO-00HMXs-Nk; Thu, 15 Jul 2021 07:09:58 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3vVC-00HMW0-3p
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 07:09:47 +0000
Received: by mail-il1-x130.google.com with SMTP id o8so4115461ilf.4
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Jul 2021 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9B+oTQwgmo4p1Ky+jMiYsVX5twnQnFrh+/KabLkfKoM=;
 b=gXX+pNEeNfCIXnvpl5zzg72jHjH+3zkYJyYwbmO1kzh6ft7/OouMUm8xc5cxG1XPp8
 Vfl1oHQrkntzz2y4B62MFB0npJvEz/EllABrsOjYb23ZWwcji9c17WbupAJqSMCKjf0q
 P9puY5/sExP8rW+vR6b7vTTJ9DDQLHDyikWKMFxq6Z+CSp+C0hNwnB5kLycCHNfoPdF0
 ZME0I/BW6gRIqG6XyZirldBU3sEofWoFpeDFdYt+CBSvj2oKp21RqmylUxRHM9lqPuuJ
 Njxiq/CD9vBHyByW1XrAxcB0Y//F+cqnQDlTU5eH2uxU8VpUmofQm/oQOYs4ipZrnaFl
 xsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9B+oTQwgmo4p1Ky+jMiYsVX5twnQnFrh+/KabLkfKoM=;
 b=dyoVh70gRK5HIzzSP0sL7ktDGjNitXuU5L/MmHqaMyl7We50fn+ok3PuxtG4NvdV6R
 7xn4QGJ6ytHHiD+2MDSFG8uRmQ7xFkzPUJx2q95RVWklb9YnsT5UTh3T9hRSitCuLb1x
 Y+qV8LTJk2XcwJsABrSm9TqDaefD8e6erX0pLsATDSdoHw7dz1BlyiJPzjdWcVkJGpUs
 0MjWL6m0fxt3QH3zjHV95aPto46D3dBVx7ezGnRpLtY6WIoT8xy6BnwUyKTKD09xTsdz
 1dl5XuIUFow8MUDsmv1EPV0OrOyfo6DVbFZqPYs0cllb/3znypwtSO68NjJf1z7LjPm/
 oNjA==
X-Gm-Message-State: AOAM533G9p5xE3xENFj01B4pE2O2zz4lH8N86DllrL0y5/5sglbmT57S
 +3ukMo6XhIKgTmPlZ9E4+bXPhMSLbtvrPjOKwOnmgQ==
X-Google-Smtp-Source: ABdhPJwuKUmsa/XevSPh49jg4k4QcER8gMdTrKqp3qt3Rwy5IFwH+L9++y/Wz79S7Mh+BnEstfthYeRZOPSds8h1z9k=
X-Received: by 2002:a92:d990:: with SMTP id r16mr1786919iln.204.1626332975821; 
 Thu, 15 Jul 2021 00:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-9-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-9-git-send-email-kewei.xu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 15 Jul 2021 15:09:25 +0800
Message-ID: <CA+Px+wWNcSkxvsEoUrgBN73+jhq8qjFJodYjQnY1zW2d0a5yRA@mail.gmail.com>
Subject: Re: [PATCH 8/8] i2c: mediatek: modify bus speed calculation formula
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, matthias.bgg@gmail.com, robh+dt@kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 leilk.liu@mediatek.com, qii.wang@mediatek.com, qiangming.xia@mediatek.com, 
 ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_000946_221986_B207BDED 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Jul 15, 2021 at 10:32 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
The patch sounds like a fix up.  Need a "Fixes" tag.

>         for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
>                 clk_src = parent_clk / clk_div;
> +               i2c->ac_timing.inter_clk_div = clk_div - 1;
Using the way to pass the parameter "inter_clk_div" to
mtk_i2c_calculate_speed() looks like a hack.  inter_clk_div is set
again[1] next to the for loop.

[1]: https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/i2c/busses/i2c-mt65xx.c#L831



I have no domain knowledge of what/how the patch fixes.  But if this
is a standalone fixup patch, suggest separating to an independent
patch.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
