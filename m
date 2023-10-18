Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB4ECDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpalVXFnmfEZpl2gny06EY83cGYN2KyHJZnP/7qCC6I=; b=3zjgaTyQH+g3hd
	nSGNN6phaFoXgyUsbo1i09fS4bcZrsvCi3Ka5v/fNIJsGnnJd5MoDbBeStTdW6ES2zL6hj+uSmoji
	78rscoOmX7Tidt3EnSQGeQsWYErSwI2OX7C92Ry+jDgggvnNPqmiSW38GVaTtVGDhfoHpDFcfuYTh
	yuSw5Zg1jjekO/6GJdChfLRMugf9cfRdHSGjU6+rZ7CvWbdAnvqUb/zeJWI02HSvhKSOirmuORbPI
	2KzbM8kaFdCT5M0ZFAfp2lOhvCoj9nATGbPcEzuzsb4ilPC7UrjCalrtXLqo+TeqLbp2H6PfsFwqN
	PfSXarcpQwsTPngK7mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1Zp-00E6Ox-2r;
	Wed, 18 Oct 2023 08:06:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1Zm-00E6OG-1R;
	Wed, 18 Oct 2023 08:06:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 49E9B66072ED;
	Wed, 18 Oct 2023 09:06:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697616405;
	bh=SKaYS5DAqe/a4E7/c1VcAilMd6UWMjFFf0Epels2xL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MdDYz9WoTVlY4oHxVt/oTkSzcqWPK4ev+LKCoza0HMj4mlY/URh65GQQnpkGFSbKm
	 d70v6ajl9K5xhqr31MT4u0bOUHhNp+n9lsVauYGHkUwIf94Aww1rLE6s6Oii18jTzk
	 S5CT8aHpkM+eJHZx/uMWa0zHaO6/zd96sHtdTnVYQARLFR14TPUyCnus1lBuRznKlN
	 Nd4EDwW2Nw1L7eKwPZOC/SyxJT7Wpu3Zv9mLxDoK+pPhpjgAGcBqG9YCU4yY8c5AF7
	 ovsMKvKyFGqczaHX4eFSW0GW/kBc4PICK6/qVmEiISwQe67T5d7DTFSV1hHGugCHl8
	 YDC4GBzuJPfkQ==
Message-ID: <4e402da6-f6ba-4200-9cbb-47d2b117aa91@collabora.com>
Date: Wed, 18 Oct 2023 10:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 22/23] drm/mediatek: Power on devices in OVL adaptor
 when atomic enable
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
 <20231018043650.22532-23-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231018043650.22532-23-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_010646_615317_946E725E 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/10/23 06:36, Hsiao Chien Sung ha scritto:
> Different from OVL, OVL adaptor is a pseudo device so we didn't
> define it in the device tree, consequently, pm_runtime_resume_and_get()
> called by .atomic_enable() powers on no device in OVL adaptor and
> leads to power outage in the corresponding IOMMU.
> 
> To resolve the issue, we implement a function to power on the RDMAs
> in OVL adaptor, and the system will make sure the IOMMU is powered on
> as well because of the device link (iommus) in the RDMA nodes in DTS.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



