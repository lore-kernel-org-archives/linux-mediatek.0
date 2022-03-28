Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRkTwDb3CJnfdB8D+1yEczqaJM1tWxJ/TZ2RouEBsfM=; b=wU/+NZxAEzrCVs
	fCtP3HBqfg3+Paw0coz2OW7h7wmcF1KCogtv9JJqIo5N/UjOyrHZAtjx7AV4mbZIt/RsnZsSUsqKm
	yMdBBfrwamYYLZ+QqGKDgFAV1cVec3WfkzqCxm2e7J62Zf+cqs1qH/rLRjVuPi2Vykr/ygxlo72yr
	NrKR8i9JHutR5+h+XBUY+Lh3XKcZ5scTtH1tdv2+YvveIZiup9ddmPMgeRASYXrxhv5TD+2hRBtvP
	wPUUBKC0qaGorUdZ1p84o2rj1bUoGQ58GqXHmLyRIBuClc14aM2v56am6PzCOROy3rEbJhS0wa9Fi
	T/GqMKB18sJrfVGWS3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYpvJ-008yzD-Ip; Mon, 28 Mar 2022 14:00:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpuj-008ylD-0U; Mon, 28 Mar 2022 14:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476009; x=1680012009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=U8/IvxCtevfYoGYrmAhmdvhsaSlpF29tUqtt73uDLA1mNqIdn9gAh5Px
 LS3s2pIN8sFmOrO/atdnDsCnOk2QBkaCZTV5pGjo+XhXYYarAiIIzXbCI
 KuAYCgpNsw2miPHYKSwBDdywOVa9743uWj5iGnEiCOVJIgtcJbuIArtuB
 FiU0E0VJSlejFS+KsPWvPv6sxjL5m10MlkFYv8diGYs+wI7oYwi9BScOm
 b1YQukNL5OvfmlbFPT95RwnRBykJWQqZ02S/dtSs24P6pyjcRpe4glG6y
 b8YQyedffRPaJTs0VmLXut/QlvD30JS5tFylRtBCgwTcQfY5ZDcCWeQ0m A==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935295"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 28 Mar 2022 16:00:05 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 28 Mar 2022 16:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476005; x=1680012005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=WuV252Nu+GZzN74VzCmlspBKd0dca8X2+xSzsUDOC+VBkSdAcRJKkpz9
 V6ZhUvtyzJXo40EU/KoKsnsMA+udDgpFrmJjA0OOrI8Du6AE/IqQXvbD0
 l7/oi3cIclt6kdqSsBk62dD3jTXzpYH4IITmDIWCq1j5VlQdR/7ht0rkB
 UzXa+gf9sB2fMmE9Y4BJg30hxvVMBs2s+cV3pKJsYN741b+m12/z4LAVK
 Ghd0BfGmPSMkfRYy9LlDPSTztxPRWJXf02LYJ3AALa7lqL+bNoPBea5QD
 q3OLZ+wYdDSKr/JtyC5EC84xkLnc6lGkLWsLSzPCKdl/McKEhN7OLwWQj g==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935294"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 20160280065;
 Mon, 28 Mar 2022 16:00:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: (EXT) Re: [RFC PATCH 0/1] Categorize ARM dts directory
Date: Mon, 28 Mar 2022 16:00:02 +0200
Message-ID: <2100132.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_070009_483059_2BDE5E40 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Montag, 28. M=E4rz 2022, 15:21:08 CEST schrieb Jonathan Neusch=E4fer:
> * PGP Signed by an unknown key
> =

> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally
> > categorize
> > the ARM dts directory in subdirectory for each oem.
> =

> [...]
> =

> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> =

> Nice idea, thank you!
> =

> A few notes on categorization below.
> [...]
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> =

> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.

Please don't mix the names for arm and arm64. It's very confusing if the =

vendor directory is named differently for each architecture.

>[...]
> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> =

> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.

This seems to be some generic devices common for all ARMv7M CPUs used in =

Cortex-M CPUs. It's also used by some stm32 .dtsi.

Best regards,
Alexander




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
