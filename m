Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8EAC02180
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 07:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOzS1fYuXawLqEdeQfCslk8qImk6u8m0BOnVeqEnmrY=; b=NECxHFnHyGHYmdocFA1TEiOj/w
	1ZKOz7zImo4KsHZ9d8K8nsRQ9lkFxa858Bl7FS6co9iU9y1JhasQ/0eol5R4kwPiRvreW/9962WVX
	a3trTL8LdtOBU5MUzkY9FI6Z7Njvq1+XKXa6iCvIRFg7GkEPDH6sZaMnc9yNAGzt4GIqFXl+po48/
	JCrwRS2EaMIqL7sGjDFimB4eIV7aaIeBumI35iCg6ryOEOaAH28bDi+oGG4CXiY5+e+2SMu3tGhqM
	IyX2GZq3L31fPp2oo3H/fpG7dZDQPYPJ6SqM5+PZWPk4m3gOCyEO3pFJf04H4jN2t3YitxrVYbD2h
	1aQkYwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spMrR-00000000GMa-01Sh;
	Sat, 14 Sep 2024 07:06:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spMrM-00000000GKd-2Kq7;
	Sat, 14 Sep 2024 07:06:22 +0000
X-UUID: d4b53f70726711efba0aef63c0775dbf-20240914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gOzS1fYuXawLqEdeQfCslk8qImk6u8m0BOnVeqEnmrY=;
	b=C0iM3a/UMwwJ2Ra1cmkHaoVgIIiOqgHjJPmOV2r9ovIFLRV7F8E6hG7aWp8fQoEhE3vh4qEKS98hq5Wb3evHZnAGHonRobXwo/ztiC+T9246ZnYKw/K1xgoamlZcbD43j/kvuSFNa6mHqeBb0y4CmrlKwaumPpTu7Z7EuInwSBI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:50f825c9-4ffe-41dc-abf4-3b4e01c919f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:39bc01b7-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d4b53f70726711efba0aef63c0775dbf-20240914
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 323142580; Sat, 14 Sep 2024 00:06:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 14 Sep 2024 15:06:11 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Sat, 14 Sep 2024 15:06:11 +0800
Message-ID: <099c4f3e-0772-3d30-79f7-8b996142cd7c@mediatek.com>
Date: Sat, 14 Sep 2024 15:06:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen Zhong
	<chen.zhong@mediatek.com>, <linux-leds@vger.kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Lee Jones
	<lee@kernel.org>, <linux-mediatek@lists.infradead.org>, Macpaul Lin
	<macpaul@gmail.com>, Mark Brown <broonie@kernel.org>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, <linux-input@vger.kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-rtc@vger.kernel.org>, MediaTek Chromebook
 Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Sebastian
 Reichel <sre@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
	<devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Pablo Sun <pablo.sun@mediatek.com>
References: <20240913175926.7443-1-macpaul.lin@mediatek.com>
 <172625540069.478205.2893721075637493498.robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <172625540069.478205.2893721075637493498.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_000620_654476_5AF103C9 
X-CRM114-Status: GOOD (  19.88  )
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



On 9/14/24 03:23, Rob Herring (Arm) wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Sat, 14 Sep 2024 01:59:26 +0800, Macpaul Lin wrote:
>> Convert the mfd: mediatek: mt6397 binding to DT schema format.
>> 

[snip]

>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Warning: Duplicate compatible "mediatek,mt6357" found in schemas matching "$id":

I'm using dtschema 2024.09 and the dt_bindings_check didn't report this 
issue even the full check has been run.
However, the compatible "mediatek,mt6357" indeed existed in the old 
bindings. Since it is a independent DT schema now, I'll remove this line
and update v4 version to see if it will help.

Is there new version of dtschema used by bot? I guess the base shouldn't 
affect this duplicate detection whether using rc-1 or next-20240906.

[snip]

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240913175926.7443-1-macpaul.lin@mediatek.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch
The base of this patch set is based on next-20240906 with linux-next/master.

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Thanks
Macpaul Lin

