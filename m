Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8295EC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtzP7I40RQyEUjKbXHB73J4wJHJ46s1Pzo+UKJfysDc=; b=Sxvwe/QXg34bYVfkiZ2dM49KQ3
	/4kLrY9EgCYFIOuVE/8EMEmNPI/kxOJ1PoyWBia7FO80cEreI73qt6RzIDuCESRtnzw6LA6Km6Q2D
	5Upcuurz5zvsdcE5QWWuAPTojcPbQkAWETDPT+h3u/cZxjKyZkCIfaR5YK6O40YmHukgA5cjySlCL
	hNI2/RET6iTZib/JnPRFLXCgJS3V9YjiX+oaV0CYUEpUHKT8vQx53nMIIe4eqKMVY4KmjXuXcRh5+
	nHHQyuroo/c2BsSAMeRampkWJH32M57OnFkN669A1qglqNW1oCyj6/cUmfga5+OeN/3zmsKsrAjQZ
	gC0yjang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBKHP-00Db0N-Mv; Tue, 12 Jul 2022 18:06:39 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBKHN-00DazQ-04; Tue, 12 Jul 2022 18:06:38 +0000
Received: by mail-il1-f176.google.com with SMTP id p13so5351997ilq.0;
        Tue, 12 Jul 2022 11:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YtzP7I40RQyEUjKbXHB73J4wJHJ46s1Pzo+UKJfysDc=;
        b=qrPQiVC+CnSRdGrZFCAaOyHgeOPwrqwFVfNRQtqMAI5+yTptz2Rt+v4aTuQCPjJUvp
         D4eOwsbikPD/e6nM8wY7sTtfwlMjeJgP5hzz00IITmNDzDlqweNEodg62lpVDxS65weo
         xECd3vNxWVu1IgQ1fym0EWFu/BY9rVlxbQnYS+fDsYJrKPUz3nwPlhSKuayP7o29bvf7
         clWkxdfy5e28i2Cof0EbMDnwHLDkoHDZsabfaoRQmdTo9Iv1nPFA25JwJXHzWwFXQXAn
         REym8TaUjju7Z8WJiWOhUHze2H6A8rItm6OpQ9lnlBkOUgF9y2OItaintHg8kOZ85ltF
         wzaA==
X-Gm-Message-State: AJIora87HoXJ+G0qVMp96cx08nH+wbW/9LpNfyFHJBgljIX8Wj4rQVYb
	iPYrf5rjUGY66z9Q6LD7dA==
X-Google-Smtp-Source: AGRyM1uQj9XqR1H/j1xEWpea/Q+tQa2PKHOSbgCLwSEg/z123utZodWxiVGVv4vw8BKVxtlj/J0DYg==
X-Received: by 2002:a05:6e02:154d:b0:2dc:6324:e1be with SMTP id j13-20020a056e02154d00b002dc6324e1bemr11287953ilu.47.1657649195773;
        Tue, 12 Jul 2022 11:06:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id cq7-20020a056638478700b0033f21999e6csm4389983jab.90.2022.07.12.11.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 11:06:35 -0700 (PDT)
Received: (nullmailer pid 2112717 invoked by uid 1000);
	Tue, 12 Jul 2022 18:06:32 -0000
Date: Tue, 12 Jul 2022 12:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie, msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, liangxu.xu@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v13 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220712180632.GH1823936-robh@kernel.org>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-2-rex-bc.chen@mediatek.com>
 <20220701202914.GA1457156-robh@kernel.org>
 <d8b6f7d9b79608c9a533042f714869219ad067be.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8b6f7d9b79608c9a533042f714869219ad067be.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_110637_053838_EAC8C663 
X-CRM114-Status: GOOD (  21.88  )
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

On Tue, Jul 05, 2022 at 05:40:27PM +0800, Rex-BC Chen wrote:
> On Fri, 2022-07-01 at 14:29 -0600, Rob Herring wrote:
> > On Fri, Jul 01, 2022 at 02:27:59PM +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This controller is present on several mediatek hardware. Currently
> > > mt8195 and mt8395 have this controller without a functional
> > > difference,
> > > so only one compatible field is added.
> > > 
> > > The controller can have two forms, as a normal display port and as
> > > an
> > > embedded display port.
> > 
> > I'm sure you answered this before, but I'll keep asking until the 
> > information is contained within this patch. Otherwise, I won't
> > remember. 
> > Is there a h/w difference in the 2 blocks? Different registers? Why 
> > can't you just look at what the output is connected to?
> > 
> 
> Hello Rob,
> 
> Thanks for your review.
> Yes, it's two different hw for edp and dp and they have different
> registers base address.

Multiple instances *always* have different base addresses. That's not a 
difference.

I probably asked before on what the difference is between edp and dp 
variants if anything? If the blocks have some difference then, different 
compatibles makes sense. But you need to explain the difference or I'll 
just be asking again...

Rob

