Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B753C3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLzM9/030cAER8BTD3NcNMTjqO5oML/8R1yU28wqQaU=; b=RzvKhTTpwCVCUCQKxGFqAJhMsa
	/V57SkYiKcAL1u5WIRrctsvfnCFEhhMlJz8afEkmC2lvi/b9t5yZCtr3oGOJOvp7m5wUEqTkdtBes
	Z3K8tuebl3hOv85KNThCHWuGEv7Owk8fxfNOvgkPgOwLUoLn9SRq8xDrRXZQ8+6aMg8i24Glipo65
	OZRmb+4kOv9a+cTEaOYvq3vmuHb9b9SjwcVvq8kUnQ+IY0iccSQSyIa2cE3T5jPLV4b+KMgolZFIX
	sa3GMChu5Cv5k50OBpWrI4A/UbjzlmHrHdXow1x/XK1OVrsvObApHBMOo2h/olRXQUdNn4tafNzj+
	mzuWe9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNE69-0000000EIDl-2DdP;
	Fri, 28 Jun 2024 16:05:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNE5z-0000000EI7r-0ALy;
	Fri, 28 Jun 2024 16:05:08 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso1108868e87.1;
        Fri, 28 Jun 2024 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719590704; x=1720195504; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLzM9/030cAER8BTD3NcNMTjqO5oML/8R1yU28wqQaU=;
        b=DU0x+oAHN22rDpMAIuKlqsQD7d3gEucdxyquct/4V+jRA2HY/KMq83MQPp2o0d5aWS
         7niYARun8DgWcaeLCrQSLvEYk38M6BQu8FhrCer3IQVTPXDB7tStw7cGHFzMuHTHoOjQ
         cSd6acRFiDxA+0PLeQLxC4Ij24wRvV1HCO/VNHZ5f4RUNEwRS3He6b9UTw4o/nMV3mh3
         Kfm9wmSCUFr4DAb5vBEVKlOS4/G1Q4+RKFWI88qXnnCb9yca8C0UZrgtT2i9/dBUXr+M
         5rAV9a5xHsKbjo6BzXfSZ8F+T6uNBawrptq3H1ajFnYJW4HsMMAK/yR+2WlH1NfkXfXr
         QxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719590704; x=1720195504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLzM9/030cAER8BTD3NcNMTjqO5oML/8R1yU28wqQaU=;
        b=NGDkrTnuxJy8nhcYRdssc6x7FNpsea1y2Ys/2mKhSadJCS1QYFFu25Ez5XBy55XFc+
         VgMwCTXA1bwLqFoHavZoMJoiCReaxj2osNAjJqZidWRALBYj5nZ32MEWvv6UR62aT1BM
         52dgpBG17rZX8iEY1yuIuQ7/qOPVIjNXmHPrko5SAZhsE2kNl8vW4Mg5f7Gz/xoYi341
         sPIS5+Zo2ZEU2rCZQPmNSefOADzmTdZ2QSOqH7b6ZsvcgDkrklvUMWBMYIQP4/voOqlY
         MFK5vHYe9endr8DL9dyJaFmlMpvdpOMspq4IhyKCVARbz2ODWGaP0jxS2OJjBWlqZMKN
         KYQw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ucSBpVLuYJHIjDp6A0H8uENh2l7rIprqZDG7W+QhWLJ0hA4piPUoN3EiHowALxf7Iyvnq6OnIYUUoXLkDU6vqwgpitrnIyMmeBprayWAvRmp02gy5jor313laNyi6DtYejlsdKbIY9yM+TTL3Sp7cj07JE1qCGA=
X-Gm-Message-State: AOJu0YxxNQhVeWU9fFcb6iAAax81CkCsEfP/en9KTvFNPNcwQJ946AaA
	p8alhM6VwrXymy8rUAG50uCEIU9dVO7aWPqAMipKuHgqxPrZnmGF
X-Google-Smtp-Source: AGHT+IF4B20Xs61JY2WDdTljN5tsITuP6RpEAeKzP4VISYuoULX3SqB9Os9Bd+hpX4ErLC3PU0Crfg==
X-Received: by 2002:a05:6512:304b:b0:52c:ec24:e3ea with SMTP id 2adb3069b0e04-52cec24e4f4mr10337474e87.10.1719590703368;
        Fri, 28 Jun 2024 09:05:03 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b2e4sm309663e87.272.2024.06.28.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 09:05:02 -0700 (PDT)
Date: Fri, 28 Jun 2024 19:05:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
Message-ID: <v55chwj4xl7t6qfgmahtc2yi2c3zc3fqavuj2px4njv4oz3kwk@zbfo47rlaq4z>
References: <20240625215442.190557-2-robh@kernel.org>
 <gr7rgy7cptnpj2rkeufhgqkve4ytqddpts6gdekeszoq7znwf2@ivyjpaiyxruk>
 <CAL_JsqLYHbr=Wqg-S0t_hK3uDATe9KKob9chFGFnoTcyt2ttyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLYHbr=Wqg-S0t_hK3uDATe9KKob9chFGFnoTcyt2ttyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_090507_104709_ACA0B985 
X-CRM114-Status: GOOD (  23.43  )
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

On Thu, Jun 27, 2024 at 01:03:01PM -0600, Rob Herring wrote:
> On Wed, Jun 26, 2024 at 9:05 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > Hi Rob
> >
> > On Tue, Jun 25, 2024 at 03:54:41PM -0600, Rob Herring (Arm) wrote:
> > > Convention is DT schemas should define all properties at the top-level
> > > and not inside of if/then schemas. That minimizes the if/then schemas
> > > and is more future proof.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/net/mediatek,net.yaml |  28 +--
> >
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   | 167 +++++++++---------
> >
> > For Synopsys DW MACs you can just move the PBL-properties constraints to
> > the top-level schema part with no compatible-based conditional
> > validation left. It's because the DMA PBL settings are available on all the
> > DW MAC IP-cores (DW MAC, DW GMAC, DW QoS Eth, DW XGMAC, DW XLGMAC).
> > Moreover the STMMAC driver responsible for the DW MAC device handling
> > parses the pbl* properties for all IP-cores irrespective from the
> > device compatible string.
> 
> That's definitely better.

> Will still need the TSO flag part though,
> really, who cares if someone wants to set that on h/w without TSO...

Besides the TSO property description is wrong in describing the
semantics of the DT-property and MAC HW-capability. The description
says that the property enables the TSO feature "otherwise it will be
managed by MAC HW capability register." So it means that the
"snps,tso" property was supposed to be utilized for force-enabling the
TSO feature irrelevant of the MAC HW-capability register data. Instead
the STMMAC driver enables the TSO engine only if both "snps,tso"
DT-property is specified and the TSO-feature has been detected via the
MAC HW capability. 

> 
> >
> > Alternatively you can just merge in the attached patch, which BTW you
> > have already reviewed sometime ago.
> 
> Can you send that to the list since it changed from the last version.

Ok. Please find the submitted patch here:
https://lore.kernel.org/netdev/20240628154515.8783-1-fancer.lancer@gmail.com

-Serge(y)

> 
> Rob

