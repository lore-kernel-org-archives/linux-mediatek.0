Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766CAEEB572
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLxWknSNP102FQHHCINBLPm6AWY/Q/H4b+GbZZFKnkg=; b=s7tqh+fYJtcBCP63unMx6J3RHg
	7+Yldnx79Azx8LZQFrT7iWU+/7N08kfUTJcesDx0eDf4pRy1xUkxc3NOlMxZr2jH+Y8xBlB5oZ3Js
	Em85jp/UeUKgttbiCHo0lhx149Hg/euhOmdIjgSkMVaR8MQgvipgB9widP+leklQnm4ro0L2Kllz3
	PDG3YxyzxymuKCkPGLLqe+BWLIrp/5CdTGwJheD5M/gMlvq6SP8E0gzwDgVoMtQLW5ObcTztV78Q6
	N1tRaXAgSmX6CYK0TbhONBa/UPPjbH82Mmz+IQak5NRj8SEq0ZUGJrTEg1sIla+gV5EjMVzLlZziY
	pd1nnhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf01M-00FbEf-1w;
	Sat, 09 Sep 2023 15:37:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf01I-00FbDU-24;
	Sat, 09 Sep 2023 15:37:14 +0000
Received: from pendragon.ideasonboard.com (unknown [80.194.85.162])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B40E3B1;
	Sat,  9 Sep 2023 17:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1694273731;
	bh=PUBdnMzQWjybgAphbuDj9Jlrd9yGtqWsPZzqidBnMyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ft7bIvZ0/fpYIbYc8e2rLGyX8E2XpLc8YQUhuVHSLkFrAxBrOa24VYgg8CX8KUPkj
	 D1ZwHL228SitOvlHMUJuudTxcwG3b8BoyrCFp+3Axeq8hPIo1n+cYx4JLYGnsQkQ10
	 oV99kmV1ubblBg2m3Hb0ibZg345RE+/oeSlNEJEs=
Date: Sat, 9 Sep 2023 18:37:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Message-ID: <20230909153714.GA21014@pendragon.ideasonboard.com>
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
 <20230908205222.GA320762-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908205222.GA320762-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_083712_849889_D384AF29 
X-CRM114-Status: GOOD (  22.13  )
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

On Fri, Sep 08, 2023 at 03:52:22PM -0500, Rob Herring wrote:
> On Wed, Sep 06, 2023 at 08:31:18AM +0900, Paul Elder wrote:
> > Add overlays for the Pumpkin i350 to support THP7312 cameras.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile         |  4 +
> >  .../mt8365-pumpkin-common-thp7312.dtsi        | 23 ++++++
> >  .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   | 73 +++++++++++++++++++
> >  .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   | 73 +++++++++++++++++++
> >  4 files changed, 173 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 20570bc40de8..ceaf24105001 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -56,4 +56,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> >  
> > +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi0-thp7312-imx258.dtbo
> > +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi1-thp7312-imx258.dtbo
> >  mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
> 
> This has no effect. You are assigning the same variable 3 times. It 
> needs to be every overlay applied to its base is a *-dtbs variable and 
> then those are all added to 'dtb-y'. IOW, we don't allow overlays which 
> can't be applied at build time.
> 
> Assuming the overlays aren't mutually exclusive, you could do:
> 
> mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
> mtk-mt8365-pumpkin-dtbs += mt8365-pumpkin-csi0-thp7312-imx258.dtbo
> mtk-mt8365-pumpkin-dtbs += mt8365-pumpkin-csi1-thp7312-imx258.dtbo
> 
> This works the same way as '-objs' variables to group .o files into a 
> module.
> 
> > +
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mtk-mt8365-pumpkin.dtb
> 
> Looks like mtk-mt8365-pumpkin.dtb failed to get built before. In any 
> case, that's a terrible name. What's the difference between 
> mt8365-pumpkin.dtb and mtk-mt8365-pumpkin.dtb? There's no clue.

That's a bad name indeed. The cover letter indicates that this patch
depends on currently out-of-tree DT changes, including a
work-in-progress commit that adds mt8365-pumpkin-ethernet-usb.dtbo. The
commits order makes this patch look weird.

Paul, in your v2, please indicate in the commit message of this patch
that it isn't intended to be merged yet. A "[DNI]" prefix in the subject
line will help.

-- 
Regards,

Laurent Pinchart

