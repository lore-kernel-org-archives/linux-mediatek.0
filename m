Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10F6CE7CE5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlXzrXpPCzLcSODdsG8c3PiQzj81rbhZ9JEiAPkX18g=; b=r1XjYOrT9PfK6+cD0WiaOr63eA
	JohYKMMzpGote+N8rUaF6OAVpFKVKq/TpQtHZtyPTQqfzN3OtyKVMhLHcyRZ+BUNJnkp3HJj0G4eE
	c/J4Yh4IOP1hDhwGKCII7N50m5fQFHZQZGBim9Zv+TpTbxE3Q7DZcHtQiUz/p1CncKb310Zz2JeZC
	S3i88ytE0Fg+ZmB684gaKy9O74U5Cv2Mdl53f+zLGDm4JqkIsjQdztnLRU+5Br4HdYAQuCrHGUJGL
	2lQYCQMBpwUGkjFlb2K99Vafl7IGjxtCi7Q5pg7awCqp6gadC8yOznTF5PuifhcA6vBTL3HyH28cp
	CqoVdczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXfc-00000001wli-2pIG;
	Tue, 01 Oct 2024 07:51:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXeJ-00000001wWM-3Upl;
	Tue, 01 Oct 2024 07:50:25 +0000
X-UUID: ce380cda7fc911efba0aef63c0775dbf-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID; bh=FlXzrXpPCzLcSODdsG8c3PiQzj81rbhZ9JEiAPkX18g=;
	b=qyHtKOEuOk6q6+jzGD1iSnaFQHlFcBrsieaxCfeRvA4W8KDlpk926lBA2sxf4FRJXNE4kxdX+/3t5NZhVbS+EbjFGG7HudBW8762A5ZXLyChg9v78v3HH8Ee+ohLNkbFr3+Z1ICpJ4lePfo5K0vLYoxIKYgRZfm/jXekpou276c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ff5d454c-048e-4e8b-af68-53aa4b905700,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b7aa8718-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ce380cda7fc911efba0aef63c0775dbf-20241001
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2107294476; Tue, 01 Oct 2024 00:50:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Oct 2024 15:50:16 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 1 Oct 2024 15:50:14 +0800
Message-ID: <c2fb40cc-491f-1c1a-7343-c70a60b3a031@mediatek.com>
Date: Tue, 1 Oct 2024 15:50:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 2/3] ASoC: dt-bindings: mt6358: Convert to DT Schema
Content-Language: en-US
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu
	<sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
	<andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
	<olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <linux-input@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240930073311.1486-1-macpaul.lin@mediatek.com>
 <20240930073311.1486-2-macpaul.lin@mediatek.com>
 <6l6hb264yvhd6e6neurd5t4gmv5z5c5gpg27icijif3hq4cuu7@pbhfkdxb2eam>
 <42dc4e9a-efcd-e166-b4fd-d4fe0dcd3c77@mediatek.com>
In-Reply-To: <42dc4e9a-efcd-e166-b4fd-d4fe0dcd3c77@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_005023_906975_66407526 
X-CRM114-Status: GOOD (  15.23  )
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



On 10/1/24 15:05, Macpaul Lin wrote:
> On 10/1/24 14:34, Krzysztof Kozlowski wrote:
> 
> [snip]
> 
>>> +description: |
>>> +  The communication between MT6358 and SoC is through Mediatek PMIC 
>>> wrapper.
>>> +  For more detail, please visit Mediatek PMIC wrapper documentation.
>>> +  Must be a child node of PMIC wrapper.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt6366-sound
>>> +      - mediatek,mt6358-sound
>>> +    const: mediatek,mt6358-sound
>>
>> This wasn't ever tested.
> 
> Hum, I have indeed tested it with linux-next/master branch.
> Ran dt_binding_check with dtschema trunk with this single file
> but didn't get any warning or errors.
> 'make dt_binding_check DT_SCHEMA_FILES=mt6358.yaml'
> 
> Could you please help to paste the error log for me?
> If there are new errors, I need to check if there is any
> environment issue.

I've both tested both of the following format pass dt_binding_check.
#1.
properties:
   compatible:
     items:
       - enum:
           - mediatek,mt6366-sound
           - mediatek,mt6358-sound
       - const: mediatek,mt6358-sound

#2.
properties:
   compatible:
     enum:
       - mediatek,mt6366-sound
       - mediatek,mt6358-sound
     const: mediatek,mt6358-sound

>> Do not send untested code, it's a waste of reviewers' time.
>>
>> Best regards,
>> Krzysztof
>>
>>
> Thanks
> Macpaul Lin

Should I update it with format #1?

Thanks
Macpaul Lin

