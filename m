Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA86C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ma85GCCpe6582TzxmH2DQK3jlW7xaNrRxhgf3wGxlaI=; b=4eIEvAvIVT2t1f
	q1LpZ+38OdLJtVOgfZU7VHNiJqF3CjWwmOGyfD/Cg7JcOLXqMTseYeqh2kQo4NC2im200FXSxiOYp
	qOIt5bcNm0q/LbCb7aoYqgwpWEWdiTrnzkBVGhVLNAuZ898HgvMtNvYzVVxma3iJB9bOvgRc5RB33
	WQOvAx3VG7tfBqMan1kE+KOXQzPIlllYk8b8EMQY4yjNmenannRn0gXUonz2m8m+m2djOPRJz0plF
	HGX+TDTPbde3+pJgX5TNavXrEpGj49k3U+acrPH+0Y20seA3AynBGbnWJhnChpt1ClBoti6ltWdTs
	ZNzAd3BwmEZxxxmN+p4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAsWu-00Er8O-9B; Fri, 21 Jan 2022 11:56:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAsWd-00Er3W-2u; Fri, 21 Jan 2022 11:56:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6792F61A88;
 Fri, 21 Jan 2022 11:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A35AC340E1;
 Fri, 21 Jan 2022 11:56:07 +0000 (UTC)
Message-ID: <8ae4a49a-4abf-be55-f6c8-9fc4ffd02fc8@xs4all.nl>
Date: Fri, 21 Jan 2022 12:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
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
 <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_035615_238049_57331BD9 
X-CRM114-Status: GOOD (  16.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On 1/13/22 17:10, Matthias Brugger wrote:
> Hi Hans,
> 
> On 13/01/2022 11:15, Hans Verkuil wrote:
>> On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
>>> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>>>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>>>> then remove that function, use pm_runtime_disable instead.
>>>>>
>>>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>>>> rename it from the _pm to _clk.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>
>>>
>>> Hello Yong,
>>> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
>>> scheduled that for v5.18.
>>>
>>> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
>>> media: mtk-vcodec: *) from this series?
>>>
>>> For the records, I think that after sending v10 this series is ready to be merged,
>>> as it was well reviewed and also tested on many MTK platforms.
>>
>> Good to know. When I have the v10 I'll try to prioritize reviewing it and running
>> my usual tests.
>>
>> Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
>> any issues (using common sense).
>>
> 
> Can you please take me in the look when you take the patches. I'll take the DTS related as soon as you queue up the others.

This just got merged into our tree.

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
