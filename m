Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D04EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hPn0vqDK5F4Kupt89UUmDtLQIxvFCQKDf5jwCD/rVE=; b=NO8Sw3rnWxry1RRFGTD8UZ9ajH
	bA2eSAoAyM4bJl2Bp7ghg1KLmYEdPxwsOLPHBk/6sAhVZf4hfyTHZeHvA7NWu6o+s+mkykQ6cZ5lK
	yYsWM7MtXvejoiRXDoblagPs84dA9yy6ZBzTuts+/8D37YzRUm2E5q0t3VvscMAya/pC1U2gCMaQq
	J/8QyJnnCP20MaRHmyjNrxb0EgM2QKuqcvqVLMZHsZWSzm3ayfbW/2uWp+9rnQl/1Qk+4iiGSwXqN
	ZnEMBi5OZVAD89Od4uQHQjI074CUJYGW2QzZ3jKC94ok7Ysjw+9hvsACUxbOXc90vXoiR+yydr64m
	Pu2VJOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsRL-00ETxo-1m;
	Fri, 21 Jul 2023 15:53:11 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsRH-00ETwq-2Z;
	Fri, 21 Jul 2023 15:53:09 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 23F203200990;
	Fri, 21 Jul 2023 11:53:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Jul 2023 11:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689954784; x=1690041184; bh=9h
	Pn0vqDK5F4Kupt89UUmDtLQIxvFCQKDf5jwCD/rVE=; b=YMTYZo67fySHWULO6E
	Ynw7vXR6QCHo3+LO1PXJmKQY3h3qEKR13mS1vI4jsW4yMLYZeLbQGOLXvavWpj/v
	BT44AHcfYxke0EeNWldO3HHGdVnU+FiBq6YnIpLKpr6B/IFxafXKtmX7mqKrnfy5
	bFa2jcPjAltL8ugcQlMCAf1XVcvKMDdQedMdgSlfG1uqwKMUmLt1UA0WSLTKGn/i
	nRji/7rpZ7SPplPbtPjPGP8tAmFVHRN2c3oFX/f1V8865xnXUa1sBzgBd8+7dlzU
	vlp29bqlKC5FVTUeowk3uR73JjVmMMXPnckfJCcTujtx2QXFJE07p+oPjFoah1lb
	86vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689954784; x=1690041184; bh=9hPn0vqDK5F4K
	upt89UUmDtLQIxvFCQKDf5jwCD/rVE=; b=oneOUSr63ErkU897PPGwDKKr7BkXX
	U02UoooSEW86a8ho9bKWMp8x6aej4JeA9IbiSCk6KdZgU+z8bsfyF83yONYxJOmQ
	LDb6nNOuP5COmmiXDi89AQgmBgq8WJqgWKslJmPyuZ9hgq3/IFnRoIuNbObRMrqK
	8/CFDzrO+OiiLbO3mYCzWIt7/ZeIWUck7Vc7ePH50vfPo4hkXqTiLQlLyJJXZXj4
	hFC09ws2BTQZGDSbIGjLfcD882P6wEQca1KeLh/+GDA8dOzIOt736oqPYoylu/tk
	e0FEQ1oS76OUIHYBg1FwZBBgCc5MYCEK2XsOi3EWX8W2srf+9JkcvFYgw==
X-ME-Sender: <xms:4Km6ZHXs-n0p5vtx3LYYV46v2wziywExcvKQMer1UX-4aJzrdVOm8w>
    <xme:4Km6ZPnnGc5OE6ifbURb-Qjgg1K2a6-lSE7_yqNDPe-MddenFJ5yQTTfKaj2_SI4E
    d0y_03nC4uVjGdWqEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedvgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4Km6ZDbTXcZcyk3HkWJ0bnGNfl3rLTPRyTxhQyjGi2XLg9YpODiRRA>
    <xmx:4Km6ZCXeYJDe8OiWHBPe6RLLtqBuMCUITy5DqjszswbzYqzAvEPF4Q>
    <xmx:4Km6ZBmYM51PEEVjm4ygjGiKxPyx41FAJCswgaGzmYINtCMyZmyH4w>
    <xmx:4Km6ZBFFQvac8VbqUFDUjWPGzGrvw84n-K5lEArQY0-7E8WV4eFKKg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 440A2B6008D; Fri, 21 Jul 2023 11:53:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <4f8ce95e-99ac-40e0-9827-292ef0f67906@app.fastmail.com>
In-Reply-To: <ZLqg5g5cmx8gX9E1@orome>
References: <20230714174438.4054854-1-robh@kernel.org>
 <ZLqg5g5cmx8gX9E1@orome>
Date: Fri, 21 Jul 2023 17:52:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Olof Johansson" <olof@lixom.net>
Cc: "Sudeep Holla" <sudeep.holla@arm.com>,
 "Cristian Marussi" <cristian.marussi@arm.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Jon Hunter" <jonathanh@nvidia.com>,
 "Michal Simek" <michal.simek@amd.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: Explicitly include correct DT includes
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_085307_863950_9B8D321B 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Jul 21, 2023, at 17:14, Thierry Reding wrote:
> On Fri, Jul 14, 2023 at 11:44:37AM -0600, Rob Herring wrote:
>> The DT of_device.h and of_platform.h date back to the separate
>> of_platform_bus_type before it as merged into the regular platform bus.
>> As part of that merge prepping Arm DT support 13 years ago, they
>> "temporarily" include each other. They also include platform_device.h
>> and of.h. As a result, there's a pretty much random mix of those include
>> files used throughout the tree. In order to detangle these headers and
>> replace the implicit includes with struct declarations, users need to
>> explicitly include the correct includes.
>> 
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  drivers/firmware/arm_scmi/driver.c | 4 ++--
>>  drivers/firmware/imx/imx-dsp.c     | 1 -
>>  drivers/firmware/imx/imx-scu-irq.c | 1 +
>>  drivers/firmware/imx/imx-scu.c     | 1 +
>>  drivers/firmware/mtk-adsp-ipc.c    | 1 -
>>  drivers/firmware/raspberrypi.c     | 1 +
>>  drivers/firmware/scpi_pm_domain.c  | 3 ++-
>>  drivers/firmware/stratix10-rsu.c   | 1 -
>>  drivers/firmware/tegra/bpmp.c      | 3 +--
>>  drivers/firmware/xilinx/zynqmp.c   | 1 +
>>  10 files changed, 9 insertions(+), 8 deletions(-)
>
> Not sure about the other maintainers, but I usually pick up
> firmware/tegra patches up through the Tegra tree and then they
> ultimately go through ARM SoC.
>
> Arnd, Olof, does it make sense for you guys to pick this up directly?

Sure, I was going to suggest the same thing.

Rob, can you send the patch to soc@kernel.org assuming nobody
has objections? Feel free to send this together with the bits
for drivers/soc, drivers/bus, arch/arm/mach-*/ and anything else
that usually gets merged this way.

     Arnd

