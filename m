Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EEAC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgN2oDAm7jnjRYWg9B2QaY9780SaXO7w1csXZxFZCmE=; b=IPtLVU8WzhiV4QE3coOTJ51Szs
	XpdK4B42VO559eZYecrPDwVJMIRnMsKbIhTAoapopkkJgCGrNdTmd4awnH6sspr8p4pqWxUL8n52e
	BjwAijMtAolGmlM8loD1j2zAlhjvf0SLqsQw263jYSrNv4V+CYULGErQr/6Uyba0jLGFauRH1uF7Y
	FN0Q3mC43N7RRJlMDUMoZj0TwSDDcMLGqGLL4yjL7pq1hcVN7B3VYDFR10DJej/WyiUcKGOT3YAgB
	fyb2HzTHS3eoFXmxXyDA4rQa7i/k3XPE4tlOYzs6JqyrvhTKLBMh42EaAKw/1Ba3yOIpV/jINCJ62
	M2vmETjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMX7x-004Fbq-3T; Mon, 30 Jan 2023 16:35:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMX6d-004FSJ-4v; Mon, 30 Jan 2023 16:34:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D06E924000D;
	Mon, 30 Jan 2023 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675096441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgN2oDAm7jnjRYWg9B2QaY9780SaXO7w1csXZxFZCmE=;
	b=EGoqFJy7VLLxtPtG+Wya2mCyjbxp+643c8y5pLlX380I8DJtrdlrDZRrZhOKRM+761zceH
	pqCkFzSy24eJMD7GH4wCInBYfUWPUVL1yRcvkL4HbQ1Hd44JKzxwf5R/siXdsFF3jcKwJr
	4tYTGnjV+gg9/tTvuc7OMeUp+zMjQezXKm6ENaO09tsoRx/s/2jmSN+mR4wR5eUz3Dy/o7
	RDB6qNlo23Uv1bclo2LPgMz6c+Obp2J9ZdC0iysLvvKA7PT2Zysvk0Pb1jQGdICjeEHRIg
	9clXkXZ1tNOnlmSNmaxUBjA9tqDMRaaxT5DmPPiQD8XdJMmAnVsutyYKp4fehQ==
Date: Mon, 30 Jan 2023 17:33:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Message-ID: <20230130173355.5e65a1c5@xps-13>
In-Reply-To: <Y9ft8BIzESLQ0TTh@sirena.org.uk>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
	<20230130171145.2c844d34@xps-13>
	<Y9ft8BIzESLQ0TTh@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_083407_342954_95D368C2 
X-CRM114-Status: GOOD (  16.61  )
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

Hi Xiangsheng,

broonie@kernel.org wrote on Mon, 30 Jan 2023 16:18:56 +0000:

> On Mon, Jan 30, 2023 at 05:11:45PM +0100, Miquel Raynal wrote:
> > xiangsheng.hou@mediatek.com wrote on Mon, 30 Jan 2023 11:06:46 +0800: =
=20
>=20
> > > This patch series add MediaTek MT7986 SPI NAND and ECC controller
> > > support, split ECC engine with rawnand controller in bindings and
> > > change to YAML schema. =20
>=20
> > I would like to pick-up patches 3, 7 and 10 and apply them in the mtd
> > tree as they look completely orthogonal with all the other (spi/DT)
> > changes, am I right? =20
>=20
> > Mark, is it okay for you? =20
>=20
> That's fine, assuming there's no dependency issues.  Xiangsheng, it's
> generally best to avoid mixing patches for multiple subsystems into a
> single series when it's not needed since it makes merging things more
> complex.

Well, kernel test robot just reported an issue with a wrong file name,
so let's split the series. I now expect a series with the spi and
relevant changes (for Mark) and another series with the three mtd
patches -fixed, of course- which I'll apply on my side.

Thanks, Miqu=C3=A8l

