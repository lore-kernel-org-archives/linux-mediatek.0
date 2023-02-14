Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B74C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7By/CSrNIkxlAnNQm7oQbgRcFOiTF9x2QDUAHmsAms=; b=v9kMHwdWRC9Njo0DsNdhKzDN98
	8OjPbT508HEsh6N1mRfUVsVlgoSh4LQpD8yFe1VSMKYo7JXPhMH8h3+HJY63MLuKn4eyPA2FauBO1
	HE9cVN8+EY8M/EU3Qi8hJzhCGk9VREtKFjhyZM9PqF/HZJzvrQirnHNlENlhrNqaSoC3fRKpWDeJi
	0XFOkQwcUkVUQk2ZsYVUcXdbTtIKaw9iWK5BW45EG1LLHE/Fa+vmLveFHqvW3DgUWxR/pDfBxAJwC
	NZo8sL0MNL+I3Kf4fGIpb3rlx91gzc26uqt0Kem54NaHpw+q/JG7aLq6sPvBbr25aLZIFzTwg4999
	l5G0Pa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrjf-000jpR-Ki; Tue, 14 Feb 2023 09:36:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrjV-000jnJ-1c; Tue, 14 Feb 2023 09:36:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9062660216A;
	Tue, 14 Feb 2023 09:36:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676367375;
	bh=I0xlUPTQjUVqujxFEQUs5rV8kqpJYvjuzeEqfHqSU04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l7tFNlOyJodSIoviMgrVgynN/hgCGoWsiMMoPzS5mT6IMyqxYoXq7FRnqd4Y5BT5n
	 oNgbU920nBZAAlhrz7YO9Fyn8koyaQuAEy+8AMz9Ll6hvS41NTpmhEwT9+fTKj7U88
	 W3W9pLyjQS8cRqeAlGY5jscc+Pa/tR6VCNsDZXt06hjyqfJQunMGeMNDa/UQewZWd+
	 OfsNvlDKW98FTRYSF/ywk1idQQ4L7X+DOvvLycalMgtLjNwEwLV/P1DMVz4iCjK1L8
	 EgyoWkqBnrPB/eWzf0BrpMahzYPWmAG3JIFCy2BemqxPhG0nJKV4efXKI6VKsS3bR6
	 Nu/jtxaSCLrXw==
Message-ID: <17239a6f-1d85-d725-89d6-02afe4fbe56a@collabora.com>
Date: Tue, 14 Feb 2023 10:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 05/11] iommu/mediatek: mt8195: Add iova_region_larb_msk
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230214031114.926-1-yong.wu@mediatek.com>
 <20230214031114.926-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214031114.926-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_013617_247280_B0E8E0C0 
X-CRM114-Status: GOOD (  10.30  )
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

Il 14/02/23 04:11, Yong Wu ha scritto:
> Add iova_region_larb_msk for mt8195. We separate the 16GB iova regions
> by each device's larbid/portid.
> Refer to include/dt-bindings/memory/mt8195-memory-port.h
> 
> Define a new macro MT8192_MULTI_REGION_MAX_NR to indicate
> the index of mt8xxx_larb_region_msk and
> "struct mtk_iommu_iova_region mt8192_multi_dom"
> are the same.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Sorry but... you *are* introducing a iova_region_larb_msk for MT8192 later,
while you're introducing definitions containing the `MT8192` name in a commit
that introduces the same but for MT8195.

I strongly suggest to, at this point, introduce MT8192 region mask here, along
with the MT8192 definitions, and MT8195 after that :-)


Regards,
Angelo


