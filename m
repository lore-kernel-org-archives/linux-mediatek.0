Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74FC636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20UFv4FYR0RNRhy2mEzLDHn9GdVhRKvFn1ySTJIDHWo=; b=2t4eI6pwT/nY66i74D0UsK43V2
	wiHQAzsfviX0C+X/w+0IkqMmH1GYWU1wsc/UDSd5Cgs5qgg5/E2jqdVMbRSflmWe+q+R2cEAq/cV0
	r1Lg0A2ltoYCJqyCyAOiXidY8b2b2UVJMolIXpa1rkIqpnLZF/QY/GT6AHGQM3huB3YJGt17Ha8GZ
	0N4W1Syv/3/aeUQd1rAngacNvgsU08gcVtu6A07nf04igcmKB5OgzyKvgWvEBpHBR7F49Sc8k6Z0x
	rJzd2cFnuW3sxDMqOSEBNr9ORK3syOWFJv++01vQqhAtjg/c0B5vag3SVGr1HH4o0sN4+OJFngUa7
	E36IRMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqYN-000nwj-15; Fri, 03 Feb 2023 07:32:11 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqYD-000ntm-Ry
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:32:03 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id a24so4506829vsl.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=20UFv4FYR0RNRhy2mEzLDHn9GdVhRKvFn1ySTJIDHWo=;
        b=RsxUC4vMRzdVnPDNIlpDSu6HWqexhlUr3/ndoqsY0EjcW+V0zfAdnJtijv7YsU+TcO
         KP5dbNn8LEe6vaxWWUeAbQkcVNYZxVRxSgG/V1wSR7AmvPlMMMOOGCYQGquKCmSUZ84T
         fQFD2VAWxBjKc9fP1AUSzWc+V61mf4ynPPAiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20UFv4FYR0RNRhy2mEzLDHn9GdVhRKvFn1ySTJIDHWo=;
        b=IkqKeYHB8PVuayBnnbeMY0U1bB6DrO475Pdj/6Ltus/P2Pxbk3QqFgKxa0zY0B72cJ
         5UuFJIqy76EI+4GIsP5E6IegwESyb6/gKOkHoib/KCq3s7ZBybrzaDro2tRVuFueqHiY
         EmXLF3f3pS9xeh/+Mg6qeutbl6BItN6DnKFhtonNKfYwnZJTtBXS9yG5D03at47rdTE7
         e4z/+HvfD9x5iAa4D6x/wYAOunqfCT0jvTX9z9ur1xdz6TzgmZ7YKicxWmTDafZzRGDR
         MBiMDH5qYLrD7QOCFIxdAKcFPySoxW1boydCuyaJ2miUNJ+JF68t9LXnvK1a6U2UTTPs
         0C5w==
X-Gm-Message-State: AO0yUKVsrMhCMqea7hAylKOa8rYLAgHCBOD2NsIXzHFiUpPlTSRs4Wv9
	KIf7xiW2g6TVPTPkkOnewr5myW/FEIf/LybZwgCtcw==
X-Google-Smtp-Source: AK7set/4FlDK7sISjom/UmIlvod48p3X4cFzfbV8Lo3q+4ml6FeokBpj89CDwYQ/JOIdYwgsnoY2RhpBJT1ZpU8fMvI=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1677388vsc.26.1675409517750; Thu, 02
 Feb 2023 23:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-18-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-18-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:31:46 +0800
Message-ID: <CAGXv+5G4vvtZAcgO9SUczUDq4_94K4jF3G+YuSDYa8QvxpMp7A@mail.gmail.com>
Subject: Re: [PATCH v5 17/19] clk: mediatek: Add MT8188 wpesys clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_233201_909430_C25C5672 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 19, 2023 at 8:54 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

