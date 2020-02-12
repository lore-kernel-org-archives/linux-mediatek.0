Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB106C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 09:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC12206CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 09:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uE00HDF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cte8xNkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC12206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTNMSNjT8Q8qUK33h9LKRniuz9QqHnCxyH3z5IcISig=; b=uE00HDF+KEOUe0
	00FJy48dgPIJlia9meufIlnOu0kE6imbJYzFwFLXG+NSyqSLlJh+gHnm/aJ0n5m5unrZvDLwmjqkq
	qOOqtct7ZMofyn00tOHL9dpns2TPBBy+HEP/sPbtcTlDcpr6C/594DZBViBJJf227uE5e4eQy7fPJ
	36+HAhol7Lf/Pmfh5t2A8r4y8/uD/RT0OU113w+Ns4ksmwq0lisvvnU6w8V94kcjl1eascF646OpS
	B1h2W/fuUGy9o2M/1fcKw+YKZVY9nTljdwLQ+OXUS4hIdpR7mVV9DM/zRq60l8NYbK8FXFlXqhKx5
	ZTiakg3Q+Ukm57juVDNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1nyv-0000qu-EK; Wed, 12 Feb 2020 09:06:53 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1nyn-0000jE-GW; Wed, 12 Feb 2020 09:06:46 +0000
Received: by mail-oi1-x244.google.com with SMTP id c16so1352069oic.3;
 Wed, 12 Feb 2020 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdiHyv1C8Z3O51Il2rRtKfTPYZzHq2aAiI21t6YVfMs=;
 b=cte8xNkI44GgsFD77ysg/J0+ROdUNaqr+8/qMeiMSvUTstItSyKa+1zbC936kxrWBR
 cv0glfQP1KHjjzFbxYSTJao3VNZztB19IYH2m+ItrGt5d0F6SOq5qdEuZx+drk27kCpQ
 pGKZokcJiORu3/nxErNnRCWc+jHy2i0FoqBD0TpcDWp5R1nSQkYEKW1obTRdpv3yIaqX
 g60WNW95r77sjFcgekae14GjYakaPLg0/z8gOgdEpXQvSsttsRAlnOLg3/ke3ZtUw0Bg
 VsFxYg0aJZifwjQBgCa0LFsXmndcr6s4ag/0rW6/l/G1dQ1/RmSEQj672xfEbY+TveLV
 SC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdiHyv1C8Z3O51Il2rRtKfTPYZzHq2aAiI21t6YVfMs=;
 b=mqbupdovui9UcbMx7Er2BSKjzmAmFqhuGdIsk14E2fXhdg64rpW2a7zf+XGhoVKBf9
 zCo2CSLFNLBGEOCQjmjs6xt4BHTBPF+fizHs6qzMm4hkHzC1WRiqo2hQ3eA8dfwRb+R9
 e8AYjdpqoeHss7MQPrG5UTC8RX5pMfiwbAMdxJPkHa8HqSZfa9n5HnGCJJW+SThFFXv0
 JWkcoA2v3hDwJ52ZjMqLCW0bVe0SJ2UqHgYRC2x+n/EmVob1vsh0cqYBz8PbSkh4BojY
 IvF0MqptrVjZdS8hIPG9HZNpOYBpP0087mJZlQRDxYmjQeUDebGnK6a7MMlbTsc5YExA
 33sg==
X-Gm-Message-State: APjAAAVPBkVmtDy5uesSkQ1qF7AINGu/HMM9j88oDxaSf70mHeMrewL0
 FejvN60F2vjjIbZ3xj34GhHf0yO4vqHT1Ayhb9I=
X-Google-Smtp-Source: APXvYqz8LnWunxxKZNW1cjt4ireZgvOfph0KWPT5e7ByuK9ekEqH5ZKVzzbSPgDtk7Xf0cv7GXM0tk/J2jgQ4cISQQk=
X-Received: by 2002:aca:3114:: with SMTP id x20mr5662123oix.121.1581498402770; 
 Wed, 12 Feb 2020 01:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
In-Reply-To: <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 12 Feb 2020 14:36:31 +0530
Message-ID: <CAOh2x=kS_X-zmwWKfm2CAHAjuLqEcOZ61gkCLKKi8webmpLTOw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Nicolas Boichat <drinkcat@chromium.org>, sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_010645_584559_B06A5D38 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 vireshk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2020 at 2:19 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> +Viresh Kumar +Stephen Boyd for clock advice.

You missed adding us in the cc list of the email, fixed that now :)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
