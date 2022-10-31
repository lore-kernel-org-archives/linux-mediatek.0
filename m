Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A364CFA3747
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifwpmU7A0PMQ06MNBDvyGSIa8Sixxnkraic/SyG2pxo=; b=monpHkyxeicHes87gv+MLcBSzW
	NG0Vd9wAlkuDsL2zziNnZyd/Wt6u2/wMt2LumAm4rro7Yk+7Z2Qr5IxFxg38ELOKiPUYioAO5q6V0
	qYFr9s0Ay50ET0WBbKSmn8eXfdxaxhzIanDdrvasLOZXbu5XN9UCHL9HBpl3S8adupzv+yPmNdTlp
	YDatHENdqXi3/8ivgJDl01tADU2NDJaxFr4xMLAPppoMEBFCVg2rGU7l/xpX8+BjwALQtdIpSCyIs
	c0csozjznZGQ4EEIM4j3ZwSwCRwyZlU7aDGnI3Wc6lS4ajBGVM7CDbSH9aBD2lDc5A2Oh7wm2e88R
	B66kxurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWxS-00Ci6g-7T; Mon, 31 Oct 2022 15:44:14 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWxO-00Ci3q-TY; Mon, 31 Oct 2022 15:44:12 +0000
Received: by mail-ot1-f51.google.com with SMTP id k59-20020a9d19c1000000b0066c45cdfca5so2535377otk.10;
        Mon, 31 Oct 2022 08:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifwpmU7A0PMQ06MNBDvyGSIa8Sixxnkraic/SyG2pxo=;
        b=jk3oXpTV/Iy8rZ8vqBBcP7Z6AyB5R/aX1Jj3zyyXbtSjEWmkAaEg90wCFdhar6X7RW
         g88wqQ+rm6LMKeMrMyTAU5W6IYVsL/qGPiEHsT198lg1oKo5J8hkB3zlGOBxTiUckfRE
         szneAspMSWosO6P991Q2l4Y8qn5VNBET/K/1h+BUYP4bjxEC/JI2g89l1K7WIdBzzatd
         c1kFFRgIJal1u+IL3Y0Nefi6aCg5O83h6jRiSXSdcide3z1g0wOq9sf0SySFxihs7m+4
         m6IhmshNWoNZXLjy3bZzPwUVpJO/ulLWbdps5Gv6rSAULQwvkQkEfsyIgVXoswqGfIA/
         dB0Q==
X-Gm-Message-State: ACrzQf09ban6MtfpyvIco2Uvk+dEsoyeBD1tdCQVnn3Nn/Vk/pGso0I3
	8YyoQY2Cg8VeHSW9UvQrCw==
X-Google-Smtp-Source: AMsMyM4dyhQJfUihmItaQeAe7EzaxUEKtl/G0crodesYYunz1GQ0UewMwDpLQSlnR0+F3iiPt9nM5A==
X-Received: by 2002:a9d:7384:0:b0:66c:42ae:a3da with SMTP id j4-20020a9d7384000000b0066c42aea3damr5180443otk.220.1667231048700;
        Mon, 31 Oct 2022 08:44:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a056870708d00b0013c955f64dbsm3147424oae.41.2022.10.31.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 08:44:08 -0700 (PDT)
Received: (nullmailer pid 2922103 invoked by uid 1000);
	Mon, 31 Oct 2022 15:44:09 -0000
Date: Mon, 31 Oct 2022 10:44:09 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Colin Foster <colin.foster@in-advantage.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 net-next 3/7] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221031154409.GA2861119-robh@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-4-colin.foster@in-advantage.com>
 <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-4-colin.foster@in-advantage.com>
 <20221025212114.GA3322299-robh@kernel.org>
 <20221025212114.GA3322299-robh@kernel.org>
 <20221027012553.zb3zjwmw3x6kw566@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027012553.zb3zjwmw3x6kw566@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_084410_999810_6C3AD172 
X-CRM114-Status: GOOD (  31.19  )
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

On Thu, Oct 27, 2022 at 04:25:53AM +0300, Vladimir Oltean wrote:
> Hi Rob,
> 
> On Tue, Oct 25, 2022 at 04:21:14PM -0500, Rob Herring wrote:
> > On Mon, Oct 24, 2022 at 10:03:51PM -0700, Colin Foster wrote:
> > > The dsa.yaml binding contains duplicated bindings for address and size
> > > cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> > > this information, remove the reference to dsa-port.yaml and include the
> > > full reference to dsa.yaml.
> > 
> > I don't think this works without further restructuring. Essentially, 
> > 'unevaluatedProperties' on works on a single level. So every level has 
> > to define all properties at that level either directly in 
> > properties/patternProperties or within a $ref.
> > 
> > See how graph.yaml is structured and referenced for an example how this 
> > has to work.
> > 
> > > @@ -104,8 +98,6 @@ patternProperties:
> > >                SGMII on the QCA8337, it is advised to set this unless a communication
> > >                issue is observed.
> > >  
> > > -        unevaluatedProperties: false
> > > -
> > 
> > Dropping this means any undefined properties in port nodes won't be an 
> > error. Once I fix all the issues related to these missing, there will be 
> > a meta-schema checking for this (this could be one I fixed already).
> 
> I may be misreading, but here, "unevaluatedProperties: false" from dsa.yaml
> (under patternProperties: "^(ethernet-)?port@[0-9]+$":) is on the same
> level as the "unevaluatedProperties: false" that Colin is deleting.
> 
> In fact, I believe that it is precisely due to the "unevaluatedProperties: false"
> from dsa.yaml that this is causing a failure now:
> 
> net/dsa/qca8k.example.dtb: switch@10: ports:port@6: Unevaluated properties are not allowed ('qca,sgmii-rxclk-falling-edge' was unexpected)
> 
> Could you please explain why is the 'qca,sgmii-rxclk-falling-edge'
> property not evaluated from the perspective of dsa.yaml in the example?
> It's a head scratcher to me.

A schema with unevaluatedProperties can "see" into a $ref, but the 
ref'ed schema having unevaluatedProperties can't see back to the 
referring schema for properties defined there.

So if a schema is referenced by other schemas which can define their own 
additional properties, that schema cannot have 'unevaluatedProperties: 
false'. If both schemas have 'unevaluatedProperties: false', then it's 
just redundant. We may end up doing that just because it's not obvious 
when we have both or not, and no unevaluatedProperties/ 
additionalProperties at all is a bigger issue. I'm working on a 
meta-schema to check this.


> May it have something to do with the fact that Colin's addition:
> 
> $ref: "dsa.yaml#"
> 
> is not expressed as:
> 
> allOf:
>   - $ref: "dsa.yaml#"
> 
> ?

No. Either way behaves the same. We generally only use 'allOf' when 
there might be more than 1 entry. That is mostly just at the top-level.

Rob

