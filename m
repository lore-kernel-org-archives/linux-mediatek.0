Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E56C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tlSHw9ZM+FPr3Y3XYBP/zaKnsHhtp+N6M+45uR7o6c=; b=BWw50Gx/PhO1Ht
	X/z9U0gZGbh1AZwMRJ0SIIK8ukBe+qqlCMLPRZW5Sban3fwCISCJtTNozS0OsBUb7EQIVMPAliBX4
	yXCwb5CLhF9IkqMq+1oxiihNY3jPrpFYUspYYjOShzxmmMVzHuIP9nZzQtYOQsXoW7lH31cnPK9/n
	/uPhgOope5xchYLZEBmnOEJQbDOPOJl/tqz9jgHyD3BFCynE3ArTcXu/W5XnEjJjSuZ4JD4aZgWX1
	kqWilPC1pxgUeuLQf9Y/10CsHRnpvzsku2mAvmycDRCUw2XrRjeO7+MWWSwvkFUdAKlFxw92jcEdH
	9gFW+JmhsA5yU9Nta55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDBs-003n0s-QI; Mon, 06 Dec 2021 12:33:56 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([2001:888:0:108::1b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDBe-003mwY-Hz; Mon, 06 Dec 2021 12:33:44 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id uDBYmouE8QyExuDBbm29bY; Mon, 06 Dec 2021 13:33:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1638794021; bh=bZ+CLaoPT5tY5Fs+ojwV7IM2puh3ptKjmQumE2EskXM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
 Subject;
 b=X4WyQ3Fp534wSlbVoSTh1FXgXSqlGMEXsHS4YcWzReeS4LDuXa/lwTbYD4A9BUtv3
 mGYmj2S29NGlHeYx/KEvTsnaIzHTZwEWboY5ldnbTN1gvEvBH/Ywlt3pqQKyC6eRm3
 Aj3dWvs2pghyHSKPNoX8VHwhEOnf8KRb4zUdSeypdpDQlhaCf+jyRpJZ4/yFHCOsdT
 NmJIIzSnAxKLi6pl3tjByhd2lslWTJlROmRLu7LU/pkUsvurqkOr5lbEytEVZNwe36
 7ueMeLvySN/cmSomHmVHaGt9llrr6Mpdcjodzq6TEw8ZzXU2AedK7GxyeW0SYaw195
 vJtmYYhZEwqCA==
Message-ID: <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
Date: Mon, 6 Dec 2021 13:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <Ya35hNY0iAR/JPmI@8bytes.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Ya35hNY0iAR/JPmI@8bytes.org>
X-CMAE-Envelope: MS4xfC6q05SjXglfV5LxXFaSTSUMB/dlJSUNGmCADHFo5BmcyXwSnRfdCc1gNpWXs96C56P8Ity4Lw2P1xbKIlNoFwuzV4OYs5VbC4qyKxrfBLR09U0/kE5u
 5KEEkM7ZEJA7Nbmao7irdT15MoJD0Y+jwqFL5hqtuBO1x5Yx0YX9fcv9X+48YLAexPDS22OYZ3fRdQmu6BfbtFTNG1BXwYJrSv2CtcdC9z8ZxeoLDq7gRIQo
 d0WtL+CyxkfBKgBJQ5qIKFYPSAoE+PZ3JOHA3qp2uBhpOmyqe2+gX+Ct8sXYHfFzvXynqBIfyUiyMJ1SSnYawd3IXilpXxuLNhYqakWWMTuSMnnvEJmO94if
 kuLbLrG04MEtte+1n3coylDTLxKoM1Ny9Q+9+bHr1YRvg8aNBPrlq43SnobF13GLV+c25sLpdjI2GroYX7+bdBplzV7ti4urX6YMzjD8hE4t3dQgqZUcdoBM
 HyYp//T3CIVD1iPNhgFp51GKugQmeRE5wadiACVsyLD65InVfvNJQDpKdHgqB3mRFX87ah6D/NcC9O/TmvDGgL1nR1WlIwMHoHybex2mPoolv7l3KZQz54tf
 Y6nIrOdaTBKeWvZNjqWY77E4nOgZPVpaIiWyDiWaOams8YZuJBiAFu1gTL2DO18imGHECP+m4Efo9KmcjUfi05bEjCCi5SoZJMbQtauuBkhGw1BNi/nDvANX
 UF0e1EzKIl//d+5kCcgazSjh+WmzYFQzgpEh8Oav1klMGB+ATJgjuD2uQOhTkq1am3ZJ6bla4q8k0Umu7wARvp3LjjK41h/6SdcQOyZGmm0Ob1vg5tXjT7VV
 7gp87ouT+q/1l51vzHPSLspXXBfo3skIv4LPaBaAYrJbkxcqzjfKzCd8Td4ZijZ2ECIaFMLlm4wnunnHcPd9hQcf0FNulNqLSyPyhYUCwCrPnoX1M11bQDNc
 yhn1//ohwLCPL1IS6mrV8gQzOzz0xhOdyun/Ip7kSL/ImdbLORUz3UtJQRHtNdTBH/6AU7cAnGtFia5ho5wLyYQCNBe+R49EOznrp/miEZPfeN9qs3OKtyDN
 LR5mNbUz5XZf85F6CMwllw/hfEHRX69G3uiI3mzn+vq+52qQvot7It/LXvw5+cF949e6VmfTMpEdSIzqSDKq5gLKEYONyrxvCfiFkgiiq6GISkA+XpdOCFTQ
 5iw4uShr9zFgmQ7g9kR6y3Gb+SPNfXhh/Sl7SYgiZGGnvXKbDSZfirOZrIywOQ5yle4/Z6aNGlaG7pCuXAARbO2QdneI25kh8fkfd3DvxM18QAX7g269Kdbi
 9IVeQs/DebcHR50lMl1Gx9UAFiAe4vEbxxh8bFpvFFBykbMZLJ7pRM9+bChatDrg3fTSGVsh2KWR7BtOoiNxFgJu8HZt6D1Yf6osoRnq3Wv77FP6UoQmfhzY
 O6yuRj6tYBEB412IsrwaVJmqUfY9uOoDMebDRg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_043342_774066_5661C05D 
X-CRM114-Status: GOOD (  13.06  )
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
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/12/2021 12:52, Joerg Roedel wrote:
> On Fri, Nov 12, 2021 at 06:54:54PM +0800, Yong Wu wrote:
>> Yong Wu (14):
>>   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
>>   iommu/mediatek-v1: Free the existed fwspec if the master dev already
>>     has
>>   iommu/mediatek: Return ENODEV if the device is NULL
>>   iommu/mediatek: Add probe_defer for smi-larb
>>   iommu/mediatek: Add device_link between the consumer and the larb
>>     devices
>>   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>>   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>>   drm/mediatek: Get rid of mtk_smi_larb_get/put
>>   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>>   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>>   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>>   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
>>   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
>>
>> Yongqiang Niu (1):
>>   drm/mediatek: Add pm runtime support for ovl and rdma
> 
> What is the plan for merging this? If Matthias has no objections I can
> take the iommu-parts, or will this go through another tree?

I think it might be easiest if it is all going through the media subsystem
(except for the dts patches, we don't handle those unless specifically
requested to do so). I need a resend for jpeg bindings txt to yaml
conversion series first, though. This time with the linux-media mailinglist
included :-)

I would need your Ack for the iommu patches as well, of course.

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
