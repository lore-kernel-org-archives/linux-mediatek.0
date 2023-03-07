Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE3CC6FD20
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov+7M2rJ+yI8E3FxSOXUyYGQGXOW9J99IK253jZbFoE=; b=vWUE3njuUx2ACjRPHueVXob4kW
	5uKngxT0mFeM3cERio6o1rqEcO+RyWkrdqc7Ax2IbswmnpcEnaja1wkxUYGkNBz46t/brB22XDHLO
	DxQ00Tg5fjOTecpyHw+fc9SX9xlGI6fKtfDqFavX0ePF1q9Nl0fmSRLq2ydpwJ1lry9cGM4iR5lvI
	TkwoKIbCgrwhb7UJVLfvfXZD6jdCi3EujnS2pDun11VfEtCRMwPUb18HxfQx6UwaAgzfrJEkYzYgK
	pMHrL1q2sFD69/NicUccZj283Fhv/9l9AQLJrg4m8p3YBp3V3nz9DRSFQ8ZxGWZVq65evrNIaScZZ
	/7K79lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTZW-00GsXG-7C; Tue, 07 Mar 2023 09:25:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTZ7-00GsJ5-DD; Tue, 07 Mar 2023 09:25:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E3036602FE5;
	Tue,  7 Mar 2023 09:24:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678181097;
	bh=q3luoZTgpNdhEHW9jdKgy83al0aOJTjkSQZabZ2eSNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W8ZSG78OC0e/uulkRGd5Gm6py5CcblJbNWn1TQOWZv/EZ0g0shxFXfxDTp0262JYR
	 liRNvSmuJOPli90jo2/hE6h6gkO0GePEbxa5OOIRAS7ADdfRlCptRhPAsR0ZtMTFOZ
	 y+QLPOFue9xJHHJQrG0J4bLfTMhJmxChge6xibg9M3APxTzLNeEJPjBDxPtPXNj1tI
	 A0mgGGcOhmhCLgAqxjxMPgtLaJ0gUge6mPI5Z4q0A9jGMBaywuerKA3cBPnySWXzx8
	 j/AtZCGNrZGSHqJrmoHpC/IiG0jtBidJsLHkNy0zVuKmJNOdb/LRks7cFxQqIUBP2z
	 +JnIUIZpky/Aw==
Message-ID: <5ca9ad61-0a79-5700-8c6a-e9afa94a59c5@collabora.com>
Date: Tue, 7 Mar 2023 10:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 47/54] clk: mediatek: mt8192: Move apmixedsys clock
 driver to its own file
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, fparent@baylibre.com, msp@baylibre.com,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
 sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
 <20230306140543.1813621-48-angelogioacchino.delregno@collabora.com>
 <ZAZjYTv4TLKSunFZ@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZAZjYTv4TLKSunFZ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_012501_746632_3899E8F8 
X-CRM114-Status: GOOD (  18.05  )
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

Il 06/03/23 23:04, Daniel Golle ha scritto:
> On Mon, Mar 06, 2023 at 03:05:36PM +0100, AngeloGioacchino Del Regno wrote:
>> This is the last man standing in clk-mt8192.c that won't allow us to
>> use the module_platform_driver() macro, and for *no* good reason.
>> Move it to clk-mt8192-apmixedsys.c and while at it, also add a
>> .remove() callback for it.
>>
>> Also, since the need for "clk-mt8192-simple" and "clk-mt8192" was
>> just due to them being in the same file and probing different clocks,
>> and since now there's just one platform_driver struct per file, it
>> seemed natural to rename the `-simple` variant to just "clk-mt8192".
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Tested-by: Miles Chen <miles.chen@mediatek.com>
>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>> ---
>>   drivers/clk/mediatek/Makefile                |   2 +-
>>   drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 214 ++++++++++++++++++
>>   drivers/clk/mediatek/clk-mt8192.c            | 221 +------------------
>>   3 files changed, 219 insertions(+), 218 deletions(-)
>>   create mode 100644 drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> 
> I've tried to apply this on clk-next (currently v6.3-rc1) and also
> linux-next (next-20230306), on both this patch doesn't apply:
> 
> Applying: clk: mediatek: mt8192: Move apmixedsys clock driver to its own file
> error: patch failed: drivers/clk/mediatek/clk-mt8192.c:12
> error: drivers/clk/mediatek/clk-mt8192.c: patch does not apply
> Patch failed at 0047 clk: mediatek: mt8192: Move apmixedsys clock driver to its own file
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 

You've missed the dependency that I've listed in the cover letter.

https://patchwork.kernel.org/project/linux-mediatek/list/?series=719067

Regards,
Angelo


