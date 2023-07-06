Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA00EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3UR4Lz2UxgUpYC0MVS/hfFjardY5m1XR8fQLZZvlGE=; b=2SBKrbtnNcT+UlTlcN4RCVmYV9
	JfA79Dx9A5V4MLY/tGIssWc6Etb9c5ScMwLVhSMBLOcWOc2vO3U+rh9qITXCdRMvTL8zQWlqqavsm
	+/Lu8aExHZnuF/Q7C0FDAWH9pNlB5/CEevol8XkbHNm41xCrIO5qFQTGCLXCgIHiG8pR0GkSeFHE4
	aPZmjoplU30twqOqxbM/ttURXanCa5IJiP67HHN+gabl7WdbYd+5mJ0hfSmDHhWa06oW0/Yp8qdi1
	urpEYNxkOEvCbfsvPDOwuyv8OyobpsHFIEOa1cYYnisQ4k5zUqWsHvgYlxCNTlaTF5anFG9RpPaGY
	2P6gcNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHM0E-001BYf-0U;
	Thu, 06 Jul 2023 10:14:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHM0B-001BXO-1X;
	Thu, 06 Jul 2023 10:14:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADA64660585C;
	Thu,  6 Jul 2023 11:14:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688638455;
	bh=teT1OjiRap+HP8iW1Gyu0lP/v4LyjAIlwMT2n0OqG7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbyxQ6WTKY1badRoEB1wFosnFnBlNUnVPcAW/Ug+3b9HVwuVLEO1+MIwGTzZHMlau
	 siOHhUYJ/CFlxV8dr1CLwEEMX+XB/SRWHM9/jD04AaCyMRxd1A3ULaSosbZC0gtj+d
	 5dpOQKYoE7fjHPIsWNKr6Isi2+RUKCO6npXO6GvCssvbjrFL+3S5FbV2yT+PAtjIkg
	 5Bqm8uLNA97URsEk6ZEC8rVAK9XR6LyouDTXpW9RdplQ5xfZ+626HpHiQRniFtJIzL
	 LBrjuNJPuQiUGCq8lUOa9x29i/3U2CutNjGoZ5y5Ey6JVbD7yOzE3Y6EDWF+U6GHL6
	 ROznf7K+VDymQ==
Message-ID: <25d2f4ce-8c95-56ff-eb5a-9cf19532d1bc@collabora.com>
Date: Thu, 6 Jul 2023 12:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-2-shuijing.li@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706021425.31735-2-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_031419_664721_4A75C3E1 
X-CRM114-Status: UNSURE (   6.07  )
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

Il 06/07/23 04:14, Shuijing Li ha scritto:
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



