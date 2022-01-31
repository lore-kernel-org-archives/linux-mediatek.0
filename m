Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B54C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VefL/aHZXW3xr6REsKaXldSA/XnIOt7gOcF9L7boac=; b=gcfc6ild3kPnqfhkQu1M385srh
	NoHthty1toPOHnSJ5O8GNnbY5PHmJmPZgGu/bHz7+iTyqskSByGc3eNUKecFpu5e7osTJTHO4IF80
	ZKkWM8xfvs38kNBCCNYG/+9yXAc8GaZq2fFZNHRMjvgbaFAPMY4lUzTFqfFt5qW/so+U2Zp/E2LvU
	6ETOyYkUUoDTLd/3SEGqtvljq45haRPf/9QMk7yydn6ggFi+Mlcq7EKtOmdtqjK2LE01Gb1cC6wj7
	IpswgQw8gzGYDaE686LJtQCS2CG7RAmvVHoJgoojpmCu2KrsxM14Uov3XCyHjYuajv2WzAXJxMulD
	kVGjpz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVol-009M74-N8; Mon, 31 Jan 2022 12:29:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEVoi-009M5J-Fp; Mon, 31 Jan 2022 12:29:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id e2so25164811wra.2;
 Mon, 31 Jan 2022 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XfDEtvQ/tzVD1YeBowq1DH94HINF3JBGxRgfDDz4P9Q=;
 b=W4NHjEA+9XVVL8xz6qTEqQvruINpNG1pl5p/yaTwPsUbqDWoTdwk6B90cytFkMTHZT
 lrQuJGMCrkrs3FC5BaobUmorxlxni/0C26+D4VsSXYqKlUY8Ar8xiHI3b74c2sMVkTLU
 gSKadOZdH4vnOVfaH7dEpE2s9zlDj36v/3eMYHeSfAyUcZJ1HDwwiM1nyWsQnV4O0yRb
 O1xd+UqJM3rUINASsACdI5OKMhaHlXLsyvVO9ERwrZUlIgIG7kIn8nF6cUlGtvVMzycp
 83qu/fIP/2WVZAxPlTcZxmh9pHc3byTUiIOGNQbWxrf5VMQI0tURoHxAzof9DE6mx1vg
 FIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XfDEtvQ/tzVD1YeBowq1DH94HINF3JBGxRgfDDz4P9Q=;
 b=RlHYqwWSgpaiv4sBGmxcBNHYZiEciRrjZNK+Y2o1PoGqpvp2SlTzduZcdOlZIZ5JCJ
 sdjwgqiIeXyGP/FbxYAv53UnMQ6dyLFx5xjIdN74puSQrjXkMpo81GzTz/hjfbj8ATIC
 rScE0nq3VND1yG11k6J3ioZ7NErmlukApVzkK4kYGC9lIKUzYlUAe4425Ud8zfhxbSic
 js74olOGRtf1OmAIQ0AQb91V2r5kBF0hVbXsCgVEJeBR4uM2LWlPjZpNEl/OB/tbeULl
 JOHjnJZOo4OqANxm3mMm0TJAWnw/56yUyf/xLNi03BqRKl8wip3i2ZlcszTsKn2jkUWv
 N1+A==
X-Gm-Message-State: AOAM532KTi0dbTN7Taw9KjzgAMdTmoF8BLYmjNhFkJLCMDdSa4xxMC97
 kGRww0GaeUaA/Z2ZMwhEoUg=
X-Google-Smtp-Source: ABdhPJwKPAOlfE8A7dNEWpNDKJVV/rApo0lar6YbP+IVu/WUEb/GzeZxyimip5vdiaqDYs3eC4tjRQ==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr16792438wry.504.1643632193762; 
 Mon, 31 Jan 2022 04:29:53 -0800 (PST)
