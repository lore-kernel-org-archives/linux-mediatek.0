Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A914CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46P5h01jAelBXroejZyy8o2zLCeBQY9BjbMrOmlLNts=; b=mrMm5h10rUkcV9Yq7NTIxn4QaT
	OesvjRgyDlXz7lE71B4vwXGSwdJgdn0aUTMF1HePgENtRcFNZAbygVaxOCA3+OXwK86OeOvk7dVET
	cndd9cWMidrhftUPm4o8QaZYK//uY+BdIdtQ3mhK+FP7yuOnCE55bq6d1/Fg0hCTR2Mxq9IL021V8
	xiqIMTvpZyGSuB72VVuduv+BXy+nQxLwel9WFtXkCaz782qQGdCXPubA4azKCmmCVA03SRgdo65id
	C78f/uvJHpaLiFYaGnRPdC9/3xnX2ErCnMMZ8hbqymuwfUzhd2ZUZ+zV7FRCxtxDZLPj6x385vGzl
	ck5a9xSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt0S-000fkt-0Y;
	Thu, 12 Oct 2023 10:33:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt0P-000fkI-0s;
	Thu, 12 Oct 2023 10:33:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F243E660733F;
	Thu, 12 Oct 2023 11:33:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697106803;
	bh=00AF0ZzRGxYkozvqS7tP70zcKb+I/COOXlccZYk/8bg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMNU9QqICRKVi5V1+62Z9wy0+S9uRYM/HPL7fMGlmJ+QSN8/ueXOrPuJUExo7h94p
	 3STQ7GpZaK35JRBEcPQDrBPWgSOg/gaBksKBiiGie6OFVwgqbt+9eFus+0U4zUajm2
	 EIJL2hCv07hDMWXuMPHP4auyj6SaYMXjdoPjkD5Ds4Y/BRmHrVV+lJs6nSliddwnWh
	 V4nAd/JabPblCdWTEzbLxxqVrT+pcbYdztJ34uh1LXVnq0bg1orcdiS7Gb4FKNMdwU
	 oVwyXrel3Qc98LGWb8H7lH8myYoB/SZxR2h7mxh/l54RrR67mE1AEmWwYgkHNVqYkA
	 +cffWlzKUUKIw==
Message-ID: <83545460-deac-2793-ad97-3957b09e4aaa@collabora.com>
Date: Thu, 12 Oct 2023 12:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
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
 <20231012084037.19376-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033325_478013_EAD41FB1 
X-CRM114-Status: GOOD (  10.77  )
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
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).
> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

I agree in that this belongs to bindings/media and not bindings/display, as the
display-specific RDMA component is display/mediatek/mediatek,rdma.yaml.

The merge looks good to me, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


