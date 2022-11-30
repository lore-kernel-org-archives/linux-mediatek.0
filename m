Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B88C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efQ1auvrx5joRwcznVTM3EMV1vhSADvgXQLY7x3fP0E=; b=H9hqFOaNrZl2nljB1BMkQ+0efV
	nLpE4YF/JzLfGG7iCacFIzqzJ/5ieVk0w1PIaTQ+Td3jqm4EHMIsX5mM0a/1QO8YIAXRY6CEV5jV7
	gbhLqrNY368eUZvZqk13JH1rK61l0KGzzn1gx0QghNyGTdC/Jm8J14NKliGmug6BdE3T+peuAKZV2
	18vSnKcKvnsOupoTS4YY8T6MLVjFF1FdYYt1bevP3AxVoPxzUBvSo829EHVxttXdlpQw4rrd5RaF5
	TxUE1pr7ufjed9OtE0/ZIuGY0M2u0MugKlIo0wZchPBJrmAFo/kXEiMqfHZCvlLlTZhYTg7yCcBuy
	wNfpwvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Lui-00G2fq-An; Wed, 30 Nov 2022 12:10:08 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LuW-00G2az-3C; Wed, 30 Nov 2022 12:09:58 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1p0LuK-0005r4-P3; Wed, 30 Nov 2022 13:09:44 +0100
Date: Wed, 30 Nov 2022 12:09:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.or,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible
 string for MT7986 SoC
Message-ID: <Y4dIBW4Kped5klgD@makrotopia.org>
References: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
 <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
 <cdc79d9b-7afe-1aaf-3692-171370abaa3c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc79d9b-7afe-1aaf-3692-171370abaa3c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_040956_151092_F65EE76C 
X-CRM114-Status: GOOD (  16.52  )
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

On Wed, Nov 02, 2022 at 04:43:35PM -0400, Krzysztof Kozlowski wrote:
> On 31/10/2022 18:16, Daniel Golle wrote:
> > Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
> > found in MT7981 and MT7986 SoCs.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> > index 5c7e7bdd029abf..efc16ab5b22b5d 100644
> > --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> > @@ -13,6 +13,7 @@ Required properties:
> >    - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
> >    - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
> >    - "mediatek,mt7622-thermal" : For MT7622 SoC
> > +  - "mediatek,mt7986-thermal" : For MT7981 and MT7986 SoC
> 
> Then recommended is to have specific compatible followed by fallback (so
> 7986 followed by 7981)

I'm a bit confused about the order you are suggesting. It may seem
counter-intuitive, but MT7986 was released before MT7981, the thermal
units found in both SoCs seems to be exactly identical.
Or are you suggesting to list MT7981 first to maintain alphabetical
order? Because in terms of precedence, MT7986 has been there first, and
hence I'd list 7986 first, followed by 7981, ie. the opposite of the
order you were suggesting.


