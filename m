Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618BCEEB596
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMl5165Nco4nnPRdvUh/bXbQdA86zHrP4M9QbnMQj9k=; b=1nhrQSUN7SEcxOng9Y7FmakFUN
	glNRKIYS0/Q4xyLtWpiKQMz+WFWrAzYbDjZiDw87SazVyIlMTxSglJlPP+ORavkwWrk4J5rKTHEIz
	/DmCoElW03jyoeqa07o2BzjOh5Njp//G1qjo7ZLWSgXPeTe0tdXDNQJ4Ioa1mdOdiS1K4ZMklHerh
	NJLBTmbesGqXyG8EmoS72Uak0Qn5S8djj8LELe+qd+kRTSAX/3UG4NXDRfEJyRm9Uju9aXrse3kc5
	XKh+RWlnddpOeyf8LZ+jRAvnnRZAHq0SlaOKanbnPZPq97hRu/7MvNim4wX4YQs6pp8lx/eI3mGt5
	UMoVJgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soi9b-0000000Ct5d-2GIz;
	Thu, 12 Sep 2024 11:38:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soi9Y-0000000Ct46-3R4j;
	Thu, 12 Sep 2024 11:38:26 +0000
X-UUID: 82944cda70fb11efba0aef63c0775dbf-20240912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=zMl5165Nco4nnPRdvUh/bXbQdA86zHrP4M9QbnMQj9k=;
	b=latU+9OMDNRD3zIVStiqfee1ZoKpvQIhRs60H1Ip3llZ0jB1FR5hR73iXp0c5pItX8/PDlS++5TUPfsW5wQIqSSJkpGMv3a58Y6/wYPAQ+0eeu8+PIsoN8i2d9lgNnhXP4loYUcZNHqmiDOfiNAxFEmovOyKM7U36zYs/ceeDDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c702edf4-af23-471a-a3e7-4ddd60fddac3,IP:0,U
	RL:25,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:26
X-CID-META: VersionHash:6dc6a47,CLOUDID:54a51ad0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 82944cda70fb11efba0aef63c0775dbf-20240912
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1123867319; Thu, 12 Sep 2024 04:38:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Sep 2024 19:38:12 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 12 Sep 2024 19:38:12 +0800
Message-ID: <30184391-12a6-c095-7862-35c7677b0ede@mediatek.com>
Date: Thu, 12 Sep 2024 19:38:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240910143245.5282-1-pablo.sun@mediatek.com>
 <01020191e04d4237-204596e1-6cc1-491c-a60f-de3917af7d42-000000@eu-west-1.amazonses.com>
 <2fd45240-a341-806b-f336-78d0595a8031@mediatek.com>
 <01020191e5383829-7eb375ea-ee17-419e-b173-30df46f61863-000000@eu-west-1.amazonses.com>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <01020191e5383829-7eb375ea-ee17-419e-b173-30df46f61863-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.398400-8.000000
X-TMASE-MatchedRID: VfovoVrt/oYNtKv7cnNXnSa1MaKuob8P2r3/CX4MlKCqvcIF1TcLYIKO
	HgdS51oIY8pnlWhODINRVnZsGmIphSw+COFH6OKxioK033WJkCk4m0JsW63IXBKCZ+Q6yB8qy7F
	bVebgF6C5u9/qS1btcB+SaFrhL/iTQjr0vbZGNcuWLCkl1lq7B0Crr/LkAQ46+3n3Z6rbGhNjy0
	xoWgR6JLEwnnFnQnmnUNHYJMizeW5f2oN5IGbAjgXysW33GYMpfkXv6w7OOZIKM+BgluLK4HJZ1
	Ae+gMbqAZ/Skj4ls4+Rk6XtYogiau9c69BWUTGwVnRXm1iHN1bEQdG7H66TyMdRT5TQAJnA0heq
	/DjysoVjrbuJifCzbU4niEfXGAFbP/pFwct6g8CeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.398400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1049EF671E4F33D3EAD7E1E3BDF8DDDA43F8B73B2326C84DD876E49E57F162052000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_043824_904531_961D2DE3 
X-CRM114-Status: GOOD (  18.27  )
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

On 9/12/24 15:52, AngeloGioacchino Del Regno wrote:
[snip]
>>
> 
> The range should match the target device's Vin constraints; in this 
> case, it
> should be no lower than the minimum working voltage of the Vgpu-in of 
> the Mali IP.
> 
> The drivers will be responsible of setting the lowest possible voltage for
> enhanced efficiency (power saving), taking into account the fused chip 
> quality bits
> (in this case, the MediaTek SVS driver!).
> 
> You should, at this point, check the constraints of SVS, as in, given a 
> reference
> voltage (in this case, located in the GPU OPP table, the voltage 
> associated with
> the lowest frequency of the GPU), what is the maximum voltage 
> *subtraction* that
> SVS will do on the VGPU?
> 
> After the subtraction, may this voltage be lower than 0.546V? :-)

Thanks for the clear explanation. While there are no explicit constraint 
in the maximum voltage subtraction in the SVS driver, I have
confirmed that the fuse data of MT8395 is written in a way that the SVS
driver would never go lower than the minimum recommended operating
voltage of DVDD_GPU in the datasheet[1], which supplies power to the 
Mali IP.

I have sent patch v2 to remove the always-on property and add a note
about the fuse(eFuse) data in [2].


[1]: 
https://mediatek-marketing.files.svdcdn.com/production/documents/MTK_MT8395_Application-Processor-Datasheet_v1.8.pdf?dm=1724252510
[2]: https://lkml.org/lkml/2024/9/12/285

Many thanks,
Pablo

