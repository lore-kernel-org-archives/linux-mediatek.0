Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832D4C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 09:50:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0986C2145D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 09:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VX5uo0/V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kslZWqSJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0986C2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y4yvQBW4i2pI2sBTdaFHb0ErY6FxaPzn8fAWXYc5lBk=; b=VX5uo0/VqiT4Q/CIKmV8WaZGU
	650V2yZjjVkuBFBtbB6wBQ3m9vS0jWv4k1cjkwLd5gCyrd+xxnUGF81FzcsYlGQTe1QCyLPU/brhX
	xwRK4/l4htFTJ5AwTfXb5vPHkPLJ7uWOEEqHap5zExoxv4BSCG7OzLd7R9SLwrcchv1lU1H/sRimQ
	2AXrM5lLjnQg26Y1XJnCurnZlAwtM2Kqci3U6Xsj9IxDOS9CN/SUKTaYBjlS75jruqq4UEwpVYufo
	D3aEixF6TjgooCouEfmcIvfA72NbaPWn34P6quvfYQByLHlIb7pBk3RgDC8xeMVzZUcq9qMfxo+Md
	+7ukGzNEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKevl-0003hg-TZ; Tue, 22 Sep 2020 09:49:49 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKevh-0003gS-70
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 09:49:46 +0000
Received: by mail-lf1-x143.google.com with SMTP id z19so17339762lfr.4
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2020 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1/GzZlsKjhO1xxrHGT1Pj5iI6bnlIrvYMKuCo5qePOY=;
 b=kslZWqSJM+PosmlJDdIfAsIleycfhPV8R8da0n6UAoIJjhKVm/d/jIjzyh8gWKmP8y
 fnZHKcZ38/iKV4/Kz4Ky8Ek4UM1QmsZGnyAXDu3MQlLHnt58WgMQFh5cHIFkflD8CvF4
 6gMpBBdPMPzqXu5Uu1CZC18g4o+YwLKa8QoTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/GzZlsKjhO1xxrHGT1Pj5iI6bnlIrvYMKuCo5qePOY=;
 b=M4m3RNA8DV2io1D79xBN1CZDwC17uljb2b+WJb2ZhUyQl6HYf1yUJmNm65LZnMkYUW
 EEv8sMQwj6o3RN39PGtUkVeh+9i0BHJc4gizlxXhVh4YX0JbDKWD/JNCvjp6nGdT8oml
 dlKgn9j+c3hFghW4rxnhyEs4dDfvooVj+qC4V9IB07zC8PI9rjRb70qxiSltHfwAH+en
 EXNXXAFpD09u17K6C+Jm+Jl4RHehu+JgJ3UHKMwZYhrOPz1PSTxpXDO6+lHOvte+8TgQ
 dwBernAHFNNaUgzkJDRi0Th0XmAiJwAz6lqXFNMqsfzeS6e7lu/Jwh8fion0mHuiG7zE
 PPaw==
X-Gm-Message-State: AOAM530gu0vdLoMAAwV/zk49rphmoQ974kcY6j0CjgrIi7arQ4OnWqpJ
 47RmshCMiWUaaniNWWdX4gqu5hze/9uhnM/05JfibQ==
X-Google-Smtp-Source: ABdhPJzCzXxBPcWaZu5L2QbUTB1OBB6ypvI7XJpXbSukl1N9svuHQlbnL4rX0pdqqFfETgs6kWui561zwFleCfAC/9o=
X-Received: by 2002:a19:df53:: with SMTP id q19mr1280959lfj.119.1600768183682; 
 Tue, 22 Sep 2020 02:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <1600686235-27979-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600686235-27979-5-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1600686235-27979-5-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 22 Sep 2020 17:49:32 +0800
Message-ID: <CAJ66y9HCTEYcuGpd_C4bZdD3PDOytUW00-PK6u9F6=v67CCXAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] soc: mediatek: pwrap: add pwrap driver for
 MT6873/8192 SoCs
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_054945_312749_309CDCE0 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Argus Lin <argus.lin@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 11:03 AM Hsin-Hsiung Wang
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
> index 149bf02..c73e92b 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -632,6 +632,17 @@ static int mt6797_regs[] = {
>         [PWRAP_DCM_DBC_PRD] =           0x1D4,
>  };
>
> +static int mt6873_regs[] = {
> +       [PWRAP_INIT_DONE2] =            0x0,
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
> +static struct pmic_wrapper_type pwrap_mt6873 = {
static const struct.

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
