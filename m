Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEFAC6FA90
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFP7auqO3Nu8uv/H9gkFXYzB4LekW9MXxYskYGMRL9A=; b=FBJeLZqt5fHHuXHktYW1ig6aYg
	qu50JKv5JEkWQ4uZZonSFgJZ76YBd18lUWlrRywWk4WGzLt42OmDlIW5fLkZaN9hSX3+aUx3q66TK
	tqysCD5+eW7g6mIG/yNDVAN3LOXbLTzzSSk95W8M0sGspqejgwxyGZetSfptmKLgH7TLccA+kp3yy
	Z60xDuHu5930vqRpRBslmQlaqmMB1n1kGYUPbMWtEXE/KKUD3bpOiwocn2XojkVQ2seO8ZKaxNvVG
	giLwsZHEpxQRwRpyD+3so4M3Qwv1kTWz2q2DlXgIfaQIIpVBFxF5Vq/T6ESqLm3zddRCQyE+0ot29
	Bn39AVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauv3-009s5C-GY; Wed, 21 Sep 2022 08:17:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaurj-009qQa-TR; Wed, 21 Sep 2022 08:13:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 082386601F3F;
	Wed, 21 Sep 2022 09:13:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748034;
	bh=Bjxfb672TwUm4EQlrnOmkCxSjzDBw2gi/aezKDDa3X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XLuzjhKcVat7z477U2gtZXCfQG48jkdlU0vFU2EaqllJ4M3ys37+lldw8lOLD9Naa
	 NJNTLwGFc7/65UL8qmtVfIdJFEIfxKDBelbBck1dhknCIKeDTsCAFguew1RwrnyxRp
	 BSwEmrWuQdI2GKgRnlCkx7upp5ynC4kRviGrDBD6/XVAZQlJtW11njPnIolD/RFMkB
	 +m0Y773tikySCI84XCpVc1K9G3Vx9GeaNxNYZRjAs9rRldiNdeEjbYTQj6IN9YVa2h
	 x8W2ABkKTBnW2DnvtyqpLBKuZnoTkgbqtRnJ1Ry8zZt5SDG3YW+NHMXAEPS3UHP3r/
	 h70g0J8hKc0ow==
Message-ID: <cad587d8-8435-668f-1c7d-a8f0e8d05873@collabora.com>
Date: Wed, 21 Sep 2022 10:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 13/18] phy: mediatek: mipi: mt8173: use GENMASK to
 generate bits mask
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-14-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-14-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011356_161682_77B5FE74 
X-CRM114-Status: UNSURE (   6.34  )
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

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Use GENMASK() macro to generate bits mask
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



