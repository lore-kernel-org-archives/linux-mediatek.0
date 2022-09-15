Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C9BECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxs4RqmYuVNWaPnnXaShAh9m0MiXhfQMPDmlcCj0mgY=; b=Yp+tX/KliFX5ApdvNa2pB/yIe/
	9Ipp2fKDFfQ9I8OHwoPi/YLl19Vvu85pWLMt7sDjpJJggfjSMXRSyyMlvSMR3HF5/2GYksmrjFhy2
	XRmvtIwMAN6UDLXXcA2lsdsT8CaxrDxOpdm7UDMuEVGCKgu/1hX2/FpuEPAyOT/V+HexQLABTSjWR
	2qkLj6X1D/3lLgB9Ruv9QaflH9sPGdUYE6G+ZeYHal1avXLYAMbCk/QMmgueANddvYJ5M+9cxJgCl
	bt7yG5KcjCcL8CzbgBZKqNcIyS88ObGPdhZaaCd3glQa5U2psoBlOwPz4Nn0Yfyws0i3VzpudPiTL
	uwlxKkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm3F-006edB-Fn; Thu, 15 Sep 2022 10:24:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm34-006eYp-8P; Thu, 15 Sep 2022 10:24:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E17EE660159F;
	Thu, 15 Sep 2022 11:24:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663237484;
	bh=HDcKpztFgW4JjS7pab1Fzd5dwgcS0z5gxyoB+VISHjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JM8xNPPxNw7LgMzRh3TcUWEAOGC+nccV0z1x4jFgZ8hBwoIpXJO1xRs7SJo1QzhuM
	 9EJA85oqEFa4oVlfJZweqzQGaio31p4HUMy10rCu47eI4eWZ0KLXQEAk95tEwlbgya
	 RESktb4WCjU4OiWJySpK5fhvBJ74VjyU6SP0tula13tHSbpv0iiWlkOwx9DoAVd7Cf
	 VMjKlF4f4J8ata/B9yN7FnGUPUnoI0dAaVzmbaegZUdbzM2eXG1nFLM+GgTMqcG/1L
	 lvM8lT87LOCaEX31uCETUtJue33yBEnpiGrlQNCm0u24xbFvueyDiKR9kefcIqyEdb
	 j8VUXPDk287Ew==
Message-ID: <d644bdfe-2b9f-97a6-ae77-088983a42fe2@collabora.com>
Date: Thu, 15 Sep 2022 12:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/4] arm64: dts: mt8195: Add dp-intf nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915094640.5571-1-rex-bc.chen@mediatek.com>
 <20220915094640.5571-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915094640.5571-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_032446_453543_F194CC64 
X-CRM114-Status: UNSURE (   7.93  )
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

Il 15/09/22 11:46, Bo-Chen Chen ha scritto:
> Dp-intfs provide the pixel data to edptx and dptx. To support edptx
> and dptx, we need to add dp-intf0 and dp-intf1 nodes.
> 
> Dp-intf0 is for edptx and dp-intf1 is for dptx.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



