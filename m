Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB334C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 03:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4m9+NDppUp7sQi+UOD21uigXlltsiEIftmf4JBbKiQ=; b=yBvMsB5pwPdEUqReN0bwk8fRQO
	XjpQZMo63gh4kDWmR6WJDtgkVNQjtD4pf3Zfeph/UTFVhod2hGCwla7FqUoy/N+0zO7cwqXiKAEyT
	VdGjC3f986xdklpsDfVIFj14Bn+0yzUz1yYWqOZj8h4dyl3lVs04nf9ckYyfeNicz40N6sjT0YMXr
	QaVxswxDN/LdkLAcmyPxYxZiXv74RZKbvZhdAe0C5SYurBMm0kPOWJNAVGF10cKRWN/wwUDQ5+Nav
	u056avx7Wil0Sm4f9G8DDOpI44Ez8hSxYVJ2GjsAMnDcekVvNsUtjZUKT52tcmFZZ3oBoc0tL0lts
	esV1a5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVm5q-002Bkb-WC; Wed, 07 Sep 2022 03:51:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVm4r-002BHC-H7
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 03:50:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id l14so4066028eja.7
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Sep 2022 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=W4m9+NDppUp7sQi+UOD21uigXlltsiEIftmf4JBbKiQ=;
        b=S8XLl/R4T6De2Gn/PbHbRk4v/CW/S2fj6vDkgz8kmZX7PoW1RLsUJZo0DcJJlnnGoQ
         tg8tncuKa2r0KclUVqbQjUFUxyWtdIdI0jhEWw+H87vxgXqARJZl7YaaRXTCR1+UDHdK
         SaWO7+sLzRTTEnbJESVjIe7VEx/F511xtsDK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W4m9+NDppUp7sQi+UOD21uigXlltsiEIftmf4JBbKiQ=;
        b=2/9bBmfPT9h2mlK7K1o4Flr8XyTSx3k3eFY8C4UZTsi46O/rrbtU1FQ44xy+h1Hc7a
         FW/e9yh7CB9fNiIOG87lE/ls+kScWJiyiWxJVHl7tKMu7jrm/wjwv0co2J+5cpOMaLUj
         7pwOGs+JrRkuFdE9wKfeLP7A4bRaat+/Z2I1n0lA2t0nq02pD7Y7rOeveoxPRXv4D2GU
         HljeqFnvJ/gex+jj//rfH7JMvqycHZ2RKt6u1bZOB3B78hil1TY9UKpkU+6gQBRWV/lE
         5GohLhrzM4J8gZ4Nuedt8k705T2vHAxfqBp2hYPZDlSXrfjUfV64rmHuCHXX8eqCLmTt
         z0fQ==
X-Gm-Message-State: ACgBeo02Xp5WCwLJ9p7Z7KYq/lPLJx7Alny5aqlYWCsJl7ORUzoUR+2r
	+2AaVcRKRLA+uGmO3k63f/ceIOLc04snRflsvMRcDQ==
X-Google-Smtp-Source: AA6agR5cWmVDk4BJzUa4/gpQoBsGtpeBnOAIB6yOKvCmn5A0rx51ZiLMS0dQ5apC/zJsAc85IvVujDW8CkEPx4x6pXA=
X-Received: by 2002:a17:907:60c7:b0:731:17e4:7fcc with SMTP id
 hv7-20020a17090760c700b0073117e47fccmr971016ejc.73.1662522606825; Tue, 06 Sep
 2022 20:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com> <20220905100416.42421-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220905100416.42421-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 7 Sep 2022 11:49:55 +0800
Message-ID: <CAGXv+5G52--wF=e=nd3ezDPoQcOdsqMd_1WdzGEWxjjZaJsRLg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: mediatek: clk-mt8195-topckgen: Drop univplls
 from mfg mux parents
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, drinkcat@chromium.org, 
	weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_205013_691175_05DE40CB 
X-CRM114-Status: GOOD (  16.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Sep 5, 2022 at 6:04 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> These PLLs are conflicting with GPU rates that can be generated by
> the GPU-dedicated MFGPLL and would require a special clock handler
> to be used, for very little and ignorable power consumption benefits.
> Also, we're in any case unable to set the rate of these PLLs to
> something else that is sensible for this task, so simply drop them:
> this will make the GPU to be clocked exclusively from MFGPLL for
> "fast" rates, while still achieving the right "safe" rate during
> PLL frequency locking.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-topckgen.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> index 4dde23bece66..6ff610c101ae 100644
> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> @@ -301,8 +301,6 @@ static const char * const ipu_if_parents[] = {
>  static const char * const mfg_parents[] = {
>         "clk26m",
>         "mainpll_d5_d2",
> -       "univpll_d6",
> -       "univpll_d7"

I'd just comment them out and leave a note about it. Or remove them but
leave a note. Removed code will not be obvious to others. And given this
is probably the only public documentation of the hardware, it'd be a shame
to lose evidence of it.

ChenYu

