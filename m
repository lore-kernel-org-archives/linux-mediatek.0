Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EA5C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diVbxx203IJGIrnKY6E0lfW1qYDGb4mOEMWZeEVnrPA=; b=E2UZfrC/17qK10O0HWTNn4KwLT
	Vy3jRdtB9dNBFalrJqpLUVdsNmfH0d7gmJh9zOkyFU9XZ1cshdKjlYmSJXwZ/nG4RcZIx/KiU4IN1
	qT0zTJGGbpCDlXD/erQnio5J90MDti+airM46GiORaWn035QeIJtu3O9jSMo0T4cZUEMu+N6s+7ue
	hS7atMeeaJ8vtFSGoZKUyRm7lTkecDNb0cceUfh0e98R0FqBUkrKtBm+SuscypFuUOgPBTkBkMYYc
	7kKp3G0R2dr/GbVsUUPDcF8rFzNvvP3qxH8exrSFnaSajEltkxThxzgkClhSlVB5jeFDBsg18MZwF
	KJr5sTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSylu-00Dttd-FD; Fri, 17 Feb 2023 11:19:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSylY-00Dtjw-Ri; Fri, 17 Feb 2023 11:19:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 780AC660212C;
	Fri, 17 Feb 2023 11:18:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632738;
	bh=SK5YF4VJ5EozXIVUN6qmnCrFlh18Ax8TQqauGjRXIGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WMyE8gviyZndoO2l8tpuskyHMQ2zeb8xNOuaCrpD4DDz+XXhwouR/u4ihRVForz3G
	 1eVJZPom2MjwqK51ftNdhkAccq9aKziiF/9sEQODFrRA/cGww2o3zyQ8mViV4UaCpN
	 mhmFpGWEKiE7y/LDTSW3ImDAxziUzqo5ry3ztMpHbsy1+2y0THrbG7LgMbxhXOsnGz
	 7+kfGsrrIOOwqmHVT3KdVgLOabyLTpqlf/4Cadmm+lPtX8Cs9clMyFeJaRLPNjaVPx
	 zl0leqSafApgLfbUvCmh4TLJlQFHa414xFXgarx5fw4j5p8zy7BF3Ar7m9ugoPlxVH
	 Zays9ND768Pfw==
Message-ID: <6ed4ca9f-bb75-2698-6c8a-2008b1320570@collabora.com>
Date: Fri, 17 Feb 2023 12:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 34/47] clk: mediatek: Switch to
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-35-angelogioacchino.delregno@collabora.com>
 <CAGXv+5E3KCRyaRpkYab0XmT8XDZQO21RYBpKVgCcGtWmZ+dv3g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5E3KCRyaRpkYab0XmT8XDZQO21RYBpKVgCcGtWmZ+dv3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_031901_093275_619630AD 
X-CRM114-Status: GOOD (  14.19  )
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

Il 17/02/23 05:19, Chen-Yu Tsai ha scritto:
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Lots of clock drivers have got both .probe() and a .remove() callbacks:
>> switch from builtin_platform_driver() to module_platform_driver() so
>> that we actually register the .remove() callback.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt2701-aud.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-bdp.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-eth.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-g3d.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-hif.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-img.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-mm.c           | 3 +--
>>   drivers/clk/mediatek/clk-mt2701-vdec.c         | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-bdp.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-img.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-jpgdec.c       | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-mfg.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-mm.c           | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-vdec.c         | 3 +--
>>   drivers/clk/mediatek/clk-mt2712-venc.c         | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-audio.c        | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-cam.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-img.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-mipi0a.c       | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-mm.c           | 3 +--
>>   drivers/clk/mediatek/clk-mt6765-vcodec.c       | 3 +--
>>   drivers/clk/mediatek/clk-mt6797-img.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt6797-mm.c           | 3 +--
>>   drivers/clk/mediatek/clk-mt6797-vdec.c         | 3 +--
>>   drivers/clk/mediatek/clk-mt6797-venc.c         | 3 +--
>>   drivers/clk/mediatek/clk-mt7622-aud.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt7622-eth.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt7622-hif.c          | 3 +--
>>   drivers/clk/mediatek/clk-mt7629-eth.c          | 1 -
> 
> This one looks fishy. It wasn't converted to the simple probe library.
> 
> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


Oh wow. Thanks for making me notice. Yeah you're right, mt7629-eth was not
converted to simple probe.... and I need to split sgmiisys and sgmiisys1.
This means that I need to change bindings and devicetree to add a new
compatible "mediatek,mt7629-sgmiisys1".

I won't do that in this series as I don't want to spam this huge amount of
patches to the devicetree list... but I'll do that as a separated series
that depends on this one.

So, for this one, I will simply drop the mt7629-eth change (as it's useless).

Thanks again!
Angelo

