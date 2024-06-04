Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B58C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3trbLAuM3UhjXartASda56GzP24wOoUxwwKhu/uGTk=; b=0g6pq6KHqK9amGiyHR6dqvrsiV
	FLd7rpvoFdiZMqaivl515J/ASyF5w29H1qNw6jg6WDIcT00idOBHQN6fwSdoR5Cpb9Ui1V93cIOUO
	nCw90Gl27cxcmJYVTSCmTiV1tj5hWxNVDzAy0CisXhEZ+n+IK9zy4wHKT8beRqIFymEq4hIhJj0ZA
	S9d8TSf6NLmW9KIx5TCv1KqaSsq5BPA+4Ko24LzcY6R2G5nAOQzYxn68UW+JdbxxQIVgJjLD/O7Wh
	JRar9jqppjMzmdQoWiKIcMlQGKdij3GfLGU1mgXNzPGae/nENJWHPeOKBycQmrVs4t4RxavMrUUPK
	WKnSh3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESnl-00000002Cid-0HH6;
	Tue, 04 Jun 2024 11:58:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESnd-00000002ChP-3sWu;
	Tue, 04 Jun 2024 11:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717502276;
	bh=56062WNHk69vFRqNKez1ZJ1vLNNKXi2bStApeOpZP7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hIgWr2/k1iqL5wvZ12nj8yXRxSrrlg5e8poWaVTErsNd9V1SqVxaBN4bgBCT8VmB4
	 pZhLvQQxHfkjVu7Oji8axJFgpwAUPWXj+NlNJIATSxaytE4YgEzPlhhOuIMttnEqbR
	 DXt9+almqD59l7ygrhH0Aglgu7AGfCI0aJO4ZKCMTJ0xKmCTQ9Qw8GtUw9PSpnf+Jw
	 mMdVEtG8LcvUePuCQL45fOf4GZFXtKf+CSZg1Zz3OFCOs1/ISjoNokxi/Cvscnwuzx
	 nNOSTiEElWrd86s0H5RleZ070LQXtIgCsl8MDKFF2N7rMNhlqTu64EZyAYx2GsWXPK
	 BX8k84AVfCalw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F11453782199;
	Tue,  4 Jun 2024 11:57:54 +0000 (UTC)
Message-ID: <630d943e-3bf3-46ab-b3b8-cc44a86cab64@collabora.com>
Date: Tue, 4 Jun 2024 13:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lee@kernel.org, andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
 <20240602111141.0058f39e@jic23-huawei>
 <60e55919-2a8c-4d83-89a1-6e4ae156d34d@collabora.com>
 <CAHp75Vf5a8VVyOXQRt9P1QnM6GHZ3rLuvnBF63H_83QBHOTJ9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAHp75Vf5a8VVyOXQRt9P1QnM6GHZ3rLuvnBF63H_83QBHOTJ9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_045801_966614_A38ADA8D 
X-CRM114-Status: GOOD (  12.56  )
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

Il 04/06/24 12:55, Andy Shevchenko ha scritto:
> On Tue, Jun 4, 2024 at 12:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 02/06/24 12:11, Jonathan Cameron ha scritto:
>>> On Thu, 30 May 2024 11:34:08 +0200
>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
> ...
> 
>>> What are IMP channels?
>>
>> Honestly? Well, it's called like that. I don't have any clear description of that
>> and not even datasheets are unrolling the meaning of "IMP". So.. I don't know.
>>
>> What I know is what I wrote in the driver, and this is:
>> * IMP has IBAT and VBAT ADCs
>> * It needs different handling from the other ADCs, as shown.
>>
>> ...and nothing else :-(
> 
> I could speculate with confidence that this means IMPedance (since it's ADC).
> 
>  From MTK6329  datasheet:
> "The hardware also includes necessary modes to allow for simultaneous
> current and voltage measurement
> which can be utilized to estimate the battery impedance."
> And googling in vendor trees also suggests the same.
> 

That does make a lot of sense. Thanks for that, I don't have the 6329 datasheet.

Great, one more piece added to the puzzle!

Cheers,
Angelo

