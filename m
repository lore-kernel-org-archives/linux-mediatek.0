Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E374EC64EC6
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fZFf2yI4NiZ1ohXSbStbdFw0GfjyGPBHrzhVz49z0Y=; b=UNqbGeH64Cv8GYOzo4dQK2sea6
	N4xcoZP8I4yGEDUp6jFqmXwymvc8tjxBSoSunqnBS4OtLvjSjd9BwJSS1vjDJIxrOMasB0VMjhFWN
	HsJ7OpO1l+TLf8jWqP9cg/91hrJZccI5ypxR/E3gwL921T9axb8CtG1AW/r84gweIwDATA8fhWFvw
	3Te6og2YTleM/rmEhrr/b5wRpjjNdsVIYp6T2c+3Z0NAmpolvzT9MtxjsNzmrNmRVQ7xQl/OLTkyP
	DEvq80+2BwsVry7UrW5fK4C22uVe0emIXeKiDPzaV2BUIMC1njuRSsARwA/W+fdgIfSgDaxF0Fche
	K7hkQAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPTD-004zLI-A1; Fri, 10 Feb 2023 09:13:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPTA-004zIv-BK
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 09:13:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id m2so14021775ejb.8
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 01:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fZFf2yI4NiZ1ohXSbStbdFw0GfjyGPBHrzhVz49z0Y=;
        b=b2tb5/OmuOTxoKVQ1J47Qg4rdMcs72fXWi2DfegMVNDSgLn/zmioHttGI9DFW+/qzO
         96+2ePEG/zrjdP3GQl7vtsyP9kRPGLutO27ermYdpR0e4tHx7pko4FrB0tILW41i8pj+
         lJC2lLEgiqa39+x8zVHZEfRw6ZyQwxKpS73UR37olSz5OGLmHnSbLV3yAGCIkezCx+bZ
         3YKLECmvyv1A336QZ3mUaN3cQ2YSd2yz6iSe2D+ptr82EpDptxzhcW8pJ+sLw5hn2CGJ
         yl7czinS3HoNadZ0i7ykVJoirTqSh+11oUPnlCzAIxf1R22L/6/bBQ//MSXFOy7yRTX/
         5fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fZFf2yI4NiZ1ohXSbStbdFw0GfjyGPBHrzhVz49z0Y=;
        b=2x8aX4PWcF/q+FenKWoNfYW30Ct+ldUquKXhdRW51AQnQyubiw2boPKTQaCrnpnvj/
         4iAbnxovlJuebSAoRsX5pIy8ANKjjcGMh/Pvg5fI/Je8AURiSZs+3I49jLJ9v4MLJzsA
         LAPXSTgiEkYRhIpudpfD2DT5VCLR1DtTgU5PjK/4dKA7TXDpuQ/oyYoDy3dQVpEYo3wJ
         C/yH9NvQJz2678SJB8CZ45OrnsUpPiyJ3h/vTzrWYQCW519mF4yGdetj68PTPvZQisGJ
         D1Cl8doz5kNQ1QFJO8BSx0hxXrX4j3V3uNxbH+m3QMTjxDuoufnTZx1hL8cbx150LbKb
         rK2g==
X-Gm-Message-State: AO0yUKWLJ/HsCA0tTWgXzMNjJfKmEcAwmoKVunHHNsGdXzHK9WrZMY81
	UXvABMCgbLSVJu4qW2D0N87c0V7TyhfukVARjcn6/A==
X-Google-Smtp-Source: AK7set8z0VVs9Ynm8YK8/sg/s2hoilc5vUf32Iszp/v3ATNK4ku2TS/dWRb+ymTJE6AxLofb6FZhMsS0juAOG5sQLBU=
X-Received: by 2002:a17:906:ca04:b0:7c0:f45e:22ff with SMTP id
 jt4-20020a170906ca0400b007c0f45e22ffmr3467086ejb.104.1676020403067; Fri, 10
 Feb 2023 01:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <b41930f9-89d9-1b12-b024-05fb12700769@linaro.org>
In-Reply-To: <b41930f9-89d9-1b12-b024-05fb12700769@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 10 Feb 2023 10:12:47 +0100
Message-ID: <CAGuA+oo+1tSDhVkrc-2feH9e8wMpBgAa-N1VEOuGN8_c=uo1zw@mail.gmail.com>
Subject: Re: [PATCH v14 0/6] Add LVTS Thermal Architecture
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: angelogioacchino.delregno@collabora.com, rafael@kernel.org, 
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_011324_422784_D2A7A8BE 
X-CRM114-Status: GOOD (  22.72  )
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

Hi Daniel,

On Fri, Feb 10, 2023 at 7:44 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 09/02/2023 11:56, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > The LVTS (Low Voltage Thermal Sensor) driver is capable of monitoring
> > multiple hot points. For that, it contains 7 thermal control blocks
> > dedicated to specific devices on the die. Each control block can handle
> > up to 4 sensors.
> >
> > The thermal controller supports several interrupts. One for the cold
> > trip point, the hot trip point, the return to the normal trip point,
> > and a specific programmable trip point to monitor the temperature
> > dynamically.
> >
> > The temperature measurement can be done in two ways, the immediate mode
> > where the temperature read is instantaneous and the filtered mode where
> > the controller uses, by configuration, an average of a set of values
> > removing the minimum and the maximum.
> >
> > Finally, it is composed of 2 finite-state machines responsible for
> > the state of the temperature (cold, hot, hot 2 normal, hot hot),
> > the triggering of the interrupts, and the monitoring of the temperature=
.
> >
> > As requested, the thermal driver has been reworked to reduce
> > the complexity of the code. At this time, the 4 little CPUs and
> > the 4 big CPUs are supported by the thermal driver.They are described
> > in a data structure and more devices can be added later.
> > The calibration routine has been simplified also.
> >
> > The series provide the following changes:
> >   - Move the Mediatek drivers inside a dedicated folder as their number
> >     is increasing
> >   - Add the DT bindings for the controller
> >   - Add the efuse node for the mt8195
> >   - The LVTS driver
> >   - The thermal zones description in the DT
>
> Applied patch 1,2 and 4 for v6.3

Thank you very much!

>
> Patches 5 and 6 should go through the Mediatek tree.
>
> Thanks!
>
>    -- Daniel
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

Best regards,
Balsam

