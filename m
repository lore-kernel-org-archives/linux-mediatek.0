Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A43CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7TLM22Wmba41bgkB9fdo/HPdJHUvAgwM7SdATtZCKs=; b=I+9KSPQzUs05GhEaQ4zZwkMVgh
	hnFC8DtGX8xR2Sdk3jKaLaVlEDNnsTeA1ksl/sxIJyqAqaAy0NasujHDSzALIpMzaU3l1oLeg+O+A
	nXZQmlQpPIXGYaYKSyodCry16qzrujkhGLG1IWdNBAkELyvOanw22duYSA29y/O4h8qs/GtttavRu
	0jFqRcj9H0RfV5YdP2N2jfi3rQH/llj6OzbHwfcCIpasweVem07PQKRQyf8Te14gqLOVwYC8CoPVg
	84qhAOyQCtW2qHcDVwwgYcIOUPg0vvPap3LDt6l+pDJ+xk7KOYJv8sJfskzSeoa8Yk2G2qNO8RujJ
	rdCjzQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qszf0-00Ds6Q-10;
	Wed, 18 Oct 2023 06:04:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qszew-00Ds5Q-3A
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Oct 2023 06:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A989CE2314;
	Wed, 18 Oct 2023 06:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847E7C433C8;
	Wed, 18 Oct 2023 06:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697609034;
	bh=Djzi1NuVDLlPwGRlitqHObrsX7ODU1p3B7yM65Bk/0s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kzzwQ/Vva5kn+XiCa+emJ7bu6nHA2BpEWYvmubMbMqouvRnWF9+O11qdG7oKAagQM
	 qAWB/3Egcv9Tyul1pXIx8RylkZYQCN68E/KWu3T0v91h1vq1QfjaSENkOtkeF8aJSn
	 JTOfhNyyh3IcsXl1l2Z7VM5VvLq9Glu4QW9/k6VD+rGNTaZ7TL/KYr673IHIdghnPz
	 b1HZq0HP1Ch4FJ9zjXDTtXJWiClI9jHG9UZRiyGm9U94Law/OsZnOxM+0fvALiXUoJ
	 dxnt9SzYgMP6cUw+mhdbSg4UC6YPYydAEf5iForUtAfV9MzO/sXgQov+QiSP42E8ay
	 SncO95GaJiebA==
From: Kalle Valo <kvalo@kernel.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Jakub Kicinski <kuba@kernel.org>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Sean Wang <sean.wang@mediatek.com>,  Soul Huang
 <Soul.Huang@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Leon Yen <Leon.Yen@mediatek.com>,  Eric-SY Chang
 <Eric-SY.Chang@mediatek.com>,  KM Lin <km.lin@mediatek.com>,  Robin Chiu
 <robin.chiu@mediatek.com>,  CH Yeh <ch.yeh@mediatek.com>,  Posh Sun
 <posh.sun@mediatek.com>,  Stella Chang <Stella.Chang@mediatek.com>,  Quan
 Zhou <quan.zhou@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,
  Shayne Chen <shayne.chen@mediatek.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  linux-wireless
 <linux-wireless@vger.kernel.org>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Subject: Re: [next v2] wifi: mt76: mt7921: fix kernel panic by accessing
 invalid 6GHz channel info
