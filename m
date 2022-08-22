Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B4FC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGXPT7+mPmovmUCCRnU+eezzrRuI/5/eaI3MEaYC8zA=; b=uVFjFwzN4+StDaF6THrX1IHWCj
	SU9K5zeVD/GJk/ZA8AMAkhmHT87GP5RzEtbz9sog4DzWFrfm1EoZquN4ea4K4mGnG+/yWaUoNA48r
	NLvPd4jXPgLOJjzMr62PwrVY4tXI3z+sgmG3f6v9z2m+pjsfiCQk6Fmf+yBuoU33mNAzExOIAePZP
	IgHp18NyzWlJY3UNLX6Rj3fmhVZq3L3/KBWEeQXiW4wL0NpY/a0v/Ml9mruVDbTBLLGKxkStinbiZ
	cmFoNFr0JW+HbWdmL6YDaBkfxO0NYoAs4psctf8STWk9z2/4tSTWOc82pfqWDKb0qPkjaESJ61gCN
	u2SF1xIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3CK-006h9U-8Z; Mon, 22 Aug 2022 08:54:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2vX-006XbB-5O; Mon, 22 Aug 2022 08:36:58 +0000
X-UUID: cca01ebda3004485a1f3f6393d64427e-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject; bh=NGXPT7+mPmovmUCCRnU+eezzrRuI/5/eaI3MEaYC8zA=;
	b=lLh1sE//MWKvLz5W24FOH5S6YV1VCDPT8/5KxNqWussOdE/8TL0H8y8dgi1fujy6mfd0CIxZFykeZK+298GA/o7IMjxE3EkR446VjjemLebBX7GWsdsKZEPfvqICZhI9/j8fWt3u2JJ9h8XXnDk95GMBh+uPX2Z/++XNiwWCxPE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a852871b-dc25-4d42-895a-9f952f49138a,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:027437cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cca01ebda3004485a1f3f6393d64427e-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 929196332; Mon, 22 Aug 2022 01:36:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 15:56:10 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 22 Aug 2022 15:56:09 +0800
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add scpsys compatible for
 mt8186
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>
References: <20220819124736.21768-1-allen-kh.cheng@mediatek.com>
 <e5572e77-4ba5-d8f3-4e9e-04ac5dc416fe@linaro.org>
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Message-ID: <365eb0ad-8423-b8e3-298f-b356a2250dd0@mediatek.com>
Date: Mon, 22 Aug 2022 15:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5572e77-4ba5-d8f3-4e9e-04ac5dc416fe@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_013655_337117_7AE62F21 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Krzysztof,

On 8/19/22 8:53 PM, Krzysztof Kozlowski wrote:
> On 19/08/2022 15:47, Allen-KH Cheng wrote:
>> Add a new scpsys compatible for mt8186 SoC.
>>
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> ---
> 
> No DTS using it?
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof
> 

I had it all arranged to send anther DTS using patch after
https://patchwork.kernel.org/project/linux-mediatek/list/?series=666901
is applied.


But I see your comments in
https://lore.kernel.org/all/a810ec42-825c-1a85-568f-b70f04b58280@linaro.org/,
I think it's better that adding another DTS using patch for scpsys nodes
into a series (include this patch).

Thanks,
Allen

