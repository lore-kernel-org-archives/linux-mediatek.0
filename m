Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F11CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hFbDqdqARkXESCpWhEKpXy666gO0BZMnAA7bAJp/zY=; b=JiVkbevSDwmTXpHvO6+u1W2ZI+
	P1+sksho8RAgin2Flje2Y9xaObwXVyIS0T0GVA+daUpr82paZE2oJGDRoxk18uy7FQEfJtaUGPH93
	SaGbssHTuZPBllFoPwpydGRm+4ZKcbPmRxjRSCwoGMCgQjCspx+1Dbwmeo1IvGZ2vt3/Febhf1l71
	yFbhtXxViptskANGwpLGHpEZqU5ZhK/ybDSIdZdTpH4JwppTjd7QEFzvFwmevT34j84NA3nCO9eON
	XZV/jfJrSXddWM83qTLHyywr/EkYGVifaY7zP7Kl7Mq7quMw0mti6frngzZSCOl11JWPdjiJVfB86
	ego3KxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk05M-000000066l3-25ir;
	Fri, 30 Aug 2024 11:46:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk04V-000000066gz-0lU8;
	Fri, 30 Aug 2024 11:45:44 +0000
X-UUID: 603ca16866c511efba0aef63c0775dbf-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=8hFbDqdqARkXESCpWhEKpXy666gO0BZMnAA7bAJp/zY=;
	b=kQy1H/0yHnVwaqCdm2FqJ1a1LSyGue3PSruFY0837fmDETWiFzQezOgrmtkd5t9Xq1v2t8Fw9sU2DKaWFP8uYjcczvD8Se8BsjqTOFkn969Fuim4y68l88uQyyfoEPgS18NrXwO4d9LgPUiazF61wy038o8T0SFnlgQzp1xhQ/0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:aa07f51d-c638-4743-b9d4-a514dbd7c70d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:77d80d15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 603ca16866c511efba0aef63c0775dbf-20240830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975359706; Fri, 30 Aug 2024 04:45:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 19:25:34 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 30 Aug 2024 19:25:33 +0800
Message-ID: <2d2626a7-b920-6113-e81c-3b24463c1fe1@mediatek.com>
Date: Fri, 30 Aug 2024 19:25:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt6357: Fixup reference to
 pwrap node
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora
 Fu <flora.fu@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
	<sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek
 Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>
References: <20240826065415.19641-1-macpaul.lin@mediatek.com>
 <20240826-slurp-earphone-0d5173923ae8@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240826-slurp-earphone-0d5173923ae8@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_044543_260460_0F03E024 
X-CRM114-Status: GOOD (  15.85  )
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


On 8/26/24 23:50, Conor Dooley wrote:
> On Mon, Aug 26, 2024 at 02:54:15PM +0800, Macpaul Lin wrote:
>> The mt6357 is a subnode of pwrap node. Previously, the documentation
>> only included a note in the description of mt6357. This change adds the
>> appropriate $ref for pwrap to ensure clarity and correctness.
> 
> I think this change is wrong and the existing binding is fine.
> Adding the ref overcomplicates the binding completely, and stating that
> this is a child node of another device is sufficient.
> 
> Instead, if anything, the pwrap binding should have a ref to /this/
> binding.
> 
> Thanks,
> Conor.

Thanks for the clarification of this parent-child relationship of the 
binding. Will apply to further conversion tasks.

There are many PMIC devices belongs to the pwrap bindings. Hope I'll 
have time to fix this soon.

>>
>>    $ref: /schemas/soc/mediatek/mediatek,pwrap.yaml
>>
>> Additionally, the indentation for the pmic section has been adjusted
>> to match the corresponding structure.

Best regards,
Macpaul Lin

