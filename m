Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC67EC33CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 17:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA2422464
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 17:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyKVd6au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EA2422464
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOHlrwD1SBokYw9l1pcttJtamVDQJjkAn1c2yUPQIbA=; b=hyKVd6aupgnQbX
	Ocl1kw0k+4A3pTqk3+vmeRoxpWR0Yg3cTjP67ou3ochrV/xDZ497c9MP0e15xa7JfNgQKfTIERWUz
	LNNvDkcjOwr2cXPZzXfAxqMWaJDimwOPSvNkAflwUq40UgVLWXf27z3NXVjLmB7XjDIJM2qR/mXSx
	YmzuuC053vRA6GZTAcZVe4N1usH4cpW1e4x+SQGm8Q9WAXVreNoqFHE8vGlxCPrZE4QAjekbezKRi
	zRPFWhd1Wo/eEunT9ePc/cUc+7hhJmn/Gg3cdE5kaW30/VbuGZV0zO5eG7AOz5sDmyoWwWCMu5SsJ
	7HVE3gnieGr/1Yx80iSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itaYK-0001IF-Px; Mon, 20 Jan 2020 17:09:28 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itaY4-00018e-V3; Mon, 20 Jan 2020 17:09:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78A5531B;
 Mon, 20 Jan 2020 09:09:12 -0800 (PST)
Received: from [10.1.194.52] (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FCC83F68E;
 Mon, 20 Jan 2020 09:09:10 -0800 (PST)
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
To: Mark Brown <broonie@kernel.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <7e82cac2-efbf-806b-8c2e-04dbd0482b50@arm.com>
 <20200120170343.GE6852@sirena.org.uk>
From: Steven Price <steven.price@arm.com>
Message-ID: <aed32f5e-34d9-966b-98d2-2af3d311894a@arm.com>
Date: Mon, 20 Jan 2020 17:09:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200120170343.GE6852@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_090913_041302_15B444EC 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/01/2020 17:03, Mark Brown wrote:
> On Mon, Jan 20, 2020 at 02:43:10PM +0000, Steven Price wrote:
> 
>> From discussions offline, I think I've come round to the view that
>> having a "soft PDC" in device tree isn't the right solution. Device tree
>> should be describing the hardware and that isn't actually a hardware
>> component.
> 
> You can use an implementation like that separately to it being in the
> device tree, it is perfectly possible to instantiate devices that have
> no representation at all in device tree based on other things that are
> there like board or SoC information, or as subdevices of things that are
> there.

Yes - and I may yet implement a "soft PDC" device if this turns out to
be more than a 'quirk' for a very small number of device. But like you
say - it doesn't need to be (and shouldn't be) in the actual device tree.

For now though I think the code Nicolas has written works well enough
and it's only really worth 'fixing' if we end up with too many 'quirky'
devices.

Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
