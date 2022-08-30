Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FEECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1y0Wan8DXpf1HBrvVHFVpfKrieKbNPugv7wSN4JiZbE=; b=4MJIFUk23O13D9Si/G756Wlr3X
	PgLnwbQkq7MShrdS1FRVa+l8a2G81fbnEt2LPkCiUIbezDTYg774DOa/Yls24sV7P1vT1Btg0MWXe
	xs0id5//i/Zpo/PD3LVxFGGXqB7Yo5supKUWXLQNRUdO67c815VDI8sLSF7Ks/IH5y3esHmWSSf74
	/v8kUrQ9d3rlTMM4fjZJVJH0uK97kwvVPp8w2Pm4JWK5JeCgbSRKNq1xrBJMYP68Nl6LuiAOFbV3f
	F5rcUi7a+U+WggdOuDTD3DPmsYusJo7akyZ3wNa2Ysjfylkr+TeUomGTKsoymnbzQt8M4ge79aAdw
	ArNkt0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSteA-00EA2X-OZ; Tue, 30 Aug 2022 05:18:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSte1-00EA09-LG
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 05:18:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2EDE2CE175A;
	Tue, 30 Aug 2022 05:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777AEC433C1;
	Tue, 30 Aug 2022 05:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661836707;
	bh=nCbPAjIAPqJ/YO8bszJdZw+GFvqrBlsOPZLW1wkqTSM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uE/1lkRXGNRVgC7IHZgu3JOGUEIOSiKMlKQftKurS/ae1KYsL4ANQU7EZV4vyImFt
	 rtdZfh1NXQ3s7YgeJW2R6wXuH7D41GqpQk1HctTPUVszryY0IGkwm/DZUTQxwbPWc0
	 tWsZh0qVCNT+aZns3puUaZyyfy+dvBRwVCreaDQrrzTey3CXVDhbEUvlrnMbmCSJoR
	 4/KVp2pzYpfiVlCUPp6x54KeB34cuFBUU501RK1/M63YU91PpcDbO+QsS9LGFrMMtp
	 PVkMp4f2wGJaoEDnYvW9d26qv1urcUC7CrCaRLtPUlajnjmbVc6Tf6PuA3PRQgnEyh
	 69V9N37Evb3nA==
From: Kalle Valo <kvalo@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,  =?utf-8?B?U2VhbiBXYW5nICjnjos=?=
 =?utf-8?B?5b+X5LqYKQ==?= <sean.wang@mediatek.com>,  Felix Fietkau
 <nbd@nbd.name>,  lorenzo.bianconi@redhat.com,  Soul.Huang@mediatek.com,
  YN.Chen@mediatek.com,  Leon.Yen@mediatek.com,
  Eric-SY.Chang@mediatek.com,  Deren Wu <Deren.Wu@mediatek.com>,
  km.lin@mediatek.com,  jenhao.yang@mediatek.com,  robin.chiu@mediatek.com,
  Eddie.Chen@mediatek.com,  ch.yeh@mediatek.com,  posh.sun@mediatek.com,
  ted.huang@mediatek.com,  Stella.Chang@mediatek.com,
  Tom.Chou@mediatek.com,  steve.lee@mediatek.com,  jsiuda@google.com,
  frankgor@google.com,  kuabhs@google.com,  druth@google.com,
  abhishekpandit@google.com,  shawnku@google.com,
  linux-wireless@vger.kernel.org,  "moderated list\:ARM\/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 8/9] wifi: mt76: mt7921: introduce remain_on_channel support
References: <cover.1660606893.git.objelf@gmail.com>
	<f48a750e8ad17d5b2410eea03fc30a6403732168.1660606893.git.objelf@gmail.com>
	<YvyUwEdURYHiAduf@lore-desk>
	<CAGp9LzrvVQOrUNPR8aguUTgWo1wZFMR2Y3kdTk8WqxmG=B8--w@mail.gmail.com>
	<Yv3sqvhXnGiOpKkE@lore-desk>
	<CAGp9LzpjeKH2AHcDGjpeKb02fiE9yHD_p-T9oeY1HS-nDKcUNQ@mail.gmail.com>
Date: Tue, 30 Aug 2022 08:18:19 +0300
In-Reply-To: <CAGp9LzpjeKH2AHcDGjpeKb02fiE9yHD_p-T9oeY1HS-nDKcUNQ@mail.gmail.com>
	(Sean Wang's message of "Wed, 24 Aug 2022 17:10:59 -0700")
Message-ID: <87k06qfgx0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_221838_413228_4E617614 
X-CRM114-Status: GOOD (  20.73  )
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

Sean Wang <sean.wang@kernel.org> writes:

>> > > > +static int mt7921_check_offload_capability(struct mt7921_dev *dev)
>> > > > +{
>> > > > +     struct ieee80211_hw *hw = mt76_hw(dev);
>> > > > +     int year, mon, day, hour, min, sec;
>> > > > +     struct wiphy *wiphy = hw->wiphy;
>> > > > +     bool fw_can_roc = false;
>> > > > +     int ret;
>> > > > +
>> > > > +     ret = sscanf(dev->mt76.hw->wiphy->fw_version + 11, "%4d%2d%2d%2d%2d%2d",
>> > > > +                  &year, &mon, &day, &hour, &min, &sec);
>> > >
>> > > does the fw have a differnt base version with respect to the previous ones?
>> > > checking the date is a bit ugly.
>> >
>> > I admitted that way was a bit ugly, but I have investigated for a
>> > while, and that is the only way we can use to distinguish the version
>> > in current mt7921 firmware.
>>
>> the fw seems pretty new (2022/7/15), is it already available in linux-firmware
>> git tree? If not I guess you can increment fw version in a more evident way.
>> For the future please remember to do it for major fw changes.
>
> The new FW is not released in linux-firmware. I will try to figure out
> a better way to recognize the FW can support the feature and add it in
> v2.

It would be a lot better and more future proof to use some kind feature
advertising instead of guessing from a firmware version. For example,
ath11k uses WMI service bits and other upstream drivers have something
similar.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

