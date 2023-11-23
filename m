Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612FDC61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ELdqRoTSMAUd+24yaf2NGAffesSeiPknd49OSHfrO4=; b=bBk97Pd8Rjp2gyOduv62E3QhlN
	2Ek7hiiuw8k2ALeijCBfb8oxmvDt1mLlz7UzDwWnmr0H8i4me1QjlKXxk2GWbE/v1STwXSOQlGzSS
	kuD42+x6hP3/ZGGFOtN9h7TLm8iTtIgODLPhsimgMPVN3YqAILxFtpzVvvQRx+46zrlA4qysTbVnJ
	PUMZsiZ8cMSfAGpIT9A2G6gwETC9dKfyIDdQSTRol+jvQ4aqk13rThO6A0+c/vz/hgNxhPzkKMZn2
	LfuPttDwtmihNzT3eEhMnqVAMkm1/VLaf+Rlf9Hc6fDlGOwn8sV+06YxBClfwtO7WtdyscP/44mD/
	6MO1dG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67nJ-004VER-1H;
	Thu, 23 Nov 2023 11:22:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67nF-004VDb-35;
	Thu, 23 Nov 2023 11:22:51 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C56506607399;
	Thu, 23 Nov 2023 11:22:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700738568;
	bh=OkyzQvoiFclRgAoTM1AiGV82e8sHB39X1+ZjadvECzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0khKwsWt3lwNKJWrAnDwzSZMGlJ2CZr1mfieF457KHg8M2u10AApdi7aCTdhWxia
	 sR+b01+dEi4m335oJSFDxBu7pErCuPFIQJnd30nz2nQLH54PAv0TWSKcn5johqRKH/
	 rjk7bFHkjlOoCKtDqj4ELeJFfXsXz0T72AO/VWIN4wboepHbx1yKLnOQGOWXhGrt7U
	 0DbUgn9wZq4z0v8pDNFfkXJJjyOg638V6EogkEm5OlkB6X4qRgqxtJ+7E1DWh7hjR3
	 2gr73sRiTiUMtH+aFOR0zobUbh64FMV1u4HljPYypautYh3aC/cHoW8Esh9mDbc19L
	 og3Pr5e8WEf4w==
Message-ID: <e3262533-b181-4b3c-9ac7-71fc0438f6db@collabora.com>
Date: Thu, 23 Nov 2023 12:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: mediatek: mipi: mt8183: fix minimal supported
 frequency
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231123110202.2025585-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123110202.2025585-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_032250_126811_DBBF93FA 
X-CRM114-Status: UNSURE (   5.63  )
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

Il 23/11/23 12:02, Michael Walle ha scritto:
> The lowest supported clock frequency of the PHY is 125MHz (see also
> mtk_mipi_tx_pll_enable()), but the clamping in .round_rate() has the
> wrong minimal value, which will make the .enable() op return -EINVAL on
> low frequencies. Fix the minimal clamping value.
> 
> Fixes: efda51a58b4a ("drm/mediatek: add mipi_tx driver for mt8183")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


