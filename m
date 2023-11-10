Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmFdSKlHzTq3aZv6aMEs9WUEJqqrssVfq70zu/yLAJY=; b=PJFMNtvisfQ5wlAM2ck8Wle/mx
	EtxjMuM9o07ePgKoY9i1Wtfgf9L+V5fWf4RHRHtfZXvOcbc+ELAAbF6QAaDPqcDIO+3MHBBfBuPiy
	EGfAKmG+XdT0biy9p63cjoeeq41lQQpYfWxsiNNngQA/iYIzQXDXG3jTsCH2NCnN4agVNhNOw1OkT
	CPkv56OXioIiVmtQuATnFzVzpeL3lWNc5MjC5xNeJMMg7cc946tIdNsMzS0aiX9udHBhPZ3VQg8K3
	GqKwGqsWyURXhatXPakLDpStHuGd3zO5gs/f3TQS0+ScFAmmmh5c8v/8X1PEOBihcNvFeoe/zs5Sn
	BKBa74eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YOB-009QE9-0e;
	Fri, 10 Nov 2023 20:46:03 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YO8-009QCu-1E;
	Fri, 10 Nov 2023 20:46:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1YNy-0008Ty-3B;
	Fri, 10 Nov 2023 20:45:51 +0000
Date: Fri, 10 Nov 2023 20:45:48 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Message-ID: <ZU6WfOUF7owz7ZLN@makrotopia.org>
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linaro.org>
 <fc52c1df-e414-49a9-a3a7-7a4ce45c403e@linaro.org>
 <49cd75fd-962f-417c-9196-3c9edd42e4d5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49cd75fd-962f-417c-9196-3c9edd42e4d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_124600_445101_9876001B 
X-CRM114-Status: GOOD (  33.91  )
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

On Fri, Nov 10, 2023 at 09:00:26PM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2023 16:20, Krzysztof Kozlowski wrote:
> > On 10/11/2023 09:09, Krzysztof Kozlowski wrote:
> >> On 10/11/2023 01:30, Daniel Golle wrote:
> >>> Add binding description for mediatek,mt7988-wdt.
> >>>
> >>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>> ---
> >>
> >> ...
> >>
> >>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >>> new file mode 100644
> >>> index 0000000000000..fa7c937505e08
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >>> @@ -0,0 +1,12 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +
> >>> +/* TOPRGU resets */
> >>> +#define MT7988_TOPRGU_SGMII0_GRST		1
> >>> +#define MT7988_TOPRGU_SGMII1_GRST		2
> >>> +#define MT7988_TOPRGU_XFI0_GRST			12
> >>> +#define MT7988_TOPRGU_XFI1_GRST			13
> >>> +#define MT7988_TOPRGU_XFI_PEXTP0_GRST		14
> >>> +#define MT7988_TOPRGU_XFI_PEXTP1_GRST		15
> >>> +#define MT7988_TOPRGU_XFI_PLL_GRST		16
> >>
> >> IDs should start from 0 or 1 and increment by 1. If these are not IDs,
> >> then you do not need them in the bindings.
> >>
> >> Where is the driver change using these IDs?

It isn't needed as the driver doesn't list the IDs. If that would
be true, it would be sufficient to put them into a header next to the
driver or defined inside the driver C file.

The defined IDs here are intended to be used in device tree files.

> > 
> > You nicely skipped my email and keep pushing the idea of putting this
> > into separate patch.
> > 
> > No. Respond to received comments.
> > 
> >>
> >>> +
> >>> +#define MT7988_TOPRGU_SW_RST_NUM		24
> >>
> >> Why 24? I see 7. 

Because the wdt on MT7988 has a total of 24 resets. Most of them are
(currently, as there are no GPL drops, no publicly available devices,
...) undocumented and are not used in Linux **at this point**. Having
to change the driver every time a new reset is discovered or needed to
be used is tideous, so I thought the best would be -- as we know the
total number of resets -- to already define that, as it's safe to do
and won't need to change.

> >> Why having it in the bindings in the first place.

This line can indeed go into the driver, it's not used anywhere else.
I was merely immitating the style of all the existing binding headers
for similar SoCs and didn't want to stick-out style-wise, also in terms
of the added code to the driver which relies on that number being
defined in the header for all other SoCs.

> >>
> >> It's quite likely I asked the same question about other bindings for
> >> Mediatek. I will be asking every time till this is fixed.
> > 
> > No response to this, either.
> 
> You still did not respond here. To none of the points here. It's my
> third ping because I want this to be resolved. But ignoring my emails,
> and skipping paragraphs of my replies will not lead anywhere.

I have answered to this before:
The driver does NOT have any internal list of names of individual
resets, it relies on the reset number from device tree matching the bit
in the controller, just like for any other MediaTek toprgu already
supported by mtk-wdt.c.

