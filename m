Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A1FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR9yh+MGJc6yJjmKhl5V2S44arNolkzCvV+lLhhUe64=; b=JBMsNyIUjErE/7Ew90JiEWdBu8
	hrnc+q0QCNnd7bpXh0s3sj9g+5dCgUHEELpX7Q2f0kAngxXWhrvLFjF1WDsE2jACTrAz/4oJEeU2S
	uXEP2o6QEGWrIdRYrIPWSgTSeaovNTJKrSyYfM+sbHzgxLvV7AvbJ4Kqt4h0BF8QW55Lg2e+h7yzI
	Vn261YHhNwRMreb2+x2Z7NoqcGe/a1xwQJEt6bKKzHgsI1qxn2ttcdBut7KwMoAbkDcyInKCi/sr6
	/UFyf27avaQgBvfANFOD6REEf29V+ZojbkrNNpXUykB8LmMp7RuwuRETIFIfennPd8M8BSoSyLOsE
	PtAKEeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onreo-00BUaG-1t; Thu, 27 Oct 2022 01:26:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onrei-00BUZW-1i; Thu, 27 Oct 2022 01:26:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id n12so390987eja.11;
        Wed, 26 Oct 2022 18:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iR9yh+MGJc6yJjmKhl5V2S44arNolkzCvV+lLhhUe64=;
        b=Ak9cFoMVeWMSUIAGFSQkCJHFveAgowrzclOz8E4R2ovNZinoB7cMxtzP7UJ/FS1MhZ
         aIQokrDMuaFVyObAva5a9obdhGVc0TwHF/sqmrLQoYKqsWBtpU7iUc2XlX4U44VIx3Fl
         x4lm958gv/LZXmUtpDAvwe0Xa9ywn99PinYj+U49u2/uv07NVu8IdUgBKvZ4+2iiRaS3
         51j7VannowB5ZDLKDDlSh9Ip7bZdQh4pmCNSJgbMbOb17pBnjE+VQD/wO5vTADdy40DG
         99idyhZFj3/rxP/5K4LaE0m+b3wJsquLcBbqrMspfJKC+TzxL+q2Jm9yzSWNvgyyMeOD
         cJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR9yh+MGJc6yJjmKhl5V2S44arNolkzCvV+lLhhUe64=;
        b=UnFg1pZIBkXgFhyhx3+ao57n5qaIjahjHhYbhqg63dO/nGEvTiyvLRxTOf6pfA/cRZ
         GxMF/IuEaJcqZ2UnCHWZUGZaECBlfADyLnsfvf0aoMVGG/Kn6sSo+X2B3zb+/wRB6DZA
         Yxqx8QUgE0qJ5SZoRwGaogO/5aqEHncDHWyZetJOB9izMprqlwszCd5p6hkbTFy2xsEP
         UGja7B+PRNxECk5bdVagg0TMWfX+cMp6v6OrSboKZYINMjxr/tuawKSLj1UofgtHO3l8
         5WYLlpmzXFNGzIWM0i5+QG3TrSEPbDEY4smBxzdtB1qZ6g05YcDukLip2cCvhmONbWK2
         5AXA==
X-Gm-Message-State: ACrzQf1cq8rQLh/XiPWcHGqA3R0T/XQlwjhSsCwmO6G7rIJAuA4njTrD
	6N9xjsNeEihgBreyhRmPf+c=
X-Google-Smtp-Source: AMsMyM6jmu231VAY0bBmdx9jmWK53PBwcm6TKFHHTLvhIiaAps0fm87Ok/ITHE9SN204+ArviR9/DA==
X-Received: by 2002:a17:907:744:b0:741:36b9:d2cc with SMTP id xc4-20020a170907074400b0074136b9d2ccmr38493473ejb.613.1666833956870;
        Wed, 26 Oct 2022 18:25:56 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id q19-20020a170906389300b00773f3ccd989sm10022ejd.68.2022.10.26.18.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 18:25:56 -0700 (PDT)
Date: Thu, 27 Oct 2022 04:25:53 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 net-next 3/7] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221027012553.zb3zjwmw3x6kw566@skbuf>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-4-colin.foster@in-advantage.com>
 <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-4-colin.foster@in-advantage.com>
 <20221025212114.GA3322299-robh@kernel.org>
 <20221025212114.GA3322299-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025212114.GA3322299-robh@kernel.org>
 <20221025212114.GA3322299-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_182600_180492_5355A4C5 
X-CRM114-Status: GOOD (  24.23  )
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

Hi Rob,

On Tue, Oct 25, 2022 at 04:21:14PM -0500, Rob Herring wrote:
> On Mon, Oct 24, 2022 at 10:03:51PM -0700, Colin Foster wrote:
> > The dsa.yaml binding contains duplicated bindings for address and size
> > cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> > this information, remove the reference to dsa-port.yaml and include the
> > full reference to dsa.yaml.
> 
> I don't think this works without further restructuring. Essentially, 
> 'unevaluatedProperties' on works on a single level. So every level has 
> to define all properties at that level either directly in 
> properties/patternProperties or within a $ref.
> 
> See how graph.yaml is structured and referenced for an example how this 
> has to work.
> 
> > @@ -104,8 +98,6 @@ patternProperties:
> >                SGMII on the QCA8337, it is advised to set this unless a communication
> >                issue is observed.
> >  
> > -        unevaluatedProperties: false
> > -
> 
> Dropping this means any undefined properties in port nodes won't be an 
> error. Once I fix all the issues related to these missing, there will be 
> a meta-schema checking for this (this could be one I fixed already).

I may be misreading, but here, "unevaluatedProperties: false" from dsa.yaml
(under patternProperties: "^(ethernet-)?port@[0-9]+$":) is on the same
level as the "unevaluatedProperties: false" that Colin is deleting.

In fact, I believe that it is precisely due to the "unevaluatedProperties: false"
from dsa.yaml that this is causing a failure now:

net/dsa/qca8k.example.dtb: switch@10: ports:port@6: Unevaluated properties are not allowed ('qca,sgmii-rxclk-falling-edge' was unexpected)

Could you please explain why is the 'qca,sgmii-rxclk-falling-edge'
property not evaluated from the perspective of dsa.yaml in the example?
It's a head scratcher to me.

May it have something to do with the fact that Colin's addition:

$ref: "dsa.yaml#"

is not expressed as:

allOf:
  - $ref: "dsa.yaml#"

?

If yes, can you explain exactly what is the difference with respect to
unevaluatedProperties?

> >  oneOf:
> >    - required:
> >        - ports
> > @@ -116,7 +108,7 @@ required:
> >    - compatible
> >    - reg
> >  
> > -additionalProperties: true
> 
> This should certainly be changed though. We should only have 'true' for 
> incomplete collections of properties. IOW, for common bindings.
> 
> > +unevaluatedProperties: false

