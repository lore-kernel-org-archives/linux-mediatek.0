Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487F9C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ftd/Rb29GQlI+ogXgIbEomupaph/9xpI+7Ojh5eQKHs=; b=YiJz8RJyxELSPTDpikH090Wnyw
	M+/YhplD8zKtPryICOZj4vR0JSK3RcfHLl65D4a9kbw95opWBYuOEKVqen68IpXzjBpjciCOusHS3
	hsrizHZ73DB7TW6T9d9655LNVl+YycCyMTLl75Jl6nLf0nyUMe7oR7mWnpaxu3rPsGOujXlPlhhEc
	t0fq8XQx+OCKQi3Ua+kN2DpRSqNYb0Y1+JY9715tk85dzLI86Qtr/cFS06++a99uDgbx15Cfdii59
	Sy2NCsH0X27xu3x2V+kQUUMs22A8+WHeVI0XISxcmeF0yTTNpqFyLXroek5vSdfYDO30jfbWZuZiB
	amnJuw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRoC-005qWW-2K; Fri, 29 Jul 2022 15:21:48 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRo8-005qTz-Ma
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 15:21:46 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3238de26fb1so36105587b3.8
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ftd/Rb29GQlI+ogXgIbEomupaph/9xpI+7Ojh5eQKHs=;
        b=D8EmA+zZy9pWMwqNjrwN7EkBpYkgDmiACAU/RNngnePGi8cWmMrb32U5Nvr5TvYv8h
         BvMIWXk5GZaq9Lt8kTmdhNMNTDel1fyC+ftzQ9DK74gWjFPishoY1zk68gFsjqhPAzFl
         JFRITUJoIJ7otDFSPvEokmCgPcue5/EXJoTxRc6AmwG1TmJDGuBs/GzhndJkKhrZtNQ1
         t0aMPbtBbkDlBKakdy40VXMF1rNygq1k1L5oqFMhd+mHHpDPomipFHHpK6cRRCgpHf3x
         e3JZWvPXRJcct9cgxSws3JSkOq+qGc7ptHJ6Gj5dwU4LnmW1NP8lMpPDZqp3hlCI9TKW
         126A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ftd/Rb29GQlI+ogXgIbEomupaph/9xpI+7Ojh5eQKHs=;
        b=09YcxiYSDXd+1b84aJF6UgtExmCYI+ixRMTytHcK7KovdVGJY59uNvbmecaU0dU+B1
         Ktdv2MnS/juiwVeNFqmQ8YdPJKHBOggZzzfBod7SV+mEdBzK3QxagSteUUvnitSPSCcF
         wrBIKK04BlyDXwhte+DzvinL7EDOng1jlrWaOwbhCbHxs8G939a10VGwpwZxb9s2hcZ+
         ID9qVwT5CEuws39nUPQeHlh0P7lb6t+kvPWX1eTD2G3YNsERXdvMdCgG3E6jp8lwjXmO
         T17zkIm89TsIEejgK35e+H15PbeQddaXPu3YsZGyiLIvhPy5LAHmQFLx2KgA7LjOhT3z
         hL+w==
X-Gm-Message-State: ACgBeo3p6rSSulnYZamHGjflVUk0jTChbSsnEL9zpcg1TG3NrrvAFtG5
	o1OLMZM0SG9xOwgt7IknqUkUSFBO8AMBJAsaI+aapqzID9I=
X-Google-Smtp-Source: AA6agR7KILU9FPTu9cuWQZ1lp+wXnpmNjyMLgZNJ652RF6rhJLbpSdQ09FhDCprQUhwn+0k1aqCEro02i1Fj3jahtmw=
X-Received: by 2002:a81:6e87:0:b0:323:828:2175 with SMTP id
 j129-20020a816e87000000b0032308282175mr3598423ywc.71.1659108103971; Fri, 29
 Jul 2022 08:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-2-bchihi@baylibre.com>
 <24250d03-b25f-e521-5abd-f36109885c36@linaro.org> <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
In-Reply-To: <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 29 Jul 2022 17:21:07 +0200
Message-ID: <CAGuA+ooOUXaBM+uPvEEohFLtO8sRd4T=DMcc6Fvo9P92gsq4yg@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek folder
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, 
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_082144_760349_E38B596B 
X-CRM114-Status: GOOD (  17.12  )
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

On Fri, Jul 29, 2022 at 5:19 PM Balsam CHIHI <bchihi@baylibre.com> wrote:
>
> On Thu, Jul 28, 2022 at 10:53 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> >
> >
> > Hi Balsam,
> >
> > On 26/07/2022 15:55, Balsam CHIHI wrote:
> > > Add Mediatek proprietary folder to upstream more thermal zone and cooler
> > > drivers. Relocate the original thermal controller driver to it and rename
> > > as soc_temp.c to show its purpose more clearly.
> >
> > I realize the Kconfig, Makefiles format are not consistent across the
> > boards. Before I fix this, you can comply to the format:
> >
> > drivers/thermal/Kconfig:
> >
> > menu "Mediatek thermal drivers"
> > depends on ARCH_MEDIATEK || COMPILE_TEST
> > source "drivers/thermal/mediatek/Kconfig"
> > endmenu
> >
> > drivers/thermal/Makefile:
> >
> > -obj-$(CONFIG_MTK_THERMAL)      += mtk_thermal.o
> > +obj-y                          += mediatek
> >
> > drivers/thermal/mediatek/Kconfig:
> >
> > config MTK_SOC_THERMAL
> >         tristate "Temperature sensor driver for MediaTek SoCs"
> >         depends on HAS_IOMEM
> >         depends on NVMEM
> >         depends on RESET_CONTROLLER
> >         help
> >                 Enable this option if you want to get SoC temperature
> >                 information for MediaTek platforms. This driver
> >                 configures thermal controllers to collect temperature
> >                 via AUXADC interface.
> >
> > drivers/thermal/mediatek/Makefile:
> >
> > obj-$(MTK_SOC_THERMAL)  += soc_temp.o
> >
> > However, rename 'soc_temp' to something more SoC explicit, eg.
> > mtxxx_thermal.c
> >
> > Thanks
> >
> >    -- Daniel
>
> Hello Daniel,
>
> Thank you for the feedback.
> Changes have been made as you suggested.
> Resubmitting seen.
*soon.
>
> Best regards.
> Balsam.

