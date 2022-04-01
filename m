Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPzi8Z70Pg4INCfjNgQlHn2S/XAHdjCL7KUHldS/KXM=; b=Pi5K2tQ08RA5OG
	YSdc1AnU+CC9iF4t0YqyLRV1FZOlJzM0UY/O9Ks0CEPUKfNjyxGRHt+xFrS8q3ue7xkp+U2QzEmfU
	gHWNgX7cLcNQk67dch3Q6JvAGq9JfF8o/PdsCfcMIuJvIh4q1bjntT7LjqEdeSZ172ZSmQhYK4a5v
	2dtf9+2RVa6ZPe4WB1LvcWJiuKwi9pV6UabDQQhtaxcP6NML19haJApTjaAomeRVdYsmamNZhALoa
	vFGQ1Hijpe0Gu3rFZRdJ0Pd286HEVioyKk95f6Y7mC1iO1Zu0wHjbDHIcdKeiICkqopfA3CYEMGqZ
	hayIuAhebuKb2Xt6ir4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naLJj-006jqU-I7; Fri, 01 Apr 2022 17:44:11 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naLJY-006jmJ-Vr; Fri, 01 Apr 2022 17:44:02 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso2603289otp.4; 
 Fri, 01 Apr 2022 10:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9sNR2TlxgTK1TbH9xd2EATOl1wVHrrsxIUMLp6s+Vsc=;
 b=Y8Dr00SEyfI6kZP+igRJZYerjjyTQOYawNccVZGbMXYKpaOFzhVMo2TDovg8ViR1g4
 VBb5ZrVb5S1obKokYI9gkDfhUq68cyIcK+1IfqVdqkEa+fT9MGscX3sOk6JkGV1lxS7a
 YCj5Mll7BcUF93377kPziPh4inPHVjf8fzPrHIJxl7AKEPYasYNW+c7K8pF2+4lzsvo1
 NP+lwwDiIcgogUtULXWkYrs2MgJB04lvJWiwE/C5lqw0v66zsZgD8dHre2gPCJ9CRvma
 P2Fbu/Xwn18Eo4YdpeufmcXKZEgLJxEMEQ28q5vj6z5JfB0fje/mPV3YIlz7WKTVm8Gy
 mUlg==
X-Gm-Message-State: AOAM532rGP3dppIF0uptSTj2GWxhlpBRdvtgIOuXd1kidZ8spk0rOkQm
 WMtCOwqJs5NLYZMRfHE0/g==
X-Google-Smtp-Source: ABdhPJyovbTksU5nQiLA0YPpdSisoZNvCngTqQ2Hzh2Z/zGQkGPiKebnd/iY0i+yZeuu1HOu3/Qk+g==
X-Received: by 2002:a05:6830:16c3:b0:5b2:3700:654a with SMTP id
 l3-20020a05683016c300b005b23700654amr7844054otr.353.1648835038745; 
 Fri, 01 Apr 2022 10:43:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q203-20020acad9d4000000b002f8ee3f69e2sm1255081oig.52.2022.04.01.10.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:43:57 -0700 (PDT)
Received: (nullmailer pid 3302659 invoked by uid 1000);
 Fri, 01 Apr 2022 17:43:56 -0000
Date: Fri, 1 Apr 2022 12:43:56 -0500
From: Rob Herring <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>,
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <Ykc53EmCaA7TadRK@robh.at.kernel.org>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-2-axe.yang@mediatek.com>
 <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_104401_064403_3CEB362E 
X-CRM114-Status: GOOD (  19.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 01, 2022 at 11:22:13AM +0200, Ulf Hansson wrote:
> On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com> wrote:
> >
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> >
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml         | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 297ada03e3de..3872a6ce2867 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -69,12 +69,22 @@ properties:
> >        - const: ahb_cg
> >
> >    interrupts:
> > -    maxItems: 1
> > +    description:
> > +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> > +      interrupt is required and be configured as wakeup source irq.
> 
> If I understand correctly, the extended interrupt (a GPIO irq) may not
> necessarily share the same interrupt parent as the primary device
> interrupt.
> 
> Perhaps it's then better to extend this with "interrupts-extended"
> instead. See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.

'interrupts-extended' is interchangeable with 'interrupts'. For schemas, 
use 'interrupts' and the tools take care of supporting both forms.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
