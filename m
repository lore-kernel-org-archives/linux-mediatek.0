Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02CC369AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrbVtDLJwECuyvPhK0BEV+KwQsj0q8fI1QSWfwxU1nE=; b=RSxoXRg6fCqqpC2l6bmCw+ljwC
	9iiOTcqZDi61qMnAIAXddUHs0F1nDMGbcDi9RzAgsDhxMeslFut/jZXlkBxV3x0tyvGBiOELafH1J
	GH8oANiV0PY7181NBh3bj0/fyt2KCGL4Btjd/fqXfvDzg/m3mI3PnVoVALYU4KgLgJYoaYzWZyspR
	C2yfV23XKagkLCmbUruopjRyZK7fECOwFZAyWwJRM2ZIqnscY/Tr5srr/q5fEHcdJUcI5HdCKMFVB
	ZhOW3GyOwcb2BJYoxq7oEJOoZZKj6x/kU3dzOr+mj0nA136ds3eDYf/To5N/5r5Ckuan0p66MDHMJ
	mqgnOlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stNcE-00000004WnX-1ATD;
	Wed, 25 Sep 2024 08:43:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stNcB-00000004Wll-0L1X;
	Wed, 25 Sep 2024 08:43:16 +0000
X-UUID: 2f758b267b1a11efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=JrbVtDLJwECuyvPhK0BEV+KwQsj0q8fI1QSWfwxU1nE=;
	b=Mo1xlRuhAzQobwoV5qygzF6o/nRQm+uZy6LeTFM2p3IOe2WmHz6dsVeJDNQbeqrZu2gPYXicr/MSNhpy55dcIABLvsLL23jFUDrnZdl2OYLehbx+lg+ZudLnvhKEw0lxcgDzu71I3eNwWoyKf2q/faCnTKGXIBth+2ei7hBHJKw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ddc33391-b7ed-4a9c-a922-3fdef3b58381,IP:0,U
	RL:0,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:8
X-CID-META: VersionHash:6dc6a47,CLOUDID:8890899e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2f758b267b1a11efba0aef63c0775dbf-20240925
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789533631; Wed, 25 Sep 2024 01:43:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 16:43:02 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 25 Sep 2024 16:43:01 +0800
Message-ID: <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
Date: Wed, 25 Sep 2024 16:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <moudy.ho@mediatek.com>,
	<macross.chen@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
 <20240924-commute-collision-13ad39717d31@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240924-commute-collision-13ad39717d31@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.313000-8.000000
X-TMASE-MatchedRID: QfHZjzml1E8OwH4pD14DsPHkpkyUphL9Wot5Z16+u76+UkTh6A/DwT8f
	ilvi6fr90mFsFMx0VZMOYgThO+DmXx2P280ZiGmRdARARTk4h59bAoaK+wS4jRSX1u8BLtZAFRE
	6l+a4SRTiTN0gJqFURMzVnE1oQDqoavi5Lq9+Ha1s7yIvC2pwGtF9F+XaXgXeZ5yuplze9ptTyk
	OINBDQU+cQv6iXuAzrwVMUpfyfKUIAwWnlblYdAsxmTzofEWOOazzS+36ix9ybKItl61J/ycnjL
	TA/UDoAA6QGdvwfwZZWRVlrjsKO8N0H8LFZNFG7bkV4e2xSge75AqQykow+yePbmdtfeypRXtRV
	FLwJOwOr2TwTTCELzrAUyUg9ogFt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.313000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 972967CB0576905A235A1CA79982300AA079E3A940A8E8B2F8C6AB1ADA60F2932000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_014315_136743_2F659BC5 
X-CRM114-Status: GOOD (  19.54  )
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


On 9/25/24 00:00, Conor Dooley wrote:
> On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 24/09/24 12:31, Macpaul Lin ha scritto:
>>> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
>>> to an excessively long 'clocks' property:
>>>     display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
>>>
>>> To resolve this issue, add "maxItems: 3" to the 'clocks' property in
>>> the DT schema.
>>>
>>> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>    .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>> index e4affc854f3d..42d2d483cc29 100644
>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>> @@ -57,6 +57,7 @@ properties:
>>>      clocks:
>>>        items:
>>>          - description: SPLIT Clock
>>
>> That's at least confusing (granted that it works) - either add a description for
>> each clock and then set `minItems: 1` (preferred), or remove this "SPLIT Clock"
>> description and allow a maximum of 3 clocks.
>>
>> Removing the description can be done - IMO - because "SPLIT Clock" is, well,
>> saying that the SPLIT block gets a SPLIT clock ... stating the obvious, anyway.
> 
> Right, but what are the other two new clocks? Are they as obvious?
> There's no clock-names here to give any more information as to what the
> other clocks are supposed to be.
> 
> Kinda unrelated, but I think that "SPLIT Clock" probably isn't what the
> name of the clock in the IP block is anyway, sounds more like the name
> for it on the provider end..

Thanks for the suggestions. I think Moudy could help on the new fixes
for both DT schem and mt8195.dtsi. This patch could be separated from
origin patch set.

Thanks
Macpaul Lin

