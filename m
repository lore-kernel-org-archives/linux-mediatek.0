Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50196C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SckZ+DDf8jBpsZ2C44Te6eNpzkzX9NFHG5PB36IqdKM=; b=maVFSc3z5j71LgOTEpNIbYr61y
	QjtY9X4bnBkDEBEoIywwLSRQyIhpTTUI6KM4uFYS+fxzMs186S9Z2GSRNqiFYL6tombNXEL9NQ2iU
	s9iJ8exA+n5+IQFPL8k3RUouabO7fm0kc/jhLwIHHA6yaQ5zHBUzAKiTSvboeCUpD5lN29C2pnuu0
	3HRIe89L5m7anVIv6/PX9IWMylgeAhIieKm/PciPNvuydOszVkhWGSGTERQHzzQQwXypoeUQH2T21
	cb9OOcHBFsU7JjNdil9934gZ2up9g45g2PDy2ptR1D4B8IhFh9QBT+/GPK8XAXPziJoRFr2dEZ5ed
	Ndf4VCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjp5-0000000FmtW-46mv;
	Tue, 30 Jan 2024 08:50:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjp3-0000000Fmsw-12vR;
	Tue, 30 Jan 2024 08:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706604623;
	bh=L7g7UHjKNr5SvQAGpzc9mh21hs6JnAcMjRSyUdwAxPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nrqHLF4Y2RIFvV3i1CagzTPMXnxRu8+Xec++UFZsM9uNUN0z1WjrHKVf4UrYt+sjF
	 lpcqovqRbqjlmPeYKMlWMRfnb4QlLUz+znUbVbd5nLwENsRhgipQVvd+ElXcYvdQvG
	 I7gwY7+k2ehLl86TGjghkWdIjrqrRwJ0W/IZG6LiWBR+uwwHCX06JrYXirg7nyEfWx
	 xdUSydKlIsgHe+uzkethfqub9itVdFEjI/wGVaWmwMhHVWDN1SNUoQgOO2TFBBNN0m
	 iMpqa+JPM57QDE5QdLjz0iFNw4iXIGJ0CJDseKKoq2FSt9g4MSPfimH2ApQQFJwNp0
	 EZZVxjpXk6Y1A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 99F213782076;
	Tue, 30 Jan 2024 08:50:22 +0000 (UTC)
Message-ID: <20fc5f3f-3c52-448c-979f-4b1fdcef10f3@collabora.com>
Date: Tue, 30 Jan 2024 09:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,1/2] media: mediatek: vcodec: adding lock to protect
 decoder context list
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240129023153.28521-1-yunfei.dong@mediatek.com>
 <df6c8b2b-df56-46c5-933d-e56bf704525f@collabora.com>
 <b0b32ef4fb6edb979840b49a3de0278089088f14.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b0b32ef4fb6edb979840b49a3de0278089088f14.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_005025_446410_9E1891F9 
X-CRM114-Status: GOOD (  21.44  )
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

Il 30/01/24 07:29, Yunfei Dong (董云飞) ha scritto:
> Hi AngeloGioacchino,
> 
> Thanks for your reviewing.
> On Mon, 2024-01-29 at 12:19 +0100, AngeloGioacchino Del Regno wrote:
>> Il 29/01/24 03:31, Yunfei Dong ha scritto:
>>> The ctx_list will be deleted when scp getting unexpected behavior,
>>> then the
>>> ctx_list->next will be NULL, the kernel driver maybe access NULL
>>> pointer in
>>> function vpu_dec_ipi_handler when going through each context, then
>>> reboot.
>>>
>>> Need to add lock to protect the ctx_list to make sure the ctx_list-
>>>> next isn't
>>> NULL pointer.
>>>
>>> Hardware name: Google juniper sku16 board (DT)
>>> pstate: 20400005 (nzCv daif +PAN -UAO -TCO BTYPE=--)
>>> pc : vpu_dec_ipi_handler+0x58/0x1f8 [mtk_vcodec_dec]
>>> lr : scp_ipi_handler+0xd0/0x194 [mtk_scp]
>>> sp : ffffffc0131dbbd0
>>> x29: ffffffc0131dbbd0 x28: 0000000000000000
>>> x27: ffffff9bb277f348 x26: ffffff9bb242ad00
>>> x25: ffffffd2d440d3b8 x24: ffffffd2a13ff1d4
>>> x23: ffffff9bb7fe85a0 x22: ffffffc0133fbdb0
>>> x21: 0000000000000010 x20: ffffff9b050ea328
>>> x19: ffffffc0131dbc08 x18: 0000000000001000
>>> x17: 0000000000000000 x16: ffffffd2d461c6e0
>>> x15: 0000000000000242 x14: 000000000000018f
>>> x13: 000000000000004d x12: 0000000000000000
>>> x11: 0000000000000001 x10: fffffffffffffff0
>>> x9 : ffffff9bb6e793a8 x8 : 0000000000000000
>>> x7 : 0000000000000000 x6 : 000000000000003f
>>> x5 : 0000000000000040 x4 : fffffffffffffff0
>>> x3 : 0000000000000020 x2 : ffffff9bb6e79080
>>> x1 : 0000000000000010 x0 : ffffffc0131dbc08
>>> Call trace:
>>> vpu_dec_ipi_handler+0x58/0x1f8 [mtk_vcodec_dec (HASH:6c3f 2)]
>>> scp_ipi_handler+0xd0/0x194 [mtk_scp (HASH:7046 3)]
>>> mt8183_scp_irq_handler+0x44/0x88 [mtk_scp (HASH:7046 3)]
>>> scp_irq_handler+0x48/0x90 [mtk_scp (HASH:7046 3)]
>>> irq_thread_fn+0x38/0x94
>>> irq_thread+0x100/0x1c0
>>> kthread+0x140/0x1fc
>>> ret_from_fork+0x10/0x30
>>> Code: 54000088 f94ca50a eb14015f 54000060 (f9400108)
>>> ---[ end trace ace43ce36cbd5c93 ]---
>>> Kernel panic - not syncing: Oops: Fatal exception
>>> SMP: stopping secondary CPUs
>>> Kernel Offset: 0x12c4000000 from 0xffffffc010000000
>>> PHYS_OFFSET: 0xffffffe580000000
>>> CPU features: 0x08240002,2188200c
>>> Memory Limit: none
>>>
>>> 'Fixes: 655b86e52eac ("media: mediatek: vcodec: Fix possible
>>> invalid memory access for decoder")'
>>
>> Hello Yunfei,
>>
>> You've sent two patches as a v2, but:
>>    - The two patches are identical (!) apart from the commit message?!
>>    - It's Fixes: xxxx , not 'Fixes: xxxx' (please remove the quotes!)
>>    - There's no changelog from v1, so, what changed in v2?!
>>
> 1> These two patch used to fix the same issue, just used to separate
> encoder with decoder;

I just noticed that - I'm sorry.

> 2> Will fix in next patch;
> 3> patch 1 are the same for v1 and v2, just the patch 2 (encoder)
> change something.
> 
Next time, can you please add a cover letter to your series?

I think it would be easier for people to see what changed in the entire series,
even if it is just two or three patches, as you'd be writing the changelog in
there instead of writing it in each patch :-)


> Best Regards,
> Yunfei Dong
>> Cheers,
>> Angelo
>>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>    .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 4
>>> ++--
>>>    .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5
>>> +++++
>>>    .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h    | 2
>>> ++
>>>    drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 2
>>> ++
>>>    4 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>
>>


