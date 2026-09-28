Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A83CA5FA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TR2EoUedzfwkF3107b5KNS7BcXvPvkAv8bW+yYycLg8=; b=Sh/ps9sO9pZOHiZm33WXOG20J6
	V7yhmi2OfS2K8nRRWWv5BlnFY6jDsyVn83qIUod/IEpCyZ30zuW90pPocb5omnIIucgaI2ybr5awE
	io1KWwYh+e/bRTAgFai9f2jbPYXIyUnzXDrLkuZwxCSrnTvGyJAU5S4O6mE8mrasmAHsXK23QaGqG
	yEr53o6k3YxXEBCzHy6i1jm1VvjO6rueMxXd8yZq8O7tqHo/+caZxPnOAnaRf2cXCBbyGubN2yeLV
	PUVAHNPwUzHM3gwYR2qKGpcKAJMlJumgFxNF7aQLU1nHjcDLE5u0wFq4wbUMtrR8PPzFvot/eIREl
	MH+LTO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9qM-00000000V6a-0uOa;
	Mon, 28 Sep 2026 11:48:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9qI-00000000V5k-0EY4;
	Mon, 28 Sep 2026 11:48:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91F271A103F;
	Mon, 28 Sep 2026 11:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AA61601BD;
	Mon, 28 Sep 2026 11:48:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAA5A102F2227;
	Mon, 28 Sep 2026 13:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790596095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TR2EoUedzfwkF3107b5KNS7BcXvPvkAv8bW+yYycLg8=;
	b=MGXKKc4c5SOmaVWp/phoair6djFZb7UjXYb4g7L1mu9HkDS45D2Mlcr5y0nCwPGAVqpsGv
	OEyWMqiy3ker2qxJrAW/UnrGrRHX0U5FTADuUuUtmWYUjbjs5sEQnRZOMUAMqnzQlFMAjA
	pPfwXpH8+1YUt2r57oV6Vdkon/lXPcVhV54ca8km8DMGpKDscvP2exc0uf2Nu6SDXfkR44
	TLdVQPBbaKuqlM8N4aAFilFSY0cAFNPEgcpSiJcNTfZYNkrgZ0RKbrheWBH8E5cEAIKAjr
	8JuIZsDLIGY++CVbtEFdbI5WenxcI1Asgjh4lbJzwiQZuHiUsB0V5sy5A7bfEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 13:47:52 +0200
Message-Id: <DLQXBZQ8KOCD.17XT73H60GTNJ@bootlin.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai"
 <wens@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Frank
 Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Francesco Dolcini" <francesco@dolcini.it>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Marcus Folkesson"
 <marcus.folkesson@gmail.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Yannick Fertre"
 <yannick.fertre@foss.st.com>, "Raphael Gallais-Pou"
 <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Adrien Grassein" <adrien.grassein@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Simha BN" <simhavcs@gmail.com>, "CK Hu"
 <ck.hu@mediatek.com>, "Jitao shi" <jitao.shi@mediatek.com>, "Yongxing Mou"
 <yongxing.mou@oss.qualcomm.com>, "Abel Vesa" <abelvesa@kernel.org>, "Chris
 Morgan" <macromorgan@hotmail.com>, "Martinez Canillas"
 <javierm@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: aerc 0.22.0
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
 <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
 <20260928100841.GC22609@killaraus.ideasonboard.com>
In-Reply-To: <20260928100841.GC22609@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_044822_267157_176F1B50 
X-CRM114-Status: GOOD (  16.37  )
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

Hello Krzysztof, Laurent,

On Mon Sep 28, 2026 at 12:08 PM CEST, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 10:08:43AM +0200, Krzysztof Kozlowski wrote:
>> On 28/09/2026 08:58, Laurent Pinchart wrote:
>> > On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
>> >> On 28/09/2026 07:33, Luca Ceresoli wrote:
>> >>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>> >>>> Correct indentation in the examples to consistent 2- or 4-spaces
>> >>>> indentation to fix dt-check-style warnings ("example 0
>> >>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, =
but
>> >>>> re-indenting entire example just for that is too much churn.
>> >>>
>> >>> Applied, thanks!
>> >>>
>> >>> [1/2] dt-bindings: display: Use consistent indentation in the exampl=
e
>> >>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
>> >>
>> >> Thanks, but I expected no one will pick it up, so I asked Rob to take
>> >> it, thus it is already queued.

Sorry that this caused confusion.

>> > Please explain your merge plans in the cover letter next time.
>>
>> The merge plan was this going through drm-misc. It got reviews, no one
>> applied, even Dmitry for msm only reviewed the msm-bits (second patch),
>> so I asked Rob to take it. This was not planned, but result of usual
>> drm-misc inactivity for bindings (many bindings were not taken in the
>> past or with noticeable delay/pings).

My personal rule of thumb to apply patches to drm-misc is to wait at least
(the latest of):

 * 2w after the patch has been sent
 * 1w after it's reviewed/acked

This is to give everyone reasonable time to chime in and nack if needed.

According to that policy, which is of course debatable and not ubiquitous,
this patch got applied timely.

> If that happens again, could you please reply to the series on the
> dri-devel list to tell it will be merged through the DT tree ? I don't
> think there's any issue with merging patches that way, it's just
> coordination that's lacking.

I agree a ping over e-mail or on #dri-devel would be good and less noisy.

But if the patch has multiple eligible branches an "applied, thanks" e-mail
would let everyone know. I do it very cheaply with 'b4 ty'.

Kind regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

