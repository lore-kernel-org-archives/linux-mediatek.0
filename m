Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC9CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feTsLACI85IyvD0vmtLpo8ueLzys1zaNTWuymncLXu4=; b=qDObuBIiVn6Odq/aMMqWYUwmsK
	rwnlE4Ow/awLtvTwotue73uHcW25txvKI2wX9oS3IVULwiwsGpZbD6oHlYkO5GcKvrL94a4xmSATz
	lCMbqWwBHmgxAekHStr+P0aZgPcYfYEOrhDhTKS7oXckiN5yrAq7crh2y7KpRXUUKMkVtXlCwjZFr
	ykHgQQ3z4O16jzT6UG4gEzSlyvs0Lr7sjgRyh9sWmIJgkzI9xMoIsn+cDPOi9vT31bXoz2YZiJl6P
	aYPaLMPs/CmfjDy5SMGzmWCIO8gmkWtKCu4Xzyq2BlJXKpHf1sVEByOB4thMdD4vvDny+9AsHOJ+y
	kda3YRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseR-000YZ4-1K;
	Thu, 12 Oct 2023 10:10:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseI-000YOT-1b;
	Thu, 12 Oct 2023 10:10:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C1956607347;
	Thu, 12 Oct 2023 11:10:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105433;
	bh=cTAEEkRbGv814Gyc885IuRoS5GtMoQSfLY3IUSMSg34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g/cnw0F3XJgB/36LzTLsNs+Xq+URACVf2pfcIF8g1v+mlLdrhljBPMHBsj9Ebk6fo
	 auMKHhvMXuPiFj6p3FvSdNicuOym0FuBoOUvaTGFu3P7udDl1BRi86BuqLbr33PeRJ
	 uD+1Fs3/e6jjjQrFntOFmDAXWJqbGpmNVeF3h6MskKhHk+pO2GDVfMxjXA56IslZed
	 uccu6Az27+VijqXMkpPx4N3BpHIcrD6855R/rcL5CnJSddH5bIaCf/qvhbB7eAntVO
	 8Q1KQi9DrLLwvcmy5HZEfMldUY43j2Tie1kMeOn+hG9SjqeUKQEpi9UvdBK0LiIQtR
	 lSU5py4UDZRCQ==
Message-ID: <99f8d80b-16f0-0b50-35e1-bc54737fb008@collabora.com>
Date: Thu, 12 Oct 2023 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 11/16] dt-bindings: display: mediatek: aal: add
 compatible for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-12-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-12-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_031034_661173_481D7C69 
X-CRM114-Status: UNSURE (   8.55  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add a compatible string for the AAL block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


