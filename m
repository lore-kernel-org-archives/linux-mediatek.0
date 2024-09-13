Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E59BFC6160
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvl9lrny6mvsK5Tak3zaIUvWCax7srnhKft2K/5hlG8=; b=aQO9gb1JOGbB+ZJTk6NAopT7Lv
	H+BEtPo/ybtEAAV/jBg7sYVh+y0UOn3b1IkArPzf197dPv75yIn7sII67QdcLPXpHWrdPAiqzAmUt
	SxLQqF/tdiwNBDVjDqWhGmxep6s4F59Z/x+mqoLG9W5C2ohV6Tu1rmufoXAW42BEbqVXmqHn5dZF8
	C/QNKv2LnPpe9vW2nfUiDOMzl5H6HcztX+Bjk5ES+M1RqUMWrU2r2rmmAdUfNjOzdHpmEybefVoqQ
	JhrrJ+/OLP+88wnu3E6sOI7ibTo/dHqLwcTpF2GXb2DvZVzzwZYRqGG+tn2BWosP6atWWaD09/QXT
	VPVVEXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sp9HE-0000000GZJz-0A6f;
	Fri, 13 Sep 2024 16:36:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sp9G8-0000000GZ8y-17Bo;
	Fri, 13 Sep 2024 16:35:01 +0000
X-UUID: 1c578b0071ee11efba0aef63c0775dbf-20240913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Gvl9lrny6mvsK5Tak3zaIUvWCax7srnhKft2K/5hlG8=;
	b=fNRELFfxUrdIlFmeG6ikL9MmcgsFOQk2ObS4OMyFk1Zc5iLi8fE6Rgf1JyzJbHB85l/4bLNCOoGnPlh+5E7s2qKsdM+TGcO2ESyyNQooKH2TbGVGjqqPk119MKg46obgnQdvoRXFC+4B6wBACZqP+tMdc3TJRew9ovZObtpO+nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9cb3b4a3-adc1-4ae9-8ca4-aad427941488,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3848fcb6-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c578b0071ee11efba0aef63c0775dbf-20240913
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1820668336; Fri, 13 Sep 2024 09:34:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Sep 2024 09:34:20 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Sat, 14 Sep 2024 00:33:24 +0800
Message-ID: <117a6f04-4228-8ff5-5b19-766cfbbf0771@mediatek.com>
Date: Sat, 14 Sep 2024 00:33:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 6/7] dt-bindings: power: reset: mt6323: merge to MFD
 mediatek,mt6397 DT schema
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Sean Wang
	<sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, Flora Fu <flora.fu@mediatek.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
 <20240830110732.30080-6-macpaul.lin@mediatek.com>
 <01020191b9d74883-4c4deeb2-1be0-4c45-9fff-c228767de23d-000000@eu-west-1.amazonses.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <01020191b9d74883-4c4deeb2-1be0-4c45-9fff-c228767de23d-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_093500_316469_DC364342 
X-CRM114-Status: GOOD (  16.10  )
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



On 9/4/24 05:42, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 30, 2024 at 07:07:31PM GMT, Macpaul Lin wrote:
>> Convert mt6323-poweroff.txt to be compatible with DT schema.
>> Since this is a power-controller device node, merge it into parent
>> mediatek,mt6397.yaml. Subsequently, remove mt6323-poweroff.txt with a
>> separate patch.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
> 
> Please merge this into PATCH 2/7 in the next version of the patchset
> (i.e. the patch creating the new YAML binding).
> 
> -- Sebastian
> 

[snip]

Will squash the other patches for removing text format files in to the 
MFD patch in next (v3) version. Thanks!

Regards,
Macpaul Lin



