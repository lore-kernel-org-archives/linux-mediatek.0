Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD520C34047
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 20:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6252173E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 20:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="awsjJc5u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6252173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AJr7dlOzYPTwBgP5mQBw9az7qd5LH/2MjGI6o7Rtic=; b=awsjJc5u6hLd+L
	BsEz0OyGp17vZ14GfnRc0CONy1I6Ghbv/CjOdE44e9ClzMNOUmOQ8pWCA8CWyZS40U1HeQ1hlvCgG
	Vjo7rqZGUnLq3FUjsOhSMCoQH2GV1jfHvXqMrK9wJlxHldvvkFkaPcJfqzTKeBn5r2N9c7PdwrHCm
	EJSgT096QomgDnPrKaAmNKaAJIe5Id46cR7HKGXSiYS2/Oo1g01+O1i4D/Oslce1ZHflJFseu/emD
	dYg5N1DvgKgvC7r9sSLL/K9hU/A50CUh67rUE/IgL7yLW/PYdr6e02Y9gZggTgWupTdASmQYy2+Ru
	7zWEeIsLbyh66KE2CuUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j49XB-0005hV-N9; Tue, 18 Feb 2020 20:31:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j49X8-0005gq-PJ; Tue, 18 Feb 2020 20:31:56 +0000
Received: by mail-oi1-f194.google.com with SMTP id p125so21467659oif.10;
 Tue, 18 Feb 2020 12:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J/VxJ3xiwdS6/BWNfUPWpgIlaLG5DINnCPtjKZgxKdM=;
 b=dBG6gTVnj8DfPuy2Mz0cFObHaIYmrxqrv/Xw9ECMM8uc/edkdyxoyCKWm484mqQDIS
 e+wBte1pMS6+l7P8u4GZY1d3w2W1V2NWQgaGq8L0R832lZIIppbXJ8NVBIMcJE4LqQ4Z
 r3rLzlbLFGCoJ9v2HLfMLMv/H6LiDbm0G9hzBPDhGWHHJz5ZjA3JlWQqKZXmXm+cIlqp
 01jEtXVeIh04B4PPHKMtKCAZ5++Ygpg4pjfvWrQ1MiDygrINnpRuzUvJvoqgq3H6meM8
 JTsHhTcHHDrw3OLsEIbHhFJbcW91S6NiYKS3l+H45zp5KeC930jsLF46vVsB0vG7vIzd
 lGzw==
X-Gm-Message-State: APjAAAVg2VjG9pgvIlM1EUMxk4H91s7gXN6H+cxyRYhODBZOP89blxvK
 +sbzxoZ90JZUmPATmZRKrg==
X-Google-Smtp-Source: APXvYqz4+tMO0xRMFlD+Nj7EMFcqW+z3eblcWmDWok4aK303S3lbrgXPLQt5ovOmoCv1EkypuhWhDA==
X-Received: by 2002:aca:af50:: with SMTP id y77mr2515745oie.8.1582057913671;
 Tue, 18 Feb 2020 12:31:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y25sm1716518oto.27.2020.02.18.12.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 12:31:52 -0800 (PST)
Received: (nullmailer pid 19094 invoked by uid 1000);
 Tue, 18 Feb 2020 20:31:51 -0000
Date: Tue, 18 Feb 2020 14:31:51 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: display: mediatek: Add mmsys
 binding description
Message-ID: <20200218203151.GA15948@bogus>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213201953.15268-3-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_123154_821293_BB0928A7 
X-CRM114-Status: GOOD (  19.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, wens@csie.org, ck.hu@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 13, 2020 at 09:19:42PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MediaTek DRM has a block called mmsys, which sets
> the routing and enables the different blocks.
> This patch adds one line for the mmsys bindings description and changes
> the mmsys description to use the generic form of referring to a specific
> Soc.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
> Changes in v7:
> - add hint to the mmsys binding document
> - make mmsys description generic
> - fix typo in commit message
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../bindings/display/mediatek/mediatek,disp.txt          | 3 +++
>  .../bindings/display/mediatek/mediatek,mmsys.txt         | 9 +--------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709db7a4..8e453026ef78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -24,6 +24,7 @@ connected to.
>  For a description of the display interface sink function blocks, see
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
> +Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt.
>  
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
> @@ -43,7 +44,9 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> +	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
>    the supported chips are mt2701, mt2712 and mt8173.
> +
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> index 301eefbe1618..7bbadee820e3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> @@ -5,14 +5,7 @@ The Mediatek mmsys controller provides various clocks to the system.
>  
>  Required Properties:
>  
> -- compatible: Should be one of:
> -	- "mediatek,mt2701-mmsys", "syscon"
> -	- "mediatek,mt2712-mmsys", "syscon"
> -	- "mediatek,mt6779-mmsys", "syscon"
> -	- "mediatek,mt6797-mmsys", "syscon"
> -	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"

You've lost this information about the fallback...

> -	- "mediatek,mt8173-mmsys", "syscon"
> -	- "mediatek,mt8183-mmsys", "syscon"
> +- compatible: "mediatek,<chip>-mmsys"

You are just going to have to add these all back when this is converted 
to schema.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
