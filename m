Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SIIlMJDAUxyaFYTSz6AQAAo0BiSIsn1+1Qt9FbR3cQ=; b=g0yA12XoIsE/HYdWlo2D5h50+k
	ZrnJyexMbUgI32kH7ZcT2c4eGUJ7+o/x8amnfWsgT5t/zN/mluFBu7C77L+HjC96XwXyUNF7HlVKQ
	J32gTds8YBpaaxj/XFkOe+kucHOEctEOFUamSOXimcmO/20Qu6qnQLI5pZXh4ZHyOru50rRnKfZcF
	ZUEybE+cG9wD8mkTzqyXHbQZrpqcHGJ3yVIWWZe+0dSoiar9O4W9Gy1oSjL2UYqbOI22I2oNVDbEW
	JxBtx73Er9eGMH06gc1uJkPcQT1bSkkqN87dkCzJjLRRpVTzb8yNKd52dI5HqidFn2ASHJfuwH7vk
	iJr1RnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkIp-00FDop-64; Wed, 23 Nov 2022 07:36:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkIm-00FDmO-7W
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 07:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A26F61AC2;
	Wed, 23 Nov 2022 07:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31603C433D6;
	Wed, 23 Nov 2022 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669188969;
	bh=2Edqw+R1WvvZibkeH4SiWhA8NwRq/LvyT6/U9T28yKE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G4GGmdRi5LxNwVMYU5xZ5/0ehUE0K4sdIoN7SPv/bm9jP3DYvVLdxwsZKPRPIs8JF
	 AVY07aNTfreeE8ii4xndgwZ/2indDAt8dWn+PrhrradmIGN+dUr24CTeCl2v3jXCxf
	 oCwPHEhbGCx/nCZOA6puwSv2TV9ZNYTTwBklTDriwLter1UdpSux1JR+XxprNHOQzJ
	 YaxybbcCmshbp7Gtc8QFdIBghtqshAdA2jcAvJ7RrS0MnO/3g5hmZR/Ur+m0U3tQCx
	 RoaquKYi3d/UCXO8CIzpLvoFd3ib7zHwvhO1dNfsgY6reWwDs94HMSu/1bXjL2c24J
	 U55FwDv9wtsYg==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
  =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
  "linux-mediatek\@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  =?utf-8?Q?Howard-YH_Hsu_=28?=
 =?utf-8?Q?=E8=A8=B1=E8=82=B2=E8=B1=AA=29?= <Howard-YH.Hsu@mediatek.com>,
  =?utf-8?B?TWVpQ2hpYSBDaGl1ICjpgrHnvo7lmIkp?= <MeiChia.Chiu@mediatek.com>,
  =?utf-8?B?TW9uZXkgV2FuZyAo546L5L+h5a6JKQ==?= <Money.Wang@mediatek.com>,
  "nbd\@nbd.name" <nbd@nbd.name>,  =?utf-8?Q?StanleyYP_Wang_=28=E7=8E=8B?=
 =?utf-8?Q?=E4=BE=91=E9=82=A6=29?= <StanleyYP.Wang@mediatek.com>,
  "lorenzo\@kernel.org" <lorenzo@kernel.org>,  =?utf-8?Q?Chui-hao_Chiu_=28?=
 =?utf-8?Q?=E9=82=B1=E5=9E=82=E6=B5=A9=29?= <Chui-hao.Chiu@mediatek.com>,
  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
  =?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH v2 9/9] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
	<20221110093525.29649-10-shayne.chen@mediatek.com>
	<87ilj8pcqr.fsf@kernel.org>
	<0285ab6ac5d3edfdd513ff3888481f0764b2e38b.camel@mediatek.com>
Date: Wed, 23 Nov 2022 09:36:04 +0200
In-Reply-To: <0285ab6ac5d3edfdd513ff3888481f0764b2e38b.camel@mediatek.com>
	(Ryder Lee's message of "Mon, 21 Nov 2022 19:45:14 +0000")
Message-ID: <875yf6p1gb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_233612_397392_48101D36 
X-CRM114-Status: GOOD (  28.09  )
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

Ryder Lee <Ryder.Lee@mediatek.com> writes:

> On Mon, 2022-11-21 at 17:07 +0200, Kalle Valo wrote:
>> Shayne Chen <shayne.chen@mediatek.com> writes:
>> 
>> > Add MediaTek new mac80211 driver mt7996 for Wi-Fi 7 (802.11be)
>> > devices.
>> > The driver first supports Filogic 680 PCI device, which is a Wi-Fi
>> > 7
>> > chipset supporting concurrent tri-band operation at 6 GHz, 5 GHz,
>> > and
>> > 2.4 GHz with 4x4 antennas on each band.
>> > 
>> > Currently, mt7996 only supports tri-band HE or older mode.
>> > EHT mode and more variants of Filogic 680 support will be
>> > introduced
>> > in further patches.
>> > 
>> > Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>> > Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>> > Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
>> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
>> > Co-developed-by: Howard Hsu <howard-yh.hsu@mediatek.com>
>> > Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
>> > Co-developed-by: MeiChia Chiu <meichia.chiu@mediatek.com>
>> > Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
>> > Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>> > Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>> > Co-developed-by: Money Wang <Money.Wang@mediatek.com>
>> > Signed-off-by: Money Wang <Money.Wang@mediatek.com>
>> > Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
>> > Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
>> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>> > ---
>> >  drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
>> >  drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
>> >  .../net/wireless/mediatek/mt76/mt7996/Kconfig |   12 +
>> >  .../wireless/mediatek/mt76/mt7996/Makefile    |    6 +
>> >  .../wireless/mediatek/mt76/mt7996/debugfs.c   |  851 ++++
>> >  .../net/wireless/mediatek/mt76/mt7996/dma.c   |  360 ++
>> >  .../wireless/mediatek/mt76/mt7996/eeprom.c    |  229 ++
>> >  .../wireless/mediatek/mt76/mt7996/eeprom.h    |   75 +
>> >  .../net/wireless/mediatek/mt76/mt7996/init.c  |  816 ++++
>> >  .../net/wireless/mediatek/mt76/mt7996/mac.c   | 2468 ++++++++++++
>> >  .../net/wireless/mediatek/mt76/mt7996/mac.h   |  398 ++
>> >  .../net/wireless/mediatek/mt76/mt7996/main.c  | 1325 +++++++
>> >  .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 3428
>> > +++++++++++++++++
>> >  .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  662 ++++
>> >  .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  385 ++
>> >  .../wireless/mediatek/mt76/mt7996/mt7996.h    |  516 +++
>> >  .../net/wireless/mediatek/mt76/mt7996/pci.c   |  222 ++
>> >  .../net/wireless/mediatek/mt76/mt7996/regs.h  |  533 +++
>> >  18 files changed, 12288 insertions(+)
>> 
>> This patch is too big, please split it. One patch per file is a good
>> rule of thumb.
>> 
>
> Hi Kalle,
>
> Thanks for comments.
>
> It's a bit hard to adjugement to us actually. We'd prefer to keeping
> one topic (wifi7 thing support for this case) one patch. I guess add
> code that is nor used or does not compile could get other complaints.

Applying it to the git tree as one big commit is fine, but for reviews I
always recommend splitting new drivers to one file per patch. I tried to
review this huge patch and gave up, it was just too difficult.

> Given that the series has been merged to Felix's tree (and couple
> patches are being applied on top of his tree)... but we will take care
> of this part next time and split the series by functionality as much as
> we can. What do you think?

One option is to send followup patches to handle the issues found during
review.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

