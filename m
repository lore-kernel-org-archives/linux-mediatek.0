Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C55C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 00:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQnOg8JWy4btDSR5+c/gj471wc0iTGxUlJqHKUtLXfM=; b=QXOwCRe48uaDaeqvq9/c6dz+yP
	e6evEZ2yZ7AjEFK2aRZSZtCqzn1ol3jR8tPhj88kWFKwzxPrssb9wynVBfn74sedVFaqQiEzQpzvE
	PBkL8fac6cQYlO5YQwzSGEuwAuURZlee9ep1HI00Q8Sz8RcvPvRMrR8yfHBz4KXAThkVOLYDh3Djr
	7Zst4ewOm5wR8Ow8kVCboNSpLS9itIev9554pkto3VRAI+joPP6ca1RnQ/kvygIAiYbEwXa/mRqo3
	jJiWocooWggYjGXc3wYJ2zdUgcjo1rMkbzJeJy4gJWh1iRQBV6OU1J97phN9+W7a/IyS+orjgy2TK
	eFgowsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paQxx-00CVuz-Ei; Fri, 10 Mar 2023 00:50:37 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paQxu-00CVu5-Vc
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 00:50:36 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id B66FEAC007F;
	Fri, 10 Mar 2023 00:50:29 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id E9B5213C2B0;
	Thu,  9 Mar 2023 16:50:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E9B5213C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1678409429;
	bh=EJVz+TdW6NbIT299nfmymNsW/oWJlLvv8nx9PWrZf5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IHYTV6jHESZccrd7gdQoaK0DYMFw/Cr8XtLPj8b0gyBT6dJJ5kwmHLp+tUQ1dda4v
	 +jFE16DHevvR1Zr738s1dStf9LuB7vRu8PwHqWY3YkUtgNXHOwwl0YFwVFOw1DTOzK
	 kPU+49zzlEOLcF2UIhbCA1y9f0J+i0/b0fadi6yo=
Message-ID: <79728d21-400d-d294-f48e-a2ee091869bf@candelatech.com>
Date: Thu, 9 Mar 2023 16:50:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] wifi: mt76: mt7921: use driver flags rather than
 mac80211 flags to mcu
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <0c2eed5226aef8e7e219c748b9d20cb234cf9f8f.1678186986.git.deren.wu@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <0c2eed5226aef8e7e219c748b9d20cb234cf9f8f.1678186986.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1678409431-Xzc1GRKUxN6I
X-MDID-O: us5;ut7;1678409431;Xzc1GRKUxN6I;<greearb@candelatech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_165035_150905_9C7B8019 
X-CRM114-Status: GOOD (  14.40  )
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

On 3/7/23 03:22, Deren Wu wrote:
> From: Neil Chen <yn.chen@mediatek.com>
> 
> FIF_* flags from mac80211 is not ABI. mt7921 should not pass it into mcu
> directly. Remap FIF_* to driver defined flags as mcu command input.
> 
> Fixes: c222f77fd421 ("wifi: mt76: mt7921: fix rx filter incorrect by drv/fw inconsistent")
> Signed-off-by: Neil Chen <yn.chen@mediatek.com> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>

I tried this plus the patch it is fixing on 6.2.2+ kernel with 7922 radios,
and behaviour seems worse than before the two patches were applied.

Original problem I was trying to fix is that my STAs will connect fine on 5Ghz,
but then when I try to move them to 2.4Ghz, most will not scan anything.
Packet sniff shows probe responses and requests, so I suspected firmware is
filtering when it should not.

With the two patches applied, even 5Ghz is showing failure, with lots of
beacon loss messages (I am disabling beacon filtering, which previously worked
fine on 7921 nic in 5.19 kernel).

Are there other patches that I should consider to get 7922 to work better in 6.2.2+
kernel?

[root@ct523c-3b7f ~]# cat /debug/ieee80211/wiphy0/mt76/version
chipset:       7922
ASIC-Revision: 0x79220010
hw_sw_ver:     0x8a108a10
build_date:    20221227123154a
bus:           0000:04:00.0
fwcfg:         fwcfg-mmio-0000:04:00.0.txt
WM-hw_sw_ver:  ____000000
WM-build_date: 20221227123243
WA-hw_sw_ver:
WA-build_date:


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



