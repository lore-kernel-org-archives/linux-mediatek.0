Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81734C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBuL4AczQptgNEm5joP44LjUKcigswa4AdAZa/pW8cg=; b=Dh7KsOpvnGXqLWtD0KWbem7AHG
	An+vm9e0NkDUpuGfrBpYOjLQ3/2JE0jx1XOSkVGoQ7DeGfIUAqJ7hlSFonGKb0XNywHyJfKbIz7a/
	N8xZgKAu71hn+iyDvnxFMw2w0DQrJe8pt6o0d+/RbID83UmtoPnSfGBLsgVUEFeHeTPILCAkBCfXz
	4Gqpbl30aSswUpwawQQP9WnVtaorZlNceEIdjOk17B59Jk97NKFB4gNjK0QPzyqUs673q2kMhRBx7
	y1IdeMAzkTJItr+mzRQhQVfpTKqOrqT4O/9lYAqDVTX/kmEsaf1IrauENHuLloKBVGi2EPXt9w1vi
	Ja3lAmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFe8G-00CCFM-OB; Wed, 11 Jan 2023 16:39:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFe8D-00CCE6-NT
	for linux-mediatek@lists.infradead.org; Wed, 11 Jan 2023 16:39:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06F996602D3E;
	Wed, 11 Jan 2023 16:39:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673455153;
	bh=gia7NHJzP8vCL5xfKWqDX1VgVkCNInSkGk4TT8KZ0DU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hZX55ayKE7k7KQ5VJ/4r36NFhQpP986LaAfX+U7vW0ZnoIx3bbomN4QN44XMOV8h6
	 BVnCQV0/HNPKk132jafEaeGZlZ7ClF+Oivq2V1MC333ZF9EfwTbdIJOB1vlnfOxMdE
	 ulDd7/3bMdLGs5nbBHw5gQFx6TvgkmZKoZSTnbSffHT5+9ZT6asuoOL1CeF1dlvFQH
	 TlVEijrDu7Ish1bPoIts58YrultpQ8b6uSggwDWvDhYW5W+UgUcrGXnw65Q65vdT3g
	 qP1OkLQ76SqPJGw5xeGfWLk76pwnU2M4Gwzd8AoT8P8xly3SnGVZ5NeEi09oc+4vtU
	 Qf7enchWfu+/g==
Message-ID: <e7bcf53a-0d01-4e40-e609-c1cd9b5a9ef3@collabora.com>
Date: Wed, 11 Jan 2023 17:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 matthias.bgg@gmail.com, daniel@ffwll.ch, daniel@fooishbar.org
References: <20230110204742.1354797-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110204742.1354797-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_083918_002102_A4FC7B45 
X-CRM114-Status: UNSURE (   6.81  )
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

Il 10/01/23 21:47, Justin Green ha scritto:
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> 
> Tested using "modetest -P" on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



