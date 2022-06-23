Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA38C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IyvfwMHH5J6RGveILMnRqY90+quKBsg4EFMniIhpp4=; b=g9Qo04yn7dybUFz3Q143vU98RE
	EqyTfFtV5plAHr7Mj7NcX+XWt4gERsW16lTmAxwEyWmvmBT7x89uie7X/9T4i6adZHVuGCMFro24X
	hCkbIJxAZLTv70uNncONx6Q8CSC9Jd9H9QwJ0hvOpW+wOzXutCFyA8yKdblD4ht/oeKPuhzJE+A5f
	Q9F/FWslGRgVpSXZe2KGxwnLfos4ZFctSl8Vg4v/psFzDIl4eAy45nCtYkHVRmlPiRrNxZz8qKHU+
	et25uor9eGhZQywEd3+KXMLTZeQ1fpEinBYeG5lFr46tNdpcD7IReP2hbFErTMmIbmsYlBUpeSY4+
	8IyCkVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HyB-00E1lT-ID; Thu, 23 Jun 2022 08:13:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Hxy-00E1fY-6B; Thu, 23 Jun 2022 08:13:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CA8A66016E1;
	Thu, 23 Jun 2022 09:13:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655972006;
	bh=aKUeSQS7JjwmLoA51+Y/QiVigSc3OYpsPtreXvN2cyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iCOPl6Mb1zctioVnRoo1h+YmE6mUnuFw6iO0R+k3aLmZKHCKnku7NBVDmt00tdhoN
	 DhQE2vLNb8WLU+xrS2XgPH4MFO/HJ8LPVVJZR7V83SApXqioJXOHOLzBujAgm0PYCW
	 Zki3btv0GC5UionwXKUjI+CLAY0lueTfh9o4u/dwYtALK60Su/15OzH+rDzbNnrZLm
	 A+LS85neuTq48igqYhv8BjyuTWQg484OqXKz3PFsezICja8Ei/GbaeAHbZ9wPQFcul
	 cAbmjq7ULZ1Nhhxk1lx9mWiFWL9yKSjbbtaQG3whgyH3mF9tJJx6ds9IDhYz1Nm0e2
	 0bHCntzaXUQNg==
Message-ID: <ff4dc55c-bb87-ac15-2d39-1f1ed41f4221@collabora.com>
Date: Thu, 23 Jun 2022 10:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] soc: mediatek: mutex: add suffix 0 to
 DDP_COMPONENT_DITHER for mt8395
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fabien Parent <fparent@baylibre.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
 <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
 <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_011330_489451_BEAAE464 
X-CRM114-Status: GOOD (  14.78  )
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

Il 23/06/22 02:33, Jason-JH Lin ha scritto:
> Hi Angelo,
> 
> Yes, I missed that!
> So just forget about this patch and use yours.
> 
> Thanks for your help :)
> 

No worries, it happens...
Btw, you're welcome.

Cheers!

> Regard,
> Jason-JH.Lin
> 
> On Wed, 2022-06-22 at 15:31 +0200, AngeloGioacchino Del Regno wrote:
>> Il 22/06/22 15:19, Jason-JH.Lin ha scritto:
>>> Add suffix 0 to DDP_COMPONENT_DITHER for mt8395.
>>>
>>> Fixes: 141311b856d8 ("soc: mediatek: mutex: add MT8365 support")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>
>>
>> Hello Jason-JH,
>>
>> you must've missed my commit, sent two days ago, which is doing the
>> same:
>>
>>
> https://lore.kernel.org/lkml/20220620102454.131417-1-angelogioacchino.delregno@collabora.com/T/#u
>>
>> Anyway, I have avoided to rename the definition, as from what I
>> understand
>> MT8365 has only one dither mod and that's called "DITHER", not
>> "DITHER0"...
>> ...but I've added the suffix to the array assignment, as that's what
>> we have
>> in the enumeration.
>>
>> I think that #define MT8365_MUTEX_MOD_DISP_DITHER should be kept as-
>> is.
>>
>> Also... this commit is not fixing anything, as it was already working
>> before,
>> so the Fixes tag shouldn't be present.
>>
>> Regards,
>> Angelo
>>

