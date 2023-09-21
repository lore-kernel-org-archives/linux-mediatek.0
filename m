Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE2ACD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CnIihkPpQqyPYScfyOssGvf4ukYsxn2NiXskY4j7kE=; b=kCTLAoXeEt+GkY
	xKTqy4hO4SLK5QQkor9t+zYvTMs3YkmtTcoKL2iKfhKY0gsoRoOVfd4Zx/ppLRpO9XuOQxbRIBVRh
	eS+JittfSjad4VTB0pj3s6fEYHaV4m+zR8MqlC7efsSeLMhtbknMos7kktoz97PYcO8tBCXFKaiy+
	rrmEpQQ9QuWYH6JUJR/4ebuSyJeDq4g/oKY577nYE3fSubxGVEHooEi3OuCRO5TWOVRSl5ZMc7sXx
	CwUV8ilBUR4DYbETebezn71uRV2aEsHfDmE+NNTbUTYdKLT1i1//l0dyVo8FN2ywiM+qolTq0W84S
	HzeQK5N/PwD/MaNiZhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEXA-005PoU-0s;
	Thu, 21 Sep 2023 07:55:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEX2-005Pic-0K;
	Thu, 21 Sep 2023 07:55:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C194366072E0;
	Thu, 21 Sep 2023 08:55:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695282924;
	bh=UTUCsGCHXv7lHkH0YxbJh4wFHSzf3govSJtRhJkJ4i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oIqhwiP/FxM4BSY9QC2j4qMKeDZQY+sAzkVmipX2oA0lRP3n7UK5XNXzFd+/bGfPC
	 tIBm3izSADw1ImIQYIpwGQJm5WEssrGxSbgU1i/EXnUOhpfHn56lUWBhNPjNNdHs4k
	 vKk59lgzHlErrbDrmXPP56vS3b91reNXFV3pcMWS6AMmnLL7YJgkimqG5yrLCLRDcX
	 mvw3K3GRcSD6M8j9toGzPtrHnSYg7U+SJQGVgyngSk9yrceU9lIpcfpv012HrwpPRL
	 wzR6F+wfvje8mvlVScZg8dih1P6Mze3JcoyNUPUZ7jYXHcZCIBzdBpJowgEbyB405e
	 2vOxbngwyz4KQ==
Message-ID: <78e8860a-07e6-60cc-52d3-d5ef762f7ee2@collabora.com>
Date: Thu, 21 Sep 2023 09:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add mt7988 lvts
 compatible
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920175001.47563-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_005528_282353_05F2054A 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/09/23 19:49, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7988 lvts application processor.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v2:
> - change mt7988-lvts to mt7988-lvts-ap (Application Processor)
> - not added Ack from Rob because of this change
> ---
>   .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index fe9ae4c425c0..e6665af52ee6 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -18,6 +18,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - mediatek,mt7988-lvts-ap
>         - mediatek,mt8192-lvts-ap
>         - mediatek,mt8192-lvts-mcu
>         - mediatek,mt8195-lvts-ap



