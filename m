Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8003C36014
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUDQIxwLoaQn0qRdYS/w4AJI+wuWGg95kk9MNCbeXgY=; b=aJPok8G1QP765HRYU4hARZpdpf
	RNuu1cdsIPdqR0SfcJpvdXBQPz58NYoIlM2cJKL7XWDcUs7wKMhXFKA7iWzhfmio4WaCIVH3sd3AQ
	Qvr1uffaCT7TGm/IViVt6xqNCozxi2bL5XAKV1hvSgK+iM1RVpH4FssOUDh3A6U41+uRkjBUpQJIy
	lhOFnm2cVSD5r3y6q3QoQWKlfSbpAC6+VXw9ACr34trbM3GEckQUxBD0BVjM5p49c5Dx3O34HCgzX
	x3bbBn7rozFbhk0oDSNUzmL1LliBXMsZYnLEZd25/+EAeIMXjsFU9AdL9CFERCXswS3nmUw/+lYD/
	paAnD9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ6k-00000002fIh-04Dx;
	Tue, 01 Apr 2025 10:44:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYeQ-00000002bFk-0jNj;
	Tue, 01 Apr 2025 10:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502520;
	bh=YXUmerGyYWvqMduAyNy9qqhBz9oGELjAjgHksXK1h2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=StTymTb2hZ8pzt13grHON4yU0oEsiPeZlDpfL3OwUUyEQ8Cbol+DIpfV6EdotEdPh
	 4Md79l92/BI9wDBaQgIPji7FCnuJmVxTznVDcX6liZ+iZwEmtqFsGxKciqIdXPRh3D
	 w0RF8ffMLiI/VQpkDeLY1afNY+OxjZLXRKHj6c39fDbclYom5JIpoOuiX3H86i94jE
	 ZOarsPKvGLtITZdpKPS30ACmRYq1XOckf9ktk8+WDfGXyy6OGoexwGD8lEfSnAPW1t
	 MQ+d9p6XWh5cZ29H/dyd4AqGpQnIiey68IPJ0Z6XnT0HD3ROmFLTVa4cEyN2OcB1he
	 q2qrptrEsZKhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8995417E0FC3;
	Tue,  1 Apr 2025 12:15:19 +0200 (CEST)
Message-ID: <92a25c22-f5da-4a02-9372-91bd905d76eb@collabora.com>
Date: Tue, 1 Apr 2025 12:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031522_516676_CF884610 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



