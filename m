Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTZvTH9st1aFSmtWOaet51wX59FIRj5q3YqnBaWGBeo=; b=I2aiGo2VNJMYQyzcwFFS/GKyNO
	4+ZrvklsWNVW/3N7UJZatkSvqZ8W4S1HX7zJKgamfyAOlR1EMbNrb/PzBQpY6jTlFdT5Mxj4CnIY6
	Ce4yaWV2M0AWMbyzp4QHWf+ekqBi0HindXD5NxOqUpqT3/TmRyfhVUufnrKvL9/GI6n924lBKqN1x
	C3f6ND6OR8A5KqPNH7whSvI5s/H7PpukvcdoOXTy4Q/gRIX35UYYF899ngNkaSSSzq9e2WpDGw4Lt
	JxeDvGEUCXjnautMvdy94HDPGREX5KGsvQqYcISV/D79flg1abiSV1aX6IHbbcJh77queJExaGNjs
	h/GsWogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBmB-009jmn-1d; Mon, 19 Sep 2022 08:05:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBlw-009jTC-OA; Mon, 19 Sep 2022 08:04:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D13F6601AAA;
	Mon, 19 Sep 2022 09:04:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663574691;
	bh=AxmpGgtft9fTu7bm6VSK/NdXOjH/7AO58c7gygKahWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mT/ZoHOtPw16Hdhvw+HFPR3L1c7Q/vmd8/ck+evhjxIRCTFttlLxjm/i2pBa0XOgq
	 fjsbHOy2Ou+KhIpaSxoCU4o0Jp3CDH/jT4/0+P8dif7+2w0PopCKoFA8E2r5tx91ch
	 cPebNjiHhEMFYoGoVusYcDC89SSmslLR+GzkY3GiIKjAAJ8/siqgJTXHTcrD9j2Oj0
	 vMMe2SFGvqwLswUK6m2MQMziKdY21kdjGHWgAtZJ0KQUbbiAo9V6ftxZocCjbwX8A3
	 PVYiLr3uOe+Es6PxcC/0CxyKjWjiAqBtQxEnuuW03rxnjQ/4oqk7awac1dAuS5VDJK
	 NV1Qm0c+YV9ww==
Message-ID: <2a394e37-ac3c-77ad-d482-e36bd1ab3346@collabora.com>
Date: Mon, 19 Sep 2022 10:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in
 mtk_dp_bdg_detect()
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
Cc: matthias.bgg@gmail.com, granquet@baylibre.com, daniel@ffwll.ch,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <20220916133821.27980-2-rex-bc.chen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_010457_058296_1122E405 
X-CRM114-Status: UNSURE (   8.07  )
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

Il 16/09/22 15:38, Bo-Chen Chen ha scritto:
> In order to improve human readability, reduce the indentation by
> returning early if the dp/edp cable is not plugged in.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



