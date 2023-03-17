Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8AAC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf0PXkMQMhmml7DD15tFTIiSIlccYY97jtyBlNGJL+Q=; b=W8DseFdw5oDWXRk6dWiojOHaIV
	6N3Fsi3ZdupwglYIhPb/OvC629argUzE6nWU4h/HV6m1BY8Th2mQ6q0IYk0Ym5+lqSrterW74thl1
	oW4jeMhwur6UADC6l6G+UNkeJ5VQCQAvJuoTYtA6mPhr9xd9y1WO7iQrIvAEcipzAOz7y5V8V3hYK
	RxW+GYf2T9n1CvJEm1iqxz7QTUcVth8LmwxTpjCpSjlom9GSxUAXg7JWYiKAwUb4mLzxcLvCVrLk1
	0d1kNMu5rEYJ8QD9dUa0fQEpOp1z6LHnb6IxOKmbQ/FfczcA5kSjBBC3CjISbWxnJ8YXcDyGWTUse
	q7qUHy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6I1-001iHu-2i;
	Fri, 17 Mar 2023 09:22:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6Hw-001iFN-38;
	Fri, 17 Mar 2023 09:22:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7503C660309E;
	Fri, 17 Mar 2023 09:22:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679044933;
	bh=SyM9MroVBoZ/mpIqOa19vnkIrEGa8nBH5H86kOjl6QM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aiV90Yg/3wCPzYrXz2+mtnJLVBty8uzsHvI//nNkcNeIgs8D16q3Cyyg2x5QU1H5R
	 rOPKuoKUxgtDr8JrzC3wfPbWfXvs6w2VSl3LMPAxT0Keuf0ca252d57Yr05gl1ik73
	 ry9DUEfksFcmbR57I3Tp3aZ1MRxc9hiHg5kHCVaTc8nCtztjlgPrpE4zOyd2oXf781
	 NlkDLUk3RvlQ63VlGkdZIS6SYYyvl755pqHjAE85wc7L7233P9xR3Hre86B4nm0Erd
	 EVG3+9vDrJ+taLyMSPI95OpKryZbMXDqyuJugefK6UCL1vK6PqdkJeaG62SecNow1L
	 +J3YN/BOVw7Tw==
Message-ID: <5dbee8ef-a5eb-b73d-5336-8b5c879a0d2a@collabora.com>
Date: Fri, 17 Mar 2023 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/37] drm/mediatek/mtk_disp_aal: Remove half completed
 incorrect struct header
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-8-lee@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317081718.2650744-8-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_022217_140508_D667AD7F 
X-CRM114-Status: UNSURE (   8.48  )
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

Il 17/03/23 09:16, Lee Jones ha scritto:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'clk' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'regs' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'data' not described in 'mtk_disp_aal'
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee@kernel.org>

I'd add the missing documentation instead.

Please give some time, either me or someone else will do that ASAP.

Thanks,
Angelo


