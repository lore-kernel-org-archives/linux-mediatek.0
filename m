Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87888C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhPBWvBv5kEvAMtpsRiVyomF8xiyaXra4FOCdeyLLsY=; b=rj4JhG8nL1W4Li
	hZ3EQOHgSb3v1FultFJh+jQ1JX4hgF0aebmBYaE2bHPLAxYb1L7lOZYwkL48heobwngEYTdH0k/wi
	fdZPq63O2OTeaz5X6NAQURCauALOx/sC0rNyWOKAhkMhiDDJHLVNdvAtkfwI+DJ6hy0CLQO8pUdd3
	+ztBP8l6mJr6SN+yntQYyyiteS9b9zpdi808cHzVwl4yvup4wXBjJwgdhz3/5f7TEyp+0h7c0wOUE
	/QfT9xjcbJXummK9twOA+49+vwvOdTFC84JbSJoiMwuONd/Va00Ql4OA6eifyOkjtA27/+f+NcG4l
	TG/lgTPNnCPq8dpQtk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noT58-003DSE-TK; Tue, 10 May 2022 16:51:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noT47-003CmM-40; Tue, 10 May 2022 16:50:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 5AB901F43174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652201421;
 bh=ZLNmt5sdQew7yKceknoOpRxb0cIfVFzschzGJ6r+zG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nhtj6M/AUwaJD8Ja7FlZFjsiFaIu+2p9Y8N17iQhM04EmemSlHuQtSp8lR+/4GUC0
 CWJEYllptB8/qbDjjto0Pgc1nwfyhkmVcDGy1mhD5zMSnBNb0EYejN7YBX23Jn77Wn
 TnbYfjal0cvdRR1du/7jQqsr/jA2bbPJWEYSmJIOuxHAj7NNpVnrffixXnYSMasmmz
 gGsC0WhZbmPh7RsyqSedZNvXaPp4v3hcNKNPdnUmG+SVhSV5am9JLmtEmD/sWfg/G6
 ob+7yyeog/yNcM2NbUOKZMXvFJW7+gLulAG5RJc6cZNbFNYureITmBWy1qtZxyl6Cq
 MRyAvkHgirvqA==
Date: Tue, 10 May 2022 12:50:16 -0400
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
Message-ID: <20220510165016.r7nyck2abt5m4djp@notapiano>
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
 <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_095027_343502_0EB2D98A 
X-CRM114-Status: GOOD (  23.65  )
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

On Sat, May 07, 2022 at 06:33:31PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2022 23:32, N=EDcolas F. R. A. Prado wrote:
> > Commit ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM") added support
> > for the l1tcm memory region on the MT8192 SCP, adding a new da_to_va
> > callback that handles l1tcm while keeping the old one for
> > back-compatibility with MT8183. However, since the mt8192 compatible was
> > missing from the dt-binding, the accompanying dt-binding commit
> > 503c64cc42f1 ("dt-bindings: remoteproc: mediatek: add L1TCM memory regi=
on")
> > mistakenly added this reg as if it were for mt8183. And later
> > it became common to all platforms as their compatibles were added.
> > =

> > Fix the dt-binding so that the l1tcm reg can, and must, be present only
> > on the supported platforms: mt8192 and mt8195.
> > =

> > Fixes: 503c64cc42f1 ("dt-bindings: remoteproc: mediatek: add L1TCM memo=
ry region")
> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > The if:then: branches became rather long since it seems that it's not
> > possible to override the properties in them, only add new ones. That is,
> > I couldn't leave the items definition for all three regs in the global
> > reg-names and just decrease minItems and maxItems to 2 for
> > mt8183/mt8186.
> > =

> > Also I had to add a description to the global reg-names, since it
> > couldn't be neither missing nor empty.
> =

> It is possible:
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/b=
indings/example-schema.yaml#L91
> =

> Keep constraints and list of names in properties. Then in allOf:if:then
> raise minItems or lower maxItems, depending on the variant.

Hi Krzysztof,

that example only shows setting minItems to override the default value, but=
 the
issue here is that it's not possible to override minItems/maxItems (after
they're already set, even if implicitly) with a different value in the if.

That is:

	properties:
	  reg-names:
	    items:
	      - const: sram
	      - const: cfg
	      - const: l1tcm

	if:
	  properties:
	    compatible:
	      enum:
		- mediatek,mt8183-scp
		- mediatek,mt8186-scp
	then:
	  properties:
	    reg-names:
	      minItems: 2
	      maxItems: 2

Generates the error on dtbs_check:

/home/nfraprado/ext/git/linux/arch/arm64/boot/dts/mediatek/mt8183-kukui-kak=
adu.dtb: scp@10500000: reg-names: ['sram', 'cfg'] is too short

I believe the tooling is implicitly adding

	      minItems: 3
	      maxItems: 3

to the common reg-names, and since it's not possible to override them, the
override to 2 doesn't work so they are kept at 3, causing the error.

Moving the minItems/maxItems to the common reg-names as a test gives:

/home/nfraprado/ext/git/linux/Documentation/devicetree/bindings/remoteproc/=
mtk,scp.yaml: properties:reg-names: {'minItems': 2, 'maxItems': 2, 'items':=
 [{'const': 'sram'}, {'const': 'cfg'}, {'const': 'l1tcm'}]} should not be v=
alid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list

That error, plus looking in the items meta-schema, suggests me that maxItems
isn't supposed to be set lower then the length of items. So even if the
minItems/maxItems override is fixed, there's still this issue. It seems like
defining the reg-names list separetely in each if branch is indeed the righ=
t way
to go.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
