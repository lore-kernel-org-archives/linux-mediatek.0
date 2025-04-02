Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11625C3601A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHeI/enDitFlBEcc048aGVEh0jINU/AtcrHazOovAk8=; b=M4OT5ca9gcuAae+TpNDXfZ9Kn3
	GCt9AWmsqObi8I+R5HDurce/fMs3f30X6mbURt5Dhqg85hTkw27MJsuhQ2VEv15YqJVSBk+f8qkN4
	XruPIzzAz0a6dujJtyjC8yegwlb+nD3z951lE5gShv4DJePfz6FPLkRNOyF+4tNezIvc47/EUmo8f
	W0LOdx9TXPcc6ol7ZiD75GsxGcJ/8XGYAddiSqq9tYuW+oPFHj/IDs9Oxo+Ou2ED2krVPTWuxoZTx
	zagOE3q3aJMmjNwwPMW9VEZ+bOEjZS9gO8fSbMt/wiQr/cW3bsKMiqTI6PSxo29BIAidGxBUpPtaY
	vcob46Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00A9-00000006XXU-0Zwf;
	Wed, 02 Apr 2025 15:37:57 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u007R-00000006XFu-3N0Z
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 15:35:11 +0000
Received: from engine.ppe-hosted.com (unknown [10.7.65.235])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id A034E60159;
	Wed,  2 Apr 2025 15:35:08 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id CFD55A800B7;
	Wed,  2 Apr 2025 15:35:04 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 3A17113C2B0;
	Wed,  2 Apr 2025 08:35:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 3A17113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1743608104;
	bh=1U55AuNF9Zw5tptF5+2WY9llHsrHeffahgoSOBnxAVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FKNGCy23K0a4xEaSzzcSYqgSH09WZCtvAGtFgaQp4azFqE83HSLqedAIzrNKKWcYn
	 BIXeY7u3zYMvn+Ga/vju8Wp1jwq9DCC4+IjRcnLrx/fie38H68g6MUvvISOSjr45ZA
	 HYBmfbBTi7VpKtIkmITebmR0z49GQRDHVlBC7ZOw=
Message-ID: <90f222c1-518d-90a2-6ae5-47cb13692c8b@candelatech.com>
Date: Wed, 2 Apr 2025 08:35:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 09/10] wifi: mt76: mt7996: rework background radar check
 for mt7990
To: Ping-Ke Shih <pkshih@realtek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
 <20250328055058.1648755-10-shayne.chen@mediatek.com>
 <59abf964667144b0ab10220e41b6b821@realtek.com>
 <29344a3f054368ae948415d6183365a09d1fe6d5.camel@mediatek.com>
 <44832c3d3a74429aaa095bdba4573391@realtek.com>
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <44832c3d3a74429aaa095bdba4573391@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1743608106-awR-MG-B6MkV
X-MDID-O: us5;ut7;1743608106;awR-MG-B6MkV;<greearb@candelatech.com>;6f4ef9b9d2914700e150fb80c2b35f23
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083509_886349_C676BC16 
X-CRM114-Status: GOOD (  15.77  )
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

On 4/1/25 18:30, Ping-Ke Shih wrote:
> Shayne Chen <shayne.chen@mediatek.com> wrote:
> 
>> On Mon, 2025-03-31 at 05:55 +0000, Ping-Ke Shih wrote:
>>>
>>>
>>> Shayne Chen <shayne.chen@mediatek.com> wrote:
>>>
>>> [...]
>>>
>>>> +
>>>> +bool mt7996_eeprom_has_background_radar(struct mt7996_dev *dev)
>>>> +{
>>>> +       switch (mt76_chip(&dev->mt76)) {
>>>> +       case MT7996_DEVICE_ID:
>>>> +               if (dev->var.type == MT7996_VAR_TYPE_233)
>>>> +                       return false;
>>>> +               break;
>>>> +       case MT7992_DEVICE_ID:
>>>> +               if (dev->var.type == MT7992_VAR_TYPE_23)
>>>> +                       return false;
>>>> +               break;
>>>> +       case MT7990_DEVICE_ID: {
>>>> +               u8 path, rx_path, nss, *eeprom = dev-
>>>>> mt76.eeprom.data;
>>>> +
>>>> +               mt7996_eeprom_parse_stream(eeprom, MT_BAND1, &path,
>>>> &rx_path, &nss);
>>>> +               /* Disable background radar capability in 3T3R */
>>>> +               if (path == 3 || rx_path == 3)
>>>> +                       return false;
>>>> +               break;
>>>> +       }
>>>
>>> The indentation of close brace looks weird.
>>
>> Will fix it, thanks.
>>>
>>> Since -Wdeclaration-after-statement is dropped, I think compilers
>>> will not
>>> warn without the braces. But note that it is still not recommended to
>>> put declarations in the middle.
>>>
>> Since those variables are currently only used by mt7990 case, I think
>> they can be putting there for the moment.
> 
> That looks not very natural though...
> 
> In fact, the declarations either in beginning of this function or at the
> mt7990 case, the frame size (stack) are the same.

The open parens make it the start of a new code block, so even strict
old c compilers should handle this just fine, and I personally like
variables kept to a tight local scope if possible.  Unless there is a
technical reason to change the code, then there are probably more important
things to worry about.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



