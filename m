Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2FEC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e13pUePBSYmjvmQEarfblVmi+wiaZHR07EtBRN5cuM0=; b=OloWZD8aPbuQ01l7Pr+CXdHvdo
	md0moR88STeOq+G991qmMQoIgF6DhYCZCWjT/+eiLn4UnoH84rC6Ut/tGl9NzCx2CTZNZzArLGHjx
	DqG3pggL3kUvscnq2Og/h0Bby07j3IvVzZnMEqrR1eDcB6qlVkGuP3rEzpYzB6FWCFW7rBHCW/UdI
	CnPjHtE+lEHSkl/RkEkavVM8UzRuYmKca5aNqWSK4AiKXtAocU2u17A7MMq+fKQwcDxds2fyucILX
	SdyWoFyfJTQ/xikZF6Nfgr7WwYoNFJwL6xr0wKTXsCBjVr0PMm/Ufnxte5ujBuIoKApoe+Yp8/2NF
	tNGDxEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QxZ-0000000Dlmb-2tw4;
	Fri, 26 Apr 2024 19:10:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QxW-0000000Dlly-2OUJ;
	Fri, 26 Apr 2024 19:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98133620E8;
	Fri, 26 Apr 2024 19:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD0CC113CD;
	Fri, 26 Apr 2024 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158607;
	bh=/5D69c/HjZZ5w1KhjR62OOz+fM/4KJRsPcVh8kxgYos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPWB69KLYOETZ/HxAdPvCyHATYvJFXi7xWJi3xNNbjJlFIn9sXL4RlleII4LtexxY
	 /1dxte7j4pgCPy+w0/lxTGCWnZWnvuZfeTWJTD1L37Ifb/IXJu0erWpJPPWq5bdWOM
	 94MB35DfHtzCm5HNUlBkfcmsEZPUtOOii7CImtjJx5XgqrV6uW9EVJAlHD02pcSWZo
	 9aCsnpd8PiguQE7w16jjkMmk/bljeXcjX3R6xtgaicXZaW3Q68DexX3WLFeYrUz0hz
	 KzEZmXURAq/oWfERJB+jT3JbXVFdJsXyz7I71HeORRKIZomKpmNUcTm2DUBe5sKjpz
	 7VNrvuQzYZPzA==
Date: Fri, 26 Apr 2024 14:10:03 -0500
From: Rob Herring <robh@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/3] dt-bindings: eeprom: at24: Add property dovdd-supply
Message-ID: <20240426191003.GA2655695-robh@kernel.org>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-4-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426102949.23057-4-zoie.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_121010_681531_83BBF312 
X-CRM114-Status: GOOD (  15.62  )
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

On Fri, Apr 26, 2024 at 06:29:49PM +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
> 
> Include a new property named dovdd-supply to provide an
> additional power supply.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 8befd09963be..0ecb7ea76d1d 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -193,6 +193,10 @@ properties:
>      description:
>        phandle of the regulator that provides the supply voltage.
>  
> +  dovdd-supply:
> +    description:
> +      phandle of the regulator that provides the supply voltage.

We already have "the regulator that provides the supply voltage" just 
above.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.18.0
> 

