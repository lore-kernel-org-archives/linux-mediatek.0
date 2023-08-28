Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092FFC71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRXDdDGfcw2VGrYOWIzRIFvqKbDeBV/O8IucKucUEhk=; b=RFr1oxq3mh3RjuQGAyIvyLaGQ+
	+JlwNd2XYg9XYdWTjRAvVmuXVH1qhdKfQPs8amavKSd+jXPTssgfF3mWszadq8/W7ANEQRHXXGSHb
	4EmqwoaHkQGheIqIcXtKAPzwT+VAjRh6TgSIBKmRhk02otvnMIcgMDXNRN7/RtDtB2EqtagcfmGwU
	75OTzaGi2FJmrbNGSHsjDRkbS+VstNvztmVSZNpQ9rnihRmpSpbgUMw/v7r++TIhyWkwB17TxNa/Y
	3ItT7Pru0GeToLJ1HljaSOB4YtVZ2homzB/X5dzxxgB4DVtjhHCzi1pGFKTN+T7HBj+0y2HsUnWJT
	NBLvbkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZR9-009Pai-1C;
	Mon, 28 Aug 2023 10:25:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZR6-009PXB-3B;
	Mon, 28 Aug 2023 10:25:34 +0000
X-UUID: 34ddfd14458d11ee912e1518a6540028-20230828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=jRXDdDGfcw2VGrYOWIzRIFvqKbDeBV/O8IucKucUEhk=;
	b=K1YcmgA64iHvkZcGitOm1UcHqs7QSDmEObVDCBKZZ+Xar05GiRgEZzDeUQX9kYXG2+z3KFl8TnNxzwg3Sobcdm0ha2RQ5+kenMI3dKN7zZnIhh92cmZzbBr+ylWu+nkt5etHZ0ZZyxRCMl/L7HX7ZzDsSUt0gvtWjN/dbQVgvZ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:d186aee1-faca-4d42-9790-8e8824d16e3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:5d2e4513-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 34ddfd14458d11ee912e1518a6540028-20230828
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770603796; Mon, 28 Aug 2023 03:25:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Aug 2023 18:25:24 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 28 Aug 2023 18:25:24 +0800
Message-ID: <35d2fd6a-167b-8df8-aa61-b40aa7224e3c@mediatek.com>
Date: Mon, 28 Aug 2023 18:25:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] spidev: add compatible string for MediaTek IoT (Genio)
 boards
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
CC: <angelogioacchino.delregno@collabora.com>, <bear.wang@mediatek.com>,
	<broonie@kernel.org>, <chunfeng.yun@mediatek.com>, <fparent@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<macpaul@gmail.com>, <matthias.bgg@gmail.com>, <pablo.sun@mediatek.com>
References: <20230828080909.16610-1-macpaul.lin@mediatek.com>
 <20230828093326.3255275-1-mwalle@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20230828093326.3255275-1-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_032533_035150_A8EEAF6B 
X-CRM114-Status: GOOD (  13.59  )
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

On 8/28/23 17:33, Michael Walle wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> 
>> Add compatible string for MediaTek IoT (Genio) boards.
> 
> This has already be discussed [1] and was naked.
> 
> https://lore.kernel.org/lkml/20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com/
> 
> -michael

Thanks for the reminding, I'll check previous discussion thread.

>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   drivers/spi/spidev.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
>> index d13dc15cc191..9d7952dbbaa6 100644
>> --- a/drivers/spi/spidev.c
>> +++ b/drivers/spi/spidev.c
>> @@ -714,6 +714,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
>>   	{ .name = "spi-authenta" },
>>   	{ .name = "em3581" },
>>   	{ .name = "si3210" },
>> +	{ .name = "genio-board" },
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
>> @@ -742,6 +743,7 @@ static const struct of_device_id spidev_dt_ids[] = {
>>   	{ .compatible = "semtech,sx1301", .data = &spidev_of_check },
>>   	{ .compatible = "silabs,em3581", .data = &spidev_of_check },
>>   	{ .compatible = "silabs,si3210", .data = &spidev_of_check },
>> +	{ .compatible = "mediatek,genio-board", .data = &spidev_of_check },
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, spidev_dt_ids);
>> -- 
>> 2.18.0

Regards,
Macpaul Lin

