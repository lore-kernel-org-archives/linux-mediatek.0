Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF47C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9qRE0eLqMtz9rnfDFKuf3rnw9cbt+HdSl7w2HOjV+w=; b=JzU5MeH0OklyMVzCuAHqrXv1Nq
	oi4SUBNJYLBVcFnmXbKGRshF/e+rwmrlOt6bWwtvvUrVe0jAjL58sAyrpceE3izGBiW0cB2MbOJvX
	SQhg8ynK8XPVdNEWIX/TEfXw+w7tVe0MIfYqNoirthmJfTBrVrrVA1L32pRNVqjMSecgoM9r2Jok/
	hUDoPHchJ48onYN/+MfF9uy/yuFsisK3F6VR+jENMKkJvJwPYCEPaSQ/ljAILFx9u8W4zWiX0vLyM
	0DLW62txkAax9ck1oId0DDoy7XJ2OLnS90QdrF8ogE1I53qytaepZfVyBDpdfpFjwtxHULgOPvFMZ
	7jc5+Mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ1D-00000002XFU-2jNa;
	Mon, 27 Jul 2026 10:57:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ1B-00000002XEZ-2AQD;
	Mon, 27 Jul 2026 10:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785149825;
	bh=jQQ4etZmqiYuEsbm4/OMVb1AlonMQGwUbaT1/gx2CSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=deJNRFHpubJ3qKa4IjLG3bGKg52YdaXIC8Kl4L14FKOSOVSO3EfKTZEkKbDn7FCaF
	 hdpkfqLaI9+WDSpFLdTgfcmD5KTnPWxdz9WE+ppmY1ODOLP96ndh9jN+CH/8KlQq8o
	 JyAc+m2k/JblZnwgPHF8r/TFcNqcbTeThA2wP2SyMpiVlqJR3hJbi/N/dY33Du2AuX
	 rKJZ8HjVXuE9PlzJp1+0r1U2LhinBK9rOHv7asuUzHldDjx1dUmPxqASnIGkg5lPfg
	 Bdr4F1D8nq97uhtvfhhT5EAm85Iaywb9ocq/GpyDR+GiuofzsmRT4xfR/9aiErHvew
	 S4lfu/VbIwlZQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E18917E015B;
	Mon, 27 Jul 2026 12:57:05 +0200 (CEST)
Message-ID: <dd1e30ae-46fd-4083-a306-98e2d23be120@collabora.com>
Date: Mon, 27 Jul 2026 12:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Brady Norander <brady.norander@mainlining.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <fe909054-5c9d-42f5-bbc1-66ca0ace72de@mainlining.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fe909054-5c9d-42f5-bbc1-66ca0ace72de@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_035709_740324_CE311549 
X-CRM114-Status: GOOD (  17.22  )
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

On 7/25/26 07:11, Brady Norander wrote:
> On 7/22/26 09:27, Dmitry Osipenko wrote:
>> Depending on firmware, part of the MFG domains may be left ON at boot
>> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
>> region when the display controller is brought up. This doesn't play well
>> with an eventual delay in probing Panfrost when the display controller is
>> fully set up, as that would make genpd's sync_state() to power off the
>> domain while ACP tries to prefetch: this is causing an AXI stall,
>> effectively freezing the AP indefinitely. In order to prevent this from
>> happening, the sync_state() functionality must be obliterated on all of
>> the MFG domains: while this guarantees a power leakage if the bootloader
>> boots the kernel with MFG PDs partially powered on, this is the only way
>> to ensure stable operation of the SoC during boot on devices with such
>> firmware because, of course, those will never officially receive a
>> firmware update.
>>
>> Fixes Kappa Chromebook hanging during system boot.
> 
> I also saw this same issue on my MT8192 Hayato Chromebook, and I also saw an issue 
> on my MT8183 and MT8186 Chromebooks where the audio was broken. I fixed all of 
> those issues by setting the GENPD_FLAG_NO_STAY_ON flag on all domains. I held off 
> from submitting that change as I was unsure if it was the "correct" way to handle 
> it, but perhaps it is. Either way, this issue is not specific to only MT8183.

Audio is something a bit different I believe.

For MFG on MT8183 specifically (and potentially same generation or even slightly
older) there's an issue that is very specific and described in the description
of this commit.

So, specifically for audio, I think that there may be something else that is
wrong if you're seeing such a behavior - as in, some dependencies may be missing
from somewhere (some devicetree node), or something else.

In any case, I'm always open for discussion, of course.

