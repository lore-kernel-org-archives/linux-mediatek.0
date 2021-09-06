Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C65060ED8
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 17:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C65060ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUJvOYYWMyviGNsm1g4/955OSyt2rcTnJXHpP3syTJA=; b=c5BJftYafzq1la
	DH5yZQNxdoQMw9Lyn+whG/9jk5V4GzBYi8mk4BhAUIQRc4489lxU779Qq0fr1zRXucgdJ46oKBM+D
	xsh1hUwPz45+E9qaE4xhDWLrGnTBCgkuQARkbNixCgYOvBeJeveDzgyX1t4hDJzCbhPcVJg2XLKH+
	ovph48g5TzvJomuHadCKb2E3I2YSHCu7sEuYZTAOr/c4KcikzqQsFopSXnw+dozRxei1un7LhUEDc
	iM/5PFB4SGIfIQOrsUu9itb8sXy7+3L6s0YbX34JLHSdxoqPS3FStkl/ZXGsHxDV+iuuujTPeCaxy
	rzgZUsXXWARwYxhjj05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNI8t-001Odr-6m; Mon, 06 Sep 2021 17:10:47 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNI8k-001Obi-Kf
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 17:10:40 +0000
Received: by mail-lj1-x234.google.com with SMTP id h1so12308340ljl.9
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NzOsAcij7qkGRYYRF+Gk9quH4ScOJdJCPVo4O4v2Iw=;
 b=GHRGp+FUEkuHWw+ma0xVKQKa3h0umQo2tZK29UHxYju0b6ue16Kq14o9Umrg1V2MzP
 OQQXLK8KNB+v/BxOIbCyTw0czVpMCwn+5JzpnXPuLMl7EWNQ7sHs3zh9WjxrvQpPpYiZ
 8LWWFMoMXZzjIgD/LiK4RPs8rIKwXYvFnw1MxOfktunYrvXWKxEQi+cNLd54jz/QxD82
 q5LZAvOaV1YZcbxrnCO9UXixRhXWa0Bb2CxeCigV01UXcy2uhxYVs602hEfUK+25gyzr
 O5FHrFpdUDfVO+z3EN+pb5IA++Pltvth3nAlf/Z4d1qU3iaIikLXoUvP/g8bceHOwcf6
 WvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NzOsAcij7qkGRYYRF+Gk9quH4ScOJdJCPVo4O4v2Iw=;
 b=cxMiKZ31DGC2ENKwDkz1gzPv3+W1jDe9xpfbydd54KlMftxNmunFrKziB9ObHIUZqe
 h0Pbv9EZFFCr+8VJhrgoTXjjCmd8sDbx4xBExKVffXkqHly/Ts/Ts6yAWXLV9addBjeT
 e+ZLpAJKF7qNR1zOgYW9NFsU6kuZ+mKU8YdWv17sXa9ZIBHjepm+Uo2U4aU+EroUah2e
 lKA5SJIfan3Gzml8rtLTLtTQtvolpHmKvXiMzuIi/W3xinXbOGTTMawjmX6qCW5CpakC
 8UDMzkbhr8QZWhNQIVDLJBZjflG+2xHZVHgoExNfGSl1V/UpRXUsjtH0lFSXYixgNxVV
 IJDw==
X-Gm-Message-State: AOAM531Ka04SSRh8yyLPhA/iH2hy8Htgwqs1ySS+0qcBMZeEicZTcZdh
 yjGAhCZtDfi7UALbAGU36lpJoIFXUmo4wNVoht2S2g==
X-Google-Smtp-Source: ABdhPJz02lZ2+/F+0r9vZ7g0b7LkWahcgAWP9qXLtKcaYaug81bz1fYecfyuvbPq62onmDQwmmLi7+yTxyKqBDnGYbQ=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr11093870ljc.273.1630948236659; 
 Mon, 06 Sep 2021 10:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210827093855epcas1p4ac8e34d779fe30de3e03bcadedcb66c8@epcas1p4.samsung.com>
 <20210827093119.32481-1-cw9316.lee@samsung.com>
In-Reply-To: <20210827093119.32481-1-cw9316.lee@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:10:00 +0200
Message-ID: <CAPDyKFoXtep02GTFgKZmAoa7cN6CMBErf4UukWhrk5jU10Lj_g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Remove unused parameters(mrq)
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 grant.jung@samsung.com, 
 jt77.jang@samsung.com, DooHyun Hwang <dh0421.hwang@samsung.com>, 
 Seunghui Lee <sh043.lee@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_101038_712317_BEC4F21B 
X-CRM114-Status: GOOD (  17.73  )
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

On Fri, 27 Aug 2021 at 11:39, Chanwoo Lee <cw9316.lee@samsung.com> wrote:
>
> From: ChanWoo Lee <cw9316.lee@samsung.com>
>
> The mmc_request structure(*mrq) is not used. //msdc_cmd_find_resp
> I remove the unnecessary code related to the mmc_request structure.
>
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

Queued for v5.16 on the temporary devel branch, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..813f57f6d9cc 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -961,7 +961,7 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>  }
>
>  static inline u32 msdc_cmd_find_resp(struct msdc_host *host,
> -               struct mmc_request *mrq, struct mmc_command *cmd)
> +               struct mmc_command *cmd)
>  {
>         u32 resp;
>
> @@ -997,7 +997,7 @@ static inline u32 msdc_cmd_prepare_raw_cmd(struct msdc_host *host,
>          * stop << 14 | rw << 13 | dtype << 11 | rsptyp << 7 | brk << 6 | opcode
>          */
>         u32 opcode = cmd->opcode;
> -       u32 resp = msdc_cmd_find_resp(host, mrq, cmd);
> +       u32 resp = msdc_cmd_find_resp(host, cmd);
>         u32 rawcmd = (opcode & 0x3f) | ((resp & 0x7) << 7);
>
>         host->cmd_rsp = resp;
> --
> 2.29.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
