Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36973C4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 18:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 045A120724
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 18:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMQ3W7rP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 045A120724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RJ1slzGhx6SiVKw3zUn7MRYCWyfblYWbuJnkE4LjJ4=; b=YMQ3W7rPxx+xGQ
	PzkWtXaiglt/WmHevjIfWZox8LVjfkPxdtmNLqDQeFNsZyrcA3totXvYl7TG3RNAtvOMpVPRASpY6
	QoybtHhAIK7NxFLJ1DX8bw0k2p2JR7VGy2+stCwIzUHlukeA+sp1JnmL4/H5Gchil6ecsZ/B2hk9s
	FeGZDsP6td9PpXqlUDGlhRN8G/mNJns0ciReQ4Y8ZOIQVO4yFpLIEWz+8XZnbMgvC3pXblE4aCrqy
	/z7trNx5IrXUppunGS4H+SG0Zq1Tua4f3Uo2DsBmJKrOPTmTjrmcyTKdDXdNf7lwgVbQUoi6yWHGf
	oRHLaWbj6CxZ8G5oPPTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEzvC-0001uX-0S; Thu, 19 Mar 2020 18:29:34 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEzv9-0001u0-TO; Thu, 19 Mar 2020 18:29:33 +0000
Received: by mail-il1-f193.google.com with SMTP id p12so3210292ilm.7;
 Thu, 19 Mar 2020 11:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nuVG9R1fl5aV0113Wkqeyi+DwSUJE/i7o0mHYMU/pW0=;
 b=mHF00RS3+38YSt2n5Ax4Gxp/0b0kaRtIy2t/aiBWQufdyeRJmpbNymnqoXmCR5UtIw
 e3lK9Nw0mpPYMQSraGdcYCufsNdESyIp5OHAOBDzWhjqDoxxT4YVcrOhhqeH8Vqvvmbj
 tCjOfkGZZNvHfQcpX2eSGNlkY7vODzP4Szui9ysedNKK5JkM+K28jGraqt8qBpIFjc8L
 /nbQg4pFP6m2NT8DBnTeL17WhSttb5AjM2dvfk5AWUbVRH/oK9X27FTZeB7mymiV8gHs
 IdIM/ey+YA0HXeRyGF0iimhQdiKgqpO7jiDrOqLXMqDG4w5gQvq5pguztMw9U0sBKnWp
 eoXQ==
X-Gm-Message-State: ANhLgQ0lZ/doNIzrZgOnt49IB53Qe4OZz4qR12Ur9p6a+208CqyH5XGw
 3PB9mDZgbjBbJTN8b1EZxw==
X-Google-Smtp-Source: ADFU+vuYRWENnnjTGXdM/3tIX9NPpmnsPCMZgoJW/FYaAg8G19QayHs3ZHRHOhNCbt+PxUpH9dpgjA==
X-Received: by 2002:a92:9c54:: with SMTP id h81mr4599212ili.109.1584642569415; 
 Thu, 19 Mar 2020 11:29:29 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c28sm1144757ilf.26.2020.03.19.11.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 11:29:28 -0700 (PDT)
Received: (nullmailer pid 16853 invoked by uid 1000);
 Thu, 19 Mar 2020 18:29:25 -0000
Date: Thu, 19 Mar 2020 12:29:25 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v13 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200319182925.GA13920@bogus>
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311071823.117899-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_112931_950742_8D1D35FD 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed, Mar 11, 2020 at 03:18:19PM +0800, Jitao Shi wrote:
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
> index 58914cf681b8..260ae75ac640 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -17,6 +17,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- pinctrl-names: Contain "default" and "sleep".

> +  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt

Drop this line.

> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	pinctrl-names = "default", "sleep";
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
