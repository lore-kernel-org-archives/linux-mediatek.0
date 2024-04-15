Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84380C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QT2rlaahzqm7vNQNaFLJAUYU4XEoW3pOzUkCnWZxcc=; b=JsaNImkqjzVOda4AxLoLSDtlP5
	L/Xm8ZgGaZd/y4N/oxKyhfA1Jw+9C1mQAs0RTGGvRdhRIlbPrsZIirPrjLeUdGjJl3MnX31OTBt00
	tVZ/0y40lFc8oaAmeCmUcrDVxritFAQNnpvUZofgxm9ivDi6M9cKbZpDRWqTa5sSeMCwsRUwWrX0T
	sn8VKIBmlQrEfyjSiCVJGmlqueEEWaU4cjlaeE678sOwRPJ1n+LlnXhO8bAgph4ADotmyZlxtv57w
	sa7Xu4jOZ5lkeztmw+uwgjGKuA6wn3lhyX5GsbwU/Cda9Z2VKpIkgMx2iXsxCmzop9qcnEglxD2Jp
	OtCPltpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHpS-00000007Yun-3MYL;
	Mon, 15 Apr 2024 08:36:42 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHpF-00000007Yo4-2WEI;
	Mon, 15 Apr 2024 08:36:35 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHoa-0004hj-00; Mon, 15 Apr 2024 10:35:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F2EC9C0248; Mon, 15 Apr 2024 10:32:46 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:32:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Justin Swartz <justin.swartz@risingedge.co.za>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Message-ID: <ZhzmLroS9sPGjeBb@alpha.franken.de>
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <6e8d08e4-5b26-4705-b636-0fc4412a7457@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e8d08e4-5b26-4705-b636-0fc4412a7457@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_013630_003447_901C6FAC 
X-CRM114-Status: GOOD (  16.30  )
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

On Mon, Apr 08, 2024 at 10:35:07AM +0300, Arınç ÜNAL wrote:
> On 16.03.2024 07:54, Justin Swartz wrote:
> > This set of patches was created with the intention of cleaning up
> > arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
> > the Devicetree Sources (DTS) Coding Style [1] [2] guide.
> > 
> > [1] Documentation/devicetree/bindings/dts-coding-style.rst
> > 
> > [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> > 
> > Justin Swartz (14):
> >    mips: dts: ralink: mt7621: reorder cpu node attributes
> >    mips: dts: ralink: mt7621: reorder cpuintc node attributes
> >    mips: dts: ralink: mt7621: reorder mmc regulator attributes
> >    mips: dts: ralink: mt7621: reorder sysc node attributes
> >    mips: dts: ralink: mt7621: reorder gpio node attributes
> >    mips: dts: ralink: mt7621: reorder i2c node attributes
> >    mips: dts: ralink: mt7621: reorder spi0 node attributes
> >    mips: dts: ralink: mt7621: move pinctrl and sort its children
> >    mips: dts: ralink: mt7621: reorder mmc node attributes
> >    mips: dts: ralink: mt7621: reorder gic node attributes
> >    mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
> >    mips: dts: ralink: mt7621: reorder pcie node attributes and children
> >    mips: dts: ralink: mt7621: reorder pci?_phy attributes
> >    mips: dts: ralink: mt7621: reorder the attributes of the root node
> > 
> >   arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
> >   1 file changed, 239 insertions(+), 191 deletions(-)
> 
> Thomas, will you apply this patch series as is or should we squash it to
> one patch?

I've applied them, no need to squash.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

