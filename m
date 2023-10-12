Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED32CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpziOr9E4IJkE5glwEPxUzTcVO/vNxDii8Hc75vGBjk=; b=nIYxpltHCLMCqh8PSPyV9dJlMi
	p5zVmKTqB84x71XnnDeFd4HzhcJfX6scp+xeTLOYgzZH1QcVq3eGuHhZrzoT3/d3ZC3koTX/usrv6
	SCkF1iNh4+wK8q2BvglsjWyC7N5415FJIVarBqjkcLzuCZBMZLkDL9tcB0n9o+pfc1oO8H8/wM8bp
	IvKctET0ItBEmzLzlOoBmqd/ZNPCwDwgn2wyJ5yIGWHpVKlR5ZZsPK9/XKaZUKHx4DaDYs4NR/b5q
	qI31lpvOGMlJHOlurm1XxfjmCHYHzxGCJwkB4toatQCGQp4YfWtkBujJHS9xOkoTtTF4HR1+m8OTM
	cjmYO0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseL-000YSN-2Y;
	Thu, 12 Oct 2023 10:10:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseG-000YN7-3A;
	Thu, 12 Oct 2023 10:10:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD494660730F;
	Thu, 12 Oct 2023 11:10:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105431;
	bh=/4qyp+ZcXDun69Qg8E4dWdqrT/k8BkYeCwogVKPquDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iZDDYOmoZRfv0wxvK4FVlCrZ1wqKt42XNaMyROYuUKWwZh1RWQJ8ZfHELh07U5H4u
	 REIgR6swA3WmfG87LS3j4jqJY6HPcJtxo7ksziwQgvQy3mdods8HO7uUj2rQ3uhIHh
	 IShBYcw4dplmjHURnPrL660J1Zl/d93LBd0jdqMwa0qj6ZpDgJQvU3R0Gtj318FPbS
	 p6B1FjdxKG1Yvafa6s0LQ0Qns0XjCnIGwJi/NAMxEbf5loAD41CbS8zlnMlo1dvmvd
	 fJeafioX0FD41UPTRMas3vZMZAE0Fst9U/2IcJw3RJEzxgxAmt4CBm6Y/AA203/s3Q
	 AZUnFRLb4cg/Q==
Message-ID: <c85994e6-eee4-7d85-4592-da2f62fc75ff@collabora.com>
Date: Thu, 12 Oct 2023 12:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 14/16] dt-bindings: display: mediatek: ovl: add
 compatible for MT8195
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
 <20231012084037.19376-15-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-15-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_031033_150701_29F8B03C 
X-CRM114-Status: UNSURE (   8.44  )
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
> Add a compatible string for the OVL block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


