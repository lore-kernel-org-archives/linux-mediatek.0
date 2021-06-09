Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0243EC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C2D6128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C2D6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEFaEjcr78n9o5SEUA5OIjaOEViberdALp7valMRNGI=; b=Bu8U66+VXEpsqr
	RkwWN3xBPF/pdh0GAbS1bvGquvBKNbFEjbk4U1wZGwmkLuLkjYzbIAoCch/lEMPRrZd44xj+MQB0s
	qZNyIqfWxxiPrNi+Q+erpxjd24QXrSKVAUPCkGS2w1wkcI0wfXUBz9Fx55AU2dZplbdXyZJjLB6QI
	GjeUY/VjpcRdb/Yn0eOzZPmg6huBgApfUKJ5gXvLcUsV0SoTwJMaXxhsMY62YySrVZPGUksLivtif
	cbisw4lbr0Uia+0UP2nfJY+AAEi1b05S2xlqkNhDmK4YlkX4BXoJ1vQt5C0+8DYE3tLzuydvdrqMp
	ft18yMQKhSP9nF3wv0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqt0g-00CBoj-7C; Wed, 09 Jun 2021 07:52:22 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqt0b-00CBn0-Oh
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 07:52:20 +0000
Received: by mail-il1-x133.google.com with SMTP id b14so23767457ilq.7
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaMmJ7k/BA6wFJk3ZATOxTWqaw6DpQ+qnTYlU65VAJg=;
 b=DxNoHnoQMTFxaXjpdN0XlT6hKe7ppTriU7fZPnvEO05MytIXZrM9OCTtH3lItbNDKz
 gl4v4h53dX3nd8HWtJt+JAy+2bVxxBh2BASVUYttK8YAM0I1AvEdjLN/IfPw1/6KwPSs
 X5/gB8jhEr54PpIfHjiMqE/nHS2RJeoFwN/H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaMmJ7k/BA6wFJk3ZATOxTWqaw6DpQ+qnTYlU65VAJg=;
 b=gkUKpzy8DTE5Y3/9oJFbOY/+cQqbw+JMozyRa95unqc3Ukacxrooi/HHMrkwa1M+4r
 Myh6qArxOb9uwvmr0BdT0H0vFGcUS65AhTsuve8EC5pLoMzG57xwmg2UoiQBDx3sCM/Q
 kVQTPbezZyC22o5KQDAhkx0F+RcparwwLjwogc6Q+qwEyKefeseEVolXRYj7WnTi9otE
 O7IRh296tVjS97Avzjr7gt3Mx9Wuhn8QVOXA7ZEWuw+MH6uk7naet7RrZrZS3CJsOV7v
 cs+FKkYmjLMS/FO4fu6IBfTi5klkzQ3Uhi+NnAWXQTIa+pMpcNKivoYx0FNNVRyC5XuW
 8C9Q==
X-Gm-Message-State: AOAM530sCpXJRitfCpcHfIAi95087wkcpplaAQJXnoejS6WVHDeBZLGQ
 4r1qd2uxLOBvig0C3geD8X5xz/Qd+4jTeA==
X-Google-Smtp-Source: ABdhPJzSNf0SMMvbr0ql8SLIprA4ND1EBIBio5lnqxpnu2+9CiEmko9V+Rq91piLAYPR7L/97aqytg==
X-Received: by 2002:a02:384b:: with SMTP id v11mr24253184jae.90.1623225134131; 
 Wed, 09 Jun 2021 00:52:14 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id g14sm1016994ioo.19.2021.06.09.00.52.12
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:52:13 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id z1so24162299ils.0
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 00:52:12 -0700 (PDT)
X-Received: by 2002:a92:d312:: with SMTP id x18mr22379736ila.90.1623225132502; 
 Wed, 09 Jun 2021 00:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210602112050.12338-1-james.lo@mediatek.com>
 <20210602112050.12338-3-james.lo@mediatek.com>
