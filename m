Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DC3C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ya5zyzXprkN/G8Ps/0Yx1al/Do/vOMAFjjfKJ+ZBHLo=; b=cGdz82aqAP85vzucG7r9soTmvT
	F49u8AYRt5jO30aHA6z1u5ChDSJ958zZ5uWSidYI4a8XA01CiN9EmtG+wHyo932qa01ojwfmyfkzx
	/CoE1rdx1JGNTXgNvdvfDRw1tp9dw+Oj0sOMa9Oe+zgS7x0nEXZ/DqfVlKfbwBHSYdorejJdD0Moo
	FDLFSYLmq8m0Jaw1ATOf3PdFNoW71iYR04JsFi8maH74pZtULp9WST0zh6WYeBHHgWN8DQQw9fjjp
	09bvOGebnqxL7ClHdUUmLQp/FpSEl4vFGtRJHhIAcUJeV1Wen1Cqw6e7XqdrlDs9VeHjMic9raPMv
	LWhLVdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ckN-005F9V-HQ; Tue, 21 Jun 2022 12:12:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjW-005Eh1-FO; Tue, 21 Jun 2022 12:11:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DE0D660174F;
	Tue, 21 Jun 2022 13:11:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655813509;
	bh=4dKo2IiM8dMqUKO3vusJ/wPUf45Yv2wJJDuLGWQsK54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lk2wqiGpT/qzPK+uv4UVBx8k0Gz7XeYj6+S8nLVwSH8POYdwglytxepLAkLKXKwGe
	 npz0as3cL21M+5MYDKtMgFIUr8Oae/PDUTL09fqo8gmAsa2ebx/Zx6dPU+ZxAkfVvQ
	 +7AxfSXGCw6JTCo00gGDmyHryfY3QlqhM80uVgdb1/7mzIqrTX9ehc7ax0h7CbNitw
	 pllIMpC/GnxWU8GUUVMBLgdrMiTJDhbOXyATb8Ig5jluMjTZcG1t7Cgl7AGZobRXcW
	 qZC46mJ6QAalXgSvOjVFtQcKLSPM8eNDSgnx+NVM4O1SlJ5jbTPUqfqEGUu8xxzAuw
	 ZwIziPjCGUMgg==
Message-ID: <a43ac9f0-5e21-edd3-a6d6-52a29f0b29bd@collabora.com>
Date: Tue, 21 Jun 2022 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 03/14] drm/mediatek: dpi: Add support for quantization
 range
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_051150_693437_036D68DD 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> For RGB colorimetry, CTA-861 support both limited and full range data
> when receiving video with RGB color space.
> We use drm_default_rgb_quant_range() to determine the correct setting.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


