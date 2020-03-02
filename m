Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7CCC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 18:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A259620873
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 18:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="un9xZhsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A259620873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZ5/j7b1EJmvXqOvHuL7tIZ7WlyqhlArNwcptDxh6EU=; b=un9xZhsdKo3lO1
	KFLrAbjBI0GQG45LUV+IcHbapdLJiqCc6SqMu4N0j4Q/JtYGNR+zdWn6OEc8XDa/PjjCK4CTmniv3
	xfGU+tlRozeVwU9bAfHFIH1nojsoQb7WQnXS7WJUjiRSjv6k4o0aQM3vleByZT4phmXh31xi1wDLJ
	hg3hvYg8zyCPrNS5S/FCpvxHb/SRYUpXGjo4O1U1otPTzcKwAtQXQysnEmC1G8Hy/mXoGViXB+Yo1
	03J4BC9zP4EIMw8xs4KtcUcBgp4cvK1eUHeJLoBLkrVx/XgCY9ihuGNUmukMoQ1b/3Q/k5A4Z+YBk
	JafzeelTbq+AWdrwxuvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8qDH-00072z-Bo; Mon, 02 Mar 2020 18:54:47 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8qCu-0006n8-UH; Mon, 02 Mar 2020 18:54:36 +0000
Received: by mail-oi1-f193.google.com with SMTP id r16so295207oie.6;
 Mon, 02 Mar 2020 10:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=azLo3QGLGJyP5HRfRWmkTZHyFOBCcHiq0HFCES3HCjQ=;
 b=lA5L1UeFYu3vHuOJVUjCPNQZuGW8XWsGu9Dqrt7ieX9jfC9g71utO8wy2eBDY3DJD/
 PR2q8qgPthCB7y1KeeAAA5l+Oi7AJmCYxo17zxafJdBi+2sXQIs1RZ9CSAauXvCcSKbU
 FZAyPgEJ796g2CBvKKuh3MQ0zm7IvjyjGc2h6CnA4U1x2z6NnBbfEA9h18xZEaPgN0mW
 FR4U6Eg0bQJz+0YTBEx6gco/Z5cdRWE6aHU6eslWTTfbNPpSzJgy3Z52SuItUL66zpXO
 PuSUVLhRObDZq0++Nch4aMWrZUY28ScvF1tleELpUlsrgHWnSrjwhVv78dsTY/I47WFf
 tkkw==
X-Gm-Message-State: ANhLgQ3Eps9f7SlFm1iyoyoF+LRolAoVKG8sm5TDCq/iEKFJiBtSWK1s
 YupIlNKfKUgvQ9smAMuxxg==
X-Google-Smtp-Source: ADFU+vvfubqUlzmH5eWYI1D5Jft/lIpMtECPbLNGVBuawGuLFLFxvD3bdyL1NoKnop7MocC44hue/Q==
X-Received: by 2002:a54:4011:: with SMTP id x17mr1020oie.35.1583175263204;
 Mon, 02 Mar 2020 10:54:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u3sm6838355ote.50.2020.03.02.10.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:54:22 -0800 (PST)
Received: (nullmailer pid 32444 invoked by uid 1000);
 Mon, 02 Mar 2020 18:54:21 -0000
Date: Mon, 2 Mar 2020 12:54:21 -0600
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V3, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Message-ID: <20200302185421.GA31928@bogus>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228155958.20657-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_105425_366813_081E8F31 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 28 Feb 2020 23:59:57 +0800, Dongchun Zhu wrote:
> This patch is to add the Devicetree binding documentation and
> MAINTAINERS entry for dw9768 actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 55 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dts:19.13-26: Warning (reg_format): /example-0/camera-lens@0c:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

See https://patchwork.ozlabs.org/patch/1246607
Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
