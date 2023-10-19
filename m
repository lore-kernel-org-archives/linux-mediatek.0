Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7039DCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7KO5S+b5mp49mpy1BBk5vDyjhtRVL3Y9AIN7tGvWpo=; b=OugJ9P6bucrvEu
	+XPM1qDrBeMLq3bA7dIlJYto9ICMYm+UFL6p/A2nvGGpmBufAPtZMYJ+uE8s6Y1jzzs6ifOUlSx5w
	E3OE2cofEHouM9NDKpMud4zVgoKD9VycK8Q4DzWQdXhqiqHTMZIIF8baLea9ZpjHTBxP0B8XvqW/I
	apOX/YEtDBcJkLu1aP0X+fIaC9EjbJUZK1xX/5bBunX97ptxzt1/4EgM+Dz51UmF+4qSqW8dOiD03
	1zo+6AOHgY8qPULk2EBkSCwgfQDL8fvDb5nwS7ax+G7WlK/PVwp0AwsMSd5qecSgURb7OHlSLw7kr
	6kB53UzY4/4h1jzK/SEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP0Z-00GoAE-0s;
	Thu, 19 Oct 2023 09:07:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP0Q-00Go5T-0m;
	Thu, 19 Oct 2023 09:07:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12B4D6607323;
	Thu, 19 Oct 2023 10:07:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697706469;
	bh=i4wN4m4h2lJzPVgsUhjbrbiElmhqA0fmSzmkzrYrPWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FDlbibuIvhnNoxRHgtGqCpkWiPIo+sf4Cym/EB/rZhahxHY6GN91Y9Zvx9lACMTP0
	 0n50RaX+pPgmbBj+Og56zGRzTMqp1ZSb5u2f2yeeWirimR40+VEctVjtGU7rsJpmvw
	 Ygzh8rR+xWHPzy6ZBtqzNegZCdVi5481tBqSfxX7+mud+xcGAwckpl/+19oi3d4xBX
	 th2O3dEsmzcWw7ccBsqC8pyZSYzlIQPWJalIIu26qTle5PXYUVccoEiH17lTHeuNT4
	 tGxRewA1F5G8O/t4PDkWlfcGzNAI0DIOhq2O/LgjXr3US9DQwcja4foO5pMJigTNc2
	 jiI2/SYOHsWtA==
Message-ID: <0815ab39-8796-4719-bec5-489aace1cb7c@collabora.com>
Date: Thu, 19 Oct 2023 11:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/24] drm/mediatek: Power on/off devices with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-15-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019055619.19358-15-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_020750_408298_02330D32 
X-CRM114-Status: GOOD (  10.78  )
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

Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
> Different from OVL, OVL adaptor is a pseudo device so we didn't
> define it in the device tree, consequently, pm_runtime_resume_and_get()
> called by .atomic_enable() powers on no device. For this reason, we
> implement a function to power on the RDMAs in OVL adaptor, and the
> system will make sure the IOMMUs are powered on as well because of the
> device link (iommus) in the RDMA nodes in DTS.
> 
> This patch separates power and clock management process, it would be
> easier to maintain and extensions.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


