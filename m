Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA19CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1BF7ZhJBLxJ2rF4Nu+DwYItNVCoVTxgkn/uMcDkA5I=; b=YTh6H6MlIwZ4k1krtcIHIIVAfJ
	gapEsEqEQmvHkPN4W0lKo7KAciGea0aehbKpYyAoe1Dyetu1y2OAXBzo0n10KpRlrHfcjbO23gkIs
	L+5iIafuwVRuYohntXTCi9xDBHdvC7aAOZhdceK8LuBZcDWL7noCU9KBl7EuhCf0O2+H2Y0jM/oJJ
	rF4jJRduWOx0EOlNBcYa3qR7BO5mU5YNP5h7WLvJJqDkbxmVF1S4DFlstz/E20Ndq+Z9qEX0nbCRo
	kZnEW1tXikBO5uzpWGR5u5jFw+d+22OqvlPQNY6nhKazalWoNVMgCHi/971WcSyTRZDfJcBY9rkCE
	zoq7xEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQtu-0000000FAJL-282v;
	Sun, 04 Oct 2026 18:25:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQts-0000000FAHt-1Ws8
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 18:25:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 930DF240103
	for <linux-mediatek@lists.infradead.org>; Sun,  4 Oct 2026 20:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1791138320;
	bh=F1BF7ZhJBLxJ2rF4Nu+DwYItNVCoVTxgkn/uMcDkA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=D3cEOvmeqQYIv9ZVYmWcTV4lxl0d0MJelw8vdUv8x9wwqmuh0lkIrAYDei0Oi7Wni
	 8TU3DuaH01OUPSfxB5lxvIi2WxRHtWrMtGOFnEB7WDpLWhvmULZLH16TInSlrkWQ71
	 +7CyDxt1I+TTyd4K/mSzmUknCVFiZS0pY+WrPD9N1Pup1WJn1HUll8AH5HZIa8P5CE
	 On9wFt6V7woEjCyXFoOVTNfNlep86LFHhwkPxJektxqyZSuz53pSIoAIzYl20fSd5r
	 nf6MiCr5XsYZqLnManD200HZuLoHZIXfrHEFO+PU+UV2kE++M8QTneIxo9xzDIHAVC
	 CEWziGQZb8mbA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyWCf1XxGz6v19;
	Sun,  4 Oct 2026 20:25:18 +0200 (CEST)
Message-ID: <49b62a23-3e05-42de-b3ed-92294311cbdd@posteo.de>
Date: Sun, 04 Oct 2026 18:25:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: mt76: mt7925: keep MLD membership consistent
 during link add
To: Andrei Rusu de Castro <arc@empyreal.works>,
 linux-wireless@vger.kernel.org, Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-mediatek@lists.infradead.org
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
 <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
 <20260829221319.25334-1-lucid_duck@justthetip.ca>
 <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
 <20261003180334.83575-1-lucid_duck@justthetip.ca>
 <20261004-mt7925-mld-v2-results-248bb5e6404f@empyreal.works>
 <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Language: en-US, de-DE
From: Jonas Hort <jonas.hort@posteo.de>
In-Reply-To: <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_112528_552211_EB8DF738 
X-CRM114-Status: UNSURE (   2.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrei,

Tested v2 on top of v7.3-rc5 on my setup:

   hardware   MT7925 PCIe (mt7925e)
   firmware   20260813113118
   AP         FritzBox 5690 Pro, FRITZ!OS 8.25
   links      5GHz + 6GHz MLO (5200 + 6135 MHz)

   stock 7.1.8 / 7.2-rc7   stalled after 3-5 minutes (WFDMA0 tail frozen)
   v7.3-rc5 + v2           46 minutes, no stall

Both links stayed active throughout, with about 4.2 GB received and
340 MB sent during the run. My watchdog (ping + WFDMA0 queue
monitoring) did not trigger once.

Tested-by: Jonas Hort <jonas.hort@posteo.de>

Thanks for the fix!
Jonas

