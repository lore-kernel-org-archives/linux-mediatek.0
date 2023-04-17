Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98554C77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4Pzpx8sRDz4EmGKm/9mw1J6qjBKnM36d9c+l3e2G6U=; b=OoF66qCvgc+OOGnFPZlO0Qjwy0
	805lC91OhC5QRt6fcchSTzTtHSiVR6QBtGLUm03qp8yJ3UddiD9G0qg5mBmordVT8IXP3hV5j20hT
	2rB+S8mS9nO6I32nJMkqn2rNWJwroRDEotKp/p7rYU0LlHpPPNtjOZcU5hIKy5NflgHWRYwe5FWbi
	yLoIEEq+XUh6g+g3ILu6Jd6V75IbTqA9KXZnW7BGCloMA6GD8utTI0cUNjszKO2pLeO48rHZCVmDu
	jahSO+Y1i6U+g278L7wTFVDLcYLfsCLGWHDGHpR5I5uwYHOM+S2y2NZaRqKtG4DKifkBXqhNPe+IR
	NQvENp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKmS-00FSPv-38;
	Mon, 17 Apr 2023 09:04:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKmP-00FSOQ-13;
	Mon, 17 Apr 2023 09:04:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E3B4D660309E;
	Mon, 17 Apr 2023 10:04:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681722246;
	bh=mmJ0iBDdFxaw1hgC1BUonlQRRJ5YNpa5yzZ59XFkdY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IsIwscG9vpQo5g+as2A2VwbuhAaeS91T4rhpvpyRoj2MkE2mMlHPtOGRchRFwTYag
	 3ceHD3BmX3DEoTJ82clCEpWyIXff/9tithcoLlIaZy5/rNSj87pZJq5JzO5Pb5AhTj
	 kDAK7HBB8WNgtWZ6OVxQX1wyJzfR37on8hxp26HGo/G829OwQtVwfBsRQcd6zcaX4S
	 A+8Nw31pUGorLY9CqImD55kLocvlD8biBVvPOeU5k2exJVrNqTrcU2vZXNSt7dU+wV
	 09lJONJies1zQAdacjTtkyry8qv42vEEoaAJmBgKTl6N1hb5234TLC4gz67+XalLyu
	 cptzz1sD80BQg==
Message-ID: <b645c058-9f51-034b-0e81-94c8d69469c1@collabora.com>
Date: Mon, 17 Apr 2023 11:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 7/7] MAINTAINERS: iommu/mediatek: Update the header
 file name
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230417073606.25729-1-yong.wu@mediatek.com>
 <20230417073606.25729-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417073606.25729-8-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_020409_492329_346649B8 
X-CRM114-Status: GOOD (  15.83  )
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

Il 17/04/23 09:36, Yong Wu ha scritto:
> We add the prefix "mediatek," for the lastest ports header file name,
> For example, include/dt-bindings/memory/mediatek,mt8188-memory-port.h.
> Update the entry from "mt*" to "m*".
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8ebab595b2a..833d32c356ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13056,7 +13056,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/iommu/mediatek*
>   F:	drivers/iommu/mtk_iommu*
> -F:	include/dt-bindings/memory/mt*-port.h
> +F:	include/dt-bindings/memory/m*-port.h

Stuff that's not MediaTek specific which filename starts by m and ends for -port.h
is really unlikely, but we can prevent future issues.

Perhaps the best idea here would be to keep the mt*-port.h and add a new file entry
with mediatek,mt*-port.h.

Regards,
Angelo


