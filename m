Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA1C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 04:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwtWu0DCUQcqL2AbeV9o6E8LOIY/Guz8mm3XwNfsN8Y=; b=elz1sXIeNN5qGDxx2rM3d/s26v
	ORlr5UGDk+oEqaVucsCFXFj9zf62ZJL3sSZnjJs8UmG/7wKNxmHpL4GrvWdUIFe5/rOaOj4fTqj+F
	uZZds6MHGoPU6fmeB650+onufysrj0yffS8p2Vc2zfcQ7IERR+0lQiPtmojbz9N9qXjL4Dq1ha8xZ
	ixP00go/FHyL4k5lXmJt2XmM0MJFoDnn+49p466BxQGUeBfMXxE0/Jvx3N2oNy3AsE2+jncMnTgEp
	Yz4Ganout2SE/re5qGUiQWl95+bBN1cjLE96v4tZLDk3+CJI2TR3JIYkTsIszwzhsGrYCs8FSOK6m
	8vMiOJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbY18-00000003mQW-3rom;
	Wed, 07 Aug 2024 04:11:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbY0a-00000003mOt-0CW7;
	Wed, 07 Aug 2024 04:10:45 +0000
X-UUID: 005e183a547311efa6c87f6b4542ff6b-20240806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=RwtWu0DCUQcqL2AbeV9o6E8LOIY/Guz8mm3XwNfsN8Y=;
	b=LzU3slESov7w1FttuPxNBpm8NRLUXzQtbkDIjxDA000v524OJAqfofbtksL1N5PGPzPeLk3G10vvClG8rudRVFN+ejeFUZ2GUX/9CKdfOEzWxSmS0FIZNyqP2Q4ZxyH9Fc028MORaLlhWDzVnNahHH6tpr+0tJuHd6vdaDoE3xo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a0e1f986-429c-4b11-aa19-3340e1a49bfb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1cecd23e-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 005e183a547311efa6c87f6b4542ff6b-20240806
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1549886654; Tue, 06 Aug 2024 21:10:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 12:10:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 7 Aug 2024 12:09:59 +0800
Message-ID: <578f5419-f3b1-5df9-5deb-73f66ed25c32@mediatek.com>
Date: Wed, 7 Aug 2024 12:09:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Macpaul Lin <macpaul@gmail.com>, <linux-mediatek@lists.infradead.org>,
	"Sen Chu" <sen.chu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Bear
 Wang" <bear.wang@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	<devicetree@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
 <172295218959.1231449.7916299490960765265.robh@kernel.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <172295218959.1231449.7916299490960765265.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.697700-8.000000
X-TMASE-MatchedRID: 6otD/cJAac0OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0pW7W9TrAIvEcRBLZ5x+SkXH5YQyOg71ZZaNaxZBRbNWpa8cECJFHXJbdK
	+n9eiUFuoOfBxbEbJZsdXUSvQT1NqQgUInkqQBs+dtRmRhPNchi6GDroi1vrlS3XbY42OdY3Ff4
	ZsEWDa/T0jXWQJyI+B/oc9sHLpOHV6bMYbioM9qXvBWikXzNqDv8jdqvFOu+L+TXZJvYxoebEQi
	kyj8N/gkupALizK9LIS8F73QDbKA76KewI9xZOBRlqShqb35p59LQinZ4QefL6qvLNjDYTwsuf7
	RWbvUtyrusVRy4an8bxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.697700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 81A0E1DFA0D1BF9606B50FA8970F21AAC54C95C6ACC0F14E377C752C0DD6CF022000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_211044_119867_C7C9E150 
X-CRM114-Status: GOOD (  22.14  )
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


On 8/6/24 21:49, Rob Herring (Arm) wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Tue, 06 Aug 2024 20:25:07 +0800, Macpaul Lin wrote:
>> Convert the MediaTek MT6397 regulator bindings to DT schema.
>> 
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>  .../regulator/mediatek,mt6397-regulator.yaml  | 275 ++++++++++++++++++
>>  .../bindings/regulator/mt6397-regulator.txt   | 220 --------------
>>  2 files changed, 275 insertions(+), 220 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.example.dtb: /example-0/pwrap/pmic: failed to match any schema with compatible: ['mediatek,mt6397']

Thanks for the reminding.

I'm already using the latest dtschema (2024.05).
I've found the difference that I find this error because I'm always 
using the command to run dt_binding_check.
"make dt_binding_check DT_SCHEMA_FILES=mediatek,mt6397-regulator.yaml"

After I've replace the command to full dt_binding_check, I can find this 
error now with "make dt_binding_check".

Just report the difference of running checking tools.
I'll fix this error in the next patch. Thanks!

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240806122507.2766-1-macpaul.lin@mediatek.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
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

Best regards,
Macpaul Lin

