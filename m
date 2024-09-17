Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2707C3ABDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 06:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbCPxX57iuMBrH/rM7r4BmhPgChubt5O0comTsYsiKc=; b=OyMRCmE1OWUN1isnOp2UjTvDtw
	mnUNtqiT9tl4psThqUDh45S4Q7++5ma0Oh2QEVha4461TgKi/y8uz249n/bGJRlU4CaqRyfIwJ7is
	aJIZQMWuVluxKD8CObjY2Cas3L9hydGczWR8HeLDG9PHbzAeft8oV2wu8Wsd8ZkxuXMz9aDO/sBBG
	LFQrK9e+z2SD5KwI4gUGXpU3PV7M0uCMYM/tPg0zz384ZHnd52ocUAO9p+/3TzKNwUp/eP4dsTSQZ
	MqPgXX+PWFI4XHXxjCZnC7c9IU7YjWJRXyS5N5VVDLFbCxz1R3/kFMLbmCkfwz0s1dFafnd1HWBPz
	hffkzBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRXn-00000005TXY-2r1l;
	Tue, 17 Sep 2024 06:18:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRWh-00000005TQ8-0udy;
	Tue, 17 Sep 2024 06:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA4435C54E5;
	Tue, 17 Sep 2024 06:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7298C4CEC6;
	Tue, 17 Sep 2024 06:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726553846;
	bh=CB4t/+5moG0/28K8fc5AivaacXB2UZMNsXSP/NqIUrA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=okamibA89T+tS2KYSFAwVrMBm6dqR2AErTJMj4IQZ6f9YXr0OX2iihrJjdXKkStyV
	 qUqVD8pAe3kgju5SQWuZEqiVCKKHGlWaNnvLJPHGQ9xv41IfGKjsdMkDcbQgsz4bjo
	 UhQtYqTGX4B1FocupsBBx3m8w8EWGMia6m97OvZR75XNCi3zC2cedktZrDpDeQOGN7
	 SJJrOzn9Ibyb7Kj7xHWV08/eKpvTWHbNPss8E0+QftSdQhif/VVU/bVCYYrZJYzTDD
	 T151cGYeYe6/VMUiTdqKT4c2YyuIrhiF7pYkkK8SFD1/4EtX1QOO1Y14qml61S8Snk
	 0zAvdCZQa+45A==
From: Kalle Valo <kvalo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
  linux-mediatek@lists.infradead.org,  linux-wireless@vger.kernel.org,
  Felix Fietkau <nbd@nbd.name>,  Ryder Lee <ryder.lee@mediatek.com>,
  Shayne Chen <shayne.chen@mediatek.com>,  Sean Wang
 <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,  Deren Wu
 <deren.wu@mediatek.com>,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Ma Ke <make24@iscas.ac.cn>,
    regressions@lists.linux.dev
Subject: Re: BUG and WARNINGs from mt7921s on next-20240916
References: <144fbf79-950c-4cd1-bc68-4e00b47b03e9@gmail.com>
	<ZujCwvd4XiwljDyv@lore-desk>
Date: Tue, 17 Sep 2024 09:17:20 +0300
In-Reply-To: <ZujCwvd4XiwljDyv@lore-desk> (Lorenzo Bianconi's message of "Tue,
	17 Sep 2024 01:44:02 +0200")
Message-ID: <87ldzqdcsv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_231727_413098_F9F996A2 
X-CRM114-Status: GOOD (  16.87  )
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

Lorenzo Bianconi <lorenzo@kernel.org> writes:

>> Hi,
>> 
>> I ran into some bug messages while testing linux-next on a MT8186
>> Magneton Chromebook (mt8186-corsola-magneton-sku393218). It boots 
>> to the OS, but at least Wi-Fi and Bluetooth are unavailable.
>> 
>> As a start, I tried reverting commit abbd838c579e ("Merge tag 
>> 'mt76-for-kvalo-2024-09-06' of https://github.com/nbd168/wireless")
>> and it works fine after that. Didn't have time to do a full bisect, 
>> but will try if nobody has any immediate opinions.
>> 
>> There are a few traces, here's some select lines to catch your attention,
>> not sure how informational they are:
>> 
>> [   16.040525] kernel BUG at net/core/skbuff.c:2268!
>> [   16.040531] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>> [ 16.040803] CPU: 3 UID: 0 PID: 526 Comm: mt76-sdio-txrx Not tainted
>> 6.11.0-next-20240916-deb-00002-g7b544e01c649 #1
>> [   16.040897] Call trace:
>> [   16.040899]  pskb_expand_head+0x2b0/0x3c0
>> [   16.040905]  mt76s_tx_run_queue+0x274/0x410 [mt76_sdio]
>> [   16.040909]  mt76s_txrx_worker+0xe4/0xac8 [mt76_sdio]
>> [   16.040914]  mt7921s_txrx_worker+0x98/0x1e0 [mt7921s]
>> [   16.040924]  __mt76_worker_fn+0x80/0x128 [mt76]
>> [   16.040934]  kthread+0xe8/0xf8
>> [   16.040940]  ret_from_fork+0x10/0x20
>
> Hi,
>
> I guess this issue has been introduced by the following commit:
>
> commit 3688c18b65aeb2a1f2fde108400afbab129a8cc1
> Author: Felix Fietkau <nbd@nbd.name>
> Date:   Tue Aug 27 11:30:01 2024 +0200                  
>
>     wifi: mt76: mt7915: retry mcu messages                                            
>                         
>     In some cases MCU messages can get lost. Instead of failing completely,
>     attempt to recover by re-sending them.
>      
>     Link: https://patch.msgid.link/20240827093011.18621-14-nbd@nbd.name
>     Signed-off-by: Felix Fietkau <nbd@nbd.name>
>
>
> In particular, skb_get() in mt76_mcu_skb_send_and_get_msg() is bumping skb users
> refcount (making the skb shared) and pskb_expand_head() (run by __skb_grow() in
> mt76s_tx_run_queue()) does not like shared skbs.
>
> @Felix: any input on it?

Adding regressions list to Cc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

