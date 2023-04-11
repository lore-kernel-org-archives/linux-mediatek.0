Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E433C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osSQxNEZdPaXG4HUeJmryOv9SGkldMc+97RsurghKFM=; b=yxng5OfjynLDfOjArl8UxQLSux
	GtOmwkhvQZL5ewduNUdvltZWk89oqwNJSQMr6mVRCmPCQ8N8xlik0FxaVz3+oj+TFFnNay5M/OVRU
	ubUjzeqw12nrodBoV697d6m59T3nUke8huUcov4DTVvm4Sc47E4anxNc/KFfNdNmvIcKSSzXlNTgG
	BYVVDAXk+INlefI+WOsl44X4bHGEG+zteCt/mBX3dCfRhNooQR+9K+ETbsMsb83Qs1N/SaGcVwPro
	ycKLFWZEZ5gzBl4UwMCwue4lL0jFCAgsrQ7yPjKOKRlk7xx5P0qFN6XKFfOOw3xUb8G/pq8wPj+Mm
	Iy3EUFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Ni-00Gt55-0a;
	Tue, 11 Apr 2023 08:29:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Ne-00Gt3H-08;
	Tue, 11 Apr 2023 08:29:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0687866003AD;
	Tue, 11 Apr 2023 09:29:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201772;
	bh=bPE3j4UAbUHCaDfr9qUZkcXD11zOLf1fT0sAoWVI/qY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Obp2BOCGT4IjC0VxutC9LsF+F1BUIk4hjWxDEwIifj+k8UkjL9lBBntJGhKEwQV2Q
	 9ZFtUfubR7dr86ocHI6T6TTiTC7wgbFqY2ORJQZhMZqZVSk1RYGl/7zs3sThlb8bNG
	 /aGZp4sviidyaMaWrESzyrdN2i9DnJd5XdT9HWXw2TtKV3w/0KCnvNelnzpMhsHIvh
	 Uvc5HjUIDiQiqo3ZIOlvEzjMhlCdGTQWwgW76L00vcndYs6JzRWIKFaMgFTVlYyR88
	 XW/UfbIk/3/mRV2D6vxV8XgJud6bH1ujCp+Be1wRQPkDOma1k10qV7xKaxLUUSUUDM
	 Yv0unvkvqqITQ==
Message-ID: <be19f8d0-2a66-caf9-a505-772aecf3a62b@collabora.com>
Date: Tue, 11 Apr 2023 10:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/3] dt-bindings: memory-controllers:
 mediatek,smi-common: add mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
 <20230407-smi-driver-v2-2-8da6683cdb5c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407-smi-driver-v2-2-8da6683cdb5c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012934_212094_5023D586 
X-CRM114-Status: UNSURE (   7.59  )
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

Il 07/04/23 11:13, Alexandre Mergnat ha scritto:
> Add binding description for mediatek,mt8365-smi-common
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but the bindings commits should come before the driver commits.

