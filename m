Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F116AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkQ8Gz4j/geHcEad/4Eauy1yNTF7OO2D+brLgcLvLOo=; b=QiGp3PMAQscyXJ2J8EhZntm95U
	dJtLCWu3PElCYSInbgGaS1AO2YkNBhkfmXkUCzEZUlggDnfb8oU2c1eALuC0Wync74KHlS+kaOM6Q
	gr6auaA33oiWWDyDh+OiOOK2OCgAOCs6Vncb914jBKz7UVBEs8yfY1NeWjodTAM1mV1zEvZBD52Xg
	it9JFcLc/1/XUCvm9e+44UC1HVUdxY+SvTYZGNAGLStpcc0q85wjolTYTws1aAS7msyoNwnT8cI1n
	TzOAGHmzlbinAo4ES86RAwWLq1XVmE65evXC4RmvMW1n6rJQstnGOwF38skhMVwCx0U03XnH5suXc
	fGc1nGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtuc-001WwV-4d; Fri, 03 Feb 2023 11:07:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtuR-001Wt2-JM
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 11:07:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id mf7so14316761ejc.6
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Feb 2023 03:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkQ8Gz4j/geHcEad/4Eauy1yNTF7OO2D+brLgcLvLOo=;
        b=bIa1jBCPI5MWhjL0rRPnJN7kCSzLkePkj2byuaF4LkJSK7i059EOqSRIKaq/egcsWn
         q7lDpxltYyEJ74vGv0hGLN3Mg/jAAfy2proI4RMVLagxNlKuqpkj26dHM8iOgxZDbDKZ
         9iXmSEeCVr+rLCabe1LR84R4byjKOVC0MXMoZRMuzNkQUH7m8xXQ4LKu78bPKCukoPa0
         9QIHhRDXiLWV+SB9rLuZCnQauR9A2It/1tHpHiye0ctyhbEFXjMviq1IduUueMEHtflS
         gUHGiuEFmraZiPPCb5NdjqVDwaAS0NodsgJdjEVK9e3XvireT7bB9yUdonxAfvBUmboS
         bBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkQ8Gz4j/geHcEad/4Eauy1yNTF7OO2D+brLgcLvLOo=;
        b=47rMM18gPdzOcgCGG40ceUcpNtC9GtrDSu/tud29oBfDqp2EQgcsclN9PqvUU/LloX
         +s2+rts+on5gMRm3YSPNbAVJ/dCxzldjvX+dYq1JOZoIK+rehy7fJlyTHg/zVRKypqB6
         I+CgkKfwuGRt1/12SquLzdfcRd7C92BxjOgPIQlxDAIQcwua7DrA85w07m198KXl+dlV
         mnTUlo2b2a02e0Dsu4PLTt+IICNLtxgP2jz5xzHKIYaAkSZAkmK7QhqaYDyzE7J+PAP1
         cOT5Pv//UDAve01Fh58nMiCMoyuemHKQLtKexv7q3pec8dgOA46jbzz71S4Lm7CvgrDz
         nvIQ==
X-Gm-Message-State: AO0yUKWTfNrHslxzOlU1BWdElMz7WiVpGiCvIoHkhlwSSLsT5yKfnHgA
	JPvFUj4yP7xAtHeBc4p0EK+h4AZ6J8LK6hbKxZuADA==
X-Google-Smtp-Source: AK7set9W9wLn3JZ8MrFzo0VuFe/HAuvajC0zCNwULGTi/uQ9VI1ybXodYpHBrfydldHh9/xqXzDFQFITEAIkXYRU2Zo=
X-Received: by 2002:a17:906:1803:b0:7c0:f45e:22ff with SMTP id
 v3-20020a170906180300b007c0f45e22ffmr3345979eje.104.1675422428182; Fri, 03
 Feb 2023 03:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-5-bchihi@baylibre.com> <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org> <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
 <8662c6bd-b32d-3d3d-b3b7-7f4aeb028309@linaro.org>
