Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC379C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0Q7dZHFvOYQ1lJrlkCQZ62MnDw4JSG29b+b3y9uro4=; b=SNx8739FXF0yxyf+ADwnM+r3eJ
	nO4ppM8HlujYCoJJ01MzxvGWhsz11NWQ7MEZc17KyR04gVkCFUf63u5sKCPTRkrOd1YMcahfFnDZ0
	83tE25+RK/C2GGJKIxWrwyos4BuDb4VfgCAiOk7rNWnDICJ5PZ0GnWcGv/Jbu1vBTTPft7mPneMPG
	nn0sR2ACTaBeBYM8Z72ZbvZXFHCDxVrNXDlRcDk4vyOFixlj6bFd7hih73Ui0n5s9jNAvjx21WsTv
	V27zHPh7YXxsECVgrHHjsLeDn0uAl0eu1uR7RJe5vDF6zjs439+3naFC/0BQI1SUGqRWev1g+gDHc
	vwRwo2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Esz-00FuKJ-13; Tue, 11 Jan 2022 11:00:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Eqc-00FsTT-2o; Tue, 11 Jan 2022 10:57:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C4581F43A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898668;
 bh=NvBp4xkPJVbNU3MK/oJVdRowkuSL4h8ZkX5EWIFweAI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U90UTcwrcHl7lAE18Dd1C2v+QTtECGqSHw6u7imCFmXlIJL8hlnErzEALxjHebYGo
 +fX9GGbwyyHdQr6yWIf1R+4fIiSzm0ohVZ9OFu0EJURw3P+45Ov1dfR4XQ+l6wAu5w
 SqLnH3tJ/SqyxTnzhU5uzPKBkh/Upr5Ew6S7bis+rrdnmMuCaLIcC4LV1rwxeKbaP8
 GPViTBYhTVDaZe4JzcIT8jTKycSTqNkRWe2QbsOA3XcTj1HRzpsYp/TDvR92B+YJP2
 +1pyNwJm+S7KfKQ0YFaT768zI5+B0U2sipkCh2WkA24w6qQeSUfCNhohyyI3vlbx6L
 XipzmjZI9bz0Q==
Subject: Re: [PATCH v9 07/15] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <16f77e36-fffe-d2d3-2c7c-6412a038238c@collabora.com>
Date: Tue, 11 Jan 2022 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-8-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025750_335647_F7D32C34 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/11/21 11:55, Yong Wu ha scritto:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> CC: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
