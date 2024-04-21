Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B9DC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFIiPhmmgfuZ4AluO6ea6nUBX++JinIRYsCeYqnuzto=; b=4Mn/bzIbPm86WJYX1LNp9Y1jAG
	rhTuPHjUqYg3pWlOvBGt/RvtV743rTDzgXexQa2vAKxczE+q8EBsE1k2LGhlBMLK28Ptj96nIL/7c
	p77YaeQ3SdpLgW3oEgallnHOVHH6sQi0b4yujIVAIoicQDIuxwE25Z4cCsGXo0SuKtahPL2w/JnzL
	bJTmTrFP657incGtQwCgtXF0ymFTFiiht/52dSmf8DjStj0wp+dU9spFAOXum/8pA+3m+BW99ec5N
	4eI6y60E3+lJpFugXLUKdFR0vDnl9cpY6Jn4r+3JI9U0FXZZZuYjAm3iYRFPthpbF6bIawn1zuPAm
	p3mVqu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryVTW-0000000AOBf-1uV5;
	Sun, 21 Apr 2024 11:35:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryVTR-0000000AOAN-3BSV;
	Sun, 21 Apr 2024 11:35:11 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C7B9B1;
	Sun, 21 Apr 2024 13:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713699254;
	bh=gFIiPhmmgfuZ4AluO6ea6nUBX++JinIRYsCeYqnuzto=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wIjgGGHbD/wo8+GMfWbYEFlS1VzbZ8qL7/j74iL88k7Xa5gZS2YFsd9nmAXCYT1YH
	 Be4iMTmlMMCLfjTATDp9SuY0yYNOlkKU2cZVS2F2T4Nbn9OUiXF6N2VaUUb/5lIbj0
	 8mktpLkGjUEqAFELGYbHqkaF7gbZUpDxyCj7k1zM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <171361758199.1737874.11884706323295617909@ping.linuxembedded.co.uk>
References: <20240420011840.23148-1-zhi.mao@mediatek.com> <20240420011840.23148-2-zhi.mao@mediatek.com> <0cb44232-3be3-47cd-9e4c-f01f2839aff3@kernel.org> <171361758199.1737874.11884706323295617909@ping.linuxembedded.co.uk>
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Mehdi Djait <mehdi.djait@bootlin.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Date: Sun, 21 Apr 2024 12:35:00 +0100
Message-ID: <171369930090.365791.12487523856935433191@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_043510_031732_3E787BC9 
X-CRM114-Status: GOOD (  11.71  )
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

Quoting Kieran Bingham (2024-04-20 13:53:01)
> Quoting Krzysztof Kozlowski (2024-04-20 12:21:46)
> > On 20/04/2024 03:18, Zhi Mao wrote:
> > > Add YAML device tree binding for GT9768 & GT8769 VCM,
> > > and the relevant MAINTAINERS entries.
> > >=20
> > > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > > ---
> >=20
> > Sorry, there was v1. Please do not send same versions twice. BTW, use
> > patman or b4 for your submissions if versioning is tricky.
> >=20
>=20
> Whats Patman? google returns false positives for me.

Digging deeper, I've discovered patman comes from the u-boot project,
and is known as 'patch manager', and can work along side patchwork.

 - https://docs.u-boot.org/en/latest/develop/patman.html


For completeness, b4 (which I've already used myself) is more closely
associated with public inbox.

 - https://github.com/mricon/b4


> --
> Kieran
>=20
> > Best regards,
> > Krzysztof
> >

