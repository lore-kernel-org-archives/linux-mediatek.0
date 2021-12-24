Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE552C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMND/biHVduTaPy7GdL7He9FYSHxsdIZ+QZfVRwKzlE=; b=3Fm489U1hJ75JHQ5ecWQ4p2TXf
	nc700lhSDAYLcZPsdDb9lhJCrBsTleMQ99rjU3hhEDH+aFxyUA7wXsNr70z2gih2tIJS9XlfyJ36w
	CvKODPSNypnia0mVK5bjXYVgSuJcktuvnObIb9VPjCp2fD+1NEYG0JyK02Bl9K6iVsKQeEGt7BAth
	xkziL8gU3kIaZKkB8YP6BxTZpCuA8vJ472KdsS6Ed0VuwhpNetNNYCvECdUSlH7Oi3IHdQ385VtPS
	VFd2tdHHawduOGaRspIEo64t8H//HZAkD2nOxeO2fEbs2pHSAOxO2ghzvyinnLbmnWtAEK5ThCXQp
	cd75i7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gkA-00Dzke-A0; Fri, 24 Dec 2021 09:20:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gjy-00Dzis-V9; Fri, 24 Dec 2021 09:19:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0DEB21F41087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640337589;
 bh=Dd16QanSlYA1tBVffT0FvMZpvgakJI8nT31xHJoXEAY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oDQC+LOrMg5QF+R8JR/PTi8Ifb4idiM9mqjKcMNdNXjOfo6hlwmJum2ySGAB3AfKh
 cOEFVCfmZnCAvs+QZy27b2DBsVPt9BcNG/Sc17cFkxnMm3rt1Z1dsvYOcTF2HHiYm9
 QMxYgY9MG/4kTXcezSlOVF+bX9fDHTH+i0XEhWE5xdd4scyyMcWpzix9mU9QB0UJSQ
 uBzjUvHTiAg+3R6KX4CAGODMjnoY5qjHakecPIexaci3RN64AGMXvgyWs31k7HGX3f
 /3zD6SQTSb2TbfMc7TMtPhYh8qHS9OIxHUF+3psS7n3mCOmTR6Bl86GAYEFWg+N0N1
 l2TbYFoQ0xhZg==
Subject: Re: [PATCH v7 1/4] dt-bindings: arm: mediatek: add mt8195 pericfg
 compatible
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org,
 linus.walleij@linaro.org, matthias.bgg@gmail.com, broonie@kernel.org
Cc: bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <6f16c605-713b-5318-eeea-ba9810245a25@collabora.com>
Date: Fri, 24 Dec 2021 10:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211220121825.6446-2-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_011955_190507_D53DE242 
X-CRM114-Status: UNSURE (   6.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/12/21 13:18, Tinghan Shen ha scritto:
> add mt8195 pericfg compatible to binding document.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
