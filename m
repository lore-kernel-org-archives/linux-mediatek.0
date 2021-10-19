Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E33C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 07:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8313760F8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 07:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8313760F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr6o3If3uLARGAtiqM/Okh2laap4VG5vmXyheIZZPQc=; b=Pht1VzRrVDJl2z
	z9ghmWmah2MjJPXRrIWja1r8T9oEMplidlLTieElZzQ+ysY6ES5u7o27LbrEToR9lOn+gJ06Nw/4R
	KfArYCw3YAVEHtCYW734AZlRaRhilQtJ0FrXfO8kqPDRaZVisNIwDZXazrOJojtihijCQQZfWz832
	i63wsOdCQO4HcCmQ9bEpFc80nejso9vjIMqmSatPCjL8HXdpZUNXV1hVPxGc5epimCpqzRHY1bDUM
	D5qJljDCuF8bm/cCr1lMeEj6EW0RzptCGvTvotzhltH5lOnLwjIILNqg5HfgZr+l9sRdFso2eZclZ
	CR0DFWCXEP/KA1zD1nPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcjPa-000Nyt-Si; Tue, 19 Oct 2021 07:19:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcjPY-000NyZ-2O
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 07:19:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634627987; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=uMYO89HCqmvjMOPfezlrMm2RtJkAxmAYfrETwCAbYcI=;
 b=T4XSc148H3b5ZFwcxJXO7TfG8n6I24DnAOLdbbsrbQPXsfmu0dKf8UhVRfNfyFhFfDeaLKuQ
 nyiF6svypKZeHWEb8gKBjezWmhwacW/7ojQcv/8raQEh1kzluUvxqAJFoel7KeEZx1IlAt9z
 rItMmHjKIeak6kCrL+ducb9cX1I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 616e719267f107c611cbbb22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 07:19:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D3B0C4360C; Tue, 19 Oct 2021 07:19:46 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 302F4C4338F;
 Tue, 19 Oct 2021 07:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 302F4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Nick Hainke <vincent@systemli.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
In-Reply-To: <569d434d-cf5b-6ab0-5931-41b21ab047b7@nbd.name> (Felix Fietkau's
 message of "Mon, 18 Oct 2021 12:16:00 +0200")
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <569d434d-cf5b-6ab0-5931-41b21ab047b7@nbd.name>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 19 Oct 2021 10:19:35 +0300
Message-ID: <87bl3lqy60.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_001948_204862_9BE4DE26 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Felix Fietkau <nbd@nbd.name> writes:

> On 2021-10-09 10:32, Kalle Valo wrote:
>> Nick Hainke <vincent@systemli.org> writes:
>>
>>> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
>>
>> The fixes tag should be in the end, before Signed-off-by tags. But I can
>> fix that during commit.
>>
>>> commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
>>> and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
>>> meshpoint support.
>>>
>>> Both used in the "get_omac_idx"-function:
>>>
>>> 	if (~mask & BIT(HW_BSSID_0))
>>> 		return HW_BSSID_0;
>>>
>>> With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
>>> ibss and meshpoint mode should "prefer hw bssid slot 1-3". However,
>>> with that change the ibss or meshpoint mode will not send any beacon on
>>> the mt7622 wifi anymore. Devices were still able to exchange data but
>>> only if a bssid already existed. Two mt7622 devices will never be able
>>> to communicate.
>>>
>>> This commits reverts the preferation of slot 1-3 for ibss and
>>> meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.
>>>
>>> Tested on Banana Pi R64.
>>>
>>> Signed-off-by: Nick Hainke <vincent@systemli.org>
>>
>> Felix, can I take this to wireless-drivers? Ack?
>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Thanks. We are in -rc6 now and I'm not planning to send any more fixes
to v5.15 (unless very critical), so I'll take this to
wireless-drivers-next instead.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
