Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EAEC636D6
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHaeRZqGHYAtIxM6Dz50lpu040N8lRz141Rm2pL5rVo=; b=mTtoxbhAwHpbIkSI2SgjxIPv1H
	F9B3wMK/aybyg/cF0xNKyIpCtz1XDV+QfIF5giQH/l3EU98Z4I8GjaWROYsnZVqQBH5u5B+NxXmdq
	e3LSbGk7kXnbPMTzGXH6RRCYa44CZvA3G7JGyljzb8oZzUFsR2ulhW5Lvi2QDoeGpTKKKKOP3L8xu
	NqlqUmEWRTq18RViR8v9L54LMGX/PZ8hoG6mhf7gvkhUBbc5JxBPBv3DWD5tX21JrRiUBhcNN2Afb
	kKCXMWILqOrRvDvmr/NKk8ppeNYLK7bl5AdnwLuNyE1EZzvVucPBcQ1wHCI7tKRT5VZHsUs8qmI7V
	hP0k8Pqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2Yq-008n7t-Am; Mon, 06 Feb 2023 14:33:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2Yl-008n4y-9B
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 14:33:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id mc11so34688719ejb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 06:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHaeRZqGHYAtIxM6Dz50lpu040N8lRz141Rm2pL5rVo=;
        b=jF1s45DfufJwWZ57OB4BhZN/fdCEcCANg5872Lpc2HV2Ir2Mncxbo/xAhZJfUnR3L+
         zj/iqQibSO2essYu11V5ZoaCOO1G8tKqVEw+x1gL3ETrubdC6B68mNHS4+lJGYXSzrXu
         orW5CjFvL/UrHYWJjZ8cV+5pZ+/s8jq4GoMsOmhkPKIWkNXm0D6Gnilexls3a7htxx6D
         /25skRRaDV+Gz0xrN/fO6uxRvlSPOWnSXL06w/EXUgmzB9QU+iA7gSZAByL4V9Z/WFL3
         g4urT34lwmdyWPzF1tFaoARTuuhrRNCW3FK5ZrJQXnjAxjvMTBeUgl7MN1sDOzeoiag9
         IQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHaeRZqGHYAtIxM6Dz50lpu040N8lRz141Rm2pL5rVo=;
        b=ctR1KoY5qKoEMZnjXZSizlJFD1m7FFk5C+MbO5BSIwvkrWAcV4AONsxf9lDH3FBkzc
         zmACVT7y0D0znXWGJXt9wtAkS4hnvTSaopZksp/1L2QJYBzp2ZSYZ5IpvPz/9I8J+Dwf
         rvIRPyfzchkDPlTAZCZY29OLbNBpRWhk5uL232hSAGhKZsDdJO4gUaDDP8PPdGJ31wjs
         JKbclpr9lQtz+XBrGIEYDeARoFJcfpvHrREyH6uxjKX2JO0vPq40q+kgHcKohUAYwjUp
         lelSMPusqFEQq4+rPpFT/U2zD7xEdKqrLNN/Q6FFDdkdtc5HcWtnCFmVWJ4kz5MjWp0n
         f+Dg==
X-Gm-Message-State: AO0yUKWTSNvz0uRTqWWHbRP6xrneMC6KfBXp3yeB5HGH+4m+bgFHCSAD
	jUeS3gHiY9vlT5uGz1Sy2dMto7gnKdMmV/EKLzyc3A==
X-Google-Smtp-Source: AK7set9F4u722OkpXBvTbwVo7eCQ7QLvmQTwkMqIg2LACU7M2aYX2ATRDdPXXoHFDCXc6U7xCq0cgsgND0rwHzgdHtY=
X-Received: by 2002:a17:906:1803:b0:7c0:f45e:22ff with SMTP id
 v3-20020a170906180300b007c0f45e22ffmr6633853eje.104.1675694007671; Mon, 06
 Feb 2023 06:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-5-bchihi@baylibre.com> <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org> <20230206140713.GB15176@linaro.org>
In-Reply-To: <20230206140713.GB15176@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 6 Feb 2023 15:32:51 +0100
Message-ID: <CAGuA+oo2Zzb2=v6DDwy5R2Y_u_jvpbbAUZDeKssKe9Af14fo8w@mail.gmail.com>
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_063331_475547_80174AA2 
X-CRM114-Status: GOOD (  17.82  )
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

On Mon, Feb 6, 2023 at 3:07 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On Wed, Feb 01, 2023 at 08:55:07AM +0100, Krzysztof Kozlowski wrote:
> > On 31/01/2023 16:38, bchihi@baylibre.com wrote:
> > > From: Balsam CHIHI <bchihi@baylibre.com>
> > >
> > > The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
> > > controllers contained in a thermal domain.
> > >
> > > A thermal domains can be the MCU or the AP.
> > >
> > > Each thermal domains contain up to seven controllers, each thermal
> > > controller handle up to four thermal sensors.
> > >
> > > The LVTS has two Finite State Machines (FSM), one to handle the
> > > functionin temperatures range like hot or cold temperature and another
> > > one to handle monitoring trip point. The FSM notifies via interrupts
> > > when a trip point is crossed.
> > >
> >
> > (...)
> >
> > > +
> > > +struct lvts_domain {
> > > +   struct lvts_ctrl *lvts_ctrl;
> > > +   struct reset_control *reset;
> > > +   struct clk *clk;
> > > +   int num_lvts_ctrl;
> > > +   void __iomem *base;
> > > +   size_t calib_len;
> > > +   u8 *calib;
> > > +};
> > > +
> > > +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
> > > +
> > > +static struct dentry *root;
> >
> > How do you handle two instances of driver?
>
> For now, we can put the entry in /sys/kernel/debug/<dev_name>

Yes, sure.
I will do the necessary changes.

>
> I'm preparing a debugfs series for the thermal framework and that will provide
> an entry to hook in for the sensors debugfs if available

It would be a good feature!
good luck!


Best regards,
Balsam.