Received: from [192.168.0.14] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id m12sm13729547wrp.61.2022.01.31.04.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 04:29:53 -0800 (PST)
Message-ID: <5991ad51-4181-d445-284c-386447cffb95@gmail.com>
Date: Mon, 31 Jan 2022 13:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 02/13] iommu/mediatek-v1: Free the existed fwspec if
 the master dev already has
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Wu <yong.wu@mediatek.com>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
 <20220117070510.17642-3-yong.wu@mediatek.com>
 <20220128134055.720bb43c@coco.lan> <20220128134540.00c6c380@coco.lan>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220128134540.00c6c380@coco.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_042956_579608_21721216 
X-CRM114-Status: GOOD (  21.11  )
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, Hans Verkuil <hverkuil@xs4all.nl>,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/01/2022 13:45, Mauro Carvalho Chehab wrote:
> Em Fri, 28 Jan 2022 13:40:55 +0100
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
>> Hi Matthias/Yong,
>>
>> Are you ok if this patch gets merged via the media tree together with the
>> remaining series, or do you prefer to apply it via SoC tree instead?
> 
> Same questions for other patches touching files outside drivers/media
> on this pull request:
> 
> 	https://patchwork.kernel.org/project/linux-mediatek/patch/7af52d61-47c7-581d-62ed-76a7f8315b16@xs4all.nl/
> 

Looks good to me.

Please let me know once you accepted the pull request and I'll queue the DTS 
related changes from this series.

Regards,
Matthias

> Like those:
> 	0004-0013-iommu-mediatek-v1-Free-the-existed-fwspec-if-the-mas.patch
> 	0005-0013-iommu-mediatek-Return-ENODEV-if-the-device-is-NULL.patch
> 	0006-0013-iommu-mediatek-Add-probe_defer-for-smi-larb.patch
> 	0007-0013-iommu-mediatek-Add-device_link-between-the-consumer-.patch
> 
> Regards,
> Mauro
> 
>>
>> Regards,
>> Mauro
>>
>>
>> Em Mon, 17 Jan 2022 15:04:59 +0800
>> Yong Wu <yong.wu@mediatek.com> escreveu:
>>
>>> When the iommu master device enters of_iommu_xlate, the ops may be
>>> NULL(iommu dev is defered), then it will initialize the fwspec here:
>>>
>>> [<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
>>> (iommu_fwspec_init+0xbc/0xd4)
>>> [<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
>>> (of_iommu_xlate+0x7c/0x12c)
>>> [<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
>>> (of_iommu_configure+0x144/0x1e8)
>>>
>>> BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
>>> weird. We always expect create the fwspec internally. otherwise it will
>>> enter here and return fail.
>>>
>>> static int mtk_iommu_create_mapping(struct device *dev,
>>> 				    struct of_phandle_args *args)
>>> {
>>>          ...
>>> 	if (!fwspec) {
>>> 	        ....
>>> 	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
>>>                  >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
>>> 		return -EINVAL;
>>> 	}
>>> 	...
>>> }
>>>
>>> Thus, Free the existed fwspec if the master device already has fwspec.
>>>
>>> This issue is reported at:
>>> https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/
>>>
>>> Reported-by: Frank Wunderlich <frank-w@public-files.de>
>>> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> Acked-by: Joerg Roedel <jroedel@suse.de>
>>> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
>>> index be22fcf988ce..1467ba1e4417 100644
>>> --- a/drivers/iommu/mtk_iommu_v1.c
>>> +++ b/drivers/iommu/mtk_iommu_v1.c
>>> @@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>>>   	struct mtk_iommu_data *data;
>>>   	int err, idx = 0;
>>>   
>>> +	/*
>>> +	 * In the deferred case, free the existed fwspec.
>>> +	 * Always initialize the fwspec internally.
>>> +	 */
>>> +	if (fwspec) {
>>> +		iommu_fwspec_free(dev);
>>> +		fwspec = dev_iommu_fwspec_get(dev);
>>> +	}
>>> +
>>>   	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>>>   					   "#iommu-cells",
>>>   					   idx, &iommu_spec)) {
>>
>>
>>
>> Thanks,
>> Mauro
> 
> 
> 
> Thanks,
> Mauro

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
