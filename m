Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7A7C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0++UxZtIsyZ0CH08ChO9PYEtVbUyTBKRtUVBNVx+Hc=; b=oq//Z5eXVRl5BlrIoRssaGMtIS
	guddtqWS4A4canTU1/ud6f7d0XHM80CYTeFXt6/c9o4QP12I8uw3T+kL9OXzLp1r0NnvRJFjnHuL9
	WlYWxnQbp1FqExFgMivJpFMMR/US9tlSrYXI6uJzdvWzbCdfxGnd+JgL4jxc8hJBjhnWpgwizzoB0
	OOJ6oBK2CNPyY3RdwKoGWdQP4ZfF1odFtfyvRZxZhmb03dRpsxus8YLMMLk1Flx2w8oS3Flg/LETG
	0KPrcdZjoo74++XoEzYJShi06yt0S+d6Z7l2mSL8aFktI3KLtEWuWJ3FlHu9/Bd46W1bczJUP5D2W
	Mu1S6ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1l3z-00D1GN-1o;
	Wed, 24 May 2023 09:45:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1l3p-00D1BX-3D;
	Wed, 24 May 2023 09:45:39 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C396C6602B7B;
	Wed, 24 May 2023 10:45:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684921536;
	bh=NgFF9iqT6kPQvm3wY+PBo4aRBr+03YgdIiWeIRgjHvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GSrile/9avxzPu7s2ZVGls7W4GSonWmKTja3br+cV7b+vsPa6KjfPvwMlUrbY61X9
	 2VPgBLMrffDz9sLs3qX+S9qBd2Aj9Y31n3pMWvFBYQjM6bwW13iVYdaOzOm84dAIAS
	 E6OmyJ2NOF2RzWqddsyPxQR5NM8oKf4+55Q+zydG6P3XAnLwErSCBLr8Z1Xcv6lobg
	 MU65apKhhv4hAkYYw5p+lvr0hdVmcc0SJLW8ykiu3EsT2Fu/MsQee0F2hpeEPMlKD1
	 SYqOZSabLBN4LbX8BVZ7ps4V9XhmjAyKHRkIvd4VlxSLUK3OYx6OSWa4RFKLVZDMlc
	 5+ijNFud02dCA==
Message-ID: <2b5e0d60-7084-2039-e6aa-747517eb1977@collabora.com>
Date: Wed, 24 May 2023 11:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: mkorpershoek@baylibre.com, khilman@baylibre.com,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-2-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524083033.486490-2-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_024538_168346_0B050A35 
X-CRM114-Status: GOOD (  12.52  )
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

Il 24/05/23 10:30, Julien Stephan ha scritto:
> Add definition for CDPHY phy type that can be configured in either D-PHY
> mode or C-PHY mode
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/dt-bindings/phy/phy.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 6b901b342348..a19d85dbbf16 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -23,5 +23,6 @@
>   #define PHY_TYPE_DPHY		10
>   #define PHY_TYPE_CPHY		11
>   #define PHY_TYPE_USXGMII	12
> +#define PHY_TYPE_CDPHY		13
>   
>   #endif /* _DT_BINDINGS_PHY */


