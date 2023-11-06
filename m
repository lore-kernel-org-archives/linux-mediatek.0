Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A6FC41535
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02mm6gg/27Zt3twbYLjRZKg1iblt6CFlN7zoM803CD4=; b=GGlbvLD5gmMhrDwyr4tIiarmHQ
	gygFKyCksewTVXdVQDyj2QC6SCLaQEb03FRR8U5f42tnB1j9Iw25LySSuQGTmTVBLs3yQBa2W3Gfa
	9w6dIdCzoa4wg0EcPkjJ0yQ3NOxuHuGJj0MSj/jSNisVOg9S/mqJ0n1VApB4sd4Tq1uj56MsV3/A8
	3Q1tO2f+o1QtVEYxgh3la+y+OFG9DbAt7Rakcrw0QscEjeh/KMmgtnNHOy8Vm8KF58eVHUNGlJ2xi
	df1spWitawO3G/xzlVBpjQafMHkSHqMBCo9EBfgMUVNihMi/FwlLF+qiov9jEvZje/a0g/dis2ztw
	TBAOhVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyO-00Gf7c-0B;
	Mon, 06 Nov 2023 12:44:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyI-00Gf1U-1O;
	Mon, 06 Nov 2023 12:44:51 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3FBF6607482;
	Mon,  6 Nov 2023 12:44:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274689;
	bh=sIoSRSvrBOcmnZyMDW2tZsC9ee5C1FKmhrM2pG1tRTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=agBS2/3HpPU9vDbTkdEX9hp9mzVf9XrqraVuEwEE81Xk5SlmL7TskhXLPGYaGmpaQ
	 6YusfspnRafW8+cb/MOFxx0VU2gChc4MuM+0oW03AlWn8/+2nj+zbtbeNMPOTYYK+V
	 B/4KbYdoEVdHmJjpLTnGKSDdtjtN2e8j88Ce7Fjtnw+kiQhcBOWUAp9y9vhgBJKlG5
	 dfld29UkyMvCsC5Yez2jr0XulIi31c7+CKl2xVNT2vvluhVP5eiHGS8fWNnXB7K1Sx
	 2BtjKuWzZVQO7MAPRq9IXznvmFHybKnzCMVfA81ZS/fkS/qj52ccI+1brVirsFaTTC
	 SbYPxJQNoz24g==
Message-ID: <9edb66ef-a1a8-4278-b505-5486196ef2ab@collabora.com>
Date: Mon, 6 Nov 2023 13:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/12] media: platform: mtk-mdp3: add support for
 blending multiple components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-9-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-9-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044450_603581_67F7C564 
X-CRM114-Status: UNSURE (   6.42  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Certain chips can combine several components to form complex virtual
> units with advanced functions.
> These components require simultaneous configuration of their MODs and
> clocks.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


