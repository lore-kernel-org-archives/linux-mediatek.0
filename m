Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A06C56202
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 16:07:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDEB2076E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 16:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmexPfH7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Npylciof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDEB2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bk+lSJaBy44Mlv4HsfOcb6jW0CSYjMSSciqdTMk0oTM=; b=gmexPfH7gGim3tKZOvnToVjQR
	3HqabNklWN0x6bDGMVbpVdY5gPNnrnyR4Ye69fw0w0Cg33KLfEwk6IHNNk9pIZg34+lNprVMiTrs8
	DE3Y/cFzlJ2MyUhGkFz/RP4tPMmRWssMvhvcjec1HAGoOUda6CTmeY133Qif44iZDjZ86fOak7PUb
	laqFI9m8VS9LTo45oNGGE0jgUdrblPnThqI6MQh654i9x22D59fqZIu0jZ3jdDJq8nuYHKbNETgDx
	ovq80OVsnbMhe1v+d+8NrXZqLBo7J1TN++74RD7CBLlZGicXGMpqKzkt2vI+ngzhPtkRyqseCxGVa
	CPnUPP7JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khENZ-0003Ho-IY; Mon, 23 Nov 2020 16:07:49 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khENQ-0003En-Bn
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 16:07:41 +0000
Received: by mail-vk1-xa42.google.com with SMTP id v5so4052843vkn.12
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2020 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=erW0XIM+2y9def48xOpIc4QdS/vND+3STJwJE9GzrvM=;
 b=NpylciofEhMTaLNdbM9e1geQueViMrm5kQlxx0uBp9N20vNsPQ0MItUfE46rsSwk7u
 8zw+2Daf22S1TPyrUA44QJskC0ltQVAadvRihxTvO2RS/jyJOdmwDEPQZlny1uARVT+o
 JTjp6WxOiNcj53fPMYHi4ZUL+IqdrOV1xDDzF6ZWkPPG4y/5pnOnIhyNJ08z5juS3qxB
 UiZqpb5KOm6S+FzbPVkF29sMKBfbSj8246AclN3e2BTpDxz0lUuI7/dkYZvj3cC2wp88
 yg4mFV2ORDKYktD33FA/mgnUvMfD/W+kPHfOqYc93ARJL/Fz/WO8ZBMHOBp3fB9X6W5e
 BwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erW0XIM+2y9def48xOpIc4QdS/vND+3STJwJE9GzrvM=;
 b=Z3+njjytvsxp0R0x5pTJqm45smWkjOvm61RiXzrB9zngxViGMt9gPhncKTQeyMATvQ
 scVEZHiQdWo4QYVzjCNUpWrYNhKxZfmB95IfT/IUISWKEKhdluxYIPY6wAvTPoYosDah
 4F2saUwwu/eAAhxMB2dNi5DQSylGh7wp41cuyrD4hkv7v8HNmsjdEYxP9Phrhs/FdxuE
 3u4vNy5R5RufTpGQm4z0SRnJ5oFyOpRQeyiNCjvBmZmN3k1qLieVj9PGFXjs9HM6Sfm/
 20aYgXu0EkzcQI70ZQE2JA+J00DUasScKEbltgUWcea3A+kGFkQnIAU+XjaPlufshWhz
 vyuQ==
X-Gm-Message-State: AOAM530fUX5hqJSK3P3pB+zM4+zGo4lKW6zYmVyoGBA3rvFOW0jhqUR8
 MM8+W7MiB00MgOz4e5EswWRSTwinxL7ZVwDAUCpcng==
X-Google-Smtp-Source: ABdhPJw11sLZpk2iJcw5H2+UztqwfIK1pCCTH30flHi05HVt6b1JKFFDYFDtFUO8SBtnEJgqK+HLHZ1Lkfe1gIXhdfs=
X-Received: by 2002:a1f:8f48:: with SMTP id r69mr430105vkd.6.1606147655157;
 Mon, 23 Nov 2020 08:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20201119030237.9414-1-yong.mao@mediatek.com>
In-Reply-To: <20201119030237.9414-1-yong.mao@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Nov 2020 17:06:57 +0100
Message-ID: <CAPDyKFrqVoMQNDFhhqbiEJPtw28iOzMvZg6rRoyCEA6oTRq85A@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: mediatek: correct the setting of recheck_sdio_irq
To: Yong Mao <yong.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_110740_525401_51D6FA9C 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Fabien, Mattijs

On Thu, 19 Nov 2020 at 04:03, Yong Mao <yong.mao@mediatek.com> wrote:
>
> From: yong mao <yong.mao@mediatek.com>
>
> correct the setting of recheck_sdio_irq for each mediatek SoC.
>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>

Applied for fixes, by adding a fixes+stable tags and reported-by tags
from Fabien and Mattijs, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index fc5ee5df91ad..d49e5ccfca9e 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -463,7 +463,7 @@ struct msdc_host {
>
>  static const struct mtk_mmc_compatible mt8135_compat = {
>         .clk_div_bits = 8,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE,
>         .async_fifo = false,
> @@ -502,7 +502,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
>
>  static const struct mtk_mmc_compatible mt2701_compat = {
>         .clk_div_bits = 12,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> @@ -528,7 +528,7 @@ static const struct mtk_mmc_compatible mt2712_compat = {
>
>  static const struct mtk_mmc_compatible mt7622_compat = {
>         .clk_div_bits = 12,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> @@ -541,7 +541,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
>
>  static const struct mtk_mmc_compatible mt8516_compat = {
>         .clk_div_bits = 12,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> @@ -552,7 +552,7 @@ static const struct mtk_mmc_compatible mt8516_compat = {
>
>  static const struct mtk_mmc_compatible mt7620_compat = {
>         .clk_div_bits = 8,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE,
>         .async_fifo = false,
> @@ -565,6 +565,7 @@ static const struct mtk_mmc_compatible mt7620_compat = {
>
>  static const struct mtk_mmc_compatible mt6779_compat = {
>         .clk_div_bits = 12,
> +       .recheck_sdio_irq = false,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
