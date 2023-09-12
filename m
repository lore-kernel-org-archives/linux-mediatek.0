Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ADACA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOI/07fACFmqEXyGkSNhrdc+QsaX7ugD9rrOydN5zto=; b=cpMuHUCVfg8TObKfnhT0nXScv4
	YvHxqMXClm/9xibUKQcLWgC6sRzr7NWjtkj5thRjWURxpXEOHGRpCpzWyHucZw6PZfvaecqQpcKNw
	6WJCEr+TxcVYnZGYbgxu3e5NmMnhmQ0SY79LlIV4uDdQsV19kq8d88tPH4BbtukmO+CrwtOU7p5dY
	ZePwg1scsXqveSmWiu8zXic8gl8AFmWpBbSqyx3faB/08Pb0TPkmnSGFyrSHJusvaiUYxqfrSecdC
	F4VxPKEfbSvs5JVKNZIat/AvuwdCZISn8W5lfP09sXMKx8iypcA7bLVfUhbYbE3v1lFQ20GezK+2L
	R0S2wkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzG3-002eON-0c;
	Tue, 12 Sep 2023 09:00:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzFz-002eLq-3B;
	Tue, 12 Sep 2023 09:00:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D30AA6607313;
	Tue, 12 Sep 2023 10:00:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694509225;
	bh=avYmThuAnAF/piLJ44vGRkqbJa24UHiezDwuFxlVjrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NqUFhfSeFQSLwIxe+WM0YRbbSqYpvBa6CW0SdV7ZYbi7RSdvtw6CfnaZToAEEhGqc
	 yCLfI4eM0IO5pVsvfnWGFP/kPdzgSEomGIFAO8mdK/hu29bTpZBM4+DsfVM2VwL2P2
	 H9ziTYMYex9mKmtCV+I5XweDjLuF2J+zYselsoRjCdkM/aOAaZptiCV2oUcx2nEwmC
	 qxdXkyvaZjfiFOl7nv7Y+lDlvaYRRzuoIOpfaT3+1YfMTSqH9aDZ0FvBYrwARe3wa2
	 160Yo2al/WCfMzmLfr5YhKvlW0pPsSWKW6zK884OsIOv7v23tDUDQn9Cyh64cJPRS/
	 J8kT6snBjaxvA==
Message-ID: <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
Date: Tue, 12 Sep 2023 11:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
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
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_020028_166205_6ABE6B7A 
X-CRM114-Status: GOOD (  15.45  )
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

Il 12/09/23 09:57, Moudy Ho ha scritto:
> Changes since v4:
> - Rebase on v6.6-rc1
> - Remove any unnecessary DTS settings.
> - Adjust the usage of MOD and clock in blending components.
> 
> Changes since v3:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
> - Suggested by Krzysztof, integrating all newly added bindings for
>    the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> - Revise MDP3 nodes with generic names.
> 
> Changes since v2:
> - Depend on :
>    [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>    [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> - Add parallel paths feature.
> - Add blended components settings.
> 
> Changes since v1:
> - Depend on :
>    [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>    [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
> 
> Hello,
> 
> This patch is used to add support for MDP3 on the MT8195 platform that
> contains more picture quality components, and can arrange more pipelines
> through two sets of MMSYS and MUTEX respectively.
> 
> Moudy Ho (14):
>    arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>    arm64: dts: mediatek: mt8195: add MDP3 nodes

Please send the DTS patches separately, those go through a different maintainer.

P.S.: The dt-bindings patch can be sent inside of this series, please do that.

Thanks!
Angelo


