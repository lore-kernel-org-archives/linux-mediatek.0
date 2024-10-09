Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82004CF044D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=125oV6D49C4A1z2NuIkQKe4FP+y9yJocFdv6uX2yYjs=; b=M3nUMQOn2Q/neyRvHRTBEZL9Ru
	HECvQxMeiSGtXHcqqPYvxoapeeB7XFkDl20BqDH2Bt7G/KlksGZA36mw57b7LQpgXc+C1fnFWjq7t
	Gi8Qh2vyqW69Vak7U1w+yAc+JhWb0cc3hDWt/i92uOqZHARqHYWGd/l9foPbcQ+blNn+xW3umPbqi
	rX7fY/j7HR04XvDNGn/q2ufiwt08cEL4c7OVSPKnzfw8xSs459QFKYu9nNCeY6aZ+uBmTupsENoM8
	w3vGGPiJ7MwM+c7FaGShnwFeYGYJ+M4rsIIDXq7ECuReFnHdqVmPnHXqFT0oLNnGb0u7t42GICn12
	HG8QwR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUGf-00000008wP4-2SlZ;
	Wed, 09 Oct 2024 10:50:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUFL-00000008wIg-1dcr;
	Wed, 09 Oct 2024 10:48:48 +0000
X-UUID: 0d35e0b6862c11efba0aef63c0775dbf-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=125oV6D49C4A1z2NuIkQKe4FP+y9yJocFdv6uX2yYjs=;
	b=Jt8B/gQ9bioKHEhXgp0OSySseHKystPjzQElXXxAXKcO1sNh372gNqsI7IKZYUe1ZUfaHlp/KTxW+KZdhnKJoq8yPziM0HAuRDwxCB2am0yHfVeH563/5L6kYjMaY4m32/1Ze1gMdbry3vq/gT4tWVuzWCAL6ruWdfcz7O80t1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c8d5868f-293c-4580-8746-75716b1e9a37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:fd5f8926-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0d35e0b6862c11efba0aef63c0775dbf-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 114926194; Wed, 09 Oct 2024 03:48:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 18:48:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 9 Oct 2024 18:48:37 +0800
Message-ID: <9bf35a15-80ce-708d-3a45-08839edf41dc@mediatek.com>
Date: Wed, 9 Oct 2024 18:48:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year
 property to RTC
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <eddie.huang@mediatek.com>,
	<sean.wang@mediatek.com>, <alexandre.belloni@bootlin.com>,
	<sen.chu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<kernel@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
 <20241009103307.GD276481@google.com> <20241009103746.GE276481@google.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241009103746.GE276481@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.158500-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rfEt9Ay9zO7g20q/tyc1edx6hrpRSrYiv5bNUY+JJjyA6QlBHhBZuwAr5
	mokJOphAzNhvZcetROVc3B1k53+RhemzGG4qDPakZXJLztZviXJWr6iSXWtgP+yNYYwngrxaJtv
	q2ZmkpN/CGbwGH/FjAUvthaNK4TPYYB2fOueQzj4MbH85DUZXyseWplitmp0j6C0ePs7A07cNbT
	FVOzjU8gwrmQLYen6kXt4N9KJ/nKNbV/0cyXV+n9qL5WV0e01k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.158500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1153258BB8DA91B7858CF9A1A20F13D2387AE487A4B2C14681D709B82FAE76592000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_034847_460213_75F32B24 
X-CRM114-Status: GOOD (  18.29  )
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



On 10/9/24 18:37, Lee Jones wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Wed, 09 Oct 2024, Lee Jones wrote:
> 
>> On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:
>> 
>> > Il 09/10/24 12:15, Lee Jones ha scritto:
>> > > On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
>> > > 
>> > > > Enable evaluating the start-year property to allow shifting the
>> > > > RTC's HW range.
>> > > > 
>> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> > > > ---
>> > > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
>> > > 
>> > > No such file.
>> > > 
>> > 
>> > In the cover letter, I wrote:
>> > 
>> > 
>> > For the bindings commit, this series goes on top of the MT6397 schema
>> > conversion from Macpaul Lin [1].
>> > 
>> > This series was tested on a MT8195 Cherry Tomato Chromebook.
>> > 
>> > [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
>> > 
>> > 
>> > So, that's why. :-)
>> 
>> Nope, try again. :)
> 
> I guess you actually mean:
> 
>    https://lore.kernel.org/all/20240918064955.6518-2-macpaul.lin@mediatek.com/
> 
> It's on my list.  I'll place yours behind it and see how we go.

Just a reminder.
The last reviewed patch set should be 'v8' because of the update for

'Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml'

[1/3] 
https://lore.kernel.org/all/20241001104145.24054-1-macpaul.lin@mediatek.com/

The [2/3] and [3/3] patches are dependent.

> 
> -- 
> Lee Jones [李琼斯]
> 

Thanks
Macpaul Lin

