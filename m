Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9407FC616B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xotAzUqezhsD17X56wb62uKRJaTQRcsCpG1PKAuJkiA=; b=R/GKuv6fhdHlM7PZJDU8MhmGz0
	BYeAp1fYeInkMi/K3zw2+NCEYuEuFG/S/FjM2sloGzJ82pKxDmGJmSvw6kbbYoTqIEuX429RORSaH
	zncfdKvwMtE9OBHR9ESfgelNtQCl3Oj1F6SvfuZrO5zMDyGbAq/z7gbFtIAFbfRSjJ14vMzMbjcY2
	Rj81U86FmHR3DhjiG+MXQ+QRBEv8y/eyquR78NZrxNV4cS6yvkq3Ej0aDvTs/7/oB38ACf46IVH8K
	wFX3zuXMgXPzL6eGIzstt2qGj3n9rnZOWCPzMQ1h3ztMyikAVRTmqrpFH0bq3W2KKxw6ZVyzN0byQ
	bEfMHfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAQd-0000000GiE4-0iNT;
	Fri, 13 Sep 2024 17:49:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAPW-0000000Gi3R-3I4O;
	Fri, 13 Sep 2024 17:48:48 +0000
X-UUID: 69e61e7c71f811efba0aef63c0775dbf-20240913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=xotAzUqezhsD17X56wb62uKRJaTQRcsCpG1PKAuJkiA=;
	b=bLXyoRaoG2BWcPSJ/Lob/YGLmHH4jbYR3bk0ORhMvifoOAmUaBlAx6bHj6/nV1/gzH0pPf1djrTf1weAV0tC6/tEpJIFJ93cPXAaiu6cberu/CQ1x3hEI3RwJcQmMKOFE6KcDyKPU1wwt6G6AWFtgAJ4PdIBznlj4kQQ+79uViw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ecf774e9-f972-45f1-91d9-6c135d3007b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:0dc8fcb6-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 69e61e7c71f811efba0aef63c0775dbf-20240913
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 511957562; Fri, 13 Sep 2024 10:48:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 14 Sep 2024 01:48:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Sat, 14 Sep 2024 01:47:53 +0800
Message-ID: <f6050fa5-4cb5-9283-263b-bcd0d97a09bc@mediatek.com>
Date: Sat, 14 Sep 2024 01:47:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: mt6323: Convert to DT
 schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
 <20240830145056.GA4170065-robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240830145056.GA4170065-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.924800-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaYOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rdkc3IJsq77y9FtW7XfHueU+OjsPhIWDiwR/wKmchi2X3ikYeDnk/KepZ
	UyQ6EeDXoapbtUvkIf+xNbFV/iNBgt3ZVSPV8VOi0sO72q2op4f+UEb65dgmQEB/Asc4oaYEfg0
	sA1HT2xmQQJkXF7hk6vMxSxMv7UnmPLG+A0qvEpp4CIKY/Hg3AtOt1ofVlaoLUHQeTVDUrItRnE
	QCUU+jzjoczmuoPCq0Bv7xhCXsjZm/ZfgvjZa1rh9ifqkpf8qhcEkm/83qnHz1B6iuMVH+d
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.924800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BAB98BC90D7C6C90416F4D37BF8B8CF0C1790B6C68AB3A968115B29A6A8B76452000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_104846_854689_5EE7C989 
X-CRM114-Status: GOOD (  14.89  )
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

On 8/30/24 22:50, Rob Herring wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Fri, Aug 30, 2024 at 07:07:26PM +0800, Macpaul Lin wrote:
>> Convert this from the old style text based binding to the new DT schema
>> style.
>> 
>> The examples have been trimmed down and move to parent schema
>> mfd/mediatek,mt6397.yaml.
>> 
>> Add new maintainers and submitter from MediaTek.
>> 
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

[snip]

>> +
>> +patternProperties:
>> +  "^(buck_)?v(pa|proc|sys)$":
>> +    description: Buck regulators
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes: false
>> +    unevaluatedProperties: false
>> +
>> +  "^(ldo_)?v(camio|cn18)$":
> 
> Why are buck_ and ldo_ prefixes optional? The old binding didn't reflect
> actual (upstream) users? If so, that's fine, but mention that in the
> commit message.
> 
> Rob
> 

Will use "^buck_v" and "^ldo_v" as the prefixes of each items in 
patternProperties. Thanks!

Regards,
Macpaul Lin

