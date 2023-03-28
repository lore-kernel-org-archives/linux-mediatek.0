Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7119C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeuOLYtwyneSrOpBgYT87vrCPePrIfz258J8Vly8n4c=; b=Z1K5mqgvkj3J9mdAWLbEKZt8qH
	jReG+yMTWoMJiT6jTKsFpVrpsOSnzPCmdNzvFT7HPAwYJNj1DewdwT/F6Zvk8Z/+53Mz70YlN0R6l
	3NqNaRQa4z2gPOMsN6MGT2CzPhE8vcZt3bGZhzRbN5C+G2IDYUEkGGZiar38HDKTvMqa6duFp4gdQ
	kPpkyKOjeFiuZpjFh+OsoaNlNhaduCxwq10MLP1jwYEg7fanfR5Z0G+dmsFrENgkcOs78cci5Ztvk
	GcPQJLD1imsEZjtoVyuihRavTUfBdIPGOcbgeB9crog+gkm4QIfDuGGYdZs8LWn3kYX7LBZlBE9Ka
	1kW1TaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBF9-00Ew4j-27;
	Tue, 28 Mar 2023 15:28:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBF5-00Ew2p-32;
	Tue, 28 Mar 2023 15:28:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BABD66603150;
	Tue, 28 Mar 2023 16:28:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680017289;
	bh=LmvUlEh5ksKEzZpgWt6GAloNsrYbh3aS1Uuprqn7NrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OxmJNUxnR44yQjrlJub8pgQJ3zvKv/f1CAfrfoWmoakCxVDJPvYH4FZ180Ga1hUcR
	 eDIQ2KeX/G1t0RTjMFLIPS2JLqRS2LCwOshmH78KBTpR0QXsscOPkZQWAs8ok6UW9f
	 dlddXKT4RQDFsXqzqTdhg3YnbxCYzZF83cyQStM0g5GSgCTE29pC4laMP1NVuWdwFN
	 MAHxodsupYCT/aeAcaV4fw7/H09VP4lBrlFdBPlUMB9cbsSwG6DwqmjYrVUq0WZgbT
	 e9VVwip0kksvvBDf2xq3hGwxycmw4ypj31cThe6YFFKK0+g+b1z6rqXbzHya6gp2kU
	 J8oXU6DFEpOFg==
Message-ID: <fa638276-81d0-734d-92c1-3b72cd70c1ef@collabora.com>
Date: Tue, 28 Mar 2023 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/mediatek: Add ovl_adaptor get format function
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com,
 shawn.sung@mediatek.com
References: <20230328025126.30341-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230328025126.30341-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_082812_189126_03E1D89A 
X-CRM114-Status: UNSURE (   8.19  )
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

Il 28/03/23 04:51, Nancy.Lin ha scritto:
> Add ovl_adaptor get_format and get_num_formats component function.
> The two functions are need for getting the supported format in
> mtk_plane_init().
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Change-Id: Ia8e9f6cabcc71b262155a022b103ae81d1616b8f

The code looks good to me, but please drop that Change-Id tag (which has no
meaning upstream) and resend.

Thanks,
Angelo


