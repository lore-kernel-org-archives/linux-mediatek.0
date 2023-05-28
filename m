Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C8C7EE23
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 May 2023 11:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIXW/LydBodQh0NJYxajCZQGo5iKtGBLt/hj3aeT8EM=; b=mw8rgSptFZNn00qxfxf7clbX3d
	VMtmQdA2utFCBfewdZWOY7800K2w5BxzEFp/Z05jHvoCEOd7R4BC8FQNtRt2x7/qw+b8Y5jhkoS0Q
	709qHvTqf0y/B1+0x/Rg9p0CuooBgtINPKMBFh68lLb4oNw07Sy1LzxfvF9IWaXi65h5PhKKcLuQt
	NzGC3YgEF+G98ZrlBmzk9RmyEv5AkgQ9/RXaZnfv/aZvBxMHOFXf1waD3HLUa7gS4NwVGPT/7fJdA
	T5gN9iVTsuNMl7HwpYpdRLHGR9ohWnoq2C5Jq292kvuP6+5wSiryfCCkNUa64+hoWUripKInhXYCW
	VM3L4nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Elz-007YWF-34;
	Sun, 28 May 2023 11:41:19 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Elw-007YVP-34;
	Sun, 28 May 2023 11:41:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q3Els-0006sD-0g;
	Sun, 28 May 2023 11:41:12 +0000
Date: Sun, 28 May 2023 12:41:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] arm64: dts: mt7986: use size of reserved partition for
 bl2
Message-ID: <ZHM9zq9t2uRuvrK7@makrotopia.org>
References: <20230528113343.7649-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230528113343.7649-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_044116_988068_2764A4DB 
X-CRM114-Status: GOOD (  21.23  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 28, 2023 at 01:33:42PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> To store uncompressed bl2 more space is required than partition is
> actually defined.
> 
> There is currently no known usage of this reserved partition.
> Openwrt uses same partition layout.
> 
> We added same change to u-boot with commit d7bb1099 [1].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> If the bl2 does not fit into the bl2-partition (cut off), board does
> not boot, thats why i want to increase it now. My current bl2 is 197K
> for nor and i ran into this problem.
> 
> Openwrt uses also the first reserved partition to give bl2 more
> space:
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/dts/mt7986a-bananapi-bpi-r3-nor.dts;h=f597b869abc80d1a73f44ebb85ad4da17376bb52;hb=HEAD#l22
> 
> so imho it should be same in mainline to not require complex bl2
> compression.
> 
> have now sent the board-specific dts to uboot too:
> https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
> ---
>  .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso     | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> index 84aa229e80f3..e48881be4ed6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
> @@ -27,15 +27,10 @@ partitions {
>  
>  					partition@0 {
>  						label = "bl2";
> -						reg = <0x0 0x20000>;
> +						reg = <0x0 0x40000>;
>  						read-only;
>  					};
>  
> -					partition@20000 {
> -						label = "reserved";
> -						reg = <0x20000 0x20000>;
> -					};
> -
>  					partition@40000 {
>  						label = "u-boot-env";
>  						reg = <0x40000 0x40000>;
> -- 
> 2.34.1
> 

