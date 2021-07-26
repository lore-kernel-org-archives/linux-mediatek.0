Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CCEC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 13:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9AA60241
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 13:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F9AA60241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZv8cOKl0SLELEng7zfje6PEi1XqVF8IWGKakrKtoWw=; b=KJj0ndy6gFdkHw
	8+jSUhTt2vsdKhG837/kXadoZgHrvXxQqRct79qheRbFaV1Rt4pTQuhKsbUoSeWOKLOabJNFy3+Bj
	Dljm/kZAUMW3teM19U5efH6HA3qiir2JAVhwjgeEG9uTcU0xlPJYnqTSsUre8s94/CZWFHhgOHqVP
	V5v6uBGgSfK+Qzi+0/I7NcYEYEv4EQJS8gaSIezcUkyOy21/uFRm5dATcW62yQUBHM2CfZ/SIGglc
	3WC+A03qa/a7jVwvhsnSW/qHOoBdcebssRGs2zmx4nLOsiDMoZnBtOctKtI1/cpvgv20dhkhQUyp/
	dxc03eGU2wnFU5CZ7nBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m80rE-00BLav-Kh; Mon, 26 Jul 2021 13:41:24 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m80r0-00BLXX-VM
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 13:41:12 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 27ecbc45-ee17-11eb-8d1a-0050568cd888;
 Mon, 26 Jul 2021 13:41:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 52681194B7A;
 Mon, 26 Jul 2021 15:41:19 +0200 (CEST)
Date: Mon, 26 Jul 2021 15:40:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
Message-ID: <YP67aeAOIVgpMdca@ravnborg.org>
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP1nmsofOs5KHre+@ravnborg.org>
 <CANMq1KD_6DoNR9PvO9wrpEQc5BDwx6952mwz0poCw=hu+HsUbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANMq1KD_6DoNR9PvO9wrpEQc5BDwx6952mwz0poCw=hu+HsUbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_064111_204124_EB607FD0 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On Mon, Jul 26, 2021 at 08:38:18AM +0800, Nicolas Boichat wrote:
> On Sun, Jul 25, 2021 at 9:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Tue, Jun 29, 2021 at 07:47:21AM +0800, Nicolas Boichat wrote:
> > > Many of the DSI flags have names opposite to their actual effects,
> > > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > > MIPI_DSI_MODE_NO_EOT_PACKET.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Hi Nicolas,
> >
> > in this thread:
> > https://lore.kernel.org/dri-devel/20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid/
> > I see that several people added their Reviewed-by.
> >
> > Please either add the tgas if missing, or elaborate why you left them out.
> 
> Oh simple, I just forgot.
Yeah, know that feeling.
> 
> I regenerated the patch so it's a bit different from v1... Not 100%
> sure if I can add those, since those were for the overall patch:
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>.
> 
> Those 2 shouldn't be a problem:
> Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> 
> > I was suprised this had not landed yet.
> 
> Yep. Let me know if you want me to send a v3 with those tags.
Please resend a v3 with the tags.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
