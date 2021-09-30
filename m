Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E11FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:36:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D414360E74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D414360E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMtaGCxLPIS9Eqel13NQsQ+gkpRx6YMYVmgMRD8rOM0=; b=XpnaIOD0kWz7dytRbXhXR1mgmV
	pffB5FGt45365t/zkEYS3m1khZwFEvyHDgoRu5AlE79WobdCBIXaxDMCI8xGO1wIyiBYueYwBaZ7r
	IKlJRX936IFFLA2XpEiI2JqGROq4qE1qfyycuLWrZCIuYmQtXwTUH6Tv58ll4Yx2YquT5v83G/koz
	I02gFyPK8LwPb7yE+tVzgqFkHhjv9i6Y/peo8XxlDMo924xjj8LjCz8rXbin4ghwCrNox+JZ2ocob
	50+HqzLW01iAhvsBsU/L2TRV4SNuUdN4qQ3saajGc8jRdpOkqnVJbF1AvsyxuKTO/gZtDwt8D2DQO
	sAnhQOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVvIS-00EDOR-A4; Thu, 30 Sep 2021 12:36:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVvIF-00EDKs-Hr; Thu, 30 Sep 2021 12:36:09 +0000
Received: from [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1] (unknown
 [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 423711F44C22;
 Thu, 30 Sep 2021 13:36:04 +0100 (BST)
Subject: Re: [PATCH] Revert "spi: modify set_cs_timing parameter"
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-spi@vger.kernel.org,
 enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
References: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
 <20210930122513.GX4199@sirena.org.uk>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <28f8af42-4535-ef9f-e521-712d37e2cb72@collabora.com>
Date: Thu, 30 Sep 2021 14:36:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930122513.GX4199@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_053607_776680_6488FF4E 
X-CRM114-Status: GOOD (  30.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

hi, thanks for the fast feedback

On 30.09.21 14:25, Mark Brown wrote:
> On Thu, Sep 30, 2021 at 02:07:00PM +0200, Dafna Hirschfeld wrote:
>> This reverts commit 04e6bb0d6bb127bac929fb35edd2dd01613c9520.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
> 
>> This revert the commit 'spi: modify set_cs_timing parameter'
>> and its following commit
>> 'spi: mediatek: fix build warnning in set cs timing'.
> 
> Which is not what the commit message nor the paste of the full hash
> claimed :/

What is the paste of the full hash?
Since the second commit is only a warning fixes I thought it is cumbersome to
send two separate reverting patches. Should I?

> 
>> Those commits cause regression on mt8173 elm device. The EC either is not
>> able to register or it sends numerous amount of errors:
> 
>> cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0: Error transferring EC i2c message -71
>> cros-ec-spi spi0.0: EC failed to respond in time.
> 
> Do we have any analysis as to why?  Do these devices use timing
> parameters in some way for example, or do the values written out to the
> device change in some way?
> 
> You've provided no analysis here so it's hard to tell if this is just
> some random change that happens to change code generation slighly or if
> there's some actual reason why this might fix something.  I'll note that
> as far as I can see there are no users of this API upstream so I'm
> guessing that you've got some out of tree consumer driver which uses the
> API, it's possible that there was some error in updating that driver to
> the new interface which is causing the issue.

Actually the original commit not only change that callback 'set_cs_timing' but it also
calls 'mtk_spi_set_hw_cs_timing' directly from the function "mtk_spi_prepare_message".
So this actually influences all devices bound to this driver (in upstream)
I did some printing and it does change values that are written to registers.

Thanks,
Dafna


> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
