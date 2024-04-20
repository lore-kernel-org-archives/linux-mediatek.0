Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1404C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii39j1e9CG5HbIb6F+SPiZe/5HlLbwinhvOgR6qmVww=; b=GhHQ+Pmy4Gqi3eGugj2lrGa0gl
	hdFkdK77HnQwXaw8/QwmksPQ6qFA2LDfPXVStNJyvylOR8JjHvIZtFczVoIcoGFubNNHWw3lX//8G
	Wz3ACToBxvrAcbso6630jSZAzRK4YD+9foouwzOpeDcTOu5KT5H1dU07Rmxr798FbsNO5yp8b6/+a
	ZEzaQtv+e5H1NhYtZamxVV/AS6028jQaaiLbthN19C81RbJBkUQsdSKQEpTxhVjrvipd5sYddHl2A
	f8Ku5QXXt/GqAlMDDY87lqutHWxhG7h7X5j2bpT1ujqWbu5Nvt1EPye+lW5k2/1SpuX85ljHizyj+
	iboLV45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryADR-00000008VLr-3ukr;
	Sat, 20 Apr 2024 12:53:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryADN-00000008VKq-3DcK;
	Sat, 20 Apr 2024 12:53:11 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACA63ABB;
	Sat, 20 Apr 2024 14:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713617535;
	bh=Ii39j1e9CG5HbIb6F+SPiZe/5HlLbwinhvOgR6qmVww=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jiTvJmkNYYq6gv/kT6jD5Mw23YOnJlyQ8PZChjvvyQDNKk/lxi7YlR4hR0gy/0uNL
	 wjaAOnlyt1t7esvN22C8otstTvVVubj1sSnzj1ZLZDays3vogkfwlH1F5f/SPXNBv/
	 //T6d3KdNDV1Q8sXEMl0o5snwJZLna3Yk/bbF7Zg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0cb44232-3be3-47cd-9e4c-f01f2839aff3@kernel.org>
References: <20240420011840.23148-1-zhi.mao@mediatek.com> <20240420011840.23148-2-zhi.mao@mediatek.com> <0cb44232-3be3-47cd-9e4c-f01f2839aff3@kernel.org>
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Mehdi Djait <mehdi.djait@bootlin.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Date: Sat, 20 Apr 2024 13:53:01 +0100
Message-ID: <171361758199.1737874.11884706323295617909@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_055309_971046_3E97D51C 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Quoting Krzysztof Kozlowski (2024-04-20 12:21:46)
> On 20/04/2024 03:18, Zhi Mao wrote:
> > Add YAML device tree binding for GT9768 & GT8769 VCM,
> > and the relevant MAINTAINERS entries.
> >=20
> > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > ---
>=20
> Sorry, there was v1. Please do not send same versions twice. BTW, use
> patman or b4 for your submissions if versioning is tricky.
>=20

Whats Patman? google returns false positives for me.
--
Kieran

> Best regards,
> Krzysztof
>

