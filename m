Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAD5E8FDDB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2A6Xil6zJJ8Msfh1WTISH61DdWFX2oPZinCES5msVk=; b=dDBZTKXzfCYyGpTU9nrx6xqbLd
	FBd25La0wa1/QIj+k1+BfNEbHcv1YKdLVrYZyCmI2rUNyOEez1fqBSdN9K4+kz65Hrzk95pseD9Iq
	yMIMCnjzd6ZfVWnmaNZYuafFBx3dFMtftoKU1tUzu3cB6fFjS5E4pZ5QbkvoTa73Ymdqd5zhoM00W
	5oXkvdBoh12EaE/aspOhcFNZRr9lZc/4S1aYwIz4ugStR5RFB2p0tPXkW+w3Ihu0Mt7s2QrRReiVh
	09jEty9vUP9OxCUoKMW4oezCs28Btd6nIeLAOVumCo+ifKrRGVdiPyb5sJzB/jvxzURv0RLEmeQIu
	L5MrpjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxJ2-00GqAT-2u;
	Wed, 04 Oct 2023 08:32:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxIz-00Gq6i-1J;
	Wed, 04 Oct 2023 08:32:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDC42660576C;
	Wed,  4 Oct 2023 09:32:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696408345;
	bh=4Ba5LFXdDysLehenyraAH5emOyFnN5MNv84LC56TNIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zok3+TzrkyFWpS7sPVti62h/Okuw1RhGt+q1VisVyQRciWKRqAaLtgTd7SwlDW5hx
	 Xwv0b0SWNSBTWNPqfc9fZCgg42nYsRXnGcjeVLZ/UGqGdeY7h5/GBYPWiNLOunFOc3
	 rHZafdLei+Dd1ojVlJbIgAE9dtNlXoc8yWAXHK60VM8O8fYOa0LJxc6AzKjApgoRRH
	 PTb0rXKiVt/2tWrLcT1eS5mLVRKVQdjwG4fKNqmd7CxBNEAnEPNf5NCbsIEtMlmG/Y
	 kh5zNZAaFG4rMlOxrGl4zsjFgjbnrUszbLYSA540b1DDFncAf/ouOAdMs9NUUIY+t/
	 iZrECxJxKBy7w==
Message-ID: <022f57cc-9aff-2592-f4f9-5a10e1877554@collabora.com>
Date: Wed, 4 Oct 2023 10:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v11 5/9] drm/mediatek: Add connector dynamic selection
 capability
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
 <20231004024013.18956-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231004024013.18956-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013229_652987_287BC82E 
X-CRM114-Status: UNSURE (   9.64  )
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

Il 04/10/23 04:40, Jason-JH.Lin ha scritto:
> Add dynamic select available connector flow in mtk_drm_crtc_create()
> and mtk_drm_crtc_atomic_enable().
> 
> In mtk_drm_crtc_create(), if there is a connector routes array in drm
> driver data, all components definded in the connector routes array will
> be checked and their encoder_index will be set.
> 
> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
> identify which componet in the connector routes array should append.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