References: <cf77a58a60d81c77a28388bc8d312b87ffb48434.1697603002.git.deren.wu@mediatek.com>
Date: Wed, 18 Oct 2023 09:03:47 +0300
In-Reply-To: <cf77a58a60d81c77a28388bc8d312b87ffb48434.1697603002.git.deren.wu@mediatek.com>
	(Deren Wu's message of "Wed, 18 Oct 2023 12:29:35 +0800")
Message-ID: <871qds31rw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_230359_381550_3E1CDCE3 
X-CRM114-Status: GOOD (  10.28  )
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

Deren Wu <deren.wu@mediatek.com> writes:

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> When the chip not support 6GHz capability, the channels of 6GHz information
> should not be updated.
>
> May get the stacktrace without this patch.
> <1>[   19.442078] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000014
> <1>[   19.457535] Mem abort info:
> <1>[   19.465329]   ESR = 0x0000000096000004
> <1>[   19.473295]   EC = 0x25: DABT (current EL), IL = 32 bits
> <1>[   19.482354]   SET = 0, FnV = 0
> <1>[   19.489143]   EA = 0, S1PTW = 0
> <1>[   19.495991]   FSC = 0x04: level 0 translation fault
> <1>[   19.504554] Data abort info:
> <1>[   19.511111]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> <1>[   19.520269]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> <1>[   19.528988]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> <1>[   19.537960] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001027a9000
> <1>[   19.548014] [0000000000000014] pgd=0000000000000000, p4d=000000000000
> <0>[   19.558429] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> <4>[   19.568270] Modules linked in: mt7921e mt7921_common mt792x_lib
> mt76_connac_lib mt76 mac80211 btusb btintel cfg80211 btmtk snd_sof_ipc_msg_
> btrtl snd_sof_ipc_flood_test btbcm bluetooth snd_sof_mt8195 uvcvideo
> mtk_adsp_common snd_sof_xtensa_dsp uvc snd_sof_of snd_sof videobuf2_vmalloc
> ecdh_generic ecc snd_sof_utils cros_ec_lid_angle cros_ec_sensors crct10dif_
> cros_ec_sensors_core cros_usbpd_logger crypto_user fuse ip_tables ipv6
> <4>[   19.614237] CPU: 1 PID: 105 Comm: kworker/1:1 Not tainted
> 6.6.0-rc6-next-20231017+ #324
> <4>[   19.625957] Hardware name: Acer Tomato (rev2) board (DT)
> <4>[   19.634970] Workqueue: events mt7921_init_work [mt7921_common]
> <4>[   19.644522] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTY
> <4>[   19.655182] pc : mt7921_regd_notifier+0x180/0x290 [mt7921_common]
> <4>[   19.664983] lr : mt7921_regd_notifier+0xd4/0x290 [mt7921_common]
> <4>[   19.674679] sp : ffff800080acba80
> <4>[   19.681649] x29: ffff800080acba80 x28: 0000000000000000 x27: ffff4faf
> <4>[   19.692483] x26: 0000000000000000 x25: 0000000000000000 x24: ffff4faf
> <4>[   19.703294] x23: 00000000ffffe926 x22: ffff4faf16031fa0 x21: 00000000
> <4>[   19.714108] x20: 000000000000001c x19: ffff4faf16ba6f40 x18: 00000000
> <4>[   19.724928] x17: 0000000000000000 x16: ffffac6b891c2750 x15: ffff8000
> <4>[   19.735722] x14: 0000000000000180 x13: 0000000000000000 x12: 00000000
> <4>[   19.746478] x11: 0000000000000002 x10: ffff4faf01c21780 x9 : ffffac6b
> <4>[   19.757214] x8 : 00000000006c0000 x7 : ffffac6b6b020cf0 x6 : ffffac6b
> <4>[   19.767945] x5 : ffffac6b6b020d00 x4 : ffffac6b6b020cf8 x3 : ffff4faf
> <4>[   19.778648] x2 : 0000000000000000 x1 : 000000000000001c x0 : 00000000
> <4>[   19.789366] Call trace:
> <4>[   19.795381]  mt7921_regd_notifier+0x180/0x290 [mt7921_common]
> <4>[   19.804675]  wiphy_update_regulatory+0x2bc/0xa08 [cfg80211]
> <4>[   19.813864]  wiphy_regulatory_register+0x4c/0x88 [cfg80211]
> <4>[   19.823029]  wiphy_register+0x75c/0x8d0 [cfg80211]
> <4>[   19.831446]  ieee80211_register_hw+0x70c/0xc10 [mac80211]
> <4>[   19.840479]  mt76_register_device+0x168/0x2e8 [mt76]
> <4>[   19.849008]  mt7921_init_work+0xdc/0x250 [mt7921_common]
> <4>[   19.857817]  process_one_work+0x148/0x3c0
> <4>[   19.865292]  worker_thread+0x32c/0x450
> <4>[   19.872489]  kthread+0x11c/0x128
> <4>[   19.879173]  ret_from_fork+0x10/0x20
> <0>[   19.886153] Code: f0000041 9100a021 94000aef aa0003f9 (b9401780)
> <4>[   19.895634] ---[ end trace 0000000000000000 ]---
>
> Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Closes: https://lore.kernel.org/all/927e7d50-826d-4c92-9931-3c59b18c6945@collabora.com/
> Fixes: 09382d8f8641 ("mt7921: update the channel usage when the regd domain changed")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I assumed I should take this directly to net-next so assigned to me on
patchwork. Felix&Lorenzo, ack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

