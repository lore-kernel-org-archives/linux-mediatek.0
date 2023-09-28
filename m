Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038ECE7B12
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49V0DV9EfRiRk7wZ9T0ZUjCVVBuRnreSFl5VTCBa7mg=; b=EKPazBZnrwKu4J+y/KpZsahavE
	VhGM1yLtXNasqPYGhlfzPCWrgKumGnSj7iPDPXQsIEaZtdJa020l6w7Z2LbvWJelFz8Ky81Tt8JcB
	RJmxErGS8Akhn/4f4JIGVukOjRNR52k0l3sm2E57vzV2045nJx980qWGaJlkvZopqfleBXE2Owt9J
	JmYUCo2/p3ZGyPy2H+8YKjGRBQ/UIlx8iNf7AbMfkyJFiOmsljO0V/Y7BjHyqeNEzin5IFHV8pDnW
	XudT/9j7N+zHPPNKYReKXmuLW9KHlM4wpc7tR/9bq0Qe/pWvpR2YnSpvjmcSfQifAa4sglsw6ujrz
	w4HrTkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGj-002j1I-2q;
	Thu, 28 Sep 2023 09:25:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGP-002ipq-2D;
	Thu, 28 Sep 2023 09:24:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CBE2A66072A2;
	Thu, 28 Sep 2023 10:24:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695893092;
	bh=pU/MP7KedWGbGGiBdg85/ePbzV7MRb9SzGLMssnQQjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HK0lrEcysAetNC3UmfkbbWvr1osU1C0IlouqVRYR6CsK+g+RsQ8CVDMga4gu872pc
	 98D5l78a3L0R1srUtcklAuqF0Dz+jdSyXwWXINSaVNaXeBwbpk8+x77wFgEMr5EJ+G
	 NVup+E0IFGHAkJ//1z2e1J7ofNmsFLkO12hwXiebkBYAwBW/MckKE9d+yDF5jbYKlC
	 utHFZoO7ipRi1/IGpnoouaE/B2Tv8R+WBm+jV3dpPHsPrDRsRgRh9IWUb3QO+74qMA
	 pEdPwPJvLgtOJS8ANohchcPo3Ti9aNxvcdeKGSr7YbMSX0lWRW7OjzBTlI3Bg54+r/
	 2gw6KJqR1lrCg==
Message-ID: <9bda95ea-889b-2bdb-ca23-9013b5adf2c5@collabora.com>
Date: Thu, 28 Sep 2023 11:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 9/9] drm/mediatek: Support dynamic selection of DSI0
 on MT8188 VDOSYS0
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
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-10-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022453_890750_6FDC67F9 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add DDP_COMPONENT_DSI0 as a main display output selection on
> MT8188 VDOSYS0.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


