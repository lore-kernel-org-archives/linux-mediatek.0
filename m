Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562BC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5M3py0idHJ9j4DLqlMZRJWlgOcitaK1aqXn+xpHAIw=; b=WOwwcG+33DUrQYDG4VC1OFRM/H
	G7npYJWfxQ8PN2SzBWpYMXS5AX5OxbHcZTxDczHZH5a2OSFNuWLMJCGE5TpKwrHoTGb6jMlha0Y12
	dUiAGnIW5gaIa0QisL1/f7XEJJeSNh/iBHzy82uf72x2d4DLr7hNSpXYB7BUrSCIHtAilMTtryeM0
	KwsqGrAAvfO+6rVZlHjJlz2u8VrxfLRtgyXR4bGVNp42ZnfMJz/oS6ukAQ3l6XNOJoRd83B41wh5d
	VMmyJ5m5y5r9AHs3+8szh6FhruAYLWbyM6UqR93E+3Fno6kkPEJK8xQVWlEKdDWnkgN6Ca1CwNqCD
	rdvV9tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XPe-001txt-1N;
	Mon, 27 Nov 2023 08:56:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XPa-001twj-1u;
	Mon, 27 Nov 2023 08:56:16 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E521966022D0;
	Mon, 27 Nov 2023 08:56:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701075370;
	bh=fKSt+XksJqIiecFB+CQMWNDKTfIu4Hg/jTOPgw8XfVY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=B0oJjF72hdrRtqdzKhniJ2XPoIDVmu/Ct89zH+pzXk5L6e+j06uxaaG5o4YJejF9O
	 r3Tyq+dU2DPilARiUh1AwzSNm0g0SvTRv6N3VqOc3TsGVIQrNy/AEaYEdNQ4ApqJPc
	 R/vXa8OEV5J4JeW9/Z5bAOvIiLomqGPUtsHJiHifb2E2yMiXyqOZ2Lo+VXfxAiykuo
	 c+h1OtKMIOV+iGodbuuPAinhaEc65or9/zWhtBBhnHVDd53MwGCqbX9Lnn8FPiBD3p
	 KxA1sXJizwcQnoah0OshdrjWCZcSBxybCAARJ7Lp1j5tdFULSjskp2bDuBtf/7zVlX
	 rT6m9z+E/yKoA==
Message-ID: <c823cde4-5b64-4144-87b8-7d6c847d1eb3@collabora.com>
Date: Mon, 27 Nov 2023 09:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] drm/mediatek: Stop using iommu_present()
To: Robin Murphy <robin.murphy@arm.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: yong.wu@mediatek.com, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
Content-Language: en-US
In-Reply-To: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_005614_785226_D26ED56E 
X-CRM114-Status: UNSURE (   4.98  )
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

Il 23/11/23 14:41, Robin Murphy ha scritto:
> Remove the pointless check. If an IOMMU is providing transparent DMA API
> ops for any device(s) we care about, the DT code will have enforced the
> appropriate probe ordering already. And if the IOMMU *is* entirely
> absent, then attempting to go ahead with CMA and either suceeding or
> failing decisively seems more useful than deferring forever.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



