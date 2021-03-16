Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 05:06:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4026565139
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 05:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4026565139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WpKnQACELnpif+SCcgy9fbZebfmATijREkRaNlQga40=; b=PgA/l1G2R10Ob5BN35S/S8Tyd
	rTalWgulkhu3kUjLZWO+p1nDjVfYBpDcXovPZDp+gdnmgfdvW49tGw+AyNVsz6NmzanZpsPPBczyL
	HNtWdiP/OkFEDJpfQWLrm8PaUtlat981F5CeYP1OPDZ+YQ0izWSGZj0X7x8Wzxs68JMezXnNVzGiy
	Aatjl7tYFmT4id0jyqIRYDFlatqM8xZPmSEZfPShiJubwUHCPNEra0yixOXMxZp2n9HkJi4GKn/hu
	V06ppy6FoZdeIoABqezwagbX3CCBBopRm0kf3YRZNIrzEAr3vzm8m6X/u9T4ncuS5Gdex8JjeM/FU
	Q5Ytw2MCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM1uE-00HQlj-E6; Tue, 16 Mar 2021 05:06:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM1u4-00HQg2-AP; Tue, 16 Mar 2021 05:06:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBE1965140;
 Tue, 16 Mar 2021 05:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615871157;
 bh=cVbmNCunkCaS+UAXYbKdMGWrvOK5rfRn967P5BV1mvA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SZ7Qqv3k+z2lfXwJh0IzauQzRLnEreEAVuM+XCb0RdV0tQF43Wc8vp53HfcDlCpFn
 yG0XIbtCPqJjzn4yGQDvX51s7TEP5IA530a7znIQma4Nvrqc+jWIVywDjXSbgXX842
 kyFN068A9+RSluiQWses1QdyAY4VUeAoIgxyI15Cb5qZ6B2hwrmxEFk7s5cfoJyx+m
 IvgbYioMWjAmlGvrWxcEFr5HJY/B11ebvtT3mQeiW5suHU8iWgGs8ZYV/9AaEWM2pU
 Nr/hOQJFZmzvBbA43CloONeZ5l7ulqVYYsdmgZHaMX/G+GHieD1oxNoRXf86iJI+tz
 r6jDwZhxnCsig==
Received: by mail-ed1-f46.google.com with SMTP id h13so19950341eds.5;
 Mon, 15 Mar 2021 22:05:56 -0700 (PDT)
X-Gm-Message-State: AOAM530H/mwQ4N/U+tcASlwci7UPFsUg5tRVn+pBQDM9M1DVMxgzog6H
 S9//dQlN1PQpLn8C9y1jq9E7FQ6vjboqnpJMozw=
X-Google-Smtp-Source: ABdhPJzK79FmgJ0C57g+KUn1bwdww1LQ8aLQZI1QQ9/6Bf3ST4MJLgWngCooLHXFbLFO/wbHLPrOHtDkOhlc+tqhAiI=
X-Received: by 2002:aa7:d792:: with SMTP id s18mr33267634edq.176.1615871155305; 
 Mon, 15 Mar 2021 22:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
 <20210312063502.3685-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210312063502.3685-2-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 16 Mar 2021 13:05:44 +0800
X-Gmail-Original-Message-ID: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
Message-ID: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
 jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>, 
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
 seiya.wang@mediatek.com, sj.huang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_050600_694436_20F2414E 
X-CRM114-Status: GOOD (  18.85  )
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

Hi Zhiyong,

On Fri, Mar 12, 2021 at 2:35 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> When multiple threads operate on the same register resource
> which include multiple pin, It will make the register resource
> wrong to control. So we add lock to avoid the case.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 72f17f26acd8..fcf7c3eeee4a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -58,10 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
>  {
>         u32 val;
>
> +       mutex_lock(&pctl->lock);
> +
>         val = mtk_r32(pctl, i, reg);
>         val &= ~mask;
>         val |= set;
>         mtk_w32(pctl, i, reg, val);
> +
> +       mutex_unlock(&pctl->lock);
>  }
>
>  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index e2aae285b5fc..65eac708a3b3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -251,6 +251,8 @@ struct mtk_pinctrl {
>         struct mtk_eint                 *eint;
>         struct mtk_pinctrl_group        *groups;
>         const char          **grp_names;
> +       /* lock pin's register resource to avoid multiple threads issue*/
> +       struct mutex lock;
>  };
>
>  void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index da1f19288aa6..48e823f6d293 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -970,6 +970,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>
>         hw->nbase = hw->soc->nbase_names;
>
> +       mutex_init(&hw->lock);
> +

Could you help add the mutex initialization into pinctrl-moore.c too?
and then the patch would look good to me.

>         err = mtk_pctrl_build_state(pdev);
>         if (err) {
>                 dev_err(&pdev->dev, "build state failed: %d\n", err);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
