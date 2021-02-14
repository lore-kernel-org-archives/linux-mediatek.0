Return-Path: <SRS0=7fQF=HQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F16C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Feb 2021 01:59:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AF464E46
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Feb 2021 01:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45AF464E46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3wR6Dj77QFZXwaNgbvtx+FJ4Hx5s16HksnJUjZVxqog=; b=VoUjmvCUlKVmsPGGun/jykHVf
	S8470C8n64DegOQh84lVl0uK40p/0WlY5QkvqWxK8BcF0c6B1ef6CcljihHyaet6Eo5lD/5uNjOyo
	O/nRGjKDo7Y7ctADtoOBIEwt+tX6othwzi+js3Ud6Wq7Z03hCETP5Yx9jdDuOLxBhsjszskEVE8J8
	3S+2foPRw9u+wTQtdahmmdwrG8PMgEH2r+a7DdClOcWSfynhR5YkzDsGh4Eytq1yRiW4anxoULCUZ
	SGugMSsuJwp42iWAAmzWS+qTMThqgOQdkl94cbnA2GvATD37OAsSB/oRmZGQehc6RTsydVLqqiBJT
	AXUY6t9pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lB6gm-0004WL-5P; Sun, 14 Feb 2021 01:59:08 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lB6gh-0004VA-KA
 for linux-mediatek@lists.infradead.org; Sun, 14 Feb 2021 01:59:05 +0000
Received: by mail-ua1-x92a.google.com with SMTP id f10so1263766uaa.8
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Feb 2021 17:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ixeWtkGZms2jqEPuipL0eImgJeTeZ0ddYDeZic7MgQ=;
 b=FncMT/GvGAc/EsdPfqvKoM9XNHSxs+pjuWH41t8zU5Kg0ah1J4kXkiQfKFmtCiwtNh
 aaZuIMeVc3qALvPLqyg1iedXNqMds7nnIHMAHaAHtmfWZVW+BPtKXnNL8Vz1XIfa6Abk
 56EQYlBSF42HXLn5XpStNIxJAknDvUZtB/D6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ixeWtkGZms2jqEPuipL0eImgJeTeZ0ddYDeZic7MgQ=;
 b=Ra0ARWOr7AX/AIi9w+WiSFqhR58I8zNTTqH0dYZk0koC8MDCWWfsxeb8MbO78UTUPh
 VE6T+BEJ9F+9PcjtXHfeoBks08o0BowDjI/amBpLs3PpeRjq7LtWePHepuN93NoRzSth
 nSxY+VDCnMZTdpjXTlffOvKUFtqAE2oVgFm0QC6rI8lk82fi3dORa2rFMDqmd1frz80c
 ggtT0V3iPeolrco8W7QDsRJ1ZBe8i9S9CwlJbSj5CVo/HtWK+LB4Ieldonyr2jYLx8eM
 mh5tEZvEZ3+R9hXm0XOo7pPb9OZ2QAch1rfkXz2Sg1U6/KckEKnrOIMU9yeILdvWRCDG
 nBog==
X-Gm-Message-State: AOAM532RT9AkbjjDZmBsjDVJyERXXXiDxIkHL1CTnrwoD9HpPl3LJVdc
 i74dGhYtBGS6jK33evN1f5VnOH3EQNEv/YUceLoqZA==
X-Google-Smtp-Source: ABdhPJyoBmJ7jwKAGqVcrzAOq50zvV6KWZm+xllaqflJaAKZU8l5lkgyKY/T9PH8CRPdqVqIBQm9Ix+HOUvSzxYHOr8=
X-Received: by 2002:ab0:2e9b:: with SMTP id f27mr1582267uaa.74.1613267939297; 
 Sat, 13 Feb 2021 17:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20210129093010.22909-1-michael.kao@mediatek.com>
 <20210129093010.22909-3-michael.kao@mediatek.com>
In-Reply-To: <20210129093010.22909-3-michael.kao@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sun, 14 Feb 2021 09:58:48 +0800
Message-ID: <CANMq1KA-a1RQ=85w=sxJP8PfVfovx6Tscsuxf_vZpFqdxGc0=g@mail.gmail.com>
Subject: Re: [v2,
 2/3] thermal: mediatek: Add LVTS drivers for SoC theraml zones
To: Michael Kao <michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_205904_574118_7EF0E1A9 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Fan Chen <fan.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 5:40 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> Add a LVTS (Low voltage thermal sensor) driver to report junction
> temperatures in Mediatek SoC and register the maximum temperature
> of sensors and each sensor as a thermal zone.
>
> Signed-off-by: Yu-Chia Chang <ethan.chang@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  drivers/thermal/mediatek/Kconfig         |   10 +
>  drivers/thermal/mediatek/Makefile        |    1 +
>  drivers/thermal/mediatek/soc_temp_lvts.c | 1287 ++++++++++++++++++++++
>  drivers/thermal/mediatek/soc_temp_lvts.h |  312 ++++++
>  4 files changed, 1610 insertions(+)
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h
>
> [snip]
> diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
> index f75313ddce5e..16ce166e5916 100644
> --- a/drivers/thermal/mediatek/Makefile
> +++ b/drivers/thermal/mediatek/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_MTK_SOC_THERMAL)  += soc_temp.o
> +obj-$(CONFIG_MTK_SOC_THERMAL_LVTS)     += soc_temp_lvts.o
> diff --git a/drivers/thermal/mediatek/soc_temp_lvts.c b/drivers/thermal/mediatek/soc_temp_lvts.c
> new file mode 100644
> index 000000000000..b56c2cd3cb39
> --- /dev/null
> +++ b/drivers/thermal/mediatek/soc_temp_lvts.c
> @@ -0,0 +1,1287 @@
> [snip]
> +
> +static unsigned int lvts_temp_to_raw(struct formula_coeff *co, int temp)
> +{
> +       unsigned int msr_raw;
> +
> +       msr_raw = ((long long)((co->golden_temp * 500 + co->b - temp)) << 14)
> +               / (-1 * co->a);

This fails to build test on arm (32-bit):
ERROR: "__aeabi_ldivmod" [drivers/thermal/mediatek/soc_temp_lvts.ko] undefined!

Recommend using div_s64:
   msr_raw = div_s64((s64)((co->golden_temp * 500 + co->b - temp)) << 14,
                     -1 * co->a);

> +
> +       return msr_raw;
> +}
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
