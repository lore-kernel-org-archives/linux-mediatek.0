Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D9CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBs9hOd0LBtMlT9wlwcukfzXUw1tyuAjG8ejyYB38d8=; b=LZJdV5Ac8O0nwL6G9u6zLUF3Mi
	mUfM0q5T06zoVbkD9AMUTkKBEwgU7ItGr97XGMdH0VDKzBxfAOTGgJM4JOMMYZrbHHh5mDtWVy9AI
	yW3OU5RxK7BlomYOeJhj2QjGMpskRFmMiyyNwcSZTHCiamrTR+hTuwnncZWJMt02Z8n0wgD8ay+zs
	BCtrAXPCt9vQCkstua5A3J95aLzzqwTooFyPvn+1cx6AmNYAx4obv/2Bt4aeJ68sbx44fzUIw+5Dk
	d+svqKz82MvRgOdN8ozS26FT6vICnJsRFpGluAy59bI6tKeS6VwWMpi/QMKs45EjyYI9SLcYSb3j+
	VLSPTQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt4S-000gV8-02;
	Thu, 12 Oct 2023 10:37:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt4O-000gTP-0Y;
	Thu, 12 Oct 2023 10:37:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08666660733F;
	Thu, 12 Oct 2023 11:37:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697107050;
	bh=lNyFtEdQTDuc65MqDEMsAQSJCURe+5Hc0l5j1I+nClk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DY1opsTgYfOqAY8qFy2hg8GrEoAO+EuqCr6eiOsIX7kahRCO9NeYsDOkRL++LM2+5
	 pYwsdZTydV+3c+D9aiC89n2ZdVbD75x1yLpQ6gfs4JpSpJhuZrr5oaRo2oEYnOcnlS
	 B5zdVWt/vGDtuu7KGPU7VC38/eWQ/a1g99Hv1puyinQcm8FVMs6GulWGOSRuLbQcvl
	 oV0Kfs2A3UPoOeSFSAo8bdTOAUQ+cxCimjm/ZdUwc702CZmXGDGF6uW+hGHxYCDnEt
	 n+8HJgbe1VFusuXZj3exjWFUxN39PDEzfOhkAnQfds2Uvf6KQmcsK0quvxCs/AJi7S
	 lBuFyDvXYQPbQ==
Message-ID: <6d9bdf5d-e741-038e-3c5a-589b54d15846@collabora.com>
Date: Thu, 12 Oct 2023 12:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 01/16] dt-bindings: media: mediatek: mdp3: correct RDMA
 and WROT node with generic names
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
 <20231012084037.19376-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033732_688607_9DE2094F 
X-CRM114-Status: UNSURE (   8.46  )
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
> The DMA-related nodes RDMA/WROT in MDP3 should be changed to generic names.
> In addition, fix improper space indent in example.
> 
> Fixes: 4ad7b39623ab ("media: dt-binding: mediatek: add bindings for MediaTek MDP3 components")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


