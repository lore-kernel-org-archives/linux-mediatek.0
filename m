Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8E1CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFgOTY+WyM3Sel5YzAdYiKNG5JFSyMH2ZYWa9kVlC/Y=; b=4bdoEavrbyNMUuFHCA5obQ5skc
	jUAPRlh/dSA2rYfim3YivzA1PKamU14i0og1QrfWzQAorGHL1nqaqrU2v5qUWiYnh1FLxW1ZV5yvV
	S7a/X5/U/YElfpEwEmC0k6ChNlgI1WurueqYMpzXM7dpd26kEaYca9nHmf0HSijs+z9qYRI4AYjvL
	z26/IjGYAx1pmxWzQBW0ZQO15vsPNN8z6U23vMb2vRrfRjZ6JF2IgmLK6Lo7f0MbWC47KstlxfB7z
	Xcp9V7nHkHp1PJn0gVrhxWYjpjQCce0LBWTgdZdMivjsbdYe0vSicqL/8jnRX4kTTfREIZEqKg670
	BSCLuxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzp2-002lc0-1z;
	Tue, 12 Sep 2023 09:36:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzoz-002lZn-0r;
	Tue, 12 Sep 2023 09:36:38 +0000
X-UUID: d9d8bd54514f11ee86758d4a7c00f3a0-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gFgOTY+WyM3Sel5YzAdYiKNG5JFSyMH2ZYWa9kVlC/Y=;
	b=lH1/7POOlR828hKTVT3UB5PK5odJwmefLVO9zbS4/e6Lk1GRtMx34CxK1E24gmFyfxoKV3Z6hE4qRnweXU5iZZbORf2WUX50fTMlaLgmqVpsXfZPj+aSQL75xKnPdoNd4+sVekwi+3cPtI4jL8/blqvSCzg5ykqX0+5TJ5STDDs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:792c785f-bcdb-476a-ac25-ce028614cdaa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:c4839aef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d9d8bd54514f11ee86758d4a7c00f3a0-20230912
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1969837080; Tue, 12 Sep 2023 02:36:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 17:36:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 12 Sep 2023 17:36:24 +0800
Message-ID: <6f67c0f6-7a4d-46a9-4090-b4966ad9eb9e@mediatek.com>
Date: Tue, 12 Sep 2023 17:36:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: mt8365-evk:
 update compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
References: <20230912072340.22862-1-macpaul.lin@mediatek.com>
 <22805138-e42a-cdd0-bc96-5281f0e2c586@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <22805138-e42a-cdd0-bc96-5281f0e2c586@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.987500-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r+hz2wcuk4da+E45fdyyZXA9lly13c/gEW40XiUkbrG5gEXULQnZA+UpN
	5b4Xd/F0F3HJtKgmToNt9i45mMISqupptyy2mu+6L+98BLtDce4B84MMvKleanQqircTOm4dvlt
	Sm4q5U290mpA1Khc2MPbozLN3Sos0iXL+V+zm5ieYAh37ZsBDCfS0Ip2eEHny+qryzYw2E8LLn+
	0Vm71Lcq7rFUcuGp/EgBwKKRHe+r0k4tYvooJZyctm6a6Al36gvAINoF1zxWn7Jax9xsZ7RfNpH
	DESlTro=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.987500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2EC6181C9494BFFA8AEFEE02C3C52A803EFDBBD3FD0115827944A2EC921DBBEE2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_023637_303798_2B4E2E51 
X-CRM114-Status: GOOD (  19.48  )
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

On 9/12/23 16:08, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 12/09/2023 09:23, Macpaul Lin wrote:
>> Fix compatible of 'mediatek,mt8365-evk' from 'enum' to 'const'.
> 
> What is there to fix? There is no bug... please describe why you are
> doing changes.
> 
>> 
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> change for v2:
>>  - rebase this patch to follow the v5 patch set of mt8395.
>>   - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
>>  - Fix description as a single board.
>> 
>> changes for v3:
>>  - rebase this patch to follow the v6 patch set of mt8395.
>>   - depends on https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
>>  - drop "Fixes:" tag in commit message.
>>  - drop platform description update for mt8365-evk (Genio 350-EVK).
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index 2e8ad49c3479..bab4fa0e8199 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -245,7 +245,7 @@ properties:
>>                - mediatek,mt8183-pumpkin
>>            - const: mediatek,mt8183
>>        - items:
>> -          - enum:
>> +          - const:
> 
> Obviously this was not tested... Please test before sending.
> 
> Best regards,
> Krzysztof
> 

I'm sorry, will be fixed in v4 with dtbs_check test.

Thanks
Macpaul Lin

