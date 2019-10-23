Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D344CA9EB7
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 08:33:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D3721906
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 08:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1rsmt0M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="viCUfLzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52D3721906
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4+ctt2nRpvn1gBBQlzrjUqi3qsEY+pmi+5JUtOjcA4=; b=L1rsmt0MdRluqe
	3CGZHLefP3z9n3ZvUsnkLP95kTHEoOGHhKH/1k1zUxkocFXkh0nWgfPrEZ7ew0c2nxVJXLAWNAtOZ
	R4T5gEY0SNVI8jNxCy8Nz6p3Y2Jg6SgVbfzdu9edPlaWBv2cgh2BF391tuGF9/A266q1hrLvadBeW
	SbuY1X3Y2ciJPYOOOTKhyH7cGtOgBFtVvPHxU2MonxbaJzN8BZxp6hhk4OTI8a5BAo9aNqVlEUKqf
	SIsR6opLitX/Bweo0qWZh+B8JQxx9iBgRZXsDlewXOEQyclE36svlf1tVWlKkGntFaa7qSY1LZ5Pe
	Zql7tSiG/AW6tqPifJAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNC4j-0007nl-1H; Wed, 23 Oct 2019 08:33:01 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNC4g-0007mx-27
 for linux-mediatek@lists.infradead.org; Wed, 23 Oct 2019 08:32:59 +0000
Received: by mail-ot1-x344.google.com with SMTP id n48so1748822ota.11
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2019 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
 b=viCUfLzzS1NUVQ5Tnwemu4lRHQh7rs8CcijmjomS/9Miv9Fu+1airI68eF8A8nJSyM
 546inlstZ+rsV3j10IwzBsycIFGDPHrgXpTekkK2mvUwZ8G3lCLjyeEM7EQy/lZHZhaB
 E5ZzJt4Q/pPYmawXeV71ABnjju8sA8DJIMrKRYDgXJbiwCuKZsPLIjF+dRKIDvkcbLbB
 PqQsxIkRG98Hk2GjN6zHwsA4r1gwOzIDXX1ehjEkdS0m14uNImJD2Ybj2n3J9f6LxhoR
 vIFuKY91tEAHwK1Lh0VLR3AqD94qvyZtf73j7lbvTR4BDSKOqQihceTRTuyCyrprb6I3
 jZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
 b=KNOG7mJE7GNFfH1Y0I6/I5vrEbCV7u48wZcNQBZRRhgVCqSi1DHW3WICoyIHU3ikPq
 9c883EqDmS6xI9yottsQY1Zqjaj4DKaORFTSEuEPsarKaIsSfITse8TzOdv6VWKa80yq
 zV55HTTAsjBfPSckZ+yI0P2lJGWmVoruDQWWE8dheiQXM6++u4IbZ/mV2K2+3Z25uX2Y
 ZbVnGQ/LAHcsLCQwFUyS7gJzLmXH5IcD7VddC367CgRE6lBCw7HF9feEkzuV7Ri5sCao
 q7WCXjakLqAIQGE+2XpY98ap+vz3vIkXfH/JKB5sMx3Pzi+rfV+R8S0+L3n0sYL8fosi
 K+SA==
X-Gm-Message-State: APjAAAUv7oyLeO1Qjf28C+JL98CSPx2dF9U3eGoHzyG6u+hT6ymfYuOQ
 ++ez9hfQDPBwVcMQiT2Kw3lRiOTqAEJhpMWZhKbjzg==
X-Google-Smtp-Source: APXvYqx9C835htw9b+vjF88aUM7e4S/FRS+3eHUvwsbpuC8bReEl39lomHdHjZsPRkBvLfkVQLrdUBNmVyoQXSiyMP0=
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr4103680otn.103.1571819576961; 
 Wed, 23 Oct 2019 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191023063103.44941-1-maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Oct 2019 16:32:46 +0800
Message-ID: <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
To: Mao Wenan <maowenan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_013258_127813_70805ABF 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 ALSA development <alsa-devel@alsa-project.org>,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuehaibing@huawei.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de,
 Jaroslav Kysela <perex@perex.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
> below errors can be seen:
> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>
> This is because it will select SND_SOC_CROS_EC_CODEC
> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>
> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  sound/soc/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 8b29f39..a656d20 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -125,7 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
>         select SND_SOC_MAX98357A
>         select SND_SOC_BT_SCO
>         select SND_SOC_TS3A227E
> -       select SND_SOC_CROS_EC_CODEC
> +       select SND_SOC_CROS_EC_CODEC if CROS_EC
>         help
>           This adds ASoC driver for Mediatek MT8183 boards
>           with the MT6358 TS3A227E MAX98357A audio codec.
> --
> 2.7.4
>

Just realized your patch seems not showing in the list
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/thread.html).
I have no idea why.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
