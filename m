Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7070CC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiZtEq0TnMZ6dVYNj/YFe/ZDFlT7YjxhP5A2iXKUkoA=; b=THcrkSL7LdoJS/YC1tdbVavw24
	3YLlNzD2t4Mb2Zzp3GdzuxxPoFKK16CINlTcECFIr4NEKbvxgyx4lvIOPBqog2CKPWOWOLTpR1rwz
	yHAgFRRvw27iOkBux1TCqIfEAUmM7JF9jrVcdi/1B3wL00cRhK5NcRaRTY63NWZtoBZV2GL/BlNLH
	V543xQHuAR1s+H1/ugQBlHXtjjALS/im7pdo9VIkGNI+bat/yz45kpuw01w4qB6dT27cBTdGg0Wkk
	TYbcZozAKa7Jy507mSQmilDh/m9fhUdtvE3j3eUEPxR6t2kAXAnLgQiiY1IlhzUwmxIvkspcTtb0V
	TXDK0Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onROl-007Ehn-C6; Tue, 25 Oct 2022 21:23:47 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onROi-007Ee3-QN; Tue, 25 Oct 2022 21:23:46 +0000
Received: by mail-ot1-f51.google.com with SMTP id m5-20020a9d73c5000000b0066738ce4f12so1511047otk.12;
        Tue, 25 Oct 2022 14:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiZtEq0TnMZ6dVYNj/YFe/ZDFlT7YjxhP5A2iXKUkoA=;
        b=3KSdNi2lRGoC7BSvCYHvnthqTcc2EjCuQg5oEXN+Fxl7bwElCaNGPSBSyjhzIZgcU1
         w3P4+Y+mY7xcAy7sfYWbR8oE4Xekg0I+YduYTQECdMSIAjps+9bMkxagdGzFGQfs5SCK
         2IP7v7SH7o5Fd8LP3CR55RaTF+XWg+LKmxh0fNL9ZBOKzs/RDneYrwPmhF1Sbnwt1N39
         v0RoMlihpkhFUdyheJBHngMlTsVu/W3OV1GVgVhEyRfBKCi7dHjMLBNlCosNuhgSalv2
         5O1TZ3/zvZwZBetRORCpBHLjLV0W07Q/spThxXDtgxiS6GNltTKXa8FXnpNuOIcUyfFo
         HoYw==
X-Gm-Message-State: ACrzQf2YISk7sO1D1fFwBESpuEvCY5H23SObhyugUIPjFT5HFzsTFlvA
	SYUJfmvRvwzQGB8b/kQM4g==
X-Google-Smtp-Source: AMsMyM4bAY+2dLYm8jZ/uFm3kd9aGE6c3QFn2578otqhf/JxJGpRVle2a9mLUPqcMdF3F83SFeG3/A==
X-Received: by 2002:a9d:5907:0:b0:665:c301:2f1c with SMTP id t7-20020a9d5907000000b00665c3012f1cmr4332788oth.375.1666733014290;
        Tue, 25 Oct 2022 14:23:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d22-20020a4ad356000000b004805e9e9f3dsm1563131oos.1.2022.10.25.14.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 14:23:33 -0700 (PDT)
Received: (nullmailer pid 3336858 invoked by uid 1000);
	Tue, 25 Oct 2022 21:23:34 -0000
Date: Tue, 25 Oct 2022 16:23:34 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Eric Dumazet <edumazet@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Landen Chao <Landen.Chao@mediatek.com>, John Crispin <john@phrozen.org>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v1 net-next 7/7] dt-bindings: net: mscc,vsc7514-switch:
 utilize generic ethernet-switch.yaml
Message-ID: <20221025212334.GB3322299-robh@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-8-colin.foster@in-advantage.com>
 <166672723302.3138577.18331816371776997839.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166672723302.3138577.18331816371776997839.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_142344_873540_1AF6F2DC 
X-CRM114-Status: GOOD (  15.76  )
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

On Tue, Oct 25, 2022 at 03:05:02PM -0500, Rob Herring wrote:
> On Mon, 24 Oct 2022 22:03:55 -0700, Colin Foster wrote:
> > Several bindings for ethernet switches are available for non-dsa switches
> > by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
> > the common bindings for the VSC7514.
> > 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> > Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> > ---
> >  .../bindings/net/mscc,vsc7514-switch.yaml     | 36 +------------------
> >  1 file changed, 1 insertion(+), 35 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/net/ethernet-switch.yaml
> Documentation/devicetree/bindings/net/mscc,vsc7514-switch.example.dtb:0:0: /example-0/switch@1010000: failed to match any schema with compatible: ['mscc,vsc7514-switch']

This one you can ignore. The base tree is reset if a prior patch failed.

Rob

