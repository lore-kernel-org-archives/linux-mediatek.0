Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0432D0EE12
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 16:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC0E3tAvwzuL7RaR1WUvFuQzWfJeFLyhZJacH8FyH9Y=; b=SlcVdmwyQPzzUWwfZ+FPl5vnWs
	F1dLg6h+MpAI0uZbMYxbEY3Gj4TCJ6o+snEOjNj8Q7ce4OfeWedE0SwGZ4jlnIo06pMeiD1wfu7R+
	7wzSKP0sRT2ntgOtVJL1v7JcLvRKESMekchQD7Fh9qRzvFcFKmti3TX66vjESz8AwP9qITGssD+Ze
	QxmwKw1obcEGL//ptgR52Jeg0m688twDK67FxNO9A8gLzcUqu9Ew0abhFbKjY4Jnx5S6PDU8yX1RA
	/FuhuDm4RRYri/X+0b+7Es820XH9Ry0OYPbKUZuOJAYQoPKalNaPflW3obJQbc46Utx/d9Mu37M1p
	COLo2rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIy2-0000000H1sd-316M;
	Fri, 11 Oct 2024 16:58:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIwf-0000000H1mY-2jNF;
	Fri, 11 Oct 2024 16:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0C9AA44B8D;
	Fri, 11 Oct 2024 16:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3401C4CEC7;
	Fri, 11 Oct 2024 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728665812;
	bh=iEtHdpYrx5DVc2mfDpmhMV08XV93wcIaiwU6NFEPxW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GiMSdH2XoZ78kFCXCjt+1Bk9hEjlDpJ18YZd+qDVSlFtwTMWBBvles8ylKqTJ5smK
	 vN8q3gQl06Nyr8Qblp6EeyNJvZ05rq7JpZnTrlOy7dP4Xz/w/EPeAZw1KBTegYAlMv
	 verH1sjYtMaec26n7LYex0T8DBI0oNtVTgqAUBCL8d6UH5D9ysKzq+yBhV+9ppnGTM
	 TBF1VQOAKhMLqcoCxMJFgHw5C7zxDYveMGo+29CyeIaAmJu5HOGHsgavO1/OXHnCfs
	 kMUkGUbal+tatSdQir+hrWSHwrIstTvYWjoMAahOlg5CAdyih8Mcyy+JGojVlonHxI
	 0H4Fp0Tbr3POg==
Date: Fri, 11 Oct 2024 11:56:40 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
Message-ID: <20241011165640.GA2475122-robh@kernel.org>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011120520.140318-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_095653_776288_ECDF138F 
X-CRM114-Status: GOOD (  15.96  )
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

On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 3bbc00df5548d..352a88d7b135e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -111,12 +111,12 @@ allOf:
>          - "#interrupt-cells"
>  
>  patternProperties:
> -  '-[0-9]*$':
> +  '-pins$':

Worst case, this could be an ABI break. Best case, it's churn for 
mt6779. Is it worth unifying?

Rob

