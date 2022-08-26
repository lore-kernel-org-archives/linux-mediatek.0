Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC74ECAAA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 02:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:CC:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpBdRJBBzq6P5ZQ16LVd+gkiupvyrupsuxc/Ajvy418=; b=A4C8eH7P31TIX2CI7+gVEAf+ry
	cj4oZ1kTi12T2ZbmF7fESKeIlhIfKze+z4J1lhKRZD69HKP2aViVn1N/TxuGZl1Ucsp3vJZZaknVn
	daq5klmHhpVLuwq5zOit72NNdfC/j82EsZwz0UVk0yFDINY+xkU21r9QjTiWR7n2XoEXahtV5I1QR
	x3nL50T6KjNIbu46AIMljbNOwaA6NhJxw/2D0cwnOb85FY3j0SzWW+Mf8+jdn1BCuPkcJpCZkdGTw
	NrYF6il8oaKXQubR76igCujWJcbAjMFeHGX2qKnuzpxasYLdeIAkP7OlcWIBrS1YXdw0gYhgYrIJ1
	DS/K2mnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRPAS-005Iga-Jp; Fri, 26 Aug 2022 02:34:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRPAH-005IbR-2m; Fri, 26 Aug 2022 02:33:46 +0000
X-UUID: 2bb665a0d34a4080b6dac0f4ecf2b4ff-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:CC:To:From:Subject; bh=JpBdRJBBzq6P5ZQ16LVd+gkiupvyrupsuxc/Ajvy418=;
	b=dYDXwVryVt8OYWNxZLZaSpBJXljNIknHCXSijhyQOlu47FWcIw8f3v6PvDqEI6Ff1gxnMbeDCjXJxDzudpLulStggX01vuQcemVndXJNPi4pPRNXgL63YYi/mEydkXwaahXTvvmYNX/LFU3t4TiehnXfZQSsH8hQjn2cqIYTDzo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3328f992-8fce-467d-810b-f29f5d8c6efe,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:ef072720-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2bb665a0d34a4080b6dac0f4ecf2b4ff-20220825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 179588030; Thu, 25 Aug 2022 19:33:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 26 Aug 2022 10:03:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 26 Aug 2022 10:03:01 +0800
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add scpsys compatible for
 mt8186
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>
References: <20220819124736.21768-1-allen-kh.cheng@mediatek.com>
 <e5572e77-4ba5-d8f3-4e9e-04ac5dc416fe@linaro.org>
 <365eb0ad-8423-b8e3-298f-b356a2250dd0@mediatek.com>
Message-ID: <b5696b65-e150-244f-05ea-ce9312970d3d@mediatek.com>
Date: Fri, 26 Aug 2022 10:03:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <365eb0ad-8423-b8e3-298f-b356a2250dd0@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_193345_164500_07524E22 
X-CRM114-Status: GOOD (  16.89  )
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

Hi maintainers,

On 8/22/22 3:56 PM, Allen-KH Cheng wrote:
> Hi Krzysztof,
> 
> On 8/19/22 8:53 PM, Krzysztof Kozlowski wrote:
>> On 19/08/2022 15:47, Allen-KH Cheng wrote:
>>> Add a new scpsys compatible for mt8186 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>
>> No DTS using it?
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> I had it all arranged to send anther DTS using patch after
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=666901
> is applied.
> 
> 
> But I see your comments in
> https://lore.kernel.org/all/a810ec42-825c-1a85-568f-b70f04b58280@linaro.org/,
> I think it's better that adding another DTS using patch for scpsys nodes
> into a series (include this patch).
> 
> Thanks,
> Allen
> 

I found Matthias send a patch for renaming mediatek,mt8195-scpsys.yaml. [1]

I will update this patch after [1] is applied.

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20220825141656.15747-1-matthias.bgg@kernel.org/

Thanks,
Allen