In-Reply-To: <20210602112050.12338-3-james.lo@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 9 Jun 2021 15:51:36 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhUB=6y1SXUvAuhdj69S36FQnp9nr9V65TtS72pxuoRTg@mail.gmail.com>
Message-ID: <CAC=S1nhUB=6y1SXUvAuhdj69S36FQnp9nr9V65TtS72pxuoRTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: add pwrap driver for MT8195 SoC
To: James Lo <james.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_005217_883395_F069AB6D 
X-CRM114-Status: GOOD (  21.12  )
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

On Wed, Jun 2, 2021 at 7:21 PM James Lo <james.lo@mediatek.com> wrote:
>
> From: Henry Chen <henryc.chen@mediatek.com>
>
> MT8195 are highly integrated SoC and use PMIC_MT6359 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6359.
>
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 35 ++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index e4de75f35c33..952bc554f443 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -961,6 +961,23 @@ static int mt8183_regs[] = {
>         [PWRAP_WACS2_VLDCLR] =                  0xC28,
>  };
>
> +static int mt8195_regs[] = {
> +       [PWRAP_INIT_DONE2] =            0x0,
> +       [PWRAP_STAUPD_CTRL] =           0x4C,
> +       [PWRAP_TIMER_EN] =              0x3E4,
> +       [PWRAP_INT_EN] =                0x420,
> +       [PWRAP_INT_FLG] =               0x428,
> +       [PWRAP_INT_CLR] =               0x42C,
> +       [PWRAP_INT1_EN] =               0x450,
> +       [PWRAP_INT1_FLG] =              0x458,
> +       [PWRAP_INT1_CLR] =              0x45C,
> +       [PWRAP_WACS2_CMD] =             0x880,
> +       [PWRAP_SWINF_2_WDATA_31_0] =    0x884,
> +       [PWRAP_SWINF_2_RDATA_31_0] =    0x894,
> +       [PWRAP_WACS2_VLDCLR] =          0x8A4,
> +       [PWRAP_WACS2_RDATA] =           0x8A8,
> +};
> +
>  static int mt8516_regs[] = {
>         [PWRAP_MUX_SEL] =               0x0,
>         [PWRAP_WRAP_EN] =               0x4,
> @@ -1066,6 +1083,7 @@ enum pwrap_type {
>         PWRAP_MT8135,
>         PWRAP_MT8173,
>         PWRAP_MT8183,
> +       PWRAP_MT8195,
>         PWRAP_MT8516,
>  };
>
> @@ -1525,6 +1543,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>                 break;
>         case PWRAP_MT6873:
>         case PWRAP_MT8183:
> +       case PWRAP_MT8195:
>                 break;
>         }
>
> @@ -2025,6 +2044,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
>         .init_soc_specific = pwrap_mt8183_init_soc_specific,
>  };
>
> +static struct pmic_wrapper_type pwrap_mt8195 = {
> +       .regs = mt8195_regs,
> +       .type = PWRAP_MT8195,
> +       .arb_en_all = 0x777f, /* NEED CONFIRM */
> +       .int_en_all = 0x180000, /* NEED CONFIRM */

Please get the confirmative values here then send the next patch, thanks.


> +       .int1_en_all = 0,
> +       .spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> +       .wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> +       .caps = PWRAP_CAP_INT1_EN | PWRAP_CAP_ARB,
> +       .init_reg_clock = pwrap_common_init_reg_clock,
> +       .init_soc_specific = NULL,
> +};
> +
>  static struct pmic_wrapper_type pwrap_mt8516 = {
>         .regs = mt8516_regs,
>         .type = PWRAP_MT8516,
> @@ -2065,6 +2097,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
>         }, {
>                 .compatible = "mediatek,mt8183-pwrap",
>                 .data = &pwrap_mt8183,
> +       }, {
> +               .compatible = "mediatek,mt8195-pwrap",
> +               .data = &pwrap_mt8195,
>         }, {
>                 .compatible = "mediatek,mt8516-pwrap",
>                 .data = &pwrap_mt8516,
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
