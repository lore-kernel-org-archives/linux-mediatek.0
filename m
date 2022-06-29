Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11924C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJAe93dM+XcVdoqFF8JSM6OP3hWl2NtLLw1K6Ebw/K0=; b=nfrakFE/Jzjnakt8nTs+bZKwi8
	sNjM37VUoxtwwgB5t/130Ud9sL1SMWAtIc8rccVCOx8UiG0fLbnakYXnAqx7jHcucdZhhp1+kh6hb
	f+cd9kQ0xI1pgorYOa/3+W9wNeyd8z9pDXRgEfpQ6gzJcQk5i+xz9Vcow7ttw4UF/4ZN6UziwUYNk
	HYZL5fU8CsESHbx+/NpDqj6li5u2jgMnJ6Hr4M+10MVd6CEBS5UWmrqscbutdzMSnmeuCygkcaaG5
	qmrQMU3KJ9mvKnpQUMUKRS0GLTNZ5PGKli7LYVwhzSNFySA+s3BnaNAOdm4inlzvqFrpq2zm32g5Z
	uNjpRlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bS9-00DBph-QE; Wed, 29 Jun 2022 17:26:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bS7-00DBoZ-3E
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 17:26:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80A7EB821D1;
	Wed, 29 Jun 2022 17:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A25C34114;
	Wed, 29 Jun 2022 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523568;
	bh=bKTdzuoJYJi8iUDK8FYlg/CfAY2KxQzHuONLRYR5ryc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UIfXmBOXktNxmwj8pWEraq/TIgnYHR9+Ol6MEvCu7LBjHOoPe8esHCyzzc28axvz6
	 Z2GXxBk3euuOJ8HnHlmA583jarEWeWAGdya6PcqQsdcZ7UgPIb9gJv8KAaQ4b2awZi
	 aPxriO35n0tgWgzfO4ugABLk1wp7dYYqVDHyEZBap4C2diD1H/4Y/xbyVdwiHE1BoK
	 ikL6wEXcMOhBy6dZQqHCgUA74OBMAmt5iZ229an8gNQYUYNKjDLAFJNXnpNJBowpyo
	 w6doemrccCyDwwdzPYW5JQnwG7ucaJ4rsrd9cHuJd5vdVcLtZehuFm7Suh4zcL1mbV
	 X4iL0OgU7fccA==
From: Kalle Valo <kvalo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com,  nbd@nbd.name,  lorenzo.bianconi@redhat.com,  Soul.Huang@mediatek.com,  YN.Chen@mediatek.com,  Leon.Yen@mediatek.com,  Eric-SY.Chang@mediatek.com,  Deren.Wu@mediatek.com,  km.lin@mediatek.com,  jenhao.yang@mediatek.com,  robin.chiu@mediatek.com,  Eddie.Chen@mediatek.com,  ch.yeh@mediatek.com,  posh.sun@mediatek.com,  ted.huang@mediatek.com,  Stella.Chang@mediatek.com,  Tom.Chou@mediatek.com,  steve.lee@mediatek.com,  jsiuda@google.com,  frankgor@google.com,  kuabhs@google.com,  druth@google.com,  abhishekpandit@google.com,  shawnku@google.com,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: reduce log severity levels for informative messages
References: <753f19393f169ad4a5fc127f68e16074f1617306.1655944385.git.objelf@gmail.com>
	<b2769038-798c-fe93-478b-8d5bbd97b29f@collabora.com>
Date: Wed, 29 Jun 2022 20:26:01 +0300
In-Reply-To: <b2769038-798c-fe93-478b-8d5bbd97b29f@collabora.com>
	(AngeloGioacchino Del Regno's message of "Thu, 23 Jun 2022 10:48:07
	+0200")
Message-ID: <871qv7peja.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_102611_326488_529DA3F3 
X-CRM114-Status: GOOD (  15.46  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
writes:

> Il 23/06/22 02:35, sean.wang@mediatek.com ha scritto:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Use dev_info instead for the informative messages.
>>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> index eb1bfb682e02..2ce3a833176e 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> @@ -740,7 +740,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
>>   	struct mt76_connac_pm *pm = &dev->pm;
>>   	int i;
>>   -	dev_err(dev->mt76.dev, "chip reset\n");
>> +	dev_info(dev->mt76.dev, "chip reset\n");
>
> Since this function is normally expected to be called and this message is
> describing the wanted flow and/or this worker function starting, I'd say
> that this is not a really important information anyway...
>
> What about changing that one to a dev_dbg() instead?

Yeah, that would be better.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

