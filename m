Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41222CD5BCA
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLsXjV1VKVcilJWw4iGh7ueKoTBlMCFleWWZtbndws4=; b=dZ7DBObc1Lj9vg/qsAQjeK3vJe
	MQaBhRCBBd4xRdVPipYwan6KaNzlfJh1FouSaQnfj0vnMyJbooa8CphjIpx31AiC+qButY+5t7adC
	1PcSO+ipSbX935P48ZVeIPdx/yoQnSgGzvEQiK+HDjAwgtR5FDRv4TAL3RDX0R5On/gbcYC6pHwmP
	IyL7iIaOvfZaYiQrnF5BJPvqz0Rw4nNuG8vfcpjmryDayWUxVffqU7OifaN7fSm7IjXYjLoWHJ6pT
	5EmIOtXGkrieK0orPVTq2zulE5oYPCJr7j3W9Ht4IwRioJz4N9igBC3E4/kRs+qz7mkn47Yto/VhU
	ZKfQtdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCcY-00000008YCm-1DA8;
	Thu, 05 Sep 2024 13:33:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCc5-00000008Y2S-2RFs
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 13:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65CE6A44C2E;
	Thu,  5 Sep 2024 13:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66002C4CEC4;
	Thu,  5 Sep 2024 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725543208;
	bh=bnAS4E/vDjLHG8xkgTnr6zM6XR0xaTXlpGLRZPgH52g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EPtZHFRW8llmK6Z6OVTsRpJ+4eQesF7cbGV3cffdTTduiP8DBxzH6kgfFtLWMqyh+
	 cPWIUMczr4JeZd/3P1zpsXPKCqbIcKXB1o6K/8NmSdrhy+SNdQNv3AiZyiSO4VZJio
	 UzVf2/99ht0fcJ0m8x/ZoZvIYbDEn+QTuraZaK3s3lNn2dUHCRUZ7fCBADyx8cp/Ur
	 wnXIQhZHgmyKpKSgiUHTq7oSDM9m90AgoZo0yWZCxS/yKngy+PsBnM/uMRzHV4JPr7
	 fwR6SIEF4GDs7UzJgMidLwgUbkZTNB6YewSBtbxy3ZE0UOrBh+OqX+4c8ioUc3IuCU
	 C4CQi5fFHDYew==
From: Kalle Valo <kvalo@kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Bert Karwatzki <spasswolf@web.de>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  sean.wang@kernel.org,  nbd@nbd.name,
  lorenzo.bianconi@redhat.com,  sean.wang@mediatek.com,
  deren.wu@mediatek.com,  mingyen.hsieh@mediatek.com,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
References: <20240718234633.12737-1-sean.wang@kernel.org>
	<0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
	<CAHbf0-Hn=ZyYpk7bS1yLK7K3ZpfWKgt3-t=c9Nhdj3Ov3H84mQ@mail.gmail.com>
	<f7197c55d059cc8ddbf6c3def16dc414c5ec0b42.camel@web.de>
	<CAHbf0-EBHERbxPGakY4-1jTQWqGqua3F0OYZjxcakdemJ5Soqw@mail.gmail.com>
	<51e80bde6e3f3256ecdea2e5260463341e65578e.camel@web.de>
	<CAHbf0-HYi=x11bc-sMJFbZ4cbkdphMYQ_hjzD_wrPvJevVwyYg@mail.gmail.com>
	<980698e0d6dfa1e0043edfed6e174ff17705e053.camel@web.de>
	<CAHbf0-FfAQhuu1TgQ_jVcxPqLsF-ON8vC1QJ=mNhis44dYWufw@mail.gmail.com>
	<d657110b726646efa972c5e83bfce6c6b1627626.camel@web.de>
	<CAHbf0-ETMTYs+T=qkLd=Y-W1ssQq1ZMDkxqHCJPSYA9U9CCgHw@mail.gmail.com>
	<CAHbf0-HbLRRhtUEj1TDzemePoaLo71sxMFDN526HPEB_zO+4ow@mail.gmail.com>
Date: Thu, 05 Sep 2024 16:33:24 +0300
In-Reply-To: <CAHbf0-HbLRRhtUEj1TDzemePoaLo71sxMFDN526HPEB_zO+4ow@mail.gmail.com>
	(Mike Lothian's message of "Thu, 29 Aug 2024 17:52:36 +0100")
Message-ID: <8734mecjiz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_063329_722690_9AB74EA7 
X-CRM114-Status: GOOD (  20.30  )
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

Mike Lothian <mike@fireburn.co.uk> writes:

>> > this seems to be exactly the same error as I had (It can also be actively
>> > provoked by "nmcli radio wifi off"), but in my case commit 479ffee68d59c599 is
>> > enough to fix the issue. Can you please double check that your faulty kernel
>> > does not include this commit. If it does and you still get the error I can post
>> > the fix to the list.
>>
>> 479ffee68d59c599 isn't enough to fix it here, I've been applying the
>> second patch since it was pointed out
>
> Sorry I've gotten myself confused as the patches changed
>
> My kernel with
> 6557a28f3e3a54cff4f0dcdd1dfa649b26557ab3
> 479ffee68d59c599f8aed8fa2dcc8e13e7bd13c3
>
> Is enough to fix things
>
> I've been applying  the old fix on top which was only applying
>
> @@ -1206,6 +1206,9 @@ static void mt7921_ipv6_addr_change(struct
> ieee80211_hw *hw,
>                },
>        };
>
> +       if (!mvif->phy)
> +               return;
> +
>        read_lock_bh(&idev->lock);
>        list_for_each_entry(ifa, &idev->addr_list, if_list) {
>                if (ifa->flags & IFA_F_TENTATIVE)
>
> Casing it to be rebuilt each time

So just to confirm: all fixes are now applied to the tree and we don't
have any missing fixes?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

