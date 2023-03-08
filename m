Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6844AC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvghSm+izAzoZfMW7sPseegOBllvRQAJZKazD98Q5ek=; b=LEbL/i1wzCrD/n7i74GLqk4LNT
	o21C3K1g8LXUJinjGvhbhOjXKp3SB/r+UpoCG6oLQNHMoqzp/8y96M1Ha+48ZEzKDno30MR7cqbF5
	/pojykD4JKtiXAozqGLEDhERzDWY19I3Ek5t8KTNKN5aTtNsRqb/6p5xQS4KC46DQt/QLNCt7z/Ph
	nxO//+YiE2sKuUUwIlUEnSrcpWk7281GG8ZUpgJ5nz6NXkF5HB/KaWc/U8KTkR7Zli+qUF2JiLz1E
	FOV1BUghBN788xq/Ntisz7EdiAnL6u6KD9HDuJuu8koKSv7rmMB5DYvukUHMDXxGaMeJnQWUPSlQF
	VBc/Ppyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwEs-005pO6-0T; Wed, 08 Mar 2023 16:02:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwEo-005pNK-AS
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 16:02:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ec29so36868145edb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678291317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvghSm+izAzoZfMW7sPseegOBllvRQAJZKazD98Q5ek=;
        b=f3GHy9XwNtZAVyNU/gw7bH0xY9mv5hj6I/KXK5IsVgFchFE6xqpHD4ttjk/YveOWnD
         +niOXVxlamUfbWhNqCuIUQb9+leO9ykdzXnWpaL0OCN6Ak36qveLZhTO/ECbbqwg6qws
         9v7AhZLaWcht3nvCscEKcAKmu00AGiDlj35POr9ssy8/AnRm9g3+YWR1eAVnH4CqFBr0
         5hgH2QDyBv9q4LVqM4Hje6dmSgFi0BbrPmRD3gymEF3VbbWqIJPwaCfQMw/G51O+9XIi
         /UUQ8UgxBME4CQXoTcZG+GCWSUrUacmppusRzIpdtDqbPxgYWMf93RgN8EbgZ7WPAMv4
         DHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678291317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvghSm+izAzoZfMW7sPseegOBllvRQAJZKazD98Q5ek=;
        b=4N8rum/Ghd7na8nJhkJsfbA8SxOTZQBYzSzeCYhbQHn1YAtvefYnu41zQtfx3KWe8E
         6uY5GGVcUO1F33VhOY/MBiFTp0rPCcynX7hSmMCMw1V6QlC3o3SwdGqP1jTStBjq8ZCv
         YmiTFY3Uxc7XLeRpXkD2EolBkp6VLPBVnFfz3EXtu5evLRFBXso+8M/BtFwu0xRoZ+lI
         SBhYVRNjST7SFk7WOha409W9FdihU2Fb0JOvC5SZwey0/EEut5z3atxOtZYBFGYRl9IS
         pJ/24FUpmKTEmWSpJ6xhtpecNK/8sm7+L8nujqXd2eR0OHDbHKNM8YFxgQ7mjB94EFci
         8usQ==
X-Gm-Message-State: AO0yUKXsVBShe55sZftzOHIz8C6m467ngyv0l6E0INaGkSzm/xqx2slq
	1S/Op/hDaqyfLCNWbQpAiPyMChaT9tXHz2h0wqSSlw==
X-Google-Smtp-Source: AK7set9czStAcUNQ29jUhnUVYnTaY/lCYjixN6pRCnxEte8YUnfIYJlN08SvDepMIhgpwQmcnVtlX42y0dTAE4mfCYM=
X-Received: by 2002:a17:906:a0d8:b0:88d:f759:15b1 with SMTP id
 bh24-20020a170906a0d800b0088df75915b1mr9362342ejb.13.1678291316969; Wed, 08
 Mar 2023 08:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com> <20230307154524.118541-5-bchihi@baylibre.com>
 <5f980c7d-1bc4-cfdf-9392-70626317ca54@collabora.com>
In-Reply-To: <5f980c7d-1bc4-cfdf-9392-70626317ca54@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 8 Mar 2023 17:01:21 +0100
Message-ID: <CAGuA+oqEG-grekf=x6c7XwvbaAjgDDF1FJ=E+6zYLx8J2B+QJw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain
 temperature thresholds
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
X-CRM114-CacheID: sfid-20230308_080158_377375_B84DFCF9 
X-CRM114-Status: GOOD (  10.05  )
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

On Wed, Mar 8, 2023 at 10:17=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 16:45, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Specify the targeted temperature thresholds.
>
> You're introducing the thermal zones and *then* fixing them in this commi=
t.
> To be honest, this doesn't make a lot of sense...
>
> Please squash this commit with
> arm64: dts: mediatek: mt8195: Add AP domain thermal zones
>
> P.S.: After squashing.. looks good.

Hi Angelo,

Thanks again for the review.
OK, I will squash them in the new series.

Best regards,
Balsam

>
> Thanks,
> Angelo
>

