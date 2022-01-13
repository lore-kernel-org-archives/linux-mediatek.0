Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B833AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN0/7F3QI90GeYViUKbDZL8i07uSHgeFKkZwmvVUzsA=; b=QmXlqSqsnMHQN6kOXG44zVUrtm
	THqkm18/e7M1ABncVF89qMq+HxjQhGXCqrIuuOOwGuxlTjC/zc1q+Jcs++fT06Cztrg/rAApj2YZi
	8tTS0m/VX8KA3PWvdg1Fx7veCFYjIr09HkpoY37Gj3xWuJXdlX5mpwbU2XXOyIRH2lFr4+0h6Sydg
	hsNbQ9TJsBKU3L2YtP6SgPxi8VINt1pZ93OOjftNz9w4P76CxgbGOlDEB//nvihlo5r72vGsI5yun
	N4+aSi+FMnBU0mvP7SWnpD+EcCeF1chKVtZfcWCAhGtWl4OMaUUAj5vSt3Q9p8WKmglmjNTuPg/YR
	fjKo8LCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xBL-005Ph5-0e; Thu, 13 Jan 2022 10:18:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xB8-005PcT-8n; Thu, 13 Jan 2022 10:17:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 45B681F45862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642069076;
 bh=T7qkUHIGvD2MBe7s1NOE5lt53pqK04MKOvifdF0rNoY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CyaAEO9rKcBvrFhGLZAoimPcLxSMEm92hJLMuMf+HJhwZKp4K+aDCaMMjizvaR73Q
 Inqb0z4Oz2NjS6TY824HPwSZlfAHNcxjIM3WWAawNuH4gMOfwLkOmN+2WDz5h+EZv8
 1+ifhD4rF61qu6rdox/qBG8zvqGFvGZwhrYJoyw8ohTL4g/pZtH4nT7f6V468ia4Tn
 5xuSfcNlzHQWInMD+bcG5dDvl+bPVWshrAptVXkEJt78UZjM8CImZgMC4Hd9hCeLda
 pI1WdpGlX+smpBtL/nBLQT3l3OFJZddqzu9xFL3EF2XfSemxDCqF6A72RKzQCtgBxG
 sYToruJydriyQ==
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
To: Hans Verkuil <hverkuil@xs4all.nl>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
 <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d3f4896f-d254-e0fb-0d2a-e78fbe50d84d@collabora.com>
Date: Thu, 13 Jan 2022 11:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_021758_481055_84D46476 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/01/22 11:15, Hans Verkuil ha scritto:
> On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
>> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>>> then remove that function, use pm_runtime_disable instead.
>>>>
>>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>>> rename it from the _pm to _clk.
>>>>
>>>> No functional change.
>>>>
>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>
>> Hello Yong,
>> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
>> scheduled that for v5.18.
>>
>> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
>> media: mtk-vcodec: *) from this series?
>>
>> For the records, I think that after sending v10 this series is ready to be merged,
>> as it was well reviewed and also tested on many MTK platforms.
> 
> Good to know. When I have the v10 I'll try to prioritize reviewing it and running
> my usual tests.

Thank you Hans, that's very much appreciated!

> 
> Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
> any issues (using common sense).
> 
> Regards,
> 
> 	Hans
> 
>>
>> Thank you,
>> - Angelo
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
