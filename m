Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B378C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZID5wNeWg+VcvG0R9KRG2ixap9fJXsfdXfT6Qus7owI=; b=Rx1vHzu8dcRaucL0Tq4ZGME5Wu
	29ghAW7GhDv6ldYujJD3EhWzxMisi+xJjBE0MiLkTEdUCumKEnctqc1Ae/fKyLjXVJ39AN2ZrnODA
	hSinCoQl4xklxsL/PFyaclwULn3/N6v55OaRQHtW1neH3WUF+NyYPwXGyjmPdS/yMofcitnQYfQpw
	3QoB38JoQR6TV6rYWEAm3Oz8L1UDOku/wMNutthAWIJVgAkNg/Ba4NAdvOx9GBs3zV/IQ5AAmUCqi
	T0V/uwNFlqMa7qjovIMobWHg4Th/kGL86rxkMwm5/EEaV8Cf02H8Hn61puGqSfDI7KjQLnOqL67+1
	s8i287gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCnq-00CiJe-2T;
	Thu, 07 Dec 2023 11:44:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCnn-00CiIP-0u;
	Thu, 07 Dec 2023 11:44:24 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E88C552;
	Thu,  7 Dec 2023 12:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701949419;
	bh=2eBgXKrtGTI6s0zhnBrqy98IpYIehd77KoVQgt41igA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhWgCEqHnzhTR+DYLhEtPAprd5WoybKj6DGFTp+jzSiAyNrd34fiR9laof9MTqlAA
	 tpaWNIo7lTI6Mco0ZPbVxtnxMyVMTPrqCils3w85gk2ykXKYZnB3NP+nM1F8ocPD3t
	 RDUSnB8dgiXJXhl2RnmGYCFexrPLhfZ48J6u9LJQ=
Date: Thu, 7 Dec 2023 13:44:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, 10572168@qq.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] media: i2c: Add support for GC08A3 sensor
Message-ID: <20231207114426.GA6104@pendragon.ideasonboard.com>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <c8e0ff23-9464-441d-bcaa-485a3eca0fcd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8e0ff23-9464-441d-bcaa-485a3eca0fcd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_034423_462048_2EF7F549 
X-CRM114-Status: GOOD (  26.86  )
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

On Thu, Dec 07, 2023 at 09:19:01AM +0100, Krzysztof Kozlowski wrote:
> On 07/12/2023 06:20, Zhi Mao wrote:
> > This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
> > GC08A3 8-megapixel 10-bit RAW CMOS 1/4" sensor, with an MIPI CSI-2 image data
> > interface and the I2C control bus.
> > 
> > The driver is implemented with V4L2 framework.
> >  - Async registered as a V4L2 sub-device.
> >  - As the first component of camera system including Seninf, ISP pipeline.
> >  - A media entity that provides one source pad in common.
> >  - Used in camera features on ChromeOS application.
> > 
> > Also this driver supports following features:
> >  - manual exposure and analog gain control support
> >  - vertical blanking control support
> >  - test pattern support
> >  - media controller support
> >  - runtime PM support
> >  - support resolution: 3264x2448@30fps, 1920x1080@60fps
> > 
> > Previous versions of this patch-set can be found here:
> >  v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/
> > 
> > Changes of v2 mainly address comments from Krzysztof/Rob Herring&Conor Dooley.
> > Compared to v1:
> >   - Fix some review comments  
> 
> What exactly fixed? This cannot be that vague!

Detailed changelogs are very useful for reviewers, and they should
ideally be recorded for each patch, not just in the cover letter. It's
not as difficult and time consuming as it sounds, here's how I usually
handle it when working on a patch series (the explanation is meant more
for Zhi Mao than Krzysztof :-)).

When taking review comments into account, I will take the comments one
by one, and update the code accordingly. I then compile-test the change,
and apply it as a new 'fixup' commit:

$ git commit -a --edit --fixup <id of the commit being fixed>

In the editor, I type a single line to describe the change.

The procedure is repeated for all review comments on all patches. When
I'm done, I test the final result, and then rebase the branch to
*squash* all the fixups with the original patch. git opens a text editor
with all the commit messages of the fixups being concatenated after the
commit message of the original patch. I edit that manually to format it
as a changelog, but adding

---
Changes since vX:

manually, and follow with the one-line descriptions of all the changes.

This is a fast process, it's much easier and faster to record a one-line
description of each change as I go along than trying to write a
changelog manually at the end, remembering all the changes I've made.

Krzysztof, if you plan to make a talk about tooling for Linux kernel
contributors, similar to your excellent talk at LPC about tooling for
maintainers, this is something you could include :-)

-- 
Regards,

Laurent Pinchart

