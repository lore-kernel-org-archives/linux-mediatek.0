Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A48EE6426
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYO2EcO+MX0CfxoS7F4jWIet58CD9M/3WWGPyCM7GRs=; b=uJrbOUEkG7ME3FcGQnB1hqIgyq
	g0bfNsPKhAgug1fJTqz4qqVSvPllG+DqDzuzaab826o0zSDqtQCO5lnHJgHmlEAMhiFcKgx8+plvW
	5JkEw1Mao5V3obhjgFkQ7UTMMvz9V0z5u0OSqGfURG286D/htyO743McFeqTmqA8fkKmi6Bg5/ZCu
	FAErW6PsKmuyuZtw5qC0YvRW8m2i6WFNLgsQRqiTf0AHq8zB539Gg2dkHQGPrkqJN5kGKBMhJvFJV
	zVzQ2KR4x02gaf37p33eR2YicbUp4rt8jPs2/vyR0KLxHQMBKnwcYL6ppbE+ZV6ZgwinXp7rJqRXN
	mZFT8+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqoSZ-00000007a3D-0sij;
	Wed, 18 Sep 2024 06:46:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqoRS-00000007Zw1-1v1R;
	Wed, 18 Sep 2024 06:45:35 +0000
X-UUID: 97243894758911efb3adad29d29602c1-20240917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=OYO2EcO+MX0CfxoS7F4jWIet58CD9M/3WWGPyCM7GRs=;
	b=eatpWrAZ6iU3UHGRLcOQGAL6rG1190ywtXeR5edkqo273N9t88Ihej4V4vAuB8oKQ1/rCmK5YFhT1zrUBGRELo0T4N71k8vqYpRbY/1YqAm8fqxqrMUdQueXEwVjMJuJI++39QHxYUO2LE+TkBDo7kEqL5FVzMMb+ctIB8LqxDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2ae00b91-f775-4061-9548-cfc369d01326,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:5d8b2cb7-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 97243894758911efb3adad29d29602c1-20240917
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1867508349; Tue, 17 Sep 2024 23:45:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 14:45:22 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 18 Sep 2024 14:45:20 +0800
Message-ID: <a0a16c7a-0469-d880-532a-2bb69f5ea347@mediatek.com>
Date: Wed, 18 Sep 2024 14:45:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>,
	<linux-input@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240916151132.32321-1-macpaul.lin@mediatek.com>
 <20240916151132.32321-2-macpaul.lin@mediatek.com>
 <iudkiamza3lsl33tsby3sghfy66rj2tgg3kqjjwzeba46oxtpi@yrri5m5skjld>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <iudkiamza3lsl33tsby3sghfy66rj2tgg3kqjjwzeba46oxtpi@yrri5m5skjld>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.205300-8.000000
X-TMASE-MatchedRID: QfHZjzml1E8OwH4pD14DsAPZZctd3P4BC/ExpXrHizxV1lQ/Hn0TOpm3
	CkZsyRGFGAs04whSQKmxN81bhpHVXyiETuGglu04Bu2zRCSrLjbXAvRa0tfJGg6QlBHhBZuw5gc
	Q9o9yjpueQqC+u+jOSA6JWCjkElGt0g+iOlrNCJM1yhbbA7We0+Tv34VGGbNIWltirZ/iPP6tBF
	nLFqDVm8IgA/magxYucQfBx409I+hgZ3QS6Zzlz+v8QGaI25e3nophrTcsI7abKItl61J/ycnjL
	TA/UDoAA6QGdvwfwZZWRVlrjsKO8N0H8LFZNFG7bkV4e2xSge6L7+/PK9Vdww4apptB4u3+6SFU
	bUyOTorfjtkGwm07arAUyUg9ogFt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.205300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8DAA0D017FE1404BF14FCB32DAF0E99A46CD1524B4ED9644550D353E64B24CD2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_234534_544436_A064932A 
X-CRM114-Status: GOOD (  18.61  )
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


On 9/17/24 15:00, Krzysztof Kozlowski wrote:

...

> 
> On Mon, Sep 16, 2024 at 11:11:31PM +0800, Macpaul Lin wrote:
>> Convert the mfd: mediatek: mt6397 binding to DT schema format.
>> 
>> MT6323, MT6358, and MT6397 are PMIC devices with multiple function
>> subdevices. They share a common PMIC design but have variations in
>> subdevice combinations.
>> 
>> Key updates in this conversion:
> 
> ...

[snip]

>> +
>> +            ldo_vcamio {
>> +                regulator-name = "vcamio";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-enable-ramp-delay = <216>;
>> +            };
>> +        };
>> +
>> +        keys {
>> +            compatible = "mediatek,mt6323-keys";
>> +            mediatek,long-press-mode = <1>;
>> +            power-off-time-sec = <0>;
>> +
>> +            power {
>> +                    linux,keycodes = <116>;
> 
> Messed indentation.

OOPS, I didn't find this during editing.
Will fix it in next version.

>> +
>> +        power-controller {
>> +            compatible = "mediatek,mt6323-pwrc";
>> +            #power-domain-cells = <0>;
>> +        };
>> +
>> +        rtc {
>> +            compatible = "mediatek,mt6323-rtc";
>> +        };
>> +    };
> 
> Keep one complete example. Maybye two if they are significantly
> different, but I don't see these differences.
> 

Okay, will keep complete example for mt6323.
Trimmed most similar part of mt6358 and mt6397.
Since there are some typical usage in other nodes.
Just keep these smaller nodes for mt6358 and mt6397.
Will also add a note of this in commit message.

>> +
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    pmic {
>> +        compatible = "mediatek,mt6358">
> 
> 
> ....
> 
>> -Required properties:
>> -- compatible: "mediatek,mt6397-pinctrl"
>> -For details, see ../pinctrl/pinctrl-mt65xx.txt
> 
> Best regards,
> Krzysztof
> 
>

Thanks!

Best regardsMacpaul Lin

