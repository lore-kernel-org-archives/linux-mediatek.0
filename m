Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BFBE92FF8
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGFNwXCnnKQiKaBSwOtKpmpiuCVHginh8gwjY3/lngg=; b=zVmaK83PcVaLhTncidDkw+iVq0
	rC78XeIp9Pb4WZdH5Ix3eKRpqTU0V5ksu6qIc4E8XeXVtwhgtDZAX8+NhDpRjv/YpF5fPrjFtf+4d
	9IAtOPOWSgmWSAjz0K7soYNDCSxHxfFaGAvVoKsYGnnFilV3QW48Q1pSihXW/vMdC48qiyD/do6BO
	vOPdxgVmfJtE0K7tP99Hy6apm0sA/6I+mPKSS8j3D9RPLfwsRg1cICOReB7c0bSKUrYrQ76jCkaWQ
	neyKkiiKoqpUYQy8P9Hi1yoFRgtj6oNhNxBXubOKGNnUjUt8aapuRnfvySRMqtB0IwG4+WAou/YBW
	Ll0W2F/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8x-005HXu-1e;
	Fri, 06 Oct 2023 08:25:07 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8r-005HOh-2k;
	Fri, 06 Oct 2023 08:25:04 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qog8g-0002lP-00; Fri, 06 Oct 2023 10:24:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 64F71C0243; Fri,  6 Oct 2023 10:22:27 +0200 (CEST)
Date: Fri, 6 Oct 2023 10:22:27 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mips: dts: ralink: mt7621: rename to GnuBee GB-PC1 and
 GnuBee GB-PC2
Message-ID: <ZR/Dw5l3ljiJJbQy@alpha.franken.de>
References: <20230918075915.87029-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918075915.87029-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012502_068748_529F3AF2 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Sep 18, 2023 at 10:59:15AM +0300, Arınç ÜNAL wrote:
> Rename GB-PC1 to GnuBee GB-PC1, and GB-PC2 to GnuBee GB-PC2 to include
> brand and model name.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
> index 129b6710b699..f9c262cc2e96 100644
> --- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
> +++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
> @@ -8,7 +8,7 @@
>  
>  / {
>  	compatible = "gnubee,gb-pc1", "mediatek,mt7621-soc";
> -	model = "GB-PC1";
> +	model = "GnuBee GB-PC1";
>  
>  	memory@0 {
>  		device_type = "memory";
> diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
> index f810cd10f4f4..b281e13f22ed 100644
> --- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
> +++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
> @@ -8,7 +8,7 @@
>  
>  / {
>  	compatible = "gnubee,gb-pc2", "mediatek,mt7621-soc";
> -	model = "GB-PC2";
> +	model = "GnuBee GB-PC2";
>  
>  	memory@0 {
>  		device_type = "memory";
> -- 
> 2.39.2
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

