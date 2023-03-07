Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BFCC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdMLxd7+O/ZHJqFRgkcVCwsGJB6oN/G90X0u/LfCT2M=; b=B4We/TiPBmp1n1rbhvE6CT4IQc
	MjU+D/Uum4347nZqkC2s9yoFyXZ1top4oNoovYhLviUUvVHQmfc8NA9Yq6s8+2qEDyK644ew3UA+f
	YHJYPjXpHdCte9JePtFZX/XDQnIODaemWqC2oAZeLD/P3WJQttVrCPtzZ+1EGzdHdCZBm9rBts8z5
	tlBE7WeAxGztVnSnuX9XE3bfWsIHrvs5UwjgQGlaszt9PmBdBGaI1MkYBZ75682FPfp80ltPZ2NCd
	t6p/k2H3jwRJck4GBTQ0ctk/BqvCt5av/3Ny/98wnc0GZFwjXFp47NqQGGtUczI04RVyOLD+JHOI+
	f1cv1fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUNx-00HCfH-IS; Tue, 07 Mar 2023 10:17:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUNj-00HCaB-LM; Tue, 07 Mar 2023 10:17:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 362E66602FB7;
	Tue,  7 Mar 2023 10:17:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678184238;
	bh=aNzvfLGjkFOo6TdCygfT8zB/OIT5OF23jnR/d3d5Z94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEB+nyF2b0vByJtivXLJMet+fhz8EkO3safVeXuZGdeg+NXvynRU24vKrzOK2mW9x
	 2W1yIgKptaIjFnjnRL+cFPNFub2OvQY/0jXMhSsnKw4+EWUgLq04s0CVKQn88kGSEd
	 tuc/p7JFyut5GVLRZ3fSIweXPM9ap9wlR1XkwKFJJ9JELfvJSfZQK/nszXOjE/gzIj
	 TLGmN0d/yb0W9MsmT9ZekfKTwYaHNyPSt+n3u0ec8TbvZVG9MtvYw597E3MaT4b78I
	 YiHG858zIL3NXkCRJ+CtpcotJwfQ5tcH6Nnke/hIdlLvRlalpVS6hyO8FqVz1j5ZsC
	 SlBaE2JRx3Cyw==
Message-ID: <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
Date: Tue, 7 Mar 2023 11:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_021719_855279_DCF3F3B4 
X-CRM114-Status: UNSURE (   7.60  )
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

Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
> The item which have the mediatek,mt8192-disp-ccorr as const compatible
> already exist above. Merge all compatibles which have the same fallback
> under the same item.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


