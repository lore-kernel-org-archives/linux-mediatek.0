Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DB3C433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 10:12:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216E821582
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 10:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhOfjR5N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVb/p5Pq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216E821582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tX/P86c6Q9T5i7skAcB53nGHDkoACOYNtP3UIGTv7Ps=; b=uhOfjR5NsoVTU3wKOeNV/jFO6
	R5orzcZGIFLL0IDGnnrlWJ+9FKOw1P+54KxipP42FrSwPftjVAmldUx9f882GUyt+FsoiJ7VlJKGc
	5HXJ+5TZMnEL2yqRZTtKzfTPJY6AKzi7MgEHzZJv7rlFjx4aSLlY1SjSctidCN/QeFDQmUQsHLdj+
	ykGSbb/CzxtjWCqjzyeYj/n7E7gE3QRxhLeYvozzLVjmKQ/AUugnorkds3Xwo0dHeFubbwywd8llK
	Tl9Gv3FmsRQdq46/lkz595tyX9MREVZ0tKhdyUqP8ZVH4vF+U/WAQDuk0q8vI/Q7SHTvGvALkm0gC
	09YpOgnhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kU5fb-0000Nt-Ip; Sun, 18 Oct 2020 10:12:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kU5fX-0000Me-Sh; Sun, 18 Oct 2020 10:12:04 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 728CA21655;
 Sun, 18 Oct 2020 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603015922;
 bh=gLbxEEWfSmwUSe05MiWq3mo7ZfbPoHNGLJwjOIXi0Ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mVb/p5PqtX1Ur4SDhPiSyPIfiP5qm7JC7p8dBJXufoqiLtKpDI6F5vvvuHUtpUIOb
 PjlBq1bmDfmhOzM6t5Pqmh91ljdhQOrO0y555RN2Ssv4QrvgkY/vqDKiIc1E78cZV4
 BoAzIafQAYoZn2EfHXVZMsya+e5wZoJL7pGXp+zk=
Date: Sun, 18 Oct 2020 11:11:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
Message-ID: <20201018111157.490962a9@archlinux>
In-Reply-To: <5ac4afb0-3950-3b11-1f5c-01bbf74e64a4@gmail.com>
References: <20201012205218.3010868-1-fparent@baylibre.com>
 <5ac4afb0-3950-3b11-1f5c-01bbf74e64a4@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_061204_066634_A155CDB7 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 08:00:25 +0200
Matthias Brugger <matthias.bgg@gmail.com> wrote:

> On 12/10/2020 22:52, Fabien Parent wrote:
> > Add documentation for the auxadc binding for MT8516 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>  
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to poke at it (or do nothing given it's
a txt file ;)

Jonathan

> 
> > ---
> >   Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > index 78c06e05c8e5..1b7ff9e5615a 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> > @@ -17,6 +17,7 @@ Required properties:
> >       - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
> >       - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
> >       - "mediatek,mt8183-auxadc", "mediatek,mt8173-auxadc": For MT8183 family of SoCs
> > +    - "mediatek,mt8516-auxadc", "mediatek,mt8173-auxadc": For MT8516 family of SoCs
> >     - reg: Address range of the AUXADC unit.
> >     - clocks: Should contain a clock specifier for each entry in clock-names
> >     - clock-names: Should contain "main".
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
