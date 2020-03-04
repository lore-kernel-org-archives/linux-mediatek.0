Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E7C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 15:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F2721775
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 15:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0T8p+//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F2721775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sHEASeIVbHEV5od+BKToMmnW/JqWHEpiGs+R9anKpI=; b=m0T8p+//A+4IPu
	QC0XqDJgxVGlLfxylxozfHAyFJMjXDkGK59yB1yV/kjbHM6iZET4QmZOVl00IMwrEy4bnVFvL53MC
	ok/SmvzBhr1DzwPSbEV2z4YxLC3b5uLEmiLgL8/69W4d69uwD1THfeBumKcW3WxNeLeQRYEYWCjq9
	OGG95rvJTTgAnDPJBFHVhlS73MrCB5I4wuw2R5iTKepS3fp2AeFNAOCbIsqyXHCkz5KBsvH0NIrCD
	w2ey60Dk80Y9VE0n7DbTzgoJoyeCZ+y9osgyGgSDBKeWCkXHoPB9LBtFdcVZnEHetFxTVGzs410/C
	teWb3SH8NbEGBF4zqYZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9VVD-00047r-Hj; Wed, 04 Mar 2020 15:00:03 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9VVB-00045w-0P; Wed, 04 Mar 2020 15:00:02 +0000
Received: by mail-oi1-f196.google.com with SMTP id g6so2381695oiy.1;
 Wed, 04 Mar 2020 07:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5kzs+suiXGOLM6214SN1xySZQC2yuoHuAv+kXNmxnJI=;
 b=EP1pamTlcikhYGjTHp/9UzOznxU/ls+sNpfM+0JrXOzzQZr8LYKvfhhTNBdBmgd88o
 VCTnHzILxWnvFppuitGNMh0Q2PAmJf3T5MhiqFqa7wf3bQ2wm55ICQWM98/SaRIUhNmb
 tyK8I4FxIJ4705fj9yXg37TTuv9trHkdUXuOHegElaAFqWRn9KtDcFNGl3bFyd7K/bdw
 aoEINepp97UwjexLpC/SKiyY1Ep8RLxJgmlQZd7zf2BxOz7xIbXLVk3YsTd8GIsC1qiG
 o69icYva9lu8pRVJnF/3rSDOKCdyIF9CHOBRiZCXu0rS61ttoAtEdQHbX7/NLxByfu2T
 GzgQ==
X-Gm-Message-State: ANhLgQ2q+XVPSUIZKBDPcyCe6LxlaY466XUzeslULfxAZx0mbIdjsUIO
 hPDVjWA9/BusLjdHwqllQQ==
X-Google-Smtp-Source: ADFU+vv8e6bqzfrEUfhRglZm6ics/VgmQ0DWwpgysZeN1Q7F7AyUjL7HRD+dgHJdDUz55H2/3Q1G6Q==
X-Received: by 2002:aca:5194:: with SMTP id f142mr2089262oib.100.1583333999966; 
 Wed, 04 Mar 2020 06:59:59 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b15sm6358282oic.52.2020.03.04.06.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 06:59:59 -0800 (PST)
Received: (nullmailer pid 20406 invoked by uid 1000);
 Wed, 04 Mar 2020 14:59:58 -0000
Date: Wed, 4 Mar 2020 08:59:58 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200304145958.GA17716@bogus>
References: <20200303052722.94795-1-jitao.shi@mediatek.com>
 <20200303052722.94795-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303052722.94795-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_070001_059656_B8E79C56 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 03, 2020 at 01:27:18PM +0800, Jitao Shi wrote:
> Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> the dpi pins to gpio mode and output-low to avoid leakage current when dpi
> disabled.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 58914cf681b8..77ca32a32399 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -17,6 +17,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- pinctrl-names: Contain "gpiomode" and "dpimode".

Doesn't match the example.

> +  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	pinctrl-names = "active", "idle";
> +	pinctrl-0 = <&dpi_pin_func>;
> +	pinctrl-1 = <&dpi_pin_idle>;
>  
>  	port {
>  		dpi0_out: endpoint {
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
