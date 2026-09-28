Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D7C9833F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z10g3ECzJZ0ykUnbHwtfiSwuKXKaTF3jzUkbhLSuRL8=; b=L4sJXBFs7f3Marzr9G/Ejrgv5j
	Y6qPvHz2EK4ZtUZ0aU+/M0eWZjJgKH8fIhbwj44T6MwDlu66K/1daA948BWSVyPro6EWFBh3J0mOt
	u5b3Mrc/+JBjvsqlQ+cX4KqMShO8K7mr3C6b1WxoBbHLJqb0u2LLdg85ZRvpS+X3EW0fxRQpDIl4x
	MVxFCFqO0MZozdLKUbZVXRYeUeniibfknaIbhzPB2E8z/OP3/ywgT8kRTYLPHyoIJHx5swHqRxcxp
	oHbZkdiPn7eizJmIy885ppHGHlW42gqKfCorWb4YM2lRjR7cFRXbEua5duh3YIJayRbtH28x4YSM9
	OOdXLX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Hx-00000000Jch-3CcW;
	Mon, 28 Sep 2026 10:08:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Hu-00000000Jc7-16YV;
	Mon, 28 Sep 2026 10:08:47 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E36DB236;
	Mon, 28 Sep 2026 12:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790590013;
	bh=k6VynnZ+N0kAdeAd03ynKQPR8TBTY7wOhaOTHQKca+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYi0UKhHY06B7Vg62VtL/Uqyke32Y27qqq3plWvR9m6EVW/CNEflE+5kqP2JeozAf
	 o8RgWh+ZMIiO8DNusL1tMpQ7W1egqmADBEVBq6ch6vulOHK4Q1qExGccxe3mT8xLGv
	 jVTbhMYiYuw0ld5Li3bK/+10oRYcX3LD5PSwMP9A=
Date: Mon, 28 Sep 2026 13:08:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Message-ID: <20260928100841.GC22609@killaraus.ideasonboard.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
 <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_030846_457258_A28BB17A 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, Sep 28, 2026 at 10:08:43AM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2026 08:58, Laurent Pinchart wrote:
> > On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
> >> On 28/09/2026 07:33, Luca Ceresoli wrote:
> >>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
> >>>> Correct indentation in the examples to consistent 2- or 4-spaces
> >>>> indentation to fix dt-check-style warnings ("example 0
> >>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> >>>> re-indenting entire example just for that is too much churn.
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/2] dt-bindings: display: Use consistent indentation in the example
> >>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
> >>
> >> Thanks, but I expected no one will pick it up, so I asked Rob to take
> >> it, thus it is already queued.
> > 
> > Please explain your merge plans in the cover letter next time.
> 
> The merge plan was this going through drm-misc. It got reviews, no one
> applied, even Dmitry for msm only reviewed the msm-bits (second patch),
> so I asked Rob to take it. This was not planned, but result of usual
> drm-misc inactivity for bindings (many bindings were not taken in the
> past or with noticeable delay/pings).

If that happens again, could you please reply to the series on the
dri-devel list to tell it will be merged through the DT tree ? I don't
think there's any issue with merging patches that way, it's just
coordination that's lacking.

-- 
Regards,

Laurent Pinchart

