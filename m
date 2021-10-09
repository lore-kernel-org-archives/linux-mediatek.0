Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E246FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 13:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3ED260F70
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3ED260F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLeyaUhSSLwQmSysIKc6p/ZML0aUgsKcuJeGLw7hEa8=; b=SOLPJdIG/RcxBn
	PYzu2b/sF6h/PCjMqg9ns2GP4N4SW/EqmgKPUJQ36Wgxk+6jRl9giMANqWq/GURAMRQyeOyRlApuT
	ZD34mYSioT2xAohRQDTJGFCQVz093uMVSNISCQhS8ORFJ2JMIXTVQyf4BXU6SsOkdtHvG7HuPZh6S
	/kOfYRbhHO4wHwiAV8qAgWHiVTPr1jH+2nJrDIvvRW7cVmmEoMQ1SB8NwL5FuZZHXSZ0pr23TYe71
	FkbirKIPxztf6nmYiK2XbbAHLzSHzc3kCDAe9pHqlvXaLzbwojs8WOy3ZuBmagJ5hkjosteoOcfI3
	63LXHztbEcmVATIQAeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZCJk-005doY-0O; Sat, 09 Oct 2021 13:23:12 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZCJX-005dnI-A8; Sat, 09 Oct 2021 13:23:01 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mZCJ8-0002SM-M1; Sat, 09 Oct 2021 15:22:35 +0200
Date: Sat, 9 Oct 2021 14:22:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Nick <vincent@systemli.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, nbd@nbd.name,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Message-ID: <YWGXiExg1uBIFr2c@makrotopia.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_062259_378662_A194C029 
X-CRM114-Status: GOOD (  13.12  )
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

On Sat, Oct 09, 2021 at 12:37:53PM +0200, Nick wrote:
> On 10/9/21 10:32, Kalle Valo wrote:
> 
> > Nick Hainke <vincent@systemli.org> writes:
> > 
> > > Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
> > The fixes tag should be in the end, before Signed-off-by tags. But I can
> > fix that during commit.
> Thanks for feedback. Already changed that locally but I did not want to spam
> you with another RFC v3. :)
> I was able to organize me a BPI-MT7615 PCIE Express Card. With and without
> this patch beacons were sent on the mt7615 pcie, so the patch did not make
> any difference. However, the mt7622 wifi will only work with my patch.

Does Mesh+AP or Ad-Hoc+AP also work on MT7622 and does it still work on
MT7615E card with your patch applied?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
