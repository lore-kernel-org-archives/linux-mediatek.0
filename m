Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 08:32:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E2860F9C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 08:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05E2860F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHzVCiTWtMMhsRYS7S14S///Ejc9lfjr7ngL24BBFJI=; b=pNFjTu1yZPc1Wi
	5fNoAU6+BC7BuzbCNEOwWwxGYKaTiwrO3Y3f0a0nYyH6waQk8kfRX0Goa5iPz8Xm1RJwRC/j4Z23B
	AcgFJcGbtULIe+6oY4JsXjUQDkQ92qfi8RGho4nJZF4W2BMXoSoXbcjpo7dsxVqBhBV5YKFTzMOA7
	UFAOMSmG/YaaCkYam3iHxdfP4ch4Pb5XgqsxOCn8AAgqpO4e52DBkW/QugoQe0e+0oPGIUkiK/gNS
	t5xc464kBdPSKfPxSYsG15mxmP9A6A64u0Zn3TaLBiofJ2m4513Vog8lGTpuGpojblEJU80uqsefV
	0/U9XzJ0pM05FnW+yn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ7mY-005KqH-Hj; Sat, 09 Oct 2021 08:32:38 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ7mU-005Kpv-Sl
 for linux-mediatek@lists.infradead.org; Sat, 09 Oct 2021 08:32:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633768355; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=3Za8k22LQYkE0ul8eOPaPOScUgtlzThVQSJqA9jh51Y=;
 b=OPawhkWGL+PYZD8gSmJH2Fp5Us7+rq6TomTEhsRwnHcCXDTX6l1MtP1jp9bavAzp7zwH44/8
 0FR2brjqiUi2ws9ad5/TnfsDR7rczYDKmEk+Hm8pCFfN9sYHk6+1GxI7vkSTmAjzxfIJz3l4
 I4rMFhBhXUV1wDD92aI9sSaIi7Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61615396ff0285fb0a50f5b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Oct 2021 08:32:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1265C43616; Sat,  9 Oct 2021 08:32:22 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5164C4338F;
 Sat,  9 Oct 2021 08:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E5164C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Nick Hainke <vincent@systemli.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
References: <20211007225725.2615-1-vincent@systemli.org>
Date: Sat, 09 Oct 2021 11:32:14 +0300
In-Reply-To: <20211007225725.2615-1-vincent@systemli.org> (Nick Hainke's
 message of "Fri, 8 Oct 2021 00:57:25 +0200")
Message-ID: <87czoe61kh.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_013235_902762_CE140E74 
X-CRM114-Status: GOOD (  15.37  )
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

Nick Hainke <vincent@systemli.org> writes:

> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").

The fixes tag should be in the end, before Signed-off-by tags. But I can
fix that during commit.

> commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
> and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
> meshpoint support.
>
> Both used in the "get_omac_idx"-function:
>
> 	if (~mask & BIT(HW_BSSID_0))
> 		return HW_BSSID_0;
>
> With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
> ibss and meshpoint mode should "prefer hw bssid slot 1-3". However,
> with that change the ibss or meshpoint mode will not send any beacon on
> the mt7622 wifi anymore. Devices were still able to exchange data but
> only if a bssid already existed. Two mt7622 devices will never be able
> to communicate.
>
> This commits reverts the preferation of slot 1-3 for ibss and
> meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.
>
> Tested on Banana Pi R64.
>
> Signed-off-by: Nick Hainke <vincent@systemli.org>

Felix, can I take this to wireless-drivers? Ack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
