Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7783DC74A44
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1XZIH9inSbl3ZQyMggB2CXJxzURcCERdn7MHGk8JaI=; b=2IkDI8gDH5Alj+aQgofrd1kbtc
	PzKuaqhsf72QHXzpsobUSm2hzCk6fwXdGFUaTDyABdM7S18poT7kB3+t+RR8dOhnYz5kH3M5Uk/7N
	1bv8eymK+zbqO9D031rkKT/wqd1ppEIWHDt9mFKi7g+RPCIil6M30PD/5LtgJPOqM9QAILNrJC8Vb
	DRfvbW/5YqPBq6rPhYr2TiJGHgGF6H36x2yJkvIPJv39KWMn9yD4pkh7SE2bN55MiaZPs5PYqcFrV
	etyukPNQTH6rhdR785RqxpcHlttvHTFTWe/CvYlYMCuE+hg45bqZ8n9lO1skzaq6Hy+4xsIUzlWZj
	H90dIlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwDH-005p1l-2V; Wed, 08 Mar 2023 16:00:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwD6-005oru-9A
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 16:00:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id cw28so67694582edb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 08:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678291207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1XZIH9inSbl3ZQyMggB2CXJxzURcCERdn7MHGk8JaI=;
        b=w6o7HRK0ue3Q7m8NTdFX2fTDWAHrxzTfH9xr4i1xPQBiRogmbgVo2v45dA8yIYk6nd
         ttG0ejVeOOfBwxASmKz38jAXqLc2bz6krgCut60eHbgiBRnrTiNTGERWeJIxCdddlMg8
         vybhWItaks7KaC1yXTHlJMo0SwmoDEOkpinNYzjRap+rJJKMnH/kI/Mkfk9kDgJnzFkB
         +/rgU8MSd/Q7uLmtPf2QN8TVRSFSl4vQN9MR3W7vxvmKJ4z3SlydUJZO1ACxudnAkXOu
         xf63gA/tr3Jcqz7aMZkZQ4Y2t4S58lZ8WPQSC7DFQRfFzUArFQw/Z9up522qwyQ8u/nl
         2r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678291207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1XZIH9inSbl3ZQyMggB2CXJxzURcCERdn7MHGk8JaI=;
        b=kJxttR3nQtJsEnEWJeysdDyIur7qZyGF9lybKCtgq+763nTpkh8alCfcZuEpcvlQCT
         3mAoVYP/Z6ALy7KhSEIgLBy3N+aDewUs4hYDTwVEfEpEcLBy3oLuEzOYPClSfRmkfdMM
         xo//0f7S/BoGz5M2EN+md5dE3XeOKfiiEEzhiljomVhhMku9CyMd4mIVxmjgQk/SieRl
         N5vhoJ0dSUoa04iY475a8r72m69nvInfnh1ui6SCekar9iJgwXCzNF6sjhKs+y+9Ko0p
         QKRfex3xoWVkNrIKWvDXjULgWVx6QaPoHVp3H8jFLA/1ROW5NwHMykkaWILOkL7T6rpo
         p/RA==
X-Gm-Message-State: AO0yUKXrRoey004LMHZ3dcp6ujF3n9l/sUl7I4CboCfKIWmwYy6zicuk
	4mJQI6uttoBKWrLuYqNRHeGCM72UPpZgXEylyAWkhA==
X-Google-Smtp-Source: AK7set9RUWxvLhOUEyhQ+r7aM84SD6AwwEQowhj7IM5+Y/3h2QxwrRus0mrOqkDQW8XLnLHpJm1M9EQtGcrSmQ9R5cE=
X-Received: by 2002:a17:906:338b:b0:879:e5b2:e12d with SMTP id
 v11-20020a170906338b00b00879e5b2e12dmr8490486eja.13.1678291207665; Wed, 08
 Mar 2023 08:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <20230307163413.143334-3-bchihi@baylibre.com>
 <fc59f0d1-e2e6-d5ba-ad4f-f67fb375c8ca@collabora.com>
In-Reply-To: <fc59f0d1-e2e6-d5ba-ad4f-f67fb375c8ca@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 8 Mar 2023 16:59:31 +0100
Message-ID: <CAGuA+oqoYOV4U-=CVCnd0ceiUS4QjTTmPp+n3o7pr2tNNRB3YQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_080012_350962_52C63C85 
X-CRM114-Status: GOOD (  10.36  )
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

On Wed, Mar 8, 2023 at 10:23=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 17:34, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add LVTS Driver support for MT8192.
> >
>
> Since you're changing that documentation twice now, you should split the
> doc changes in a different commit: you will see the big picture if you
> send just one series that introduces both MT8195-AP and MT8192 LVTS suppo=
rt.
>
> You don't need two series for that anyway, so... please send both the new
> MT8195 AP and MT8192 in a single series.

Hi Angelo,

OK, I will send another series that contains all changes.
Thank you for the review!

Best regards,
Balsam

>
> Thanks,
> Angelo
>

