Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D720C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48m/z3pu4poJa0NnqIrCd9x3BBHJptVeNjn5ZdNYJdc=; b=jWmvau8Kh0xEZbX3foHKXA5i8O
	pPeIJfYSsQT9c6iaCLZSdoaOlfnfEK7u0O7l1y7wrfAuJVbECxz1jUzgfShbCgDUw3+pe4Q62iLVu
	F6/20BapHMIZE4/pGAGxhFMUw7hwnuw7EiKXKcU3ZhwimswuOGVrgyEINJGCEJ3qejJjTPw6KdSMT
	6PviygwoxG9j+iDHOMFVFdGCb7tJ+Q3KHxz2Cx3nC4HpR/xpv2LmZPTr4ef7+g32Am1NWOLvKTKW3
	CFEOOLAgqe3c2X1jzvtHIefTzKgKS3P+1a89gqEaU3IIgZm+FS182vzT1AsLvCIN0ZmTDe8wkTZRh
	tp1qsqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TC3-008z1E-1F;
	Fri, 10 Nov 2023 15:13:11 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TBy-008yzm-21;
	Fri, 10 Nov 2023 15:13:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1TBm-000707-2r;
	Fri, 10 Nov 2023 15:12:54 +0000
Date: Fri, 10 Nov 2023 15:12:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Message-ID: <ZU5IcrjqQpwMopJC@makrotopia.org>
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <2678cb48-1d2b-47bc-9272-06d9aa140c58@collabora.com>
 <ZU47hV1i66WN8nZJ@makrotopia.org>
 <d7b72b3e-c8f4-4675-ae62-26f5ae576f0a@linaro.org>
 <ZU5A59KO8Y_Q97IG@makrotopia.org>
 <a56cfe76-ab03-4187-b6f1-04a5c3414e64@linaro.org>
 <ZU5DVNOmtyFwUTdC@makrotopia.org>
 <708046ae-a821-420c-959a-ab5cb712aa9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <708046ae-a821-420c-959a-ab5cb712aa9e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_071306_686653_D9447C09 
X-CRM114-Status: GOOD (  34.78  )
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

On Fri, Nov 10, 2023 at 04:07:51PM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2023 15:51, Daniel Golle wrote:
> > On Fri, Nov 10, 2023 at 03:46:14PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/11/2023 15:40, Daniel Golle wrote:
> >>> On Fri, Nov 10, 2023 at 03:20:53PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/11/2023 15:17, Daniel Golle wrote:
> >>>>> On Fri, Nov 10, 2023 at 12:56:18PM +0100, AngeloGioacchino Del Regno wrote:
> >>>>>> Il 10/11/23 01:30, Daniel Golle ha scritto:
> >>>>>>> Add binding description for mediatek,mt7988-wdt.
> >>>>>>>
> >>>>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>>>>>> ---
> >>>>>>>   .../bindings/watchdog/mediatek,mtk-wdt.yaml          |  1 +
> >>>>>>>   include/dt-bindings/reset/mediatek,mt7988-resets.h   | 12 ++++++++++++
> >>>>>>>   2 files changed, 13 insertions(+)
> >>>>>>>   create mode 100644 include/dt-bindings/reset/mediatek,mt7988-resets.h
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> >>>>>>> index cc502838bc398..8d2520241e37f 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> >>>>>>> @@ -25,6 +25,7 @@ properties:
> >>>>>>>             - mediatek,mt6735-wdt
> >>>>>>>             - mediatek,mt6795-wdt
> >>>>>>>             - mediatek,mt7986-wdt
> >>>>>>> +          - mediatek,mt7988-wdt
> >>>>>>>             - mediatek,mt8183-wdt
> >>>>>>>             - mediatek,mt8186-wdt
> >>>>>>>             - mediatek,mt8188-wdt
> >>>>>>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >>>>>>> new file mode 100644
> >>>>>>> index 0000000000000..fa7c937505e08
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >>>>>>> @@ -0,0 +1,12 @@
> >>>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>>>> +
> >>>>>>> +/* TOPRGU resets */
> >>>>>>
> >>>>>> The first reset is zero, the second reset is one.
> >>>>>>
> >>>>>> Where's the zero'th reset? :-)
> >>>>>
> >>>>> Currently the reset numbers represent the corresponding bit positions in
> >>>>> the toprgu register, as this is how the mtk-wdt driver is organized.
> >>>>>
> >>>>> So there is probably something at bit 0, and also at bit 3~11 and
> >>>>> maybe also 17~23, but it's unknown and may be added later once known
> >>>>> and/or needed.
> >>>>
> >>>> There is no need to put register bits, which are not used by the driver,
> >>>> in the bindings.
> >>>
> >>> There aren't. That's why there isn't a zero'th reset (and also not 3~11, 17~24).
> >>>
> >>> Or should the driver be reorganized to provide a mapping of logical to
> >>> physical resets, and then have only the needed once present and start
> >>> counting logical resets from 0? This is doable, of course, but it's a
> >>> bit of effort just for the aesthetical goal of starting to count from
> >>> zero and continous in header file.
> >>>
> >>> And, of course, chances are that other currently still unused bits
> >>> will be needed at a later point which then would mean having to add
> >>> them in at least 2 places (header file and mapping logical<->physical)
> >>> where as currently it would just mean adding a line defining it in the
> >>> header file.
> >>
> >> You can do it, but it's not what I wrote here. So bear with me:
> >>
> >> "There is no need to put register bits in the bindings."
> 
> No comments here, so I assume you agree with this.
> 
> >>
> >> You replied "There aren't", which I don't understand in this context. I
> >> can be clearer:
> >> Drop this hunk.
> > 
> > So adding the file to include/dt-bindings/reset/ should go into a
> > seperate patch? Because including it with the driver itself gave me
> > a checkpath warning telling me that dt-bindings should go seperate,
> > which is why I included it with the binding docs.
> 
> No, I said the hunk should be dropped. Removed.

I guess we are somehow misunderstanding each other.
Lets go with an example. I can put the header into a commit of its own,
just like commit
5794dda109fc8 dt-bindings: reset: mt7986: Add reset-controller header file
https://lore.kernel.org/r/20220105100456.7126-2-sam.shih@mediatek.com

Would that be acceptable? And if not, why?

> 
> Best regards,
> Krzysztof
> 

