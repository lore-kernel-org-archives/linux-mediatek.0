Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D7AC3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvgFnLYSK3MCyItSwxElnfVP3fMzx1qE71NJQ+jaiE4=; b=A41S+PRg1ESoHA3u5M44J+swTG
	pT4HqfdkmoFsFGVmrDcTncMmdeb0ElWDzfvdMyEy/7uPtxFhErCBrWc9FeaP3EKQelJvIKyjfMQqZ
	O0nvBm4z0kG/UgIVS6op8Rs1Cau1YAlEjH+vEeAK5AAcQRoclxfbINPxYuXZ7hoIJY5Eq2ORzdtsh
	XsL7fL1JDcmA6z+towQJhNvRn9oFAyRREGYgFm85sr2g9VOxuDtzVhW5fEYDIMYK5WVq+N2vGIwm1
	QO7ADvRFXP3BkHROY4xoWmc4/yamJaIUm5/XuWkNFZLnuYCrGweiF1rThjDeaRMchrOMuLYNV9YpR
	Hm/wXKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ53s-00000000NvI-3vP8;
	Wed, 31 Jul 2024 08:51:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ53q-00000000NtJ-0Wnl
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 08:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10C1762283;
	Wed, 31 Jul 2024 08:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6D7C4AF0E;
	Wed, 31 Jul 2024 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722415912;
	bh=eq6ZbUjCp8yGbWbk+wUwlkkjoHUI0f5wvuxs5k0tigE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V9SkYUnFJq677ztCX6/2lYBJMv7eaeT/1xWxCqFjlEKd/ysfKPMBllkmI1H4KNjJ0
	 I5pTbW2SziHqGgW08Isvty/RSlpW4iVq+v50h1UH08X3ZghSlCCEj9xjEys7dBlF0J
	 msz2YMvJ8BS0AhOT8za2h1To27sK0t5qtjyYS/pdo5Cx7flqCAaSCvWhXTGYBD6ELN
	 NppBFfdaLbY9xNf+8LqsfCuZIPN652buyc/I2yOEZddGSSQtvUpLJpSkYy4/m07jl5
	 O3YTh39sLPPD02RLDU9wx4VTHwu5gbM2oqBez6W/XhE1Xn1mQYHrddjBuzyyrrnhSy
	 uv/dVhcZNsItQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Felix Fietkau <nbd@nbd.name>,  Sean Wang <sean.wang@kernel.org>,
  deren.wu@mediatek.com,  linux-mediatek@lists.infradead.org,
  linux-wireless@vger.kernel.org,  lorenzo.bianconi@redhat.com,
  mingyen.hsieh@mediatek.com,  sean.wang@mediatek.com
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
References: <20240711175156.4465-1-spasswolf@web.de>
	<CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
	<adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
	<4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
	<2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
	<65621cad9a22df881745e9333a5c3696bdbb8df3.camel@web.de>
Date: Wed, 31 Jul 2024 11:51:49 +0300
In-Reply-To: <65621cad9a22df881745e9333a5c3696bdbb8df3.camel@web.de> (Bert
	Karwatzki's message of "Mon, 29 Jul 2024 13:12:15 +0200")
Message-ID: <87frrqkkpm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_015154_239824_0B9B3A56 
X-CRM114-Status: GOOD (  14.98  )
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

> Am Mittwoch, dem 17.07.2024 um 17:25 +0200 schrieb Felix Fietkau:
>
>> On 17.07.24 16:38, Bert Karwatzki wrote:
>>
>> > So mvif->phy can be NULL at the start of mt7921_ipv6_addr_change. The early
>> > return in that case avoids the NULL pointer and mvif->phy has its usual value
>> > again on the next call to mt7921_ipv6_addr_change so Wifi is working again. I
>> > don't know how this could happen but perhaps you have an idea.
>>
>> This change should fix it: https://nbd.name/p/0747f54f
>> Please test.
>
> The BUG is still present in linux-6.11-rc1.

I'm not sure what's the status with this. There's one mt76 patch going
to v6.11-rc2:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=6557a28f3e3a54cff4f0dcdd1dfa649b26557ab3

But that looks to be a fix for a different problem, right? Felix, are
you planning to submit that 0747f54f as a proper patch? I could then
take it to wireless tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

