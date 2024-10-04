Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A70BCFA751
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKwcQTdi1z6XfJ8YlR6rEfMwt8LTLhlGfQB2vS/hKN8=; b=IzEY+onJuAJvtuSNk76TnFZEM8
	/aeNXZn1ZaTZ6fFE2n85f4abQkxOliVqpsIsw5XIpd46CC44WjkadObGlCyhMJ0D0RIN4zimJmez2
	WT5g1wTqVkH578po60SVv50RfTtfDWRq3nBMlSLx6QToNYWrCEFqTPSwCzHg4UPsG+FhXWYTyDq5f
	VX9RtXP+uEx9Xv/CTZdUVx5vbmlUCBRUmU0NwUws2IZlXnbod4zAZ0M/v/pcsEUyttaQrN59CRpQu
	gTE/Y/IAuVPhYzS7ri6s+PpxyTfH7L7n9gZ0y8sZVBj1fWOxiBo8ApGTOsnx4oSHrGWJTESqQJCt9
	Sun3yINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdsc-0000000BRlb-43mO;
	Fri, 04 Oct 2024 08:41:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdrL-0000000BRXJ-0cVQ;
	Fri, 04 Oct 2024 08:40:25 +0000
X-UUID: 4913758e822c11efb3adad29d29602c1-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=sKwcQTdi1z6XfJ8YlR6rEfMwt8LTLhlGfQB2vS/hKN8=;
	b=YgBYMD1fRUnkI/89E+ASjzC8doSN3zYbu7/pziuMZfjYLrCS9QbqmK8G6vUW6BF7eTvhw+rgX0up3+ZnyQS++yJ+EV2jTsoQBwIj2z+32GAq+HJ4tcw6ewIpsitn6H/HIdHqqoVKwTh1VwLYUs4kfNYoTrM94oCxZFbKmWUutpc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c7365d5b-3d63-42d9-9d39-29edc75b28c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:335ebf40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4913758e822c11efb3adad29d29602c1-20241004
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1880854117; Fri, 04 Oct 2024 01:40:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 16:40:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 4 Oct 2024 16:40:10 +0800
Message-ID: <b07db9a3-62c1-f0e6-33db-98999a517c3f@mediatek.com>
Date: Fri, 4 Oct 2024 16:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: power: mediatek: Refine multiple level power
 domain nodes
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek
 Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
References: <20241004074938.6571-1-macpaul.lin@mediatek.com>
 <CAC=S1nhW7ervk-b31mxtx_c-KUeLuC0P_Yr=9jtumUXAm6AZ_A@mail.gmail.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <CAC=S1nhW7ervk-b31mxtx_c-KUeLuC0P_Yr=9jtumUXAm6AZ_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_014023_221550_FDAAFC9A 
X-CRM114-Status: GOOD (  14.78  )
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



On 10/4/24 16:24, Fei Shao wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Fri, Oct 4, 2024 at 3:53 PM Macpaul Lin <macpaul.lin@mediatek.com> wrote:
>>
>> Extract duplicated properties and support more levels of power
>> domain nodes.
>>
>> This change fix following error when do dtbs_check,
>>   mt8390-genio-700-evk.dtb:
>>     power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30:
>>     Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32'
>>     were unexpected)
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index 8985e2df8a56..a7df4041b745 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -54,6 +54,10 @@ patternProperties:
>>              patternProperties:
>>                "^power-domain@[0-9a-f]+$":
>>                  $ref: "#/$defs/power-domain-node"
>> +                patternProperties:
>> +                  "^power-domain@[0-9a-f]+$":
>> +                    $ref: "#/$defs/power-domain-node"
>> +                    unevaluatedProperties: false
>>                  unevaluatedProperties: false
>>              unevaluatedProperties: false
>>          unevaluatedProperties: false
> 
> For reference, I sent the exact same patch and it's been acked:
> https://lore.kernel.org/all/20241001113052.3124869-2-fshao@chromium.org/
> 
> Regards,
> Fei
> 

Thanks for the reminder.
This patch could be dropped by duplicate works.

Regards,
Macpaul Lin

