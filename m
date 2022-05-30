Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32413C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FePkK5tUAF53XTaKHQJFYP+ynWZUCMGtdk1mZK0bA0U=; b=hNtOsBBSYF1g4J
	K3MDe9XZo0kY16Qd6li9UGAhDAS036OLRJgzOHbbcE6jQZ4nDGaOp/6XiwJC0sbPCVU3dIMUKNNqQ
	kcynhhvSfn5T8wCZ7ZnagsXbfevwFeKAErNvkWAJWCZpof9HeI8m35I5lLE24OJENzHwSqJ628xON
	upAboWFSMpTCoJyYr6rhKWNS1qg2Ahwj3svORYWN0GVeH5htrRfTQqwLNfnIGxiDnWKr+uqh7NwPy
	ayQ/wji1sK3q2p98us5LOI15K4FdrxgSdDySkTPEKbgDHKw8wpAYAnZlX7lMWP0zvMQ8sSHr6n2N9
	gukMOQWO6ZOjfaHPdMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbzd-006ApK-N1; Mon, 30 May 2022 09:47:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbzP-006AkJ-F6; Mon, 30 May 2022 09:47:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 330FE1F42772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653904023;
	bh=TscsrSniRUbTF2lS5EjYkm9gJZ0Gk4By33O4vJgUvvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=il99dXitmCOx0A/VyZZgaOg/pMyn3K9JWvwUiQJ80FitEn4Totge5VEgd5QM6PiHm
	 Ofum2lXAOT6ZkGd8iTUrvCUA8L0eYcWD+A4NF858gkt72XXcf0KeBLqKqmAohKMTgz
	 kVHoGOiLJtHCsCn1jKLT4amWAGjjrTxYSO54cl/We8FeI+ww8NEiyoe25wUsUPwQKm
	 6NZY9VVIyvwU3belzrLQZAJM+WMC+7zV5XLJx+Yg18rGaKj8NFhDy8t7q+mhwefEto
	 4MUajxomeppisUKDJkcu6uN14/o5ESv5DiKBTFWm5LRQ9WJPPZNixL60ms9FW98n5k
	 A6aOhdL1o/b7Q==
Message-ID: <e9cf5b0c-cb11-f68b-3130-4fa6243468da@collabora.com>
Date: Mon, 30 May 2022 11:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] MediaTek Helio X10 MT6795 - MT6331 PMIC Keys
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: dmitry.torokhov@gmail.com, matthias.bgg@gmail.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
 <20220526110827.GC5138@localhost>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220526110827.GC5138@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_024707_769504_9C6262CD 
X-CRM114-Status: GOOD (  21.11  )
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

Il 26/05/22 13:08, Pavel Machek ha scritto:
> Hi!
> 
>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>> I am upstreaming more components that are necessary to support platforms
>> powered by this one apart from a simple boot to serial console.
>>
>> This series performs some cleanups in mtk-pmic-keys and adds support for
>> the MT6331 PMIC's keys.
>>
>> Adding support to each driver in each subsystem is done in different
>> patch series as to avoid spamming uninteresting patches to maintainers.
>>
>> This series depends on another two series series [1], [2] named
>> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper" and
>> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration"
>>
>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> Please cc phone-devel with phone stuff...
> 
> ...and thanks for all the work. I guess we still don't have an android
> phone with basic phone functionality working on mainline...?
> 
> Best regards,
> 							Pavel


Hello Pavel,

I'm sorry, I've been sending a lot of things lately and I forgot to add
that list to the Cc on some series...

Btw, we don't have any MediaTek android phone working at all on mainline:
the one that I'm in the process of upstreaming would be the first one ever,
the hope is that doing this will encourage other developers to do the same
with other platforms.

Speaking of them all... I don't think that there's any retail smartphone
that comes with Android having any phone call ability... I'm aware of some
Qualcomm smartphones being able to use mobile data and SMS, but no calling.

Unless anything changed and unless I'm unaware of recent developments.

Aside from that, MediaTek chips should be a little simpler in this regard,
so I think that we can (and I would love to) get that working, so that
smartphones can still be smart -- phones -- on mainline as well... but I
have a hunch that this will require quite some time.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
