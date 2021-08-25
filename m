Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48186C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 09:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFCE610FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 09:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DFCE610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA9L9xYKhlmp1PFknc/qAv+Zb6b8tfT9CnoRKMfvE4s=; b=TXYOFnmWtq+LCe
	C7EQqVqLMLKJoEYjol7gNaPFNAjq1q48K997Fgwu+qynlzNM9YjCXpRG7Jd7EboUrg4gpIHjPE0l4
	LkbeqbwPYc4ltmaRpGgf7VZb2vRwfGCeubpSoz9Hytws+GciZy+2fBPzv3d6EKigz+sOjflmziWet
	k9fdclMikyQ7z8tB8k9QGz+vEc8OYimwXfPc0MYdTv5+oD2dfmoT6IsoPULnAts81kpGqQyP6WN8A
	kHHGfflTP3RAW/L2/Y8Y3HYM2Oy6InAbNZitQUjfUQhVLbOEM6gfRQeSfiwdt37btniYw+U9uxdzn
	OCRTzt1q28DsO9cFdC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpXl-006Epe-0h; Wed, 25 Aug 2021 09:50:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpWx-006EYu-UQ
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 09:49:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id s12so17391511ljg.0
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5cuOQSj7FEmEiodbWnKOyd6RMZP8iRN6RZOahPYho1k=;
 b=Mfumi4T6qskHuWjVy485evQdd/k+wJYzt876fJs9sikByTDOvTsYfpWmxt3D/iamnz
 yV0RikZabpUIXqeSxzw8sBz+iYKFJy4aku+vek+krbzBhe32ZfEVcqTeNuxYaCD7hAtu
 lyUL2M2e2bWwkPcsBDUOdmjwzZCCk0WRzbGJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cuOQSj7FEmEiodbWnKOyd6RMZP8iRN6RZOahPYho1k=;
 b=bikf/eSXow//mVqfj36O7XrGOaW+dGZaLZzezeV3q5BL/99KK6Yq4gVMLZ4fGu/3g4
 xBmQy1YH6TRCb8teXVYrQQw9Tx/ZiG0l9evr5rvrSqvNpKUe5+GH5gLAhnmt28cKMvFG
 D71jLKe9M1exwlDN6fMm0+EGV54fI4PjHZU51atJKHAtJ7TwDerGSjFw2i/xaPs0LBP5
 G9VFKF7tm2Ly/F5bBYnpdqoDxL6fMFKIUAzvQSyLqWgDbHwBQEq0ZnyBDt1XiuPWX+Zd
 JvZNWBmTNXDqP8sVLr70PYb1pFgEnEmYwvhD0FusAJ00nbSgVtAU/lUlFaNrA7z9ydY5
 /DjQ==
X-Gm-Message-State: AOAM530j5XeNzvfA6ydNUA2m4RaTRW23XwTO2Zuu2PblpcvdUZ7dLXH+
 /KC8ytZ4q8sfl/xDcKG3Gf0D+np2YYHbp8HBYj1o0w==
X-Google-Smtp-Source: ABdhPJznl7uEULmdH6hxgqbJqNZesw+jY2fw+pcKfOxaN8esofuUiQ5BawDdvJ1OXzvZPUBtc8p26oTmI8I9zp/sGKE=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr35406017ljc.251.1629884950515; 
 Wed, 25 Aug 2021 02:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210823092353.3502-1-chun-jie.chen@mediatek.com>
 <20210823092353.3502-5-chun-jie.chen@mediatek.com>
In-Reply-To: <20210823092353.3502-5-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 17:48:58 +0800
Message-ID: <CAGXv+5Fe6tCaYgn7MUY9g1niyFPx1VwNEidpy3BL0o0a9eoq=A@mail.gmail.com>
Subject: Re: [v4 4/5] soc: mediatek: pm-domains: Move power status offset to
 power domain data
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_024912_060537_582BD184 
X-CRM114-Status: GOOD (  15.23  )
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

On Mon, Aug 23, 2021 at 5:25 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> MT8195 has more than 32 power domains so it needs
> two set of pwr_sta and pwr_sta2nd registers,
> so move the register offset from soc data into power domain data.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/soc/mediatek/mt8167-pm-domains.h | 16 +++++++--
>  drivers/soc/mediatek/mt8173-pm-domains.h | 22 ++++++++++--
>  drivers/soc/mediatek/mt8183-pm-domains.h | 32 +++++++++++++++--
>  drivers/soc/mediatek/mt8192-pm-domains.h | 44 ++++++++++++++++++++++--
>  drivers/soc/mediatek/mtk-pm-domains.c    |  4 +--
>  drivers/soc/mediatek/mtk-pm-domains.h    |  4 +--
>  6 files changed, 110 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
> index 15559ddf26e4..4d6c32759606 100644
> --- a/drivers/soc/mediatek/mt8167-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8167-pm-domains.h

[...]

> @@ -69,6 +83,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 .name = "mfg_async",
>                 .sta_mask = PWR_STATUS_MFG_ASYNC,
>                 .ctl_offs = SPM_MFG_ASYNC_PWR_CON,
> +               .pwr_sta_offs = SPM_PWR_STATUS,
> +               .pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = 0,
>         },

This hunk no longer applies due to

    http://git.kernel.org/matthias.bgg/c/114956518c85f4e93c298749b35b46b2e78a2ec9

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
