Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787BAC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZP99wm+sXtyy874GFJhEQX+4USye8GM+pIF1JScr24=; b=D/Gg1eqAAyDypA
	1VQ0SVoao8RdugZRAl2I1B6OduuHrmy6EVHBhGQHAttU9QIuKixRllqBzF7+sf+LcdJyMqLc7lE/p
	QeO9Ue1K9e6ud5z4IYpIsRzgzIS+vXHTXRJPraoqkAZhqz9OiVKCj2FINjNKROwN6NLUIp9LhvDdv
	NU3rCh9N4r1MUTDoSfWoRuiW08RD3sHVQieobEeS3SZ31jh6JBK0En9Yqth3tDhfn7RB6+G05/1sx
	wArczw0FTZAL/J7Tz4pUyg80rfz/AyDE56tcymg3YaQNlYcF30l7JQq+BuwYMZp0CQ82ITsW60RqJ
	G4iz0z9YfbIx2G4/yZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jO0-003b3I-Et; Mon, 13 Jun 2022 12:41:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jNj-003avk-11; Mon, 13 Jun 2022 12:41:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D13166015B3;
	Mon, 13 Jun 2022 13:41:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655124081;
	bh=Dssxu5juHxniKEwBlOPdCopiQRHAuksbl/SlhCHu2R0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cj1Y7XKnAUxZ9AFEebBoxYSFqi2LXEuJRLBk7CcG9RY6lLsqhlFzV+oxNSnRAq35d
	 OCOiKUkuwtSR+9XSJ6bQgiY2tR+/pCYoiPZ2BMm35mXHvziQjWV0gOEj0U9S4GhMOz
	 EYidKT4SRSawFGHUZuKV15dCQfIEuYSlhQyeLmS/mnBTddIv9RX26o1Tj0LdumsVOw
	 ofcXrD15RlCDQA/aerb01D36rVGPuAyr6vv5yADcS/k8QTz+HSblMJutsBpu4fTyhT
	 QDBqCG3Iyw1M52WLJNimNCjmcCzyMeLKnme5b0GdVG3XihAtSttrusNmTabOCzrmOU
	 tJ78YAHvoCNMw==
Message-ID: <30fcd090-0f31-5a7a-ec14-11098aac8e5c@collabora.com>
Date: Mon, 13 Jun 2022 14:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
 <20220609083101.24195-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609083101.24195-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_054123_242900_471589C6 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/06/22 10:30, Tinghan Shen ha scritto:
> Rename mbox according to action instead of 'mbox0' and 'mbox1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index b7e68b0dfa13..6cedd6868cc5 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -55,8 +55,8 @@ properties:
>   
>     mbox-names:
>       items:
> -      - const: mbox0
> -      - const: mbox1
> +      - const: rep
> +      - const: req

"reply", "request" - as said on patch [2/3]....

P.S.: Adding context for anyone else reading this patch, mt8195 devicetrees didn't
       get any dsp node yet.

>   
>     memory-region:
>       items:
> @@ -100,6 +100,6 @@ examples:
>          memory-region = <&adsp_dma_mem_reserved>,
>                          <&adsp_mem_reserved>;
>          power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
> -       mbox-names = "mbox0", "mbox1";
> +       mbox-names = "rep", "req";
>          mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
>       };



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
