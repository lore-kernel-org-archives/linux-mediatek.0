Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF173C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 07:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC9F60F9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 07:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADC9F60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FuX8dCaVicTUZmcFirgUuWYhjX76Ey8CinDA+YjoSQ=; b=ewC+48zgYj4W9Z
	LcMNxCWzhMp4Mwrw7Hz7HIn1UK4D/naxnfea9i5/4qGrvXz3qTusi+rqwpidpkzX+N6B8IFj2MW+X
	cmMxLcHe1gtUdI7KxmYcintCGl78tL15b77Bm+6w6jk6jodPv075kP7cOmthwWgdl9HHKy7qD8DUe
	Zl9eK9j7WU0KBtWHnLU++dXF5Vb4v+xUzcE27g8JYV2xwKQvwTRPQwcjor9EWUa/0E2yKpZ9fIPNK
	09yfhjx8Xm7PRmdr0z3I/nqQ39ALcHbC91ZYYh2uT3r6yg6uDlXSlOGS4DcvyJwBGDDo5K2a5Wna1
	v4smQGJXf9kjJfx+/c/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meuNT-00Fc37-Q8; Mon, 25 Oct 2021 07:26:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meuHI-00Fa16-Ib; Mon, 25 Oct 2021 07:20:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF61660724;
 Mon, 25 Oct 2021 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635146415;
 bh=oTmkGUaMrUls5+nCfH+wzzIwXOCcij7+t4UXotfvygc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBBnUm5h4gqghZDyGBMFXofipnhDcGhosPJFd1wDxuNdR8Y3iJTNIfaycs/CXyeEk
 Pg1TjT/dDF6z6yziPGqO9eYMRx1Xh5kc35qEqRyYuFcAf4ExWCxzNb4OpkbLKLcNm/
 YtwCSwNicUdpsVC1qNrsQeqqSpX3eDl8xTFq8964WT60svGjv17G5F8epkoteciX0b
 MDM9z53DyMs+3WNInJXoi6s6gnPPCVCSK1aiEI/S/eH/G9jBfGky62ppl5JD2QDNuR
 1SsxwHagc6UmJGtIr7NVHonkZQ3/Su10jESG+wPPrb4BXYK2qNGgplVBxx+vICxTTo
 CCz4zW7iHKanw==
Date: Mon, 25 Oct 2021 12:50:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YXZaq/HYkZSNYKI3@matsya>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-7-msp@baylibre.com>
 <YXJIPu/Ax6qeft03@matsya> <20211022130636.ncqisltwsvkkc7cg@blmsp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022130636.ncqisltwsvkkc7cg@blmsp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_002016_701276_D704264C 
X-CRM114-Status: GOOD (  24.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22-10-21, 15:06, Markus Schneider-Pargmann wrote:

> > > +	dp_phy->regs = *(struct regmap **)dev->platform_data;
> > > +	if (!dp_phy->regs) {
> > > +		dev_err(dev, "No data passed, requires struct regmap**\n");
> > > +		return -EINVAL;
> > > +	}
> > 
> > is there a reason to do it this way? Why not set the IORESOURCE_MEM for
> > this device and let the driver map here?
> > 
> > NO clocks?
> 
> As briefly mentioned in the commit message, this phy is not a dedicated
> phy. It is embedded in the DisplayPort controller that is added in patch
> 7 of this series. The registerspace of the DisplayPort controller starts
> at offset 0x0, continues with 0x1000 for PHY related functions and goes
> on with encoder related and other registers at 0x2000, 0x3000 and
> 0x4000.
> 
> As this seems to me to be a single function block (also from what I read
> from the datasheet), I designed the binding documentation so that the
> DisplayPort controller starts at 0x0 and spans all registers. Based on
> that I wanted to share the regmap created in the DisplayPort controller
> with this PHY driver that is a direct child of that driver, similar to
> multi function device drivers.
> 
> That also means that the PHY does not have any clocks it requires as it
> only exists in the context of the DisplayPort controller. I could pass
> the same clocks to the PHY, but the use of these clocks does not make
> any difference.

Okay, that sounds sensible

> As I don't have a piece of devicetree, I struggled with using phy_get
> as, if I understand it correctly, it uses the devicetree to find the
> correct PHY device?

Not really, device tree is one of the backends phy_get() relies on. If
you are having issues, then chances are there are bugs somewhere or
usage is incorrect

> Do you have a suggestion on how I could improve this interaction between
> DP controller and PHY? Maybe some driver that I could look at that has
> similar constraints?

I would say use phy_get() and fix if we have any issues around it, that
should make it much cleaner to use

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
