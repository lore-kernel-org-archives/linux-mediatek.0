Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F3CED24D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 01:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMRavPU31cBGTn/6HZlIp9pt4S49zJD0Tjvymm+53a4=; b=CUdJi8JKbh3EIUKkz0mpsAnvyN
	GdFoRO31BSBxr2SidIP+9bsIrAENp7/XouanZPE5fYKCwtTzHSWwzTZOmG+6Fq4FGKITwOIAEGtax
	szxLYoVWUdrttxfVL1IYrBeigKQZzHTl72utnXwBgF8wksx/IqlQeB6yk6LCSkHfwlQBR7UKuDPQq
	cPRoavQYVX8OxINPEvqaSjMhdrH6uJfjmjkbhp2sWhDPLZaREYMb8Ff9IbvCb1RpC0KAsEjBEZsZ4
	7tJO/YY9c88BIJQTuV0LOKjngDAV0Yr8YIBS+7H8d5KMgGMKJxjl6ZqPriNFGiQBnrKVBR49OfNlZ
	/IGChC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyvL-00000004BDj-3g4b;
	Tue, 08 Oct 2024 01:22:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyvI-00000004BDA-31K7;
	Tue, 08 Oct 2024 01:22:02 +0000
X-UUID: b40c76f8851311efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=PMRavPU31cBGTn/6HZlIp9pt4S49zJD0Tjvymm+53a4=;
	b=g4pGe95A85+Wr1OcuOuyguVg0MSW6h5ov6HLFF6vIm2skIxalVGzRbfk7bQ8PKaoBGG5P6INDNKyoHfAh4rAby3cE2hHq5TTpjRz21G3UQfrJs0TXtDg0CW3vPaphTW325SeovCT00KOWhVKhmdf/igySrv30ttNq7nBqLeL9vc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2c6f35f1-396a-4a88-981a-a51034783fdd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:dc89e464-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b40c76f8851311efb3adad29d29602c1-20241007
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1221377376; Mon, 07 Oct 2024 18:21:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 18:21:51 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 8 Oct 2024 09:21:51 +0800
Message-ID: <f5b027b7-7490-3f96-66a7-ff6513ba8309@mediatek.com>
Date: Tue, 8 Oct 2024 09:21:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: mediatek: pwrap: add pwrap driver for MT8188 SoC
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin
	<macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20241007024350.7878-1-macpaul.lin@mediatek.com>
 <381fcbfa-edfb-46c8-8ee2-1386af2ba4c4@collabora.com>
 <CAC=S1nj-hpt9CS1+_Jt8C710KDz1uYTcTS5qGqSZT9qmmVm7Yg@mail.gmail.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <CAC=S1nj-hpt9CS1+_Jt8C710KDz1uYTcTS5qGqSZT9qmmVm7Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_182200_787450_4CD5F9E9 
X-CRM114-Status: GOOD (  16.46  )
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



On 10/7/24 23:23, Fei Shao wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Mon, Oct 7, 2024 at 10:55 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 07/10/24 04:43, Macpaul Lin ha scritto:
>> > MT8188 are highly integrated SoC and use PMIC_MT6359 for
>> > power management. This patch adds pwrap master driver to
>> > access PMIC_MT6359.
>> >
>> > Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>
>> Actually, MT8188 and MT8195's pwrap registers and code flow are exactly the same:
>> since they are, we don't need this commit (or we don't need it right now!), and
>> we can just update the binding so that we can declare...
>>
>> compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
>>
>> ...hence this driver doesn't get any commit :-)
> 
> ... which is already the case. :)
> See commit 040c3303f110 ("dt-bindings: soc: mediatek: pwrap: Modify
> compatible for MT8188").
> And the device tree is set as well, so it's all good for MT8188 I believe.
> 
> Cheers,
> Fei
> 

Oh. Thank you for the reminder and point out the related commits.
Then this patch could be dropped.

Thanks!
Macpaul Lin

