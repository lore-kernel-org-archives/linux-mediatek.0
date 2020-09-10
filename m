Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE46C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 19:13:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100BD20BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 19:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwxnNQqq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yl4BPTxd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100BD20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSAxs6O9IO30qJ+y/mT9DC3PP3h/aJYPlji2jiw2JP4=; b=AwxnNQqqozLvM8OGoL6EpyxoE
	7mC/DboKIH6rsAV+4Qsv/PQEqOw+PwhUjoVGB/gt/pCMAq9cm3kzt07ukkawsn57CPXWyhOC2Pcn5
	JJ7Jf5Ua3D+CURR5gmK9az51eS4PMw8TTRu8dvxz5rVmkPZL1HRutPgO3uy/vsLUoPKSHc0uupXdO
	oId8c1ktN2r16/6qcns7uQJdCAfVY+Q4TrUaMQhia8SPtCsueYaP9ZH7OgeQ/p+C/V7oB6yAGUvrv
	1//vi5bi1zm3wkPs8t44omis3m3xyEG9NtUIi0Ckim2vdbANaYN9KC8/DSbqL4Iw6R5ehvNXj4h/C
	11fTy2xZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGS0o-0002zc-SY; Thu, 10 Sep 2020 19:13:39 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGS0Z-0002uQ-Bf; Thu, 10 Sep 2020 19:13:24 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AJD8rM024418;
 Thu, 10 Sep 2020 14:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599765188;
 bh=wVHpXIuoo9L0dFhVi0aJ08O8whODuj4HNYWrOX4NFVw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yl4BPTxdastirBjKVIUEbYlKhJVs+eC45YfSESLfNSGpRaj5H77Wldw4r+pESKZsA
 GdjSwevWbvMm9fEk+EOkbjovsCE08XrltrwJ+zugtJRJRX9XUlJZ7oALrK6tDZdhKW
 ZKzX5baYKc4I7S2SLccZUq0PnF4UKdn5S7ybT5/k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08AJD8s5064725
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Sep 2020 14:13:08 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 14:13:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 14:13:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AJD5v2030041;
 Thu, 10 Sep 2020 14:13:07 -0500
Date: Thu, 10 Sep 2020 14:13:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200910191305.phjtijx2fhkhqavu@akan>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_151323_855227_6C91D5CD 
X-CRM114-Status: GOOD (  18.93  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20:53-20200910, Krzysztof Kozlowski wrote:
> On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> >
> > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > [...]
> > > +  wakeup-source:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> >
> > I wonder if "hog" is too generic and might clash with "something-hog" in
> > the future?
> 
> This pattern is already used in
> Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> match only children and so far it did not find any other nodes in ARM
> and ARM64 dts. I don't expect clashes. Also the question is then - if
> one adds a child of GPIO expander named "foobar-hog" and it is not a
> GPIO hog, then what is it?

Probably a nitpick.. but then,.. I have'nt seen us depend on hierarchy
for uniqueness of naming.. we choose for example "bus" no matter where
in the hierarchy it falls in, as long it is a bus.. etc.. same argument
holds good for properties as well.. "gpio-hog;" is kinda redundant if
you think of it for a compatible that is already gpio ;)..

I did'nt mean to de-rail the discussion, but was curious what the DT
maintainers think..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
