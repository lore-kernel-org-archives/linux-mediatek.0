Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1098FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 19:00:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63C4206C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 19:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UB8oAJXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D63C4206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=is12dLP4BjMTcd/AHBBSjv3GIQQ3U58DXU29pjw7zrM=; b=UB8oAJXodko380pIBfkeDTw8b
	8RNLsqMLpd50EYwQLXI6ukoi1AdfN2l1r6oHjG4vpi64LxEKdWeEFubSm11BoTtjGkkJZv/kl56D9
	6stKmkrQ1LOHjJLLGD2G8JkKpJIZLO8VJQ76LbBSzVnu1/bWuyWdr39Bdl/j37dKtaVSg1Ya4DsJZ
	PCamPurkptL/ZfyzAOS94U6IqvNKURLd8dSZpWmfrTpBgGRfB2ClijgiD9yPHEIRVQN0A44tQe89g
	AVVDYnjHNv+wYvEWeArlzPJZoerorXfr/ktARIubR+3FnrBE/QpnAzQmdLTpSE5QcyKE7TsJ1D1rF
	5OsvJz2Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joAd2-0008Ft-MU; Wed, 24 Jun 2020 19:00:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joAcv-0008Cg-EW; Wed, 24 Jun 2020 19:00:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3121F1;
 Wed, 24 Jun 2020 12:00:04 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470C13F71E;
 Wed, 24 Jun 2020 11:59:59 -0700 (PDT)
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl> <20200622133940.GL338481@lunn.ch>
 <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
 <20200624094302.GA5472@sirena.org.uk>
 <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
 <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
 <20200624165016.GA1551@shell.armlinux.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0c78a4ab-5aae-a45c-babd-e860c6cfc3c8@arm.com>
Date: Wed, 24 Jun 2020 19:59:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624165016.GA1551@shell.armlinux.org.uk>
Content-Language: en-GB
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Salil Mehta <salil.mehta@huawei.com>, netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-06-24 17:50, Russell King - ARM Linux admin wrote:
> On Wed, Jun 24, 2020 at 09:06:28AM -0700, Florian Fainelli wrote:
>> On 6/24/2020 6:48 AM, Bartosz Golaszewski wrote:
>>> I didn't expect to open such a can of worms...
>>>
>>> This has evolved into several new concepts being proposed vs my
>>> use-case which is relatively simple. The former will probably take
>>> several months of development, reviews and discussions and it will
>>> block supporting the phy supply on pumpkin boards upstream. I would
>>> prefer not to redo what other MAC drivers do (phy-supply property on
>>> the MAC node, controlling it from the MAC driver itself) if we've
>>> already established it's wrong.
>>
>> You are not new to Linux development, so none of this should come as a
>> surprise to you. Your proposed solution has clearly short comings and is
>> a hack, especially around the PHY_ID_NONE business to get a phy_device
>> only then to have the real PHY device ID. You should also now that "I
>> need it now because my product deliverable depends on it" has never been
>> received as a valid argument to coerce people into accepting a solution
>> for which there are at review time known deficiencies to the proposed
>> approach.
> 
> It /is/ a generic issue.  The same problem exists for AMBA Primecell
> devices, and that code has an internal deferred device list that it
> manages.  See drivers/amba/bus.c, amba_deferred_retry_func(),
> amba_device_try_add(), and amba_device_add().
> 
> As we see more devices gain this property, it needs to be addressed
> in a generic way, rather than coming up with multiple bus specific
> implementations.
> 
> Maybe struct bus_type needs a method to do the preparation to add
> a device (such as reading IDs etc), which is called by device_add().
> If that method returns -EPROBE_DEFER, the device gets added to a
> deferred list, which gets retried when drivers are successfully
> probed.  Possible maybe?

FWIW that would be ideal for solving an ordering a problem we have in 
the IOMMU subsystem too (which we currently sort-of-handle by deferring 
driver probe from dma_configure(), but it really needs to be done 
earlier and not depend on drivers being present at all).

Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
