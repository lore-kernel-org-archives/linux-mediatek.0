Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC493C83F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIe7sbzhr8pclxwbNUsUe49QcjNI1ozgaMNN0nDCuPo=; b=htKDCJAa0PgIqsNvvePcXFY2kv
	/8g5cl+021v+FRcbNVmGg12/3dBj3eRrooSD5eZmruef/mb3cbhn2cRGY8JOhYYVuLbtx4Pdw96Sx
	UYPSSRqwOI233ew5rwPnbpLfFG5t61POse0m5VyqiTF4rs60J3479gL0PYkcaurzHE+CELZQFqgo/
	pyRB588vovMr2RpAdyGb3MxhpQo4pysxSVbNiOT8OnvQ1v0e2XYlZfdTk19Jq0obEpqMN3w3kkg5+
	tQ1pLKSTSXhA/anY9XeFKHJe9L4Q4A7hNWRevcDg7zyIckAYO4JYgFgngnIq9aqYaRBMVuCDMqPYF
	VRY0gDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbaI4-00Egp6-1c;
	Thu, 31 Aug 2023 05:32:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbaI0-00Egn7-2Z;
	Thu, 31 Aug 2023 05:32:22 +0000
X-UUID: bc1adbce47bf11ee83ed1395ce914268-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=KIe7sbzhr8pclxwbNUsUe49QcjNI1ozgaMNN0nDCuPo=;
	b=A91S28/WjW2FJ3wfdi5SmOKt8er1oh/JyCxWPTBgijxqZPgkqleibKznw8lJp8Mq/ZLwyQVvF7GyqSnrCwBzME4Ey68WP1X71ZrH+Vdm/MQjSpWRIB82cIC0HAV4n04l9A828a+h+nwsPseLa+Ir/r+5+Wrofxz0R8WCNKiwAQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0c285cee-e3a3-44ac-9572-93f53eea8ecb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:09e479c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bc1adbce47bf11ee83ed1395ce914268-20230830
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737313250; Wed, 30 Aug 2023 22:32:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 13:32:08 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 31 Aug 2023 13:32:08 +0800
Message-ID: <39c24e4b-6ef7-6891-3292-b73fada9f252@mediatek.com>
Date: Thu, 31 Aug 2023 13:32:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360
 related nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien
 Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-3-macpaul.lin@mediatek.com>
 <7cba182f-2b35-84e5-16c7-770a6aff5062@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <7cba182f-2b35-84e5-16c7-770a6aff5062@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_223220_843528_44C85E93 
X-CRM114-Status: GOOD (  14.47  )
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



On 8/30/23 19:20, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 30/08/2023 13:15, Macpaul Lin wrote:
>> +
>> +led {
>> +compatible = "mediatek,mt6360-led";
>> +};
>> +
>> +regulator {
>> +compatible = "mediatek,mt6360-regulator";
>> +LDO_VIN3-supply = <&mt6360_emi_vddq_buck2_reg>;
>> +
>> +mt6360_emi_vdd2_buck1_reg: buck1-emi-vdd2 {
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/  <https://urldefense.com/v3/__https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/__;!!CTRNKA9wMg0ARbw!nP-6nVffZXG2NCdjcl06my5g9HAohnT-GF-EIGrMWpegsBvwmqgOjfVQba5Ub13z_AWAJwGOlsQ3DSIWGo0ojHlPvDZ74WE$>
> for instructions).
> 
> Best regards,
> Krzysztof
> 
> 

Thanks for the review.
Since next patch 4/4 of the patch set to modify mt6360 nodes in
mt8195-demo.dts is no longer required, please drop this patch, too.

Thanks
Macpaul Lin

