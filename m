Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E44C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH0HwbGRqxIv268gE8XaMBn1MkTnNW4tyRtF7yRX3GE=; b=4iWTiHQcA05HjGOcw+QPHJP8mm
	kr8gJHwrlymILyMk/FoUDp5j32mEKEcOBaDgaVTVB00dwaSJt77qX6TOMdJs2sL7/0ZvesfaoI7wX
	lE5j11hDs3+f8bA7JlzfopO2eyDytQGZAVZvqSMrw3UbAxfzhJo35Zzk9+CYIK4EbiiABY0z67qdR
	99YxA+kNTqqxov2MIIlh56vD+rxn9hYS2T4UTQdQf47IDQgQw6HNKbqmEcLkWiSUMbKe+8D45k2oc
	sRVGuF9xdXOkTdmfX45NmkqC9UR+PCh8kE6WbatRcFT90KcYuI6oVp03OCv32tS8A+NrXyGPjH5Pi
	t1r838Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0n0q-004Srz-17;
	Wed, 08 Nov 2023 18:10:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0n0n-004Sr9-0w
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 18:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DC73616CF;
	Wed,  8 Nov 2023 18:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E80CC433C8;
	Wed,  8 Nov 2023 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699467044;
	bh=ZhnQd77nx25O9I+BDvIQd9T1u9yJzJ6XIy/5XVehguQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Et+2HAdQU3jS9rMjfTkeKjQaD7b6J9q7DetE5oRAcAyFT2UNz0ns1cQXSmVbxALVZ
	 z58u1lQWJ7/UCHgrnHf56HqCAD2TOywSSaQnfqVKsWocnSNz+yjtYhHViIBeC8dFyq
	 ncTaKCcV+x0KPucliT37LFbnQMY0luJCpjPCWsH6y3KV1HKTJyQmSoDRzpDx1OYgTN
	 0NvyfxuS94+8NKKNhOwnhomjfq7/iwAcEzM4DFTudqj5mdzWTowv4tbIFoT7vk0fnE
	 H0lcuJen7/soDvJX/sUdhFmGMIy/6QpOBD85hdenD8s18eEXIm8ozff0S/BqoBfp1e
	 bstOztDxCrSfw==
From: Kalle Valo <kvalo@kernel.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Sean Wang <sean.wang@mediatek.com>,  Soul Huang
 <Soul.Huang@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Leon Yen <Leon.Yen@mediatek.com>,  Eric-SY Chang
 <Eric-SY.Chang@mediatek.com>,  KM Lin <km.lin@mediatek.com>,  Robin Chiu
 <robin.chiu@mediatek.com>,  CH Yeh <ch.yeh@mediatek.com>,  Posh Sun
 <posh.sun@mediatek.com>,  Stella Chang <Stella.Chang@mediatek.com>,  Quan
 Zhou <quan.zhou@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,
  Shayne Chen <shayne.chen@mediatek.com>,  Ben Greear
 <greearb@candelatech.com>,  linux-wireless
 <linux-wireless@vger.kernel.org>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Subject: Re: [next,v2] wifi: mt76: mt7921: fix 6GHz disabled by the missing
 default CLC config
References: <5a976ddf1f636b5cb809373501d3cfdc6d8de3e4.1698648737.git.deren.wu@mediatek.com>
	<169946628281.2754325.4918391356587950317.kvalo@kernel.org>
Date: Wed, 08 Nov 2023 20:10:38 +0200
In-Reply-To: <169946628281.2754325.4918391356587950317.kvalo@kernel.org>
	(Kalle Valo's message of "Wed, 8 Nov 2023 17:58:04 +0000 (UTC)")
Message-ID: <87ttpw9kv5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_101045_389169_B20C4D96 
X-CRM114-Status: UNSURE (   9.47  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Deren Wu <deren.wu@mediatek.com> wrote:
>
>> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>> 
>> No matter CLC is enabled or disabled, the driver should initialize
>> the default value 0xff for channel configuration of CLC. Otherwise,
>> the zero value would disable channels.
>> 
>> Reported-and-tested-by: Ben Greear <greearb@candelatech.com>
>> Closes: https://lore.kernel.org/all/2fb78387-d226-3193-8ca7-90040561b9ad@candelatech.com/
>> Fixes: 09382d8f8641 ("wifi: mt76: mt7921: update the channel usage when the regd domain changed")
>> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>
> Patch applied to wireless.git, thanks.
>
> 7a934b5cc3f4 wifi: mt76: mt7921: fix 6GHz disabled by the missing default CLC config

BTW the fixes tag didn't use correct title and I fixed it during commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

