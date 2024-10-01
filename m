Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA267CE837A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7maMI3JrfgulMF11preQuttN86aApnHvjFdQ3y6oNrQ=; b=VOxeSlKwO3koNcWbwT2T6xIGzs
	UyRRaNfVGjJX8qJZNBTMtmVubKctsfsk4hMzNXmqUDoIfIwesjKhr2TDC2gzK6gNQnHWxCIwv7Jmc
	4naZgg+QIbts+ny5ArXwiVOfD9VARCOeE+T1xkYc6whMiQ4xYmmisCETvMRx6J0xspVF+J3J1nRmG
	jNPFd9KkPR+rMTnlMJPpzKowhadIVnA+Mcsuqa8JbZZEExTync1+1YG//DrkwJa4yDq5PyNBiKL8c
	tjWAelQoBp4S9CKxq4ZxOeG6LKs+CCJvq7hrMjQNX92s0MYRbkR58MGfmNsDnDn8Q+R+dFYQU9ms8
	SZ7eWN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWyk-00000001rW6-3dSq;
	Tue, 01 Oct 2024 07:07:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWxR-00000001r9L-3TC9;
	Tue, 01 Oct 2024 07:06:10 +0000
X-UUID: 9bd433147fc311efb3adad29d29602c1-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=7maMI3JrfgulMF11preQuttN86aApnHvjFdQ3y6oNrQ=;
	b=ZauCsIRgzA4zsRHwG61UR1disZQf77l7l/xKgMK+ZqcXv1iKQAaDo6Tgv8Fn7XiPaEgVnRK+d/0+6cbK8A4TcJrrUIl5M8BJtk0v6sgA3g6v/4EE8MykhsvyF2T59oR0F5cYW1p2P1AZXCWXRtVN4JuS0K/Pl4eT/C6lrZOy+qc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cb3ebb31-8dcf-4c8b-98e3-0ad9ed1a39fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:284c0ad1-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9bd433147fc311efb3adad29d29602c1-20241001
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630024396; Tue, 01 Oct 2024 00:05:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Oct 2024 15:05:53 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 1 Oct 2024 15:05:52 +0800
Message-ID: <42dc4e9a-efcd-e166-b4fd-d4fe0dcd3c77@mediatek.com>
Date: Tue, 1 Oct 2024 15:05:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 2/3] ASoC: dt-bindings: mt6358: Convert to DT Schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, Sen
 Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
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
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <6l6hb264yvhd6e6neurd5t4gmv5z5c5gpg27icijif3hq4cuu7@pbhfkdxb2eam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.101800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQOwH4pD14DsF2036HHwFm/C/ExpXrHizxYJGLp3WXzKpWp
	knTQ1+q/T+8v17QjdI1rQ015tgQBDTLCC/YZrQrUMN+B8zdlz9FMK/nxnH1Imt9zZd3pUn7Kakq
	BCNYGwQ2ycWeoQW7ios4k/G1If2CrCLTFoW0rIaq4jAucHcCqnQXXmzqmsIi7yWCL+8tLbvYDkd
	7WQNL44uLzNWBegCW2RYvisGWbbS8TEC0P9PvYRt0H8LFZNFG7bkV4e2xSge73SwlEUO9gdk5Ph
	/E0lnHtrz/DYYLZZVaW2ciTighMcL7rweoAIK8o
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.101800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8213473620506FBC013195E018B92A6C2C331F6E40BA18E9D76B871E9094E6BB2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_000605_912533_2E54D26F 
X-CRM114-Status: GOOD (  13.52  )
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

On 10/1/24 14:34, Krzysztof Kozlowski wrote:

[snip]

>> +description: |
>> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
>> +  For more detail, please visit Mediatek PMIC wrapper documentation.
>> +  Must be a child node of PMIC wrapper.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6366-sound
>> +      - mediatek,mt6358-sound
>> +    const: mediatek,mt6358-sound
> 
> This wasn't ever tested.

Hum, I have indeed tested it with linux-next/master branch.
Ran dt_binding_check with dtschema trunk with this single file
but didn't get any warning or errors.
'make dt_binding_check DT_SCHEMA_FILES=mt6358.yaml'

Could you please help to paste the error log for me?
If there are new errors, I need to check if there is any
environment issue.

> Do not send untested code, it's a waste of reviewers' time.
> 
> Best regards,
> Krzysztof
> 
> 
Thanks
Macpaul Lin

