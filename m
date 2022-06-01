Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A370CCCA477
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN6ZC3u5QJRe6+UcOqNhCQM7zK66x5u932ymmhTZnMA=; b=kS9E5f1/9cCDUX
	lyCILMY6Pijrz7AVeIBdrXxqOeP6i/HadH2DKTfTlL09J45jvtyD+BUjGddhqJT7/FJHTmNhmd8nI
	xL2PxojnQbhfR5wzMb1449YYzBJTZkcCeySEvERzmlDB5wsEcKfGmXVR0I7pH5+vZQ8F2swD5PwiV
	bAbYuQLyE6V55RNpIYGY/4yuSb3OmKsjpNlBXOS4qxxKVjTN8JgWNmL/pFkX/CMwTuQl5M1EbU37c
	NWvDktZj21G7l0fOTOHJwR3aJdYIJjyqcUHLFE47DUjtH7T09kRiWhZupzYwoPVA0VIVhn+JZrGW+
	PxK3152vHsr5prGHR9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwRdT-00HD1r-68; Wed, 01 Jun 2022 16:55:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwRdP-00HD05-Ti; Wed, 01 Jun 2022 16:55:53 +0000
X-UUID: 3151a298b0c949699a06bd4e6ebbbec4-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7a664fed-d066-4274-b850-662d6129ac92,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:c3baf014-b515-4766-a72d-4514488fe823,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 3151a298b0c949699a06bd4e6ebbbec4-20220601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1846647199; Wed, 01 Jun 2022 09:55:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 09:55:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 00:55:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 00:55:38 +0800
Message-ID: <da79fa2a94c435a308ea763efc557fc352d0245c.camel@mediatek.com>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
From: Deren Wu <deren.wu@mediatek.com>
To: Kalle Valo <kvalo@kernel.org>, Philippe Schenker <dev@pschenker.ch>
CC: <linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>,
	<linux@leemhuis.info>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
	Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<regressions@lists.linux.dev>
Date: Thu, 2 Jun 2022 00:55:38 +0800
In-Reply-To: <87mtewoj4e.fsf@kernel.org>
References: <20220412090415.17541-1-dev@pschenker.ch>
	 <87y20aod5d.fsf@kernel.org>
	 <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
	 <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch>
	 <87mtewoj4e.fsf@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_095551_993583_56E95EDD 
X-CRM114-Status: GOOD (  31.02  )
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

On Wed, 2022-06-01 at 11:58 +0300, Kalle Valo wrote:
> Philippe Schenker <dev@pschenker.ch> writes:
> 
> > On Tue, 2022-04-12 at 19:06 +0800, Deren Wu wrote:
> > > On Tue, 2022-04-12 at 12:37 +0300, Kalle Valo wrote:
> > > > Philippe Schenker <dev@pschenker.ch> writes:
> > > > 
> > > > > This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
> > > > > 
> > > > > This commit introduces a regression on some systems where the
> > > > > kernel is
> > > > > crashing in different locations after a reboot was issued.
> > > > > 
> > > > > This issue was bisected on a Thinkpad P14s Gen2 (AMD) with
> > > > > latest
> > > > > firmware.
> > > > > 
> > > > > Link: 
> > > > > 
https://urldefense.com/v3/__https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/__;!!CTRNKA9wMg0ARbw!09tjyaQlMci3fVI3yiNiDJKUW_qwNA_CbVhoAraeIX96B99Q14J4iDycWA9cq36Y$
> > > > >  
> > > > > Signed-off-by: Philippe Schenker <dev@pschenker.ch>
> > > > 
> > > > Can I take this to wireless tree? Felix, ack?
> > > > 
> > > > I'll also add:
> > > > 
> > > > Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
> > > > 
> > > 
> > > Hi Kalle,
> > > 
> > > We have a patch for a similar problem. Can you wait for the
> > > verification by Philippe?
> > > Commit 602cc0c9618a81 ("mt76: mt7921e: fix possible probe failure
> > > after
> > > reboot")
> > > Link: 
> > > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/mediatek/mt76?id=602cc0c9618a819ab00ea3c9400742a0ca318380__;!!CTRNKA9wMg0ARbw!zCYyDcufJ-OLqQV6leCegA5SkNOOVjAIo-jzTHTk6HUWT9Gjt-bvSz8lr81Zv95u$
> > >  
> > > 
> > > I can reproduce the problem in my v5.16-rc5 desktop. And the
> > > issue can
> > > be fixed when the patch applied.
> > > 
> > > 
> > > Hi Philippe,
> > > 
> > > Can you please help to check the patch in your platform?
> > 
> > Hi Kalle and Deren,
> > 
> > I just noticed on my system and mainline v5.18 reboots do now work
> > however Bluetooth is no longer accessible after a reboot.
> > 
> > Reverting commit bf3747ae2e25dda6a9e6c464a717c66118c588c8 on top of
> > v5.18 solves this problem for me.
> > 
> > @Deren are you aware of this bug?
> > @Kalle Is there a bugtracker somewhere I can submit this?
> 
> For regressions the best is to submit it to the regressions list,
> CCed
> it now.
> 
Hi Philippe,

Tried your test with v5.18.0 on my desktop and both wifi/bt are still
avaible after reboot. The only problem is I need to insert btusb module
by command "modprobe btusb" to make BT workable.

I will check the issue on different platforms. If there are any
finding, I will let you know.

Regards,
Deren


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
