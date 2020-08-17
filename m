Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7935CC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 05:22:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460C520758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 05:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ywgftjYE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oAa2zF06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460C520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gu0ULU7CYxd16LQsXd+naYzmEMgpHCaL5Z/B5c9n0dA=; b=ywgftjYEdpgZngWSnv7xphdUt
	2yZ5b+PobUrqrTRhJQQlc4k1UTrlBWjIXKEGqQcEYbR/5LEGMCkkSc8LWyIpfQZAwMvJ+mAjOj5LB
	DA6JMGq0u/A2bnyYYyYuTbzYWEP9NqC9H4jx+o1eKgpvqRIhSgV4iACc//6Xy+emP3EACZZppf5g2
	Egk9VtkpOStuIrbdv5B+Kd+S+XhhyDktDfB6t8tOPn6nNoRhkt6dnDLoL+9xi6nJko12mYKE+YbSv
	VfZcNfiaXJ0kibXYIbEZ6xIF0l75dndAWNkpOWEgUX+ByslpWU0tPqyItQlP+EOJtezyE5N39xRnC
	1VXQQD+Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7Xb3-0003vo-RQ; Mon, 17 Aug 2020 05:22:13 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Xax-0003uL-Rb
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 05:22:08 +0000
Received: by mail-il1-x142.google.com with SMTP id t4so13478179iln.1
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Aug 2020 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRhcb2O8AaJEz9eMxliwlOdPhMhMY6WLI2NsdKxl3ko=;
 b=oAa2zF06p04uKthFZQF2bBEkOZ+6UqD8Fz9FQN9KPkJgoTG5nWrnJWfk/NK/fBShsu
 F5mo2GaGqLxt7WlI7Xtqf8VwF/GleJYpbAm/eOn5shh4+eE8jyBihDgisQolBAN5kavD
 OA0Vb5MCyYsfn7TnTanxxPfXeJA6sufkhUjL+bEqXETQ80mITRpTtt+Thb3MapnHYIGQ
 /JCP2jEscmB4IrK8LKAdKT/mcW9LJq6YEVHUYWfvzl8XatvdAWS/dD5RLA3v8V9dqMDE
 1GQNTIts546qkhRyR3m73qd4cf5XC4s1g8FKQhxpag8ukTlSRwU+PXbbWOkTBKG9DdNG
 V/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRhcb2O8AaJEz9eMxliwlOdPhMhMY6WLI2NsdKxl3ko=;
 b=K+o4YJECxIQEF8ztboEPR2tQcCTFbd7AdqTQVhB4rCC3bGGHsrXCkoljD9y6O8l3MS
 JhBP+i7+3kDYV5SyWity1RLwmXe5oaGvEo8p11t9LMQTGJhBOcOpkyRb/9INGzM3MFz1
 uV29sTL+LSOwPFugtMKfPidnAyJWLjOGewDF9cZzerQG2FpRMXpXKpVuXpPiU8zaI72u
 dy9HRkY/cYkCz53vX9Ghxz3tpAcKIwnLzmX3nX1YidU+/3cGOvM+mHkmDc8o2cUfouQS
 5sy0bGOSs+ccAYoE22+sgNXPI/91XHLyfl4Gs+xhg68958uiPMWbqq3SekmKGolnt/vA
 +dFQ==
X-Gm-Message-State: AOAM532313SgYHDilW6jhSCDI2/ghNIM1DaehJq/dzGUVKfY9Y6aOfiv
 eJ8TsIRR05oU1W/0W+S6qijDg4AZ1/8+pL/oYWbfwA==
X-Google-Smtp-Source: ABdhPJy14QoC914TSoUO33Pg5xyMVBeF3y5yQDrERQdKF3LGceyD4VnVKTeyYFkawCs5uqbWieDtWQWVooUUStxfbeU=
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr10091979ilc.213.1597641724059; 
 Sun, 16 Aug 2020 22:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <1597511980-16281-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597511980-16281-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597511980-16281-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 13:21:53 +0800
Message-ID: <CA+Px+wX_L3s0-m8YOwAXa1szN3v8dqaY5OYfAVJb4HLTrAt5nQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_012207_940403_52FD8B4C 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, bicycle.tasi@mediatek.com,
 eason.yen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 16, 2020 at 1:20 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> +static int mt6359_platform_driver_probe(struct platform_device *pdev)
[snip]
> +
> +       return devm_snd_soc_register_component(&pdev->dev,
> +                                              &mt6359_soc_component_driver,
> +                                              mt6359_dai_driver,
> +                                              ARRAY_SIZE(mt6359_dai_driver));
> +}
> +
> +static int mt6359_platform_driver_remove(struct platform_device *pdev)
> +{
> +       struct mt6359_priv *priv = dev_get_drvdata(&pdev->dev);
> +       int ret;
> +
> +       dev_dbg(&pdev->dev, "%s(), dev name %s\n",
> +               __func__, dev_name(&pdev->dev));
> +
> +       ret = regulator_disable(priv->avdd_reg);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s(), failed to disable regulator!\n",
> +                       __func__);
> +               return ret;
> +       }
> +
> +       snd_soc_unregister_component(&pdev->dev);

You don't need to unregister the component which is already delegated to devm.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
