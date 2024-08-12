Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60433C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCjH0oiN1gWl+3ZuwlMRSyyclKAn/0qfyu+8HyGYuFw=; b=B2qAwxneswxZk3+GJFNFFiWQxB
	owjEHlw00mYqxZZyFf/sE05JVXC9DMHDjcl8ULqjeXVfs0CsUXOCcfslG/yvGCJevuiR3ZVDJpIyB
	6ByfZwt+BeekKb/aIg8Z691ouNz1JtADpqrZU2b43sRXA/fnAZSkIq+5ckoy0KZsdngUL/ilbokwR
	8T0iygqdtiaRlIoJOQI6LPG+r2tXsYpANH8LUdONgRpGDvcj8B1tmFQ+59A+2jqtM6nGNHytPTdc1
	ZmHkKpkqMdtjVD+6fD6RnSHE6F+ujEAlzjuy1/kGwOjB7gjf5NVr1RJFd6CAibI/8O2MYH/M0JZrO
	KS7BP05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSIc-000000001Dl-1UI8;
	Mon, 12 Aug 2024 10:29:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSIY-000000001BV-2RP8
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Aug 2024 10:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4F01CE0C45;
	Mon, 12 Aug 2024 10:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4FC32782;
	Mon, 12 Aug 2024 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723458546;
	bh=CLyWWOYt22DzrQD3+24twqwW5p6ENAk4u846K2Y3tgY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tlm1HdE3fmkzZ2c1IYHfNI8S+derlQvbNjunFM/xdndnI/+jhR7T9sgDY4Ob/b2p2
	 YzS7B08GDPfVQtqT1PZWOPmy6TDc+wS5Cr0XJkmYiNjBZk0iDmousNuCYkmiwo7pol
	 7rexniM57Arc4rhM6QHJOfwHHm/IrlseprByDx59xfIltKOg3wkydE7bQLSXRYk6lF
	 7YaqNxzCMGRviC4EImuc9AdC8tIQ5BoS3Fe5A/QEEd+G0Cj8ZSGihzmjxu8yoYLgqX
	 PtGGCijV5lPyWcsetb3Z36/UUbmD0/L8HpqaDuYfBQoPqfNtJjRMQWT56m7fKWSgzN
	 nrgsT5EbI+z2g==
From: Kalle Valo <kvalo@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Felix Fietkau <nbd@nbd.name>,  Sean Wang <sean.wang@kernel.org>,
  deren.wu@mediatek.com,  linux-mediatek@lists.infradead.org,
  linux-wireless@vger.kernel.org,  lorenzo.bianconi@redhat.com,
  mingyen.hsieh@mediatek.com,  sean.wang@mediatek.com,
  linux-kernel@vger.kernel.org
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
References: <20240711175156.4465-1-spasswolf@web.de>
	<CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
	<adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
	<4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
	<2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
	<65621cad9a22df881745e9333a5c3696bdbb8df3.camel@web.de>
	<87frrqkkpm.fsf@kernel.org>
	<e32ab97963e850b4425e4f5c45d2c502d50be480.camel@web.de>
	<62226273aaafafda1a4f3abc0f8c95220407b3a7.camel@web.de>
Date: Mon, 12 Aug 2024 13:29:01 +0300
In-Reply-To: <62226273aaafafda1a4f3abc0f8c95220407b3a7.camel@web.de> (Bert
	Karwatzki's message of "Mon, 12 Aug 2024 10:57:31 +0200")
Message-ID: <87y15211ci.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_032911_134901_C2AAA711 
X-CRM114-Status: GOOD (  28.97  )
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

Bert Karwatzki <spasswolf@web.de> writes:

> Am Dienstag, dem 06.08.2024 um 13:22 +0200 schrieb Bert Karwatzki:
>> Am Mittwoch, dem 31.07.2024 um 11:51 +0300 schrieb Kalle Valo:
>> > Bert Karwatzki <spasswolf@web.de> writes:
>> >
>> > > Am Mittwoch, dem 17.07.2024 um 17:25 +0200 schrieb Felix Fietkau:
>> > >
>> > > > On 17.07.24 16:38, Bert Karwatzki wrote:
>> > > >
>> > > > > So mvif->phy can be NULL at the start of mt7921_ipv6_addr_change. The early
>> > > > > return in that case avoids the NULL pointer and mvif->phy
>> > > > > has its usual value
>> > > > > again on the next call to mt7921_ipv6_addr_change so Wifi is
>> > > > > working again. I
>> > > > > don't know how this could happen but perhaps you have an idea.
>> > > >
>> > > > This change should fix it: https://nbd.name/p/0747f54f
>> > > > Please test.
>> > >
>> > > The BUG is still present in linux-6.11-rc1.
>> >
>> > I'm not sure what's the status with this. There's one mt76 patch going
>> > to v6.11-rc2:
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=6557a28f3e3a54cff4f0dcdd1dfa649b26557ab3
>> >
>> > But that looks to be a fix for a different problem, right? Felix, are
>> > you planning to submit that 0747f54f as a proper patch? I could then
>> > take it to wireless tree.
>> >
>> The Bug is still present in linux-6.11-rc2 and linux-next-20240806. Also the
>> mvif->phy NULL check in the original patch is not neccessary (and feels a little
>> out of place as mvif->phy is not needed anymore). This patch is sufficient to
>> fix the NULL pointer dereference:
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> index 1bab93d049df..23b228804289 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> @@ -1183,7 +1183,7 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw
>> *hw,
>>                                     struct inet6_dev *idev)
>>  {
>>         struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
>> -       struct mt792x_dev *dev = mvif->phy->dev;
>> +       struct mt792x_dev *dev = mt792x_hw_dev(hw);
>>         struct inet6_ifaddr *ifa;
>>         struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
>>         struct sk_buff *skb;
>>
>> Bert Karwatzki
>
> This error is still present in v6.11-rc3.

Bert, can you send your fix as a proper patch? More information in the
wiki below and please mark it for wireless tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

