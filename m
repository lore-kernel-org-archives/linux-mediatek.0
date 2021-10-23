Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 07:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B759060FDA
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 07:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B759060FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj8obbreLzQ8jX5f7HCKTjVnjYAdcS/P2Hn18lUlhrU=; b=Bd6zrPJ6NOYtD+
	RzNtZIf+89u7ncGmaCt/d9zIVZEF3mieyAkJjpRLNXTxYW3Bebtin/VGBC11+UnJAh87IM1P5lK/R
	2ovkfGEgNWxK6Q3U6mY6UoinAdRfV2viuvoi0dVEZsuGVXTE+d5Y/qhPHBFnMolLeXuvu91YtVqg1
	prUeq37TUqPVDG8O60aSieM67DL6FfBczna2/QpKyRCO1r0t6t5FI1iSkl2w+Sy3Q+kWj07xyk8mv
	/kLf019BVzhv6kGztdmfXVdQfAk4JzBizMDRQwQgqyTV6R0uSITMV+rT0DYxxNvHRZ9DV/xu3rzEj
	p0amFxKP6rnL2bdhem9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meBUK-00CO6O-Fg; Sat, 23 Oct 2021 07:30:44 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meBUF-00CO5n-5L
 for linux-mediatek@lists.infradead.org; Sat, 23 Oct 2021 07:30:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634974241; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=6prkHAzg/ianVXk7VNqt9m/tBBvysRNdknkhwFj3piw=;
 b=Y5u7QjwTXNFzwVkmRJfapPar6WnmQlGPM8pbnMMh1gwGGhUwcCivKR5aMW93WW53m/a6tjY4
 llBoKvBA1mQ47kb7uC8FNfx+3olOl0GcGu/fBW9RGmuIyTZPc1YScqnMgDIefB0a3ENk7jE1
 SI5aQraCh6222d0zu6h7WOQ9FmI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6173ba01b03398c06c30f453 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 07:30:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD65EC4361A; Sat, 23 Oct 2021 07:30:08 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3F41C4338F;
 Sat, 23 Oct 2021 07:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C3F41C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [RFC,v2] mt76: mt7615: mt7622: fix ibss and meshpoint
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211007225725.2615-1-vincent@systemli.org>
References: <20211007225725.2615-1-vincent@systemli.org>
To: Nick Hainke <vincent@systemli.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Nick Hainke <vincent@systemli.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163497420151.29616.16838354269777236200.kvalo@codeaurora.org>
Date: Sat, 23 Oct 2021 07:30:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_003042_113114_6C770E2F 
X-CRM114-Status: GOOD (  10.79  )
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

Nick Hainke <vincent@systemli.org> wrote:

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
> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces")
> Signed-off-by: Nick Hainke <vincent@systemli.org>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless-drivers-next.git, thanks.

753453afacc0 mt76: mt7615: mt7622: fix ibss and meshpoint

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211007225725.2615-1-vincent@systemli.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
