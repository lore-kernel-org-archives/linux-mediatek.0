Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24070C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gww5730AIS5my3DaZyyra2jli29IXOhsN7YnHTErT4=; b=VNimtO5MMaE8l7i0G5oPXhTgj6
	WDMmv6gQCU0KHkn20HXX22wsQSwqqJWbu2ZGWS3pnHlj0Rq5svlzCkjDtIiVS2JBJqzmweo97aBoQ
	URMq2C4s8vZbFR0Kx34KJkhe6Jflcay59cxcrcecIbhRWvTFRr/ecazHOvSlYOTcEbVIOc3rgEOAx
	4G7pemI3H/vOYvNQ0elPNpijFI4HnISegA/8WBiSC8Q85PnjjdZSI5Dss6ZCbHU6eVQ+VSXrkCgBX
	fE5D0dKYN3X99Sfk8aEdLr1PBBX/b5HF19dPtvxg+6eZEr/3aUyCkXgxC5yLTKrUoag8un/gFI+PZ
	CevH+4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQUB-007VP1-Vk; Tue, 21 Feb 2023 11:07:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQTz-007VMN-Ml; Tue, 21 Feb 2023 11:06:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20996660087C;
	Tue, 21 Feb 2023 11:06:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676977608;
	bh=PMnNGjPvWftnPBnMRvQt50qzmTHbAhshh3s2urxuXwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eUyminmoBQKwOMgFYfsku8UgYGtzivSZAatwk2TUILx4JcfaZCGhc9o/vMpZD/uUu
	 P5/ZsGU8+WXaDz4WVXyjFr2ytyStSTvgGq5050n7D++vPdPp2RwVLRyjKLWdrTl4k+
	 pclKrO6otdKc6mx56gLFJDKIgSNMiuHOHOO8TxdKljbgieN5bAEfyC3l9Q8oGiFCeH
	 RpffElpyxAmTirjQdKcgNkOJLL2vYm35JfuyhACyLbTZhFtSmNxCONKq9gGTfkHUYp
	 mOivYiessym9uWjAv4UrGs3otnsTxfdxBKCeVyyPn6MOihSEKvPXcnNtmyTpOuZQdq
	 d8v63Rz/MocTQ==
Message-ID: <6dd97011-9ea1-6276-6589-9dd97ccff8d6@collabora.com>
Date: Tue, 21 Feb 2023 12:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 39/55] clk: mediatek: Split MT8195 clock drivers and
 allow module build
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
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
 <20230220150111.77897-40-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Eztv3RuXPXSYFd2qH_Wd18OcLNaqO+Lcp4hytjkBarfA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Eztv3RuXPXSYFd2qH_Wd18OcLNaqO+Lcp4hytjkBarfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_030651_920978_33723107 
X-CRM114-Status: GOOD (  17.64  )
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

Il 21/02/23 04:53, Chen-Yu Tsai ha scritto:
> On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
>> option: there's no reason to do that, as it is totally unnecessary to
>> build in all or none of them.
>>
>> Split them out: keep boot-critical clocks as bool and allow choosing
>> non critical clocks as tristate.
>>
>> As a note, the dependencies of VDEC/VENCSYS and CAM/IMG/IPE/WPESYS
>> are not for build-time but rather for runtime, as clocks registered
>> by those have runtime dependencies on either or both VPP and IMGSYS.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Kconfig  | 100 ++++++++++++++++++++++++++++++++++
>>   drivers/clk/mediatek/Makefile |  20 ++++---
>>   2 files changed, 113 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>> index 45b7aea7648d..49919da2be26 100644
>> --- a/drivers/clk/mediatek/Kconfig
>> +++ b/drivers/clk/mediatek/Kconfig
>> @@ -692,6 +692,106 @@ config COMMON_CLK_MT8195
>>           help
>>             This driver supports MediaTek MT8195 clocks.
>>
>> +config COMMON_CLK_MT8195_APUSYS
>> +       tristate "Clock driver for MediaTek MT8195 apusys"
>> +       depends on COMMON_CLK_MT8195
>> +       default COMMON_CLK_MT8195
>> +       help
>> +         This driver supports MediaTek MT8195 AI Processor Unit System clocks.
>> +
>> +config COMMON_CLK_MT8195_AUDSYS
>> +       tristate "Clock driver for MediaTek MT8195 audsys"
>> +       depends on COMMON_CLK_MT8195
>> +       default COMMON_CLK_MT8195
>> +       help
>> +         This driver supports MediaTek MT8195 audsys clocks.
>> +
>> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
>> +       tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
>> +       depends on COMMON_CLK_MT8195
>> +       default COMMON_CLK_MT8195
>> +       help
>> +         This driver supports MediaTek MT8195 I2C/I3C clocks.
>> +
>> +config COMMON_CLK_MT8195_IPESYS
>> +       tristate "Clock driver for MediaTek MT8195 ipesys"
>> +       depends on COMMON_CLK_MT8195_IMGSYS
> 
> This should also be moved to just after IMGSYS.
> This is the only one that is not ordered right, so after it is fixed,
> 

Big embarassing oops. Done for v4.

> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Thanks!

