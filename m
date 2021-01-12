Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4076EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 09:59:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C762064C
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 09:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C762064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FLTaXMrUTtb/51ik5KKzUluDzEi425caIN7DzD5d8g4=; b=CMG4ihQtCzzFQ8/fsKFZZaD5C
	7xdPcLcoOp3SqHj2RdCnvbGx+zTfzrJnNKWgC7Br2Z06RpWibmNhx5GPCZZqZ9Y1BUlXt63b6m73i
	adLXFkuTKDTsKTG28IBDrnGKPj/etoVgvVJkra1vg2QlGlXJiZ5UyBQu+y7owcwqmcGTyaz0EPHax
	kX8jGF5BdO8pbSkI6kYJSiI1NRVzc2zxlqBB06JYDj5xLzbCKxmaAQ+Xr/M5wfl0/xDrQOnmeVI2o
	MJocQxC56hu/IkhRq6n8Dc3jcy5h1pL1l5clot0rl6Tm8yOlWtykOYZoTPv54XR+0pxvYCzDxOFFr
	IxV8C4buA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzGSR-0001xy-8e; Tue, 12 Jan 2021 09:59:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzGO8-00081C-6r; Tue, 12 Jan 2021 09:55:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 695F4225AC;
 Tue, 12 Jan 2021 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610445294;
 bh=dLHHGgqFtP2uYlc3nf/+6zFYdSZckeor1gxlC8d7+Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WP0xcDMahQfhRGfx/Bx1c+9YNeQMFKo/yoF2P8ReATf8uspiVer2xQ20rN6FQZwN3
 O5KweDgEz07AaPsRO6c7rVKrEOQvbf4bbeo0lE+FaFvXDWTkmK38bl4pBe7HYR1pfL
 IKy6lgt9YeEAzw1tFLZz7sFYd0X+u9H7K0FlHo9S2dhK76Z2n4QemdXdqNG3GKh6B7
 KYwKeMeM0UN16CPDKBkIz/u9KV1u0Szjb4ux8kbUxxnu0dhpQQ4CnFYv0qBidd+JXO
 f9SAELuFk9G66M1fmWxD/w5HrQ6dcz5/iQwdVPb2lV01aP0miP7BzH7S9+ZhMMIRLd
 qbOGP3/Q41Y0g==
Date: Tue, 12 Jan 2021 10:54:47 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] regulator: mt6360: Add OF match table
Message-ID: <X/1x56kY+21B9fvR@ziggy.stardust>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <20210111164118.GE4728@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111164118.GE4728@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_045456_631812_D52876A0 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 04:41:18PM +0000, Mark Brown wrote:
> On Sat, Jan 09, 2021 at 12:26:09PM +0100, matthias.bgg@kernel.org wrote:
> > From: Matthias Brugger <mbrugger@suse.com>
> > 
> > Binding documentation mentions that a compatible is required for the
> > MT6360 device node, but the driver doesn't provide a OF match table.
> 
> The binding should be fixed to remove the requirement for a compatible
> here, this is both redundant since we already know we have a mt6380 from
> the core MFD and encoding details of how Linux implements things into
> the DT bindings.

Ok, I'll leave that to the driver author to fix this.
Just be aware that there is series for the MFD part which adds
OF_MFD_CELL for the regulator.

Regards,
Matthias

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
