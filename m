Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99840CEB2E3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 03:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gjo5+pSdTGHwq6JJECrTZEup0IvHwkFVyPMeb0WdRaM=; b=WEH5CMac7rKvNrwoiWkTQuTXmG
	fc57gD1Aq6A3JjoYseXjYs9nob24gqUaVrJss7cHFzCwC2Vkw3ntQJS0z6mjSD9BgLjoXCnGFIR0J
	Fw90vkZaO3vuYnGGZk1PuR/HmhJ2xKhCWWWFGub5K4MMZgm0g/2P7IBmXZwKWwmWvUMMAgik1F15u
	QzgQj5QuFKXYPjAXVYClPS7tNekxlgxT9/jblDAuHit8EgtYjid224LNShs4tT9j+hYDsrfUUskoO
	NM28aaRyPjMFvaeZE+0K8VwsxR4hT1AV4djUY0GZF9qhsHJbTu0p/ifWF/XvHlBp19r+5ln09QuVf
	e5ryIBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svTq5-00000001W69-2USn;
	Tue, 01 Oct 2024 03:46:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svTim-00000001Upt-2XRH;
	Tue, 01 Oct 2024 03:38:46 +0000
X-UUID: a53c87ac7fa611efb3adad29d29602c1-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Gjo5+pSdTGHwq6JJECrTZEup0IvHwkFVyPMeb0WdRaM=;
	b=nmebeck7ebIeyinQZ2dJqTvoYFiPslU4ffov857EPbhwoXhLMHz9MBIbRsi1UhKBceD4msWOXH6cL2d/RLc87VCeM9NtaxnNbOHxkQFwNBPJ4ugyZ0tjZSzWpjAlJ6hJLzmD2yYJtucQ1ZDsgeAUKtCQzbUzJ+olXYxdICxcVp8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:944a390f-008b-4a00-9ecb-43a3e8a744b3,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:6dc6a47,CLOUDID:c586d39e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a53c87ac7fa611efb3adad29d29602c1-20240930
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 170478753; Mon, 30 Sep 2024 20:38:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Oct 2024 11:38:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 1 Oct 2024 11:38:33 +0800
Message-ID: <329b554b-e029-0dfe-7c18-67c7c58f8302@mediatek.com>
Date: Tue, 1 Oct 2024 11:38:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/6] nvmem: mtk-efuse: Enable postprocess for mt8188
 GPU speed binning
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
 <20240927103005.17605-4-pablo.sun@mediatek.com>
 <57dfe684-c9a1-4cb3-8c87-9d2fef09aed7@collabora.com>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <57dfe684-c9a1-4cb3-8c87-9d2fef09aed7@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_203844_682090_9E90BBED 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Angelo,


On 9/30/24 17:40, AngeloGioacchino Del Regno wrote:
> Il 27/09/24 12:30, Pablo Sun ha scritto:
>> Similar to mt8186, the efuse data for mt8188's GPU speed binning
>> requires post-process to convert the bit field format expected
>> by the OPP table.
>>
>> Since mt8188 efuse is not compatible to mt8186, add a new compatible
>> entry for mt8188 and enable postprocess.
>>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> 
> I know I told you to just reuse the pdata from 8186, but there's something else
> that came to mind, here...
> 
> ...actually, the efuse block from 8188 is indeed compatible with 8186, meaning
> that the register r/w, etc, are all the same (bar the addresses, yes)
> 
> So, I wonder if it's not just a better idea to not even add mt8188-efuse in this
> driver's of_device_id array, and just add that to the binding so that we permit
> using
>          efuse: efuse@11f20000 {
>              compatible = "mediatek,mt8188-efuse",
>                       "mediatek,mt8186-efuse", "mediatek,efuse";
>              [etc]
>          }

Thanks for proposing this. I agree that in the case of Mali GPU speed binning
info, mt8188 behaves exactly the same as mt8186, only the cell addresses are
different.

I wrote "mt8188 efuse is not compatible to mt8186" because I thought
different eFuse cell layout leads to incompatibility, but it is correct that
the cell layout differences can be expressed by the device tree nodes,
so they are actually compatible in terms of hardware interface.

I'll drop this patch ("nvmem: mtk-efuse: Enable postprocess for mt8188 GPU speed binning")
in v3 and update dt-binding "mediatek,efuse.yaml" instead.

> Means that in mediatek,efuse.yaml you'll have to add...
> 
>        - items:
>            - enum:
>                - mediatek,mt8188-efuse
>            - const: mediatek,mt8186-efuse
>            - const: mediatek,efuse <---- or without this, even.
> 
> In the end, the "mediatek,efuse" property is somewhat deprecated, so that'd
> also be a good time to start the dropping process, as I imagine that future SoCs
> would also need the same speedbin transformations - which means that they'll all
> be compatible with 8186....
[snip]

But I am not sure if we should now drop "mediatek,efuse". The post-process for
GPU speed binning info is only applicable to ARM Mali. Since there are MediaTek
SoCs that are not using ARM Mali, or not having GPU at all, would it make more sense
to keep the "mediatek,efuse" fallback compatible for those cases?


Best regards,
Pablo

