Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C1BC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImaDDw7cEdneuLhUBiDJZ4JFe8ix77g6XwjyxYRUf4k=; b=ndpYNyBOqd9wRoIIUd1SQl1Cic
	GkhHeE7tquUfFytKKOgm0o9sUco6L6Be9hYvhjhvtYvhlNAeZ3xEWXcTrRJaBKlYVSV0/C1uTX+ev
	VGbnWWlvjS9KP9CPxHHbYk50mNdo0r5MDurqeyZ0LFORyfRhrhcRjuPFJmeZX418roC9Fr7XOv0KW
	1MhVpwVVmQq2ypXQ2l72wKfPWbYk0ypWklfP7ghg22DX8agkaSRQ3+EyxqWifa0xWQCCKa5bddYtt
	KmavKZZG4GKTunJvm8fP3IZY2fhJJRYKuWdgcolXGliSnHCHK+EUMI9aQrcsKsSTnKk1BtO+mGQ7U
	KyAh93jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJsr-00BMiW-4K; Tue, 07 Feb 2023 09:03:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJsg-00BMg1-Ve; Tue, 07 Feb 2023 09:03:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FF21660206B;
	Tue,  7 Feb 2023 09:03:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675760593;
	bh=VuZqdr7n7xEXZB2d/3Tch4hTmLWr+acY4x8KfnIz+Rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SSQhTqEygzg5uzZ50NmQK4QcjdMiB4BGLRNXDEyOCteBQHcWfawePtwxw3UcP8+7r
	 gv6esvDmwVM3HvUZA9nvvy9qmOXAxnqtp9zS9+Vle3b/TApa8yr3WzIfaigQ2XgIFB
	 T4K1GjCDtHVZoBB02oH4X90o1+0tko2cpOLx+EZ0kGQhf2HlObRapZVl0KraHm8Cpc
	 IE1gPdz9t1CBzetVKqN5GcQp7mlBvcPC25Y2ioop6PAzwC5zqTJtIywRRDzhEsZcZm
	 uG1HDjLBI7JtZVuXhkmRZMm/9SPoqU3HKUIrH6EMhcgeMuP9lomNU0TLUe4blVW86y
	 5DxxHEcBDUASg==
Message-ID: <490f5fc6-d73a-40a5-5205-354d5bf844f3@collabora.com>
Date: Tue, 7 Feb 2023 10:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 33/45] clk: mediatek: Switch to
 module_platform_driver() where possible
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-34-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FjV4WdJcjtT_VXC3W02noPC9+qVGv=FVW6UmPXSeqksQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FjV4WdJcjtT_VXC3W02noPC9+qVGv=FVW6UmPXSeqksQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_010315_182141_1FED2D67 
X-CRM114-Status: GOOD (  16.18  )
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

Il 07/02/23 07:37, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Lots of clock drivers have got both .probe() and a .remove() callbacks:
>> switch from builtin_platform_driver() to module_platform_driver() so
>> that we actually register the .remove() callback.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [...]
> 
>>   drivers/clk/mediatek/clk-mt8195-vpp0.c         | 2 +-
>>   drivers/clk/mediatek/clk-mt8195-vpp1.c         | 2 +-
> 
> These two conflict with "clk: mediatek: remove MT8195 vppsys/0/1 simple_probe".
> Since the rest of the vppsys stuff has been queued up, I'd like to see
> that one get merged first so we don't have two drivers matching the same
> compatible string.
> 
> This conflict also causes the last "clk: mediatek: Add MODULE_DEVICE_TABLE()
> where appropriate" to not apply.
> 
> ChenYu

Yes that makes a lot of sense - this series is really big, so let's get the
8195 vppsys stuff merged in first.

I'll rebase on top of that for v2.

Angelo

