Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:08:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F24556126A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F24556126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDHS5APhd/S/+IoYUvky7KaEG3xEjLxRu4OhjGV5aiE=; b=JM0mS+zWXLkzcbPSeVGHIAx3e7
	xr+EKsREGr45XNYDtjNxsxz0hLHBXVQdZ5tb30JiiSEp/WkTftyupl5pWYwV+sj7jjKgGMr1BHOEV
	j4PnQ4N345pwgLK/H5Aok5WQNM1df0RyuhGh5SQbV3pOmtkBqtjtMr6llLtVHdbBCYKcf8zY+BLbE
	pqY0IAllQkLKdDa7b0Cw0EDaIE24wBISaPtmjxXynozhm4HTGkWMMK3/wlJTgRp4AVNsYLjJwHzr+
	xfwHqoIoVWDopurEVi2D/h7ZGvRWZwnvo13WpL4mTtC6WnURxyi4vho7W54mxS6bOUmMz2BOAlfgK
	gK2ru8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVvnC-00EMWx-Fq; Thu, 30 Sep 2021 13:08:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVvm4-00EMA7-W7; Thu, 30 Sep 2021 13:06:58 +0000
Received: from [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1] (unknown
 [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86ABE1F44D13;
 Thu, 30 Sep 2021 14:06:54 +0100 (BST)
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
 <28f8af42-4535-ef9f-e521-712d37e2cb72@collabora.com>
 <20210930124630.GY4199@sirena.org.uk>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <bce800ff-9b3e-500b-6a42-9a60d3a0c590@collabora.com>
Date: Thu, 30 Sep 2021 15:06:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930124630.GY4199@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_060657_244462_87FABEE0 
X-CRM114-Status: GOOD (  36.31  )
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



On 30.09.21 14:46, Mark Brown wrote:
> On Thu, Sep 30, 2021 at 02:36:01PM +0200, Dafna Hirschfeld wrote:
>> hi, thanks for the fast feedback
>>
>> On 30.09.21 14:25, Mark Brown wrote:
>>> On Thu, Sep 30, 2021 at 02:07:00PM +0200, Dafna Hirschfeld wrote:
>>>> This reverts commit 04e6bb0d6bb127bac929fb35edd2dd01613c9520.
> 
>>> Which is not what the commit message nor the paste of the full hash
>>> claimed :/
> 
>> What is the paste of the full hash?
> 
> The above.
> 
>> Since the second commit is only a warning fixes I thought it is cumbersome to
>> send two separate reverting patches. Should I?
> 
> No, you should write a proper commit log with (like I said) a normal
> subject line - basically, follow the process in submitting-patches.rst.
> 
>>> Do we have any analysis as to why?  Do these devices use timing
>>> parameters in some way for example, or do the values written out to the
>>> device change in some way?
> 
>>> You've provided no analysis here so it's hard to tell if this is just
>>> some random change that happens to change code generation slighly or if
>>> there's some actual reason why this might fix something.  I'll note that
>>> as far as I can see there are no users of this API upstream so I'm
>>> guessing that you've got some out of tree consumer driver which uses the
>>> API, it's possible that there was some error in updating that driver to
>>> the new interface which is causing the issue.
> 
>> Actually the original commit not only change that callback 'set_cs_timing' but it also
>> calls 'mtk_spi_set_hw_cs_timing' directly from the function "mtk_spi_prepare_message".
>> So this actually influences all devices bound to this driver (in upstream)
>> I did some printing and it does change values that are written to registers.
> 
> OK, so that's something that should have been in the commit log,
> preferrably in a more detailed form that identifies what the change is.
> However changing the values written out is clearly not the intent of the
> patch and it is a substantially better API so can we not just fix things
> so that the old values are written out?  Why are we jumping straight to
> a revert here?

It could be that the values written to the register in the new version of "mtk_spi_set_hw_cs_timing" are the same
as with the previous version. I didn't check that. The difference is that before that patch
the function was not called so it was a dead code. Now it is called and causes erros.
Without the datasheet it is hard to know how to fix it. I responded to that patch two days ago explaining
that but Mason Zhang didn't respond yet.

Thanks,
Dafna

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
