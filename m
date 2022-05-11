Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pzhg3C9S82eMNH8g6S12sXweLLGysYsARvx9kzEXozc=; b=hyj1CwiLcElRf7
	122DU/VbaJ4HvK2fKuBYTM6OhN6TcCZSJN8Df7k2TmZpQ+mIexUSV8YDxH/3wlVFMgyJSZb1DgroO
	A5aQ6gmyYo6PJRFBkN4xx0F5OZdjCkV+n6oRmY5wRlzTvVIUwtqgr9+uZvTa/TOVYynTYUvB9Pcwa
	cHiblMFGgpZWRFYhsBkONXKVL9uiS1kSs8aMgyo9tkXBpyN1yAO32YJRxirzOrSSAJYiVjrFWnLfT
	doIFkjH3j9BRh58LT+0JB4RylI5mV9YhR0b8RroP3mx87oB13aAoS0rdbYJeFdr5QELaH4NazVws6
	5vm3Ho0nkgb60jo0mUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosTe-008R28-2n; Wed, 11 May 2022 19:58:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosTQ-008Qxg-JE; Wed, 11 May 2022 19:58:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 704CE1F42CF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652299095;
 bh=VybsRpIInZnb23XCmY8eSSZVRgUv+vJS2d+gxTZzyMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8wMtlkCxSaNmzjizBSjnADY75+vjTGMWLc+zi5Fxx6sc4wJjtayy58JkRAs8fT7e
 4Rt8A5tKkEgNPnXQ9Ksr8bCdqHvHp+bRpyIguyfczgcj676e5hA9c6/P//4l69cE7c
 dMAfscqTl5kKnZmPY8QPlGwqtX9jAcLEE/jwH4L3sJQu+SqNpSHccUgNdZa3BDH8E2
 Ui7yrvHs1AaYfAYCQLZF8NObtMGIYZMpqWw0wIb5wiu69upT5wFBK+OZ8zkr2JqmMh
 GoNP6eOXuzOblu7tVaHwB5ztD399ZdVK7hFxI8Uhd6KQ3/4S+I5a4HCChbQJUCVmot
 SZEL6KntEyazg==
Date: Wed, 11 May 2022 15:58:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Message-ID: <20220511195810.jgeoukpj7bz3ng2h@notapiano>
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
 <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
 <20220510165016.r7nyck2abt5m4djp@notapiano>
 <66796853-efe7-f661-9637-ac6cfefc68e5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66796853-efe7-f661-9637-ac6cfefc68e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_125816_809560_4AFF43BC 
X-CRM114-Status: GOOD (  26.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 11, 2022 at 11:12:45AM +0200, Krzysztof Kozlowski wrote:
> On 10/05/2022 18:50, N=EDcolas F. R. A. Prado wrote:
> >>> Also I had to add a description to the global reg-names, since it
> >>> couldn't be neither missing nor empty.
> >>
> >> It is possible:
> >> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetre=
e/bindings/example-schema.yaml#L91
> >>
> >> Keep constraints and list of names in properties. Then in allOf:if:then
> >> raise minItems or lower maxItems, depending on the variant.
> > =

> > Hi Krzysztof,
> > =

> > that example only shows setting minItems to override the default value,=
 but the
> > issue here is that it's not possible to override minItems/maxItems (aft=
er
> > they're already set, even if implicitly) with a different value in the =
if.
> =

> No, this example shows exactly what you need in first step - make one
> item on the list optional.
> =

> There are several other examples for the entire picture or different
> aproach:
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/b=
indings/example-schema.yaml#L91
> =

> https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetre=
e/bindings/clock/samsung,exynos7885-clock.yaml#L53
> =

> > =

> > That is:
> > =

> > 	properties:
> > 	  reg-names:
> > 	    items:
> > 	      - const: sram
> > 	      - const: cfg
> > 	      - const: l1tcm
> =

> You did not use the example I gave you. Where is the minItems?
> =

> > =

> > 	if:
> > 	  properties:
> > 	    compatible:
> > 	      enum:
> > 		- mediatek,mt8183-scp
> > 		- mediatek,mt8186-scp
> > 	then:
> > 	  properties:
> > 	    reg-names:
> > 	      minItems: 2
> > 	      maxItems: 2
> > =

> > Generates the error on dtbs_check:
> > =

> > /home/nfraprado/ext/git/linux/arch/arm64/boot/dts/mediatek/mt8183-kukui=
-kakadu.dtb: scp@10500000: reg-names: ['sram', 'cfg'] is too short
> =

> Missing minItems in first properties.
> =

> > =

> > I believe the tooling is implicitly adding
> > =

> > 	      minItems: 3
> > 	      maxItems: 3
> > =

> > to the common reg-names, and since it's not possible to override them, =
the
> > override to 2 doesn't work so they are kept at 3, causing the error.
> > =

> > Moving the minItems/maxItems to the common reg-names as a test gives:
> =

> You cannot just. You need it in both places.

OK, now I get it. I sent v5 addressing this.

Thanks,
N=EDcolas

> =

> > =

> > /home/nfraprado/ext/git/linux/Documentation/devicetree/bindings/remotep=
roc/mtk,scp.yaml: properties:reg-names: {'minItems': 2, 'maxItems': 2, 'ite=
ms': [{'const': 'sram'}, {'const': 'cfg'}, {'const': 'l1tcm'}]} should not =
be valid under {'required': ['maxItems']}
> > 	hint: "maxItems" is not needed with an "items" list
> > =

> > That error, plus looking in the items meta-schema, suggests me that max=
Items
> > isn't supposed to be set lower then the length of items. So even if the
> > minItems/maxItems override is fixed, there's still this issue. It seems=
 like
> > defining the reg-names list separetely in each if branch is indeed the =
right way
> > to go.
> =

> =

> =

> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
