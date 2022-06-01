Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1767AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CzpZ22QIRnR7mujTp/vOIiebtHJVm5zLiGYlG0e66E=; b=zP3dmXUR9NXLDT
	i2dZg515rHZbc2OrexV8zBuGgs3QpE+P8/AeDrlFvEkOjU/faWcolKs20reszg9BtyHDwhh4qkeze
	Y7jzLusBQwfdVhShB6xtsmN8tqH+aKv6qjQ+U5X4KX/WwWTPEjp1LXOGD/BAI0NMozDIpnSvkuxx+
	/Pes8Ie8clrNODN++FGWkCQLqmKYR/nTARyfeveN4/zxJBKfa6H513uruZl+zxycysGvJRVRirrRH
	+E7JC/UIEk1eXTEvDc16RCscYGIIeDx8SuJwnMHYw/P5u4swoO+GvZVfdwrEVgqnnx7sTQ9fljX0z
	aA0NZtMS/E8db6RWPQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwWkp-000euK-EB; Wed, 01 Jun 2022 22:23:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwWkc-000erb-VC; Wed, 01 Jun 2022 22:23:42 +0000
X-UUID: dc1fd33dad864a0f9ded43682d24add8-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:255d01f0-6019-4e06-a019-690720853bd9,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:28
X-CID-META: VersionHash:2a19b09,CLOUDID:bb70f514-b515-4766-a72d-4514488fe823,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: dc1fd33dad864a0f9ded43682d24add8-20220601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1571342725; Wed, 01 Jun 2022 15:23:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 15:23:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 06:23:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jun 2022 06:23:23 +0800
From: <sean.wang@mediatek.com>
To: <dev@pschenker.ch>
CC: <deren.wu@mediatek.com>, <kvalo@kernel.org>,
	<linux-wireless@vger.kernel.org>, <nbd@nbd.name>, <linux@leemhuis.info>,
	<davem@davemloft.net>, <kuba@kernel.org>, <lorenzo.bianconi83@gmail.com>,
	<matthias.bgg@gmail.com>, <pabeni@redhat.com>, <ryder.lee@mediatek.com>,
	<sean.wang@mediatek.com>, <shayne.chen@mediatek.com>, <yn.chen@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
Date: Thu, 2 Jun 2022 06:23:23 +0800
Message-ID: <1654122203-26090-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch--annotate>
References: <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_152339_056244_E5CAC257 
X-CRM114-Status: GOOD (  22.22  )
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

From: Sean Wang <sean.wang@mediatek.com>

>On Tue, 2022-04-12 at 19:06 +0800, Deren Wu wrote:
>> On Tue, 2022-04-12 at 12:37 +0300, Kalle Valo wrote:
>> > Philippe Schenker <dev@pschenker.ch> writes:
>> >
>> > > This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
>> > >
>> > > This commit introduces a regression on some systems where the
>> > > kernel is crashing in different locations after a reboot was
>> > > issued.
>> > >
>> > > This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest
>> > > firmware.
>> > >
>> > > Link:
>> > > https://urldefense.com/v3/__https://lore.kernel.org/linux-wireless
>> > > /5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/__;!!
>> > > CTRNKA9wMg0ARbw!09tjyaQlMci3fVI3yiNiDJKUW_qwNA_CbVhoAraeIX96B99Q14
>> > > J4iDycWA9cq36Y$
>> > >
>> > > Signed-off-by: Philippe Schenker <dev@pschenker.ch>
>> >
>> > Can I take this to wireless tree? Felix, ack?
>> >
>> > I'll also add:
>> >
>> > Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
>> >
>>
>> Hi Kalle,
>>
>> We have a patch for a similar problem. Can you wait for the
>> verification by Philippe?
>> Commit 602cc0c9618a81 ("mt76: mt7921e: fix possible probe failure
>> after
>> reboot")
>> Link:
>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kerne
>> l/git/torvalds/linux.git/commit/drivers/net/wireless/mediatek/mt76?id=
>> 602cc0c9618a819ab00ea3c9400742a0ca318380__;!!CTRNKA9wMg0ARbw!3N9I3iKwS
>> 3XCNAb4LuhbFqt_el1yiOaJzSdUjaJsTaxRCHiWhXnEgbk3bOqYTy6T$
>>
>> I can reproduce the problem in my v5.16-rc5 desktop. And the issue can
>> be fixed when the patch applied.
>>
>>
>> Hi Philippe,
>>
>> Can you please help to check the patch in your platform?
>
>Hi Kalle and Deren,
>
>I just noticed on my system and mainline v5.18 reboots do now work however Bluetooth is no longer accessible after a reboot.
>
>Reverting commit bf3747ae2e25dda6a9e6c464a717c66118c588c8 on top of
>v5.18 solves this problem for me.
>
>@Deren are you aware of this bug?
>@Kalle Is there a bugtracker somewhere I can submit this?

Hi Philippe,

Could you try the latest firmware to see if it can help with the issue you reported here ?

Please check out https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek
and replace the following three files in /lib/firmware/mediatek on your target and reboot
1) BT_RAM_CODE_MT7961_1_2_hdr.bin
2) WIFI_MT7961_patch_mcu_1_2_hdr.bin
3) WIFI_RAM_CODE_MT7961_1.bin

	Sean

>
>Thanks,
>Philippe
>
>>
>>
>> Regards,
>> Deren
>>
>
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
