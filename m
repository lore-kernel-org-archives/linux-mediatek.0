Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBFDCF9C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxJ2u/FvugU1hQiGyVxAGg7yfWlaUL7i8/K8f/CODxM=; b=PKrmWw+eq6CNA7IyCU6YHUEAni
	LOI1Ubc9zYB8wlar1wobScuuiwVgnxOI5BkWkIZrh3OKRd0us5D695Z+a5vAAoFzA4q4VPok4wYGT
	xgIBn6LhMyOGEbHXb4iZqQ5rtLUyJOyi8kFePD2qSjAybtcD7izNMiZyaIhi/JT9pgOLbn3Byo+0v
	e6LL2fM6H4WLETxU3UHA8Lo7XqkaARD+Evv+d+hOk96lXcHbLEfQ2WKM7N90GdmBn/8Z1e2AfvpIX
	acmYKzfFdBjNpG5D30gSYwckfk32i2A4u3GtSsAAC8jUyCg6bZbTq2sxnBEK8p9r67/LWiSVOt8O/
	V7eNlSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgYl-0000000Gzxc-0gSy;
	Mon, 23 Sep 2024 10:44:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgXb-0000000Gzlv-1VPT;
	Mon, 23 Sep 2024 10:43:40 +0000
X-UUID: ad7e2f6a799811efb3adad29d29602c1-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=lxJ2u/FvugU1hQiGyVxAGg7yfWlaUL7i8/K8f/CODxM=;
	b=EmzD1NEHc00QO3MhkzE01AetGGypiXlLNuFwDv/+mf5KzfgIHWm/GRroijcpnlxvaLExCyYaymWknRde/ShztiAIRnciqIbjRd85HhxVq4xrQ3ME3gvh2juN95PR8QysuigX32l0+1Dx/TeOj7mQkDZzdprO1JdIDSzlOfOiRhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:775db184-dfb4-4083-b180-99549da0effe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:ad7d1c18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ad7e2f6a799811efb3adad29d29602c1-20240923
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1019121351; Mon, 23 Sep 2024 03:43:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 18:43:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 23 Sep 2024 18:43:26 +0800
Message-ID: <637aca9a-5d1e-6726-4b97-4d5db0ee30a3@mediatek.com>
Date: Mon, 23 Sep 2024 18:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 2/2] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen Zhong
	<chen.zhong@mediatek.com>, <linux-input@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240918064955.6518-1-macpaul.lin@mediatek.com>
 <20240918064955.6518-2-macpaul.lin@mediatek.com>
 <20240918115151c896f33f@mail.local> <20240918115651c1475d36@mail.local>
 <2af0621d-14ac-b7f3-b28d-2df698931121@mediatek.com>
 <d8b90ddf-efbc-4434-9ad0-4be6942d51a5@collabora.com>
 <202409201337500284902d@mail.local>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <202409201337500284902d@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.104600-8.000000
X-TMASE-MatchedRID: QW5G6BKkLToOwH4pD14DsF2036HHwFm/C/ExpXrHizwJmdXzOhEMdq1X
	iPUpd5urvhH72H3yPfRl52ofpDGzAUER5ddgnEDec2k2agnXN3xMkOX0Uoduuf5Ndkm9jGh5+k9
	OmImxseHdNZBjAe+TD5j4oSfJftZ+Gmdo3OL/XyN17gHAyAFr0z49+ukeLY9133Nl3elSfspkDy
	hB8FZCo0saY8ROPM6fB++TmiSdVlO6de0YULw0FnuTVkeYosXtYY0tNGdvli3qLnOUXH9QdIcqr
	S3ZaIiqCEuVF6nuSDFftuJwrFEhTbew1twePJJB3QfwsVk0UbtuRXh7bFKB7n0Bw/xUOCRaQob8
	Aj73RQ4BdZxBcFC/afKV0PghFKiIHIV02d1rpG8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.104600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 29BBBD91297B46FCBF23EA27127FA88C925FF1F3A72ACB71CB857985D524E1632000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_034339_428455_FE7B7EF4 
X-CRM114-Status: GOOD (  19.33  )
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


On 9/20/24 21:37, Alexandre Belloni wrote:

[snip]

>> > > > >  - RTC:
>> > > > >   - Drop "start-year"
>> > > > 

[snip]

>> > 
>> 
>> Alexandre, I definitely agree with you on the fact that the MTK PMIC RTC driver
>> can (and needs to) be improved, and that it can make use of some nice cleanup...
>> 
>> ... but!
>> 
>> This series performs a conversion to schema, and the previous txt file didn't
>> say anything about the start-year property - which was not mandatory to support
>> at that time (nor now, afaik?), so adding support for that is out of scope for
>> this series.
> 
> It is mandatory now. I agree this can be done in a subsequent series.
> 

Thanks you all for helping with the review and kindly understanding the
situation. I see that Angelo has already submitted the RTC patch set.
I'll check it with the internal driver owner. It seems okay with a quick 
glance.

>> 
>> Eventually, that can come as a series on top, adding support for that in the
>> binding (and, of course, in the driver).
>> 
>> I should be able to tackle that... most probably next week - but still, the
>> improvements would come as a series on top of this one.
>> 
>> Cheers,
>> Angelo
> 

Thanks
Macpaul Lin

