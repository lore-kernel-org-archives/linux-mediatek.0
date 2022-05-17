Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF49CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19JWfCEuo8jCC61Lkotc01TC4+Vqm/+PAE7RcJmMxCQ=; b=hZH7nevqiV9Vyn
	QB5Vz/33onB5wGZzSgcv2Ci+ErDnfB4qngVfLklsVi0cx+4PTHdEI8ogNI3qRAG82FuPVyzKSsQj1
	CcfwDX0Iwi5dELobcZBuyn0Py/0AS/9Y+gM3g8LUqt8D0aG+ua8c+id6UOoIlVCl18UJWBsSFL9/a
	j/uPrTBO02UTFm4/qkkifku8QZUYGM7gAprOZ68kd1c3uuaHMVII69bRY0rCSzYVhPcgYQGVLho6P
	z/QoNLQ2iQl7GFhyz+bOAQWKUcGacu7LUYS31G7hF5zXBF5lNm3CSzl+OI2Qi4+xXL+qLc04Y7p+g
	9yi4Kzj6+dwC9ILHZkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqsYH-00CScz-Ar; Tue, 17 May 2022 08:27:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqsY5-00CSa7-Gu; Tue, 17 May 2022 08:27:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 422D71F44233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652776040;
 bh=tE2Neszj+y3O1cmeD6vmFcKg7q+eIA8I1b4UnVOkoE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BJL5v0bhuVFvcCQ25D+0pK3NIga8y2Un6h5uMhfxH1hCPQs3rOACMYkyuhdftODMA
 smu6iAvegiNflzFCbuhqFT/2s31v5ZA9YoWy0ljjT7HESoXXPDOzz/j74fbRRlC0wF
 gvjgdD2Ix8DZ9LK+lSBwINqwPj0l7qzi47HqevxeFw0jg2gHOvqokYwxH3xxjc5SBb
 iE0py6i4qoCiLcxX8ZMESLn5YDM4s+PlUQIiH26CJucIwb7ph6qrj1dcIzie6lp3Yn
 nJU/CaP4iR5oHkZ/SNghJwxsrkTGw296rc5WWsPV+U713IMpxtoohYuiH7PixO4KBV
 ah5V4clhlBlRw==
Message-ID: <f222e1c5-4ce1-a42d-ceef-a292136d8b61@collabora.com>
Date: Tue, 17 May 2022 10:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, wendy-st.lin@mediatek.com
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
 <cf2442b9c7124ebf1ce62ae5df597f003fa447d7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cf2442b9c7124ebf1ce62ae5df597f003fa447d7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_012721_876205_00305589 
X-CRM114-Status: GOOD (  23.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/05/22 08:37, Yong Wu ha scritto:
> On Fri, 2022-05-13 at 17:06 +0200, AngeloGioacchino Del Regno wrote:
>> The MediaTek Helio X10 (MT6795) SoC has 5 LARBs and one common SMI
>> instance without any sub-common and without GALS.
>>
>> While the smi-common configuration is specific to this SoC, on the
>> LARB side, this is similar to MT8173, in the sense that it doesn't
>> need the port in LARB, and the register layout is also compatible
>> with that one, which makes us able to fully reuse the smi-larb
>> platform data struct that was introduced for MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/memory/mtk-smi.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index 86a3d34f418e..7e7c3ede19e4 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -21,11 +21,13 @@
>>   /* SMI COMMON */
>>   #define SMI_L1LEN			0x100
>>   
>> +#define SMI_L1_ARB			0x200
>>   #define SMI_BUS_SEL			0x220
>>   #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
>>   /* All are MMU0 defaultly. Only specialize mmu1 here. */
>>   #define F_MMU1_LARB(larbid)		(0x1 <<
>> SMI_BUS_LARB_SHIFT(larbid))
>>   
>> +#define SMI_FIFO_TH0			0x230
> 
> Does the name come from the coda you got?
> It is called SMI_READ_FIFO_TH in my coda.
> 

Documentation for this SoC is not public and I have no access to it, so
everything that you see here comes from reading downstream kernel code :-(

I'll change the name to SMI_READ_FIFO_TH as suggested, thanks!

>>   #define SMI_M4U_TH			0x234
>>   #define SMI_FIFO_TH1			0x238
>>   #define SMI_FIFO_TH2			0x23c
>> @@ -360,6 +362,7 @@ static const struct of_device_id
>> mtk_smi_larb_of_ids[] = {
>>   	{.compatible = "mediatek,mt2701-smi-larb", .data =
>> &mtk_smi_larb_mt2701},
>>   	{.compatible = "mediatek,mt2712-smi-larb", .data =
>> &mtk_smi_larb_mt2712},
>>   	{.compatible = "mediatek,mt6779-smi-larb", .data =
>> &mtk_smi_larb_mt6779},
>> +	{.compatible = "mediatek,mt6795-smi-larb", .data =
>> &mtk_smi_larb_mt8173},
>>   	{.compatible = "mediatek,mt8167-smi-larb", .data =
>> &mtk_smi_larb_mt8167},
>>   	{.compatible = "mediatek,mt8173-smi-larb", .data =
>> &mtk_smi_larb_mt8173},
>>   	{.compatible = "mediatek,mt8183-smi-larb", .data =
>> &mtk_smi_larb_mt8183},
>> @@ -541,6 +544,13 @@ static struct platform_driver
>> mtk_smi_larb_driver = {
>>   	}
>>   };
>>   
>> +static const struct mtk_smi_reg_pair
>> mtk_smi_common_mt6795_init[SMI_COMMON_INIT_REGS_NR] = {
>> +	{SMI_L1_ARB, 0x1b},
>> +	{SMI_M4U_TH, 0xce810c85},
>> +	{SMI_FIFO_TH1, 0x43214c8},
>> +	{SMI_FIFO_TH0, 0x191f},
>> +};
>> +
>>   static const struct mtk_smi_reg_pair
>> mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
>>   	{SMI_L1LEN, 0xb},
>>   	{SMI_M4U_TH, 0xe100e10},
>> @@ -565,6 +575,12 @@ static const struct mtk_smi_common_plat
>> mtk_smi_common_mt6779 = {
>>   		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
>>   };
>>   
>> +static const struct mtk_smi_common_plat mtk_smi_common_mt6795 = {
>> +	.type	  = MTK_SMI_GEN2,
>> +	.bus_sel  = BIT(0),
> 
> Like the other larbs, use F_MMU1_LARB(0) here?
> 

I agree that F_MMU1_LARB(0) == (1 << (0 << 1)) == BIT(0), but that would
not be correct and induce other people to mistake, I think?
Downstream doesn't do MMU1 bits, but MMU0 in this case... but if you can
check on internal documentation and confirm that the downstream kernel's
logic is wrong on that - and that you've verified that this should indeed
be F_MMU1_LARB(x), you'll get a big(bigger) thank you from me :-)

Meanwhile...

Thanks!
Angelo

> 
> After the two changes,
> 
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> 
> Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
