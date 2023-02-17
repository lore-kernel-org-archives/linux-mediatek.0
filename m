Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DE4C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMHk9zfTnHqTqtiJZuw4eK9TicmsC5Psbvh/IR3cFZw=; b=xxL2NczR3q58zV/M1oml/YE0kz
	mNOeaImtOPedSp/+8X3fxkQiRuQfFh7onRqBWToHLa7JdtwrvYoK00ufCexQ2UqTSLONONPbnbZzj
	1Um6kXiPnMfWkcFqNwmbI/TBRBy36F+crxaivsnIISD2OwxBAOT8XkFuRRm0of0L6VC4qoMfFUxLp
	fXdC3cuSrW9CA100B4x252LMCnQOP1xcX++tnSld+PmmZvE+2g9zNXCPGbwFiDlnuCyxncS4wg8Jk
	c9UxsixYnhvE/Nv5ZT6L3sfXXELIVBoQi10tEeFXmN8tlyiFGXdfqg9R/hK6dde+MaUjKCRolkPQ1
	JOFpVhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSysI-00Dvx5-65; Fri, 17 Feb 2023 11:25:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSys4-00DvtG-Qa; Fri, 17 Feb 2023 11:25:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ECB78660212C;
	Fri, 17 Feb 2023 11:25:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676633143;
	bh=4B8vcRp+/G7dib7UnrzeCjN2VVDp840D9A86W/R5f4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aY83TVk19/9m6Yy4p4ed8gGcHeO+HVvphEoUmEMIa3ApIJ7V3WNAAo37XKCznH8nE
	 8VwH45CLKV2R8/flxPH3AFTX+9Jo0jiUTkmYFOv62RjgUgIS8V0uWMipYcdubKTkw5
	 7/HBHyMz44hGcf4yhLrZdVY60/s7pCATwNSn+BBG4PEucoKTcXk8e3SgKomK9iwv2T
	 5aK8weNwvjW6SqDaQYCKQhdMzKevLjDhoOcHVNDJWeF0OFUaoCRf/5130JbhdD8FO/
	 5fyozGcXlj1dbugFtn67eBwYK3DuWO2nMNvzVxk9ve18XgdlVShEI6ju7bZdIO/tE/
	 bJ9Ch2qYJAK/w==
Message-ID: <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
Date: Fri, 17 Feb 2023 12:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
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
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_032545_053066_4A0AFFB1 
X-CRM114-Status: GOOD (  16.61  )
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

Il 17/02/23 05:24, Chen-Yu Tsai ha scritto:
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> All of the mt2712 drivers have been converted to platform drivers!
>> Change the Kconfig options for all MT2712 clocks to tristate to allow
>> building all clock drivers as modules.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Kconfig | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>> index b9c0a9e21cf1..45b7aea7648d 100644
>> --- a/drivers/clk/mediatek/Kconfig
>> +++ b/drivers/clk/mediatek/Kconfig
>> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
>>            This driver supports MediaTek MT2701 g3dsys clocks.
>>
>>   config COMMON_CLK_MT2712
>> -       bool "Clock driver for MediaTek MT2712"
>> +       tristate "Clock driver for MediaTek MT2712"
> 
> Hmm... How does that work out if mt2712-apmixedsys is a
> builtin_platform_driver?
> 
> ChenYu

That doesn't. Thanks for catching that, I've added a .remove() callback
and changed it to module_platform_driver() for v3!

Cheers,
Angelo

