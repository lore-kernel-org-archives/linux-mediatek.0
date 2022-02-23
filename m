Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C11BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qny1aNdu4vbvCq+MaifhEeXPYhi6nONT0PiZvpEOUUs=; b=AcqS03s3oJ9Wrj
	dR1R1C3L3pOraZSqB3YS6Dku9dWmmcXjI3nhpn/fJ5JusWxB5kIc4H814TBkmW09jT3d6Jizc+qB0
	jkCN/OETHpLwii0+qLXh/jbL/fwC25qFW3vqu3Gmt5aKBdcSEGfinoJI7H67cJhhVEYfpW0YN0pWD
	myX3M1CAr/7n/xd4XeR4PIclPCtk54dRqJebCa5L2tirukVA+Bl1NNwICa8XVl5dm7nezm/LH89+f
	nA2rjTt1XkrnpFCjRGNxFwInC8p/GBxf97mrJIQjBxwQ5GdYAPN1fbcYb3CLSBkzerkII1ATocvo5
	g0Y2dn54Cyh1CAd6Kwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvYo-00FWTn-5s; Wed, 23 Feb 2022 17:36:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvYa-00FWQa-5W; Wed, 23 Feb 2022 17:36:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B13981F41250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645637761;
 bh=CSOlJtblEwB4RlgPahvcN3gy+e32KywvGIkmYOzijI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YVngT9RX4Zl8QM2ArzTdGkd+v6f9P7vNkU8HsSyWpEFDVkJFkdig9Y38uTCEdsr5O
 5t6Ht9ZtyTDN+d1KqBwwOel2VU2Y6WYNaZMuFi3kjgIhHr7/Prog05ocB5CiV5IY2U
 ymtA7PWhTGWrPnYdV0zUaKANpOI6GJ/Jgn30ZmrySwXWP5kKbr/vxIFVvwllKBgATa
 NJkBmrDA9ZRwPK2lbqCDN+jOp/x4V7Lnt3XIN0vA6EYcRWItn8CGNs50sZwyOqazHQ
 RG2MZ7y+cz0OgnTVSm4lttyzqdgJtqyC2coEngJCR7pVwOH33+NjiCD0Zv5dcap+c2
 H3nWRyFpsEdow==
Date: Wed, 23 Feb 2022 12:35:56 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8192
Message-ID: <20220223173556.u3dx7ugpxpcpir2n@notapiano>
References: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_093604_432470_8E2B9D8B 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Allen,

thanks for the patch. Please see the comment below.

On Thu, Feb 17, 2022 at 09:56:20PM +0800, Allen-KH Cheng wrote:
> This commit adds dt-binding documentation of T-Phy for Mediatek MT8192 SoC
> Platform.

Commit messages should be in imperative [1]. I'd suggest the following mess=
age:

	Add MT8192 compatible to the Mediatek T-PHY dt-binding.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
describe-your-changes

Also, the commit title would be better if it had the tag for the tphy file,=
 like
this:

	dt-bindings: phy: mediatek,tphy: Add compatible for MT8192

Otherwise it's not clear that you're changing the T-PHY just from the title.

> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Other than that,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/D=
ocumentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index d279ba222316..7b2e1bc119be 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -81,6 +81,7 @@ properties:
>                - mediatek,mt7629-tphy
>                - mediatek,mt8183-tphy
>                - mediatek,mt8186-tphy
> +              - mediatek,mt8192-tphy
>            - const: mediatek,generic-tphy-v2
>        - items:
>            - enum:
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
