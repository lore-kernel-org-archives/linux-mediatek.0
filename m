Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6241AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2829A61212
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2829A61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sb/cuoGMIiXoiPz3FKXGTQ65EOCnkRuNlp5m6WTLM8=; b=df71Xs3Cf9o6wo
	4thmDlBLFVjJpMWFxEJERUqUBYptXKk0KeJid0kftm9EaUQCz04XlV8oxxhc/zANBiTIWfQ7chZ21
	ZKN0Ho/Uwg2rBGiE0LXSu34Y1EZOpUOE4C64akkf0edUGSknGVZv4fiDkJVS/OiN2jCITlY77DvgX
	EViZUmzlszZhV64+lO9HaIzLPIgoNJdFKFWiq+sDIqPbPQHfkzUwpiX9vK4kiI8R8OkH9Oe9EO0sc
	ukqhr2/4QLWnBO4emvOWu3O3I6Nvl+MI4R/xW3kFiYVAiRqB7PjVbbi9HNfYDVJxxTyvrqokt73Me
	+U0ljYf6OE4ju0FVDWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcQ8x-00F69Q-Fx; Mon, 18 Oct 2021 10:45:23 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPgg-00EwxT-Ry; Mon, 18 Oct 2021 10:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iosnmQOJWI7XWNeYhYR243+qqN8R1RCG0Hp7iVJ4bxg=; b=gf2eLeWZLk2w6Vi2AU54sQvFrX
 injMvWZyhfNraHIvhffFnRRdadeqE37Xj62GGt9/Izgpf3dB5/q/mBr51WUuTMBCKsgdlZizPMsT6
 yT4yNeT+JOFR377JuEUf8Z/dw7Q7e74JzYaP1D/Mr30DrH9//0C+RF9X69ZpGqZ+1bX4=;
Received: from p4ff1322b.dip0.t-ipconnect.de ([79.241.50.43] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mcPgX-0004ZM-2s; Mon, 18 Oct 2021 12:16:01 +0200
Message-ID: <569d434d-cf5b-6ab0-5931-41b21ab047b7@nbd.name>
Date: Mon, 18 Oct 2021 12:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>, Nick Hainke <vincent@systemli.org>
Cc: lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <87czoe61kh.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_031611_167219_A99FB567 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 2021-10-09 10:32, Kalle Valo wrote:
> Nick Hainke <vincent@systemli.org> writes:
> 
>> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
> 
> The fixes tag should be in the end, before Signed-off-by tags. But I can
> fix that during commit.
> 
>> commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
>> and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
>> meshpoint support.
>>
>> Both used in the "get_omac_idx"-function:
>>
>> 	if (~mask & BIT(HW_BSSID_0))
>> 		return HW_BSSID_0;
>>
>> With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
>> ibss and meshpoint mode should "prefer hw bssid slot 1-3". However,
>> with that change the ibss or meshpoint mode will not send any beacon on
>> the mt7622 wifi anymore. Devices were still able to exchange data but
>> only if a bssid already existed. Two mt7622 devices will never be able
>> to communicate.
>>
>> This commits reverts the preferation of slot 1-3 for ibss and
>> meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.
>>
>> Tested on Banana Pi R64.
>>
>> Signed-off-by: Nick Hainke <vincent@systemli.org>
> 
> Felix, can I take this to wireless-drivers? Ack?
Acked-by: Felix Fietkau <nbd@nbd.name>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
