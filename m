Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6330AC25B50
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFxG+3+AuEwK9dzCd11bJRVbzf/YkEZyr1PAY32IkjE=; b=dGH+u1MUV/CW7tdH9SLwB+qfiH
	bR9Tzhg1ZyGC6lyp5jW5tZPJ7gZ5fcg7ZtlDYBdfPYgxSAD14QuJebQdTUwNfOSayY7OEputZGq9F
	3xA83s4/uVLTY9qmR4zALJ7ruNjpzidgVm/YIQ4BN4LQMImfgr/E0GWgP2KWvCG/vQ3IEdVFllt0A
	doyd8rQBXPCWD37SeCHFaCqI4VjMFBikl19ELCqSRcEWJvdueYl+NCWWvuzFsZQioCJZuikGI+k6b
	n3jd3Fj4e/cMSozXxnffUqMDJhpklYy7jZGOr0vQGaryL5W4Bz77OIj0Qo0/f2DBsZnNpSg4lwkgV
	46N6FWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuJl-00Gshr-2a; Mon, 23 Jan 2023 10:44:49 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuJa-00Gsfn-MH; Mon, 23 Jan 2023 10:44:40 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9E6F641;
	Mon, 23 Jan 2023 11:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674470670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DFxG+3+AuEwK9dzCd11bJRVbzf/YkEZyr1PAY32IkjE=;
	b=VdV5rc8IrJMFjBa6mto/mGtQoXEGtCUqj8STBbOoayWmrEWIXIX88kYqpel7XFP2/KZel/
	36ppyAyqN1vpFgVr6YlGgYvLtfh2CpDJrOEkQFva0MEUflK4LsbL014Btz1/LN4I22+jvl
	l3Bkzz2K0VLMFH+8mBXQsLAW9uYsyOePaVgjB+zHj4Xcle7Dlf9gNTqpHgKeAU9GBHBAhL
	nKQFX61FWp9SiyEpdF7Ol8W8WqyZOdg9/R+rcpxDeVVqPp2E53pYMvrq74N9ulW1nkVcmi
	KDdXDCulaWhYCGpaesZFCzQkWH0BBiBPO0NREK33biEnVUjNCwZ6R3PrCIEUwg==
MIME-Version: 1.0
Date: Mon, 23 Jan 2023 11:44:30 +0100
From: Michael Walle <michael@walle.cc>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
In-Reply-To: <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <20230120082054.610626-1-michael@walle.cc>
 <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2aa2ff64cfd3b5ccd1342873fffa6cb4@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_024439_144649_03EB7D4F 
X-CRM114-Status: GOOD (  12.21  )
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

Hi,

Am 2023-01-23 10:37, schrieb Alexandre Mergnat:
> Le ven. 20 janv. 2023 à 09:20, Michael Walle <michael@walle.cc> a écrit 
> :
>> 
>> From: Alexandre Mergnat <amergnat@baylibre.com>
>> 
>> > Add the "mediatek,genio" compatible string to support Mediatek
>> > SPI controller on the genio boards.
>> 
>> What is the use case of having the spidev? What if I want to
>> connect a device with a linux driver to it? It seems like you
>> just want to expose the SPI bus on the pin header. There was a
>> similar discussion for a mikrobus connector [1].
>> 
> Yes I want to expose the SPI on the pin header for two reasons:

Then "mediatek,genio" doesn't really describe the hardware, does it?
If you read that linked thread, NXP was also trying exposing the SPI
bus on a pin header. IMHO this is just misusing the userspace spi-dev.

That being said, exposing something on a pinheader (or on a standardized
connector) seems like a common thing and we should be working towards
a good solution. I still think Robs proposal for the mikrobus connector
makes also sense for your case.

-michael

