Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCC4CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLeEagp2tMjbvFVL6BgSORtYx7xLhieyOAwmMraa89Y=; b=WvBPROEsdf+UM0+ielLFcFBR58
	+1Q/kPCVanL5QnUQiAQ/bhy9b7wjjcaSYi3jmWcLRvDDolqRnLCjLaaM/ZfDb5sc76xDs0NbyKx1b
	UWnod9cxRz/rIW6cFKQXdys5WE2djT3KUmnj0F59EkcUeK6odRsG7zd0bx5/7RMC/a7UWaXg+6fhy
	HSh/g49Z5TONPNUEEwxDqyPh6t8Hwx907uCEjmXy/4AJ6Ej6Enus6xyq8wB0D9l8kAPVGt21k52D6
	UxFKk3+xI09TuFf7ZZPAUfrkra4NDCprnxQC6WnZPdXOfaizM7hB94cAt8vsEogg7IqzN/wA40d89
	B9QRdb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsqs-000eYB-1A;
	Thu, 12 Oct 2023 10:23:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsqn-000eWV-2x;
	Thu, 12 Oct 2023 10:23:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC9F4660730F;
	Thu, 12 Oct 2023 11:23:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697106208;
	bh=LMBUo8PBQBbC71oWAhDP/MrirqdHNCG7pWe9OPLefqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k67loyHHPg8mSIVbpLieCDoT0Q58bsqEBSzX1MfMycASZy32cu8nskIcwC4gUfAar
	 JGsGNZq7OYWrFkEtZrrzCsYlDep6GUO1ikwzkN7yGcBWdscMN+nGZy5H8MPrGrOS+w
	 I5XhyaXH09RKhHUZVRM/o16/TiMIsEL9Zlyq5r8sc2KZt6p6fLHGKXIp2OtFedcPjP
	 AOO2oneYzDcV/2Qk5JRwntgntFQ0hRlHvUfx3MdqF9Rw+ADrHE0S60ozrUvIJgPzTW
	 cla8JQ/jS5qn8lJh8FzG/8P3YaEhZDX8gYVnZvonCaU1E58+gfYsN2r+cQq/bS6sL1
	 pD6jCLeS5qPFg==
Message-ID: <eb7a163d-7730-32b7-966f-fa78ffee77db@collabora.com>
Date: Thu, 12 Oct 2023 12:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 05/16] dt-bindings: media: mediatek: mdp3: add
 compatible for MT8195 WROT
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032330_197535_13368735 
X-CRM114-Status: UNSURE (   8.03  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> MT8195 WROT inherited from MT8183, add the corresponding
> compatible name to it.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


