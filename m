Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeOqliidll/oQjk0g2NLlqBR1kt8AgRYpkbr02yVLsA=; b=GDjj49a/ugE7oYhGVbubf/aROO
	2V4e5p/5icYrPZ0Wb4RConL1iLo8B72D8goa09sj/ZItVzvhJzOkYidebn9myin3axg5ScgfPmMhs
	dL1jHa0fi6lxvofYs5Gtc+/MZXW3hzt6HDA3EXCVUBHzH38gFEbi67y9Msln385ir0IG6c2EY93P+
	nEEAdATTrcMFN9TEE/iY++zNKRGi/bb0kewWFYWqjd8dknfiAf1b3BTL787+5gHNOYMF9LWXLOe2x
	K6mC5X1k0nVOLPJ3CzDxqQ+JCmtRK8xT2aE/3j4HZo7xPXqa7zeURJmvqacfo9eIgBEEDH7JqLKlx
	kxNG5+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ga2-001mEB-MR; Fri, 24 Jun 2022 10:30:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gZe-001m2b-Dx; Fri, 24 Jun 2022 10:30:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D26366017E1;
	Fri, 24 Jun 2022 11:29:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656066601;
	bh=hKBlTlh6rJQp0/PqrIUPBQEzlcGlkHae7pIOm2+YUlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iYG3Nlzt+inCv41ww4oWe9xvhet5gZLdSI+PaSF1HwHO5txbqew+S5pL1N3BDoudr
	 OH/REp0e/Ko9kOQx4LhqttxGd+ZYJzXTQ4bkmljp8AZK1rQv92ASzG+x6TJMuiL2mZ
	 oxJUuf52ishxcC6x8emkjyn6iFRFyDjMpmiTtvh1G73HnHQi9aS/3SyNmOrRQAYV7r
	 wjHRgEdL2VY7s7REGv3bYgJluNLLEDg/1pPrpbB7+HGG0oiRByMFTCcoTddWplif3K
	 mj2yyT+ahLQrqOnr2E4VeW5zYOq1Bm6SqfaF9NxhQBgDOxvlqpJ6AFBN63OY88km6q
	 9HObPrJqpwNuA==
Message-ID: <2c788189-275a-ac31-4f82-959c04e760e8@collabora.com>
Date: Fri, 24 Jun 2022 12:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v19 2/4] dt-binding: mediatek: add bindings for MediaTek
 CCORR and WDMA
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 cellopoint.kai@gmail.com
References: <20220624092359.11908-1-moudy.ho@mediatek.com>
 <20220624092359.11908-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220624092359.11908-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_033002_654299_EEA3CBCA 
X-CRM114-Status: UNSURE (   8.36  )
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

Il 24/06/22 11:23, Moudy Ho ha scritto:
> This patch adds DT binding documentation for MediaTek's CCORR and
> WDMA components.
> These components exist in both MediaTek's Media Data Path 3(MDP3) and DRM,
> and the bindings are placed under the folder "./soc/mediatek" to prevent
> duplicate builds.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


