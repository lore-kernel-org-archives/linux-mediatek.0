Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC2BC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9kvN16anoM3azA6S0rqi8yRR61J89mjGu7gPlJj7D4=; b=FTqp6aOp7z946/wyCkHxR4NhFs
	h5C/+fuX+f6eYlhYuDdWvzKQ3UDChDvhqg5juz8Xmc4F3Q7o4eO+ujjfbHPS3og6h1B80yzuEW2AP
	yewKogvGl3VVtY7Zrd4+Ygd9xb4Orw5LIFnWd17x4+1YnwT94kgB7ajkqGxm1Ww4Z2GGIzVSdRe81
	k7vcUFK8CkOOKNv26ibeXsF2HQczozUSKz4iCLRqmtCC0wX3PsWiFph7jhIbWo89ANlizpzq/8Fd+
	lljnXsbpWBj8s29U3FHzlllCkJgY85+IHgShJrVxyK6Tfbl5Wwy3vPK45chTF/lbZrUFzzVELko3r
	W/TlA+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB1h-0068O2-Ta; Tue, 10 Jan 2023 09:34:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB1W-0068K8-CM; Tue, 10 Jan 2023 09:34:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AA566602D6F;
	Tue, 10 Jan 2023 09:34:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673343264;
	bh=2X++/CX/YTAfIcjlM+DL6gfRl75tPuYYPGsfmxgOiGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OefKhWDdnqvlYAqc/ThdX441MkImgzCrRjY1+pFgFjiOCZjJ/XehLQdzQ/ZF//jzD
	 iXBkxh8mqvB/O3bJr0gpVcEnZ4CCrw/1pa59q1NrWTYhtk2PZBnise3AQrLYCpLz65
	 4GPR/9wf+MXUjIP9QZ1/QdB5VooBClY/wMD7z+enttc9fo0+oM+L14mblHmMzaTtf+
	 1Xl/TrHJxxgefbGblH3l0yjTpDvlfl92VKQba3ajbhshYj9+62IeHLXFNJ3LcGA47z
	 w4MpK7ARbvRw6/td8yfjypsT0TDzZRIuvC17+0/WIHkzX4GmdA26QRf64u4Odr4S2A
	 p0VNLfnOwsWKA==
Message-ID: <9102d7a1-e40d-1201-f1e8-eeb12923502a@collabora.com>
Date: Tue, 10 Jan 2023 10:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/mediatek: include missing headers
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230110091647.13265-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110091647.13265-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_013426_578924_CE1C5F92 
X-CRM114-Status: UNSURE (   7.74  )
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

Il 10/01/23 10:16, Miles Chen ha scritto:
> Fix the follow sparse warnings by adding missing headers:
> 
> drivers/gpu/drm/mediatek/mtk_cec.c:251:24: sparse: warning: symbol 'mtk_cec_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:221:24: sparse: warning: symbol 'mtk_disp_ccorr_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:390:24: sparse: warning: symbol 'mtk_disp_rdma_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:209:24: sparse: warning: symbol 'mtk_disp_gamma_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:565:24: sparse: warning: symbol 'mtk_disp_ovl_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_color.c:164:24: sparse: warning: symbol 'mtk_disp_color_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_aal.c:161:24: sparse: warning: symbol 'mtk_disp_aal_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_dpi.c:1109:24: sparse: warning: symbol 'mtk_dpi_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:340:24: sparse: warning: symbol 'mtk_hdmi_ddc_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_dsi.c:1223:24: sparse: warning: symbol 'mtk_dsi_driver' was not declared. Should it be static?
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



