Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B591C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Ea5zJXlB3e1KT8z1rwASC29nIJeLdRkL4qnmzLYs8=; b=mpaxQ/GLhnJTvpWsTKKLHvkHmj
	oeYqhQQqzQ7kEEZbRKBaHzYIVi0unVSpJfXTLDg3lGRVi68Ne0UhChcMdSL4M7QhLV+mLQr4JEgKJ
	+8Y0cKkcsbvv6BVZxs+DiKBgY9odFU2u0/cyhQVDKLIVeNxYmnfqGlDmKKEUZGFTMPFHKx0VAnGoK
	bd3q0XMKK6j8wwb4uBfknaePA/iaNAkzDdgpxbQ0/HzKbGi3hD/vt/ZXrrttmBzCNNNI9zAHiDGGp
	2eui+n4nUpx4h3rJt1vrIzMfTmgkyDYkNhh6WkdKYDh6StuJ4XktUTi1EVWGRJyUjs/8ydkb0/Ffe
	G+qqeEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdVG-00BsM1-PM; Wed, 27 Jul 2022 09:38:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdUz-00BsA4-0v; Wed, 27 Jul 2022 09:38:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FB9D6601B24;
	Wed, 27 Jul 2022 10:38:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658914715;
	bh=kb0hA66Ulh+7LVrBFaFbFx4CH2CTog1BkhvnquNUp4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=exegzssRDPydn8NZXLEP2+QYLvxDERNon/2ad2ZmKIpheWyJazAyQuSY2ZqWnOVcs
	 ku5Rv+1nSC7XQZn8dkx4/JKenuKhvPAHIEAd+tvBKPlFx9ZZgULuH9Ji5az4p3wsL3
	 V9pETgTGcmQTPAga1ReDqiLddUaCO64/yuf+qpDiY6YbO5wd4AgW7rrBOOwMTJTN0z
	 iw3uaAqF/T+qItfif0rvrZVQijd+w64c9GCLnlTTvVws8LIBZSJz10ayELJkbzcnGR
	 A8qJTVumydv065wwRiOvGEQvy/6AbegSLh21ZpjcKUnTIsiUPtxoqCSAXB+kS3h7KR
	 jM8qRNBBRntRQ==
Message-ID: <223f8f7f-8655-6f72-e4f7-c4a6a3159203@collabora.com>
Date: Wed, 27 Jul 2022 11:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 06/11] drm/mediatek: Add MT8195 External DisplayPort
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727045035.32225-7-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023837_808159_E607BFBB 
X-CRM114-Status: UNSURE (   7.83  )
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

Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


