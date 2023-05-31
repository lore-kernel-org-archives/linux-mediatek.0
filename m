Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A6EC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3B0ijvvTOZ5HdXNXcOXMnvuz533+EdkBPLnfpbyVQJc=; b=OJRlsU8FLssCo4
	OPrpV/kpxxVJd7N51lxCNEFHfvKzKtQmOC3w8yJK0ek+g6lPx5xtuuyO0ye7Eltk+6rqe4TER4a/3
	2SE1lb+LSpc9G9DX6yePh8TGw3DdSQEYKX8lZwWCSLoxU3SRFOTZ9yxaMepm+j74n1x6GovwMrDEy
	lwDluQy3hy9sEeK57qZQBUEPbxy9/ULMIcMl7+DUr+svAexdVFMDWqJyWm2r0lEZpwbP9xhl1ymbo
	bxH5AwXFdy/LPt9pDFQaiorglkCB5G0iblg1VSB0MS6T6F/cHKv2/LeTepbLbMoNuZo0D/GRS7Pq8
	VoTR/rgXxxFOGHc2YJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LWM-00HULp-1I;
	Wed, 31 May 2023 13:05:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LWI-00HUKs-2l;
	Wed, 31 May 2023 13:05:44 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C0C4E6606E88;
	Wed, 31 May 2023 14:05:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685538337;
	bh=A1yOZ5qwSssnB/Bhki1if+GKibGEWLG0BYkt3eOhlj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YVGMKfdk3cEYRuGBDGFOd5mnG95lAtXTdFrZ/EWYe2+1RYhKKWD3isrFlFcmlUXWc
	 o32znUMgkO/4uEra7WhxymF47kKMI30K6aCSUweXCLUWXxUQ4mXGeL8nWOU5TseXM6
	 /3wnnrTV1Bc5DfDXPhQVfMmgn756a/epWj6U3AR2NzUVLQ4P65w22BMEiuoB8iaPac
	 enoz1HLD6x7Tl3AShsF/eibYRChkgdLxRJu/eOQGDFO4uUsFv5dVR7vTtR/59QMn7N
	 j9FRyuL1Aem8zNK4RTc7GHVyfoTY3tOB/ZjjYpUitGKEvlm4zCSq643Gl9Ohtz8DQe
	 NlneGmfD49NYA==
Message-ID: <4dc45163-2aeb-4635-2c02-256b35ccccb7@collabora.com>
Date: Wed, 31 May 2023 15:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: mediatek: efuse: add support
 for mt7986
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230530201235.22330-1-linux@fw-web.de>
 <20230530201235.22330-2-linux@fw-web.de>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530201235.22330-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_060543_112742_EA166469 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 30/05/23 22:12, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


