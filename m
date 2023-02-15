Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07DDC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS6P7rQlIswuqVSvTF0RXm0ljEwZrVynBCicdfNUUfU=; b=zRw2NQx+V9n6SFZGNHKIKNsza7
	eCsmLAKiTbrjtAShMs6S6GChKDwqW5sNjnHp7vKYzVi8QDLdR4z5eT09D6n3HDpoqEGXvVB4YpLay
	Sha7a13fQq6PuP5ez6AK0xU4y8/SF7v2IqLJ+N6iktaPwBNUMJEsCVsUvx4Jaiw5ZwZPkPENnM1og
	khZoq3wSi8qaZYLXJ+HGwB4ebf5c2IE971k5hxreaeidibwHE2mRugLStAw8ELUCsxD6z9GqIZwOU
	jKhyruCMF4hQ869SgtPJlh2JZ1GnpPdwp7EU2sGFkxQEx8doRjX8ojQ7xfqv7+KJbqotG3AMndY4A
	thWbgG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH10-005myB-Dr; Wed, 15 Feb 2023 12:36:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH0p-005msv-2g; Wed, 15 Feb 2023 12:35:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3459D66020BD;
	Wed, 15 Feb 2023 12:35:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676464547;
	bh=1xCCe0WB5EclmlsSqF9Xyjv96K2FBMIVBfbtWbcB8XA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g1Ms3BZbDTzmhD98kyn+rcwDdi4StjxVnHzSKxMjBYVqUmD8SjyG/FAvXS6ouBdCT
	 lfC9+OqhYaE2Ut4LAhSAfnhsXEYVMpNEbSPaW8UXryidEmHFUAn6OeShRM0KXk9kAv
	 JSyC1mWN7REftcGDOz8RPT8t0GbOR3hxpzXD7hQF9rbwDRfwAgHhBSDz8PtTC3yXEU
	 gO661cTXETOU2m7S/uM48Ny6VjHDcxU8+Dxa3b0MwtczyDrvIaEj7EgRJ9Z485nBTD
	 uKfBIzvoUCT4WFuHgIOZOT9JLv/fxcdDtGWCA9mJyI0Mb27XUOXhhQPV95W8qGL90j
	 quEGyKQZnj1tg==
Message-ID: <7e108286-4ada-fdf3-cabc-aa3ce61117a6@collabora.com>
Date: Wed, 15 Feb 2023 13:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 08/11] iommu/mediatek: Add a gap for the iova regions
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
References: <20230215062544.8677-1-yong.wu@mediatek.com>
 <20230215062544.8677-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215062544.8677-9-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_043551_296347_A3E082CD 
X-CRM114-Status: GOOD (  16.07  )
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

Il 15/02/23 07:25, Yong Wu ha scritto:
> As the removed property in the vcodec dt-binding, the property is:
> dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> 
> The length is 0xfff0_0000 rather than 0x1_0000_0000, this means it
> requires 1M as a gap. This is because the end address for some vcodec
> HW is (address + size). If the size is 4G, the end address may be
> 0x2_0000_0000, and the width for vcodec register only is 32, then the
> HW may get the ZERO address.
> 
> Currently the consumer's dma-ranges property doesn't work, IOMMU
> has to consider this case. Add a bigger gap(8M) for all the regions
> to avoid it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Hi AngeloGioacchino,
> I define a new macro for this, I think it is a small change, thus keep
> you R-b.
> Thanks.

Hello!
You added a nice comment to the new definition describing that there's a 8M gap,
so it's completely fine; you can keep my R-b on this one just fine!

Regards,
Angelo