In-Reply-To: <8662c6bd-b32d-3d3d-b3b7-7f4aeb028309@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 3 Feb 2023 12:06:32 +0100
Message-ID: <CAGuA+or+rKzZaVO--yhBuOnUrL1+LhJAwxLsNcTif4t9W0TFWA@mail.gmail.com>
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_030711_645385_495F31A1 
X-CRM114-Status: GOOD (  29.98  )
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

Hi Krzysztof,

On Wed, Feb 1, 2023 at 6:12 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2023 17:46, Balsam CHIHI wrote:
> >>> +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
> >>> +
> >>> +static struct dentry *root;
> >>
> >> How do you handle two instances of driver?
> >
> > This root node is the topmost directory for debugfs called 'lvts', the
> > different driver instances are below this. It is a singleton.
>
> Indeed. What about removal? Aren't you remobing entire directory
> structure on first device removal?
>

For now, the driver only supports one instance.
I will find a way to handle this when the driver supports more instances.
Is this suggestion OK for you?

> (...)
>
> >>> +
> >>> +     of_property_for_each_string(np, "nvmem-cell-names", prop, cell_=
name) {
> >>> +             size_t len;
> >>> +             u8 *efuse;
> >>> +
> >>> +             cell =3D of_nvmem_cell_get(np, cell_name);
> >>> +             if (IS_ERR(cell)) {
> >>> +                     dev_dbg(dev, "Failed to get cell '%s'\n", cell_=
name);
> >>
> >> Is this an error? If so, why debug? dbg is not for errors.
> >
> > AFAIK using dev_dbg does not increase ELF size when DEBUG is disabled.
> > If this is not a good reason for you, then I will change it to dev_err.
>
> But also dev_dbg are not visible in error or warn level logs. If this is
> not an error, then indeed dev_dbg could be fine. But errors should be
> verbose.

OK,
I will replace all "dev_dbg" with "dev_err" in this function.

>
> >
> >>
> >>> +                     return PTR_ERR(cell);
> >>> +             }
> >>> +
> >>> +             efuse =3D nvmem_cell_read(cell, &len);
> >>> +
> >>> +             nvmem_cell_put(cell);
> >>> +
> >>> +             if (IS_ERR(efuse)) {
> >>> +                     dev_dbg(dev, "Failed to read cell '%s'\n", cell=
_name);
> >>> +                     return PTR_ERR(efuse);
> >>> +             }
> >>> +
> >>> +             lvts_td->calib =3D devm_krealloc(dev, lvts_td->calib,
> >>> +                                            lvts_td->calib_len + len=
, GFP_KERNEL);
> >>> +             if (!lvts_td->calib)
> >>> +                     return -ENOMEM;
> >>> +
> >>> +             memcpy(lvts_td->calib + lvts_td->calib_len, efuse, len)=
;
> >>> +
> >>> +             lvts_td->calib_len +=3D len;
> >>> +
> >>> +             kfree(efuse);
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int __init lvts_golden_temp_init(struct device *dev, u32 *val=
ue)
> >>
> >> You did not test it, right? Build with section mismatch analysis...
> >
> > I'm not sure to fully understand this comment.
> > Would you explain, please?
>
> git grep -i "section mismatch" leads to lib/Kconfig.debug and
> DEBUG_SECTION_MISMATCH

__init is removed from all functions.

>
> (...)
>
> >>> +static struct lvts_ctrl_data mt8195_lvts_data_ctrl[] =3D {
> >>
> >> Why this cannot be const?
> >
> > I've got the following warning when I added "const"
> > drivers/thermal/mediatek/lvts_thermal.c:1286:27: warning:
> > initialization discards =E2=80=98const=E2=80=99 qualifier from pointer =
target type
> > [-Wdiscarded-qualifiers]
> >  1286 |         .lvts_ctrl      =3D mt8195_lvts_data_ctrl,
> >       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> As with every const... Do you need lvts_ctrl to be non-const? If yes,
> then how do you handle multiple devices (singleton)?
>

I found a fix for this it was simple.
add const here as you suggested
and in other function parameters every time we use this variable.

> Best regards,
> Krzysztof
>

Thank you for the review!

Best regards,
Balsam

