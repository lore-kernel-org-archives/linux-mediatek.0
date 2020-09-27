Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDB6C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:39:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17E123A03
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQ+heubl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kac0eHuF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17E123A03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fsF3Aybyrv8bD7O5z9LTLaNGq+a8cSCT07rVcNziBl0=; b=EQ+heubl97Cf39CzsLkYE3OTR
	TK+f/0iQXyxWCwzg3g2oEFYCjZwJIKvnt2tngfbw/fStjQ4NHZ7yGIqpE+gw1NPqBEKJJfERgRXhJ
	z1d5PHkXfBbxrDuhF4Z2V0NQL4RQKDBP/NQjdSeWeihs6YaiQM+swbRrsYvx/T53GKWqApB8anFh7
	6lnsIERYaPeAoikjTs0j5iIdTlquOwCCMubsjpw7lZ3HWrT/WJmdulIhGTfcGfX5QDFEsdATY6t/o
	whkgZYwCn7b5HU54Q0omsk6rMGueqMOtQGk247MUa+s3Bxz0MhDZ6NKRjyk+zF4AOAsCP8bVl34rU
	+VBz0NSjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMbZw-0003zw-Od; Sun, 27 Sep 2020 18:39:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMbZs-0003zB-Br; Sun, 27 Sep 2020 18:39:17 +0000
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FE0B23A05;
 Sun, 27 Sep 2020 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601231955;
 bh=ufALKz1q13Sp1G9pTzVWJq9Q1h8p8JU3W/56CmJ0ZS0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kac0eHuFG0YFdPk3SGPh90/lS+yAQpBBt7wXoJ3mz352++AlzEiezW+UxtH+l9hYZ
 WiwLHpgSc3mCtciJ8aRaCwxSi7XhEjAkEZqF/8CBjN1AqREvjKrb3T3eTG12SqsCNe
 Lbe+Rrgl2SjkUtugP2IAg8oWAVS59mUHWAL0m9bc=
Received: by mail-io1-f51.google.com with SMTP id v8so8785995iom.6;
 Sun, 27 Sep 2020 11:39:15 -0700 (PDT)
X-Gm-Message-State: AOAM533vteLyikuftVEVbDHboojQeDrzUzL9i5OHYoOlJkpSAtEpMpqo
 vYhNPGMTAFXHnjh6wrHgSGTT9FmIbiwlT5j9w7c=
X-Google-Smtp-Source: ABdhPJz+78g3vvZjop19EkMo/szs1TmRRk+mu7AQEdXsiYi9+WwNrZpOgx8s3j8bVsqhIPaJiE+v57HiA1bMcpOHQv4=
X-Received: by 2002:a05:6638:d96:: with SMTP id
 l22mr6111864jaj.97.1601231954482; 
 Sun, 27 Sep 2020 11:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131056.92848-1-miaoqinglang@huawei.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Sun, 27 Sep 2020 11:39:03 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo0R=7diO62sWwfKFTn7WZFnFbE2aQDV8Yh8UZ4=bm8mA@mail.gmail.com>
Message-ID: <CAGp9Lzo0R=7diO62sWwfKFTn7WZFnFbE2aQDV8Yh8UZ4=bm8mA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To: Qinglang Miao <miaoqinglang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_143916_484165_23CEDE08 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 6:10 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2f3dfb56c..16bb15226 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -479,14 +479,8 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
>  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
>                                       const struct mtk_pin_desc *desc)
>  {
> -       int err;
> -
> -       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
> -                              MTK_DISABLE);
> -       if (err)
> -               return err;
> -
> -       return 0;
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
> +                               MTK_DISABLE);
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
>
> --
> 2.23.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
