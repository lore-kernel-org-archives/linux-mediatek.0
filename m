Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BD2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:42:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4EF222DD6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4EF222DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y99O9omeTUjjrAVH3MjaFnLOc2+qMHFbtvkMkg650zc=; b=aczpXdFOJx5SgdiPgiLAmm8UN
	K7TrF26p99pKTVmy7FJqMg/BkHlW0ZKK+nxQOV376NxaTI2kWv50Uq/QVfvm3laZ0R/z+//dXOSCK
	C9tUVCcxSKCseksLILKZaZowYp/JlSmHCUpKkcWXmW9D1cGdn77CIRz4qjKcx1LaTZSGrefo0K4VY
	U52cwzE+0+nS39paMsgqjs6A7DB6DGCRHT854FBfGaZ1ua9E+wZVwp7bukmOFW9JRwV+cgmB7C9q/
	4dRkxuLDDExwLwqVCBU2W6dP7i9lY50aF+5AGJKn9kqYcf8KHfq/Pubv+yXRWImYmUKPbIqL/t+yI
	gR2JWq1WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krB9Q-0006gk-6U; Mon, 21 Dec 2020 02:42:20 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krB9L-0006fc-Ev
 for linux-mediatek@lists.infradead.org; Mon, 21 Dec 2020 02:42:16 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id e20so4569220vsr.12
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42aU/0QkvhPwE8g58QyrNOHFOkDcHhgODUw0Rs5b/Uw=;
 b=ea9CItxiILeaNwCUkQP2JS5JQFW1QWbk3+Nx8tKIMMx0H7EmkWqaJl0PgSxzs2WEzQ
 o1YKd2wX8ELgdqJ71XFRE3d7/Zby7W6O+NrguV2DlduUkuVvZFLp0gQwJUKvA7ucuq+8
 bxVaftTqHXPqOu9cLbNSxxuqTUYYsq1X8HxRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42aU/0QkvhPwE8g58QyrNOHFOkDcHhgODUw0Rs5b/Uw=;
 b=XaFYUXPigglO57BCrXnRODiYLLAiWIU9D6A5p3jgKTusxmmwM0t793ckZgZHbtTOKk
 Vsa2o7FH9rE7pkVo3pd16+UU/E5HwNmDLcQ7WCjKOuwpmrAf/AydohMjk/VJDVcDIgUw
 zvJf+v4erhUtd5wI8SblqYc+1C/t2nNeVMRTs6/2cf4s+ECy/JeGsHCdb37HBCUjd++f
 0IvbF8bnH16bu/4mO9keFdhMw/I6x+gf1184CCrVQxhIASyLsNsfPJ9cARuMt93p0Nx8
 /aMeTkQV4DkU9FhjadzJI7hpyLgZ3DuNyiyd/IQYeRqOVquVrLb/meC5PPG8bTxDClXh
 XDfA==
X-Gm-Message-State: AOAM532THWp1SmwYGs0bQ/Od0u7AYreqSmZ7bxA3gosWyRbZqsUuHnDc
 MLn9K9XGZPmJWZdVQrTPwXp0Q3TbnNM+OKU1blSW4A==
X-Google-Smtp-Source: ABdhPJxyuTf71XGSFnxCVk3D2pXZTKGLrWsD632V9VKnQKt8wROKwl2TJ3anpFzlIkMTXAqcjAKmszVvdq2V6TBsP2Y=
X-Received: by 2002:a67:6b46:: with SMTP id g67mr11079180vsc.60.1608518533535; 
 Sun, 20 Dec 2020 18:42:13 -0800 (PST)
MIME-Version: 1.0
References: <1605700894-32699-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1605700894-32699-5-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1605700894-32699-5-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 21 Dec 2020 10:42:02 +0800
Message-ID: <CANMq1KBXKQOj=qUMULeJsqy8bvsJLgRniuF2kqzhxpKTWCVq1w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] soc: mediatek: pwrap: add pwrap driver for
 MT6873/8192 SoCs
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_214215_554657_5C0B194E 
X-CRM114-Status: GOOD (  19.33  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Argus Lin <argus.lin@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Fei Shao <fshao@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 8:08 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> MT6873/8192 are highly integrated SoCs and use PMIC_MT6359 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6359.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 5678f46..d1cd050 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -632,6 +632,17 @@ static int mt6797_regs[] = {
>         [PWRAP_DCM_DBC_PRD] =           0x1D4,
>  };
>
> +static int mt6873_regs[] = {
> +       [PWRAP_INIT_DONE2] =            0x0,

I don't have the datasheet for the PWRAP interface, is this register
at offset 0x0 real?

If so, I'm concerned that mt6873_regs only defines very few registers
offsets, so the init code will do a _lot_ writes at register address
0x0 (e.g. for all the undefined values in this array: PWRAP_WACS0_EN,
PWRAP_WACS1_EN, PWRAP_WACS2_EN, etc, etc.)

> +       [PWRAP_TIMER_EN] =              0x3E0,
> +       [PWRAP_INT_EN] =                0x448,
> +       [PWRAP_WACS2_CMD] =             0xC80,
> +       [PWRAP_SWINF_2_WDATA_31_0] =    0xC84,
> +       [PWRAP_SWINF_2_RDATA_31_0] =    0xC94,
> +       [PWRAP_WACS2_VLDCLR] =          0xCA4,
> +       [PWRAP_WACS2_RDATA] =           0xCA8,
> +};
> +
>  static int mt7622_regs[] = {
>         [PWRAP_MUX_SEL] =               0x0,
>         [PWRAP_WRAP_EN] =               0x4,
> @@ -1050,6 +1061,7 @@ enum pwrap_type {
>         PWRAP_MT6765,
>         PWRAP_MT6779,
>         PWRAP_MT6797,
> +       PWRAP_MT6873,
>         PWRAP_MT7622,
>         PWRAP_MT8135,
>         PWRAP_MT8173,
> @@ -1512,6 +1524,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>         case PWRAP_MT7622:
>                 pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
>                 break;
> +       case PWRAP_MT6873:
>         case PWRAP_MT8183:
>                 break;
>         }
> @@ -1948,6 +1961,19 @@ static const struct pmic_wrapper_type pwrap_mt6797 = {
>         .init_soc_specific = NULL,
>  };
>
> +static const struct pmic_wrapper_type pwrap_mt6873 = {
> +       .regs = mt6873_regs,
> +       .type = PWRAP_MT6873,
> +       .arb_en_all = 0x777f,
> +       .int_en_all = BIT(4) | BIT(5),
> +       .int1_en_all = 0,
> +       .spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> +       .wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> +       .caps = PWRAP_CAP_ARB,
> +       .init_reg_clock = pwrap_common_init_reg_clock,
> +       .init_soc_specific = NULL,
> +};
> +
>  static const struct pmic_wrapper_type pwrap_mt7622 = {
>         .regs = mt7622_regs,
>         .type = PWRAP_MT7622,
> @@ -2026,6 +2052,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
>                 .compatible = "mediatek,mt6797-pwrap",
>                 .data = &pwrap_mt6797,
>         }, {
> +               .compatible = "mediatek,mt6873-pwrap",
> +               .data = &pwrap_mt6873,
> +       }, {
>                 .compatible = "mediatek,mt7622-pwrap",
>                 .data = &pwrap_mt7622,
>         }, {
> --
> 2.6.4
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
