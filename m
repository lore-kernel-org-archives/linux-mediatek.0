Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B775EC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80264610C7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80264610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU4pdq/K8HmKIa3qD8T6sTnj/OEgRKXbzEQpfpkblyI=; b=V61/NC6q+VGQnU
	V61fK7Ter8by3n1Wjmv+v5cBuAmoZUYoj6Ek9w3qcihKBtyGhQNxcBTNFyYquu7qK6Acp9aaqRoQN
	XejF+3jL/UGao3A84zxoAL+eoGR0Am30wFJCYUMYDYdieHp6nuNERqYGRqwnnaZtiQUy9NRze54rC
	fHgrtcUmELvzBhDbrXkOsGhBstdbaAFYOodPVLRxG8qQUO3XrgIrpso6JG3lGCHZ9ICW7RAkzvTa2
	vXIo9EstuYXCJguWeUDKYPCh8GDA2nzgEuzFp8fkwhtPqP5NJQHsJysiDYYyHe1Zl3hqpW+u3HR11
	PWhTzsRH3IKIZpuFnKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lquxj-00Cq3i-EC; Wed, 09 Jun 2021 09:57:27 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lquqX-00CnNX-KY
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 09:50:04 +0000
Received: by mail-il1-f177.google.com with SMTP id w14so15041014ilv.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCj9GCI+5QISlmGJjehDkaz0A2PdjbYMmQM8TFM7cPQ=;
 b=eJFtZM3I6Dm/cIcSWJdNjF3jep+VNcHdOjE4Inxmm7DNf5csnGMG1e+98OSj/SImd/
 wBzkqd/JQyXoIo2or+T2MIs3EKFuHAazJoCZ0i4DHsmOvL3sec1wOKWsfgZn9pF7AYUK
 i76J3nSz/DDNHF/bzdTKFIitmBwzGlnpHAmXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCj9GCI+5QISlmGJjehDkaz0A2PdjbYMmQM8TFM7cPQ=;
 b=p+8ugH/WUpu/0wud/0CgEJFr68+A3lihttiUYEgpuwiuFP/fi7W5jfqLpcwmdNee8M
 S2FpoMzW9sKzJOJlzleVzQDMGSHdNEdgNWZnrYC7zNHY2seZy+3+TXJHPlk6WzrYbFvE
 vdiABGM1LF4r9khzT1vkSBqtdmsSHtaNaylvsTTKLB0j8g97hmaXbWciuN0Z/lfck7rn
 xHbj4GXZUiByL4CWRZw+Jg6dF9rKVrmPlJyVc1/TZBiisPNUVNLrxxdh3wevWgYbCLp6
 2m6+bJzGtSGxABW+3IiYDAbSFmUD6yesZKiBUNoec3AocnjeyHTSNvcra8mrjR/rplCn
 cB2Q==
X-Gm-Message-State: AOAM531j0y5SOaxn0qs7NZ44gvZoYrfDRIOGATaGf3KkEfEaD1FKP7Z4
 lcGT4yHyEXh8K8Y3iEjKq0sqAA1QvdRu9Q==
X-Google-Smtp-Source: ABdhPJxBNgUTXHTylafRUT4alDNm4qmsU758l0x935RnXurhS3R7bgq1JCiFnZ+rnaegVRzzA+RvJA==
X-Received: by 2002:a92:d80a:: with SMTP id y10mr23737673ilm.254.1623232138886; 
 Wed, 09 Jun 2021 02:48:58 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id e17sm1230842iom.8.2021.06.09.02.48.58
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 02:48:58 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id w14so15040835ilv.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 02:48:58 -0700 (PDT)
X-Received: by 2002:a92:d589:: with SMTP id a9mr22625576iln.175.1623232137595; 
 Wed, 09 Jun 2021 02:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
 <20210517173314.140912-5-gene.chen.richtek@gmail.com>
In-Reply-To: <20210517173314.140912-5-gene.chen.richtek@gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 9 Jun 2021 17:48:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1njg1PUAkz+TvbtPPxm4uDb3xDSA5HmOOgjwrLz01vFzHw@mail.gmail.com>
Message-ID: <CAC=S1njg1PUAkz+TvbtPPxm4uDb3xDSA5HmOOgjwrLz01vFzHw@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: lee.jones@linaro.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, 
 shufan_lee@richtek.com, cy_huang@richtek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_025001_722480_08DD5714 
X-CRM114-Status: GOOD (  17.83  )
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

On Tue, May 18, 2021 at 1:34 AM Gene Chen <gene.chen.richtek@gmail.com> wrote:
>
> From: Gene Chen <gene_chen@richtek.com>
>
> Combine mt6360 pmic/ldo resources into mt6360 regulator resources
> to simplify the similar resources object.
>
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/mt6360-core.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 512480f7bd40..3553c7045829 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -266,7 +266,7 @@ static const struct resource mt6360_led_resources[] = {
>         DEFINE_RES_IRQ_NAMED(MT6360_FLED1_STRB_TO_EVT, "fled1_strb_to_evt"),
>  };
>
> -static const struct resource mt6360_pmic_resources[] = {
> +static const struct resource mt6360_regulator_resources[] = {
>         DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_PGB_EVT, "buck1_pgb_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OC_EVT, "buck1_oc_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OV_EVT, "buck1_ov_evt"),
> @@ -279,9 +279,6 @@ static const struct resource mt6360_pmic_resources[] = {
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),

Nit: sort MT6360_LDO*_OC_EVT and MT6360_LDO*_PGB_EVT after combining
the resources.

>
> -};
> -
> -static const struct resource mt6360_ldo_resources[] = {
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
>         DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
> @@ -299,10 +296,7 @@ static const struct mfd_cell mt6360_devs[] = {
>                     NULL, 0, 0, "mediatek,mt6360-chg"),
>         MFD_CELL_OF("mt6360-led", mt6360_led_resources,
>                     NULL, 0, 0, "mediatek,mt6360-led"),
> -       MFD_CELL_OF("mt6360-pmic", mt6360_pmic_resources,
> -                   NULL, 0, 0, "mediatek,mt6360-pmic"),
> -       MFD_CELL_OF("mt6360-ldo", mt6360_ldo_resources,
> -                   NULL, 0, 0, "mediatek,mt6360-ldo"),
> +       MFD_CELL_RES("mt6360-regulator", mt6360_regulator_resources),
>         MFD_CELL_OF("mt6360-tcpc", NULL,
>                     NULL, 0, 0, "mediatek,mt6360-tcpc"),
>  };
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
