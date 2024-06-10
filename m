Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C42C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqCJnjHmhe1AmErrMnWA+oqbCYQa3cq3S1/88j1PYX4=; b=2KCekMJw25WPKK4DY8OkOdbb0z
	EwaD4OwKSWS1wmqSWcGFviPZ67E9JzsBZxrrRerECBNMI9dOX9VtQry2Z8BcYB/wHoY8iRTWPaFVq
	7b3SVYjPYYGYfRhzw+huRyogMYhqHDmycA8BRhLgZ/3msym51+MwdNFsV41/jQ45mrqxtFuAW2PXV
	1bBRfQGTMb/62pYdt0sx9fwQnuv4GTq3GxRsajuWspiqih+SbQ9VftStoW+FmQ098gSbzyVu5n+sU
	b1/u3PVKDoisXyVxIBr8JnQXt09+RxRdatlwZiIH0d0K2F3rPx7rBIkWkZwgM1kO5qGk64bH0ehOk
	+DihS74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGa4b-00000004AxA-03KQ;
	Mon, 10 Jun 2024 08:08:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGa4U-00000004AsX-2dy5;
	Mon, 10 Jun 2024 08:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718006884;
	bh=+a4XyDtUsGwPIvUvhqNonD5lfzcSOMuMC24xSiBtXco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5NePribMsVST4B2FtFE2Zr5cx66W8RZW36ExJ1UM//vid2ECn5F6DUrQoZlCOM74
	 YQMClvdCvYHJByKhzdzaot8O3FLaKXfnqSlmW6iLWr9jpxNZh84rz+DS6tK9N4imL9
	 FjuyphhdnKrxozXdFykRNP+GH/Panveqy5buMs9VJoGJhNMPFhjKEjKkC7Z2Q3Zp9S
	 7MFDGPX4fQbv05whQ3+GiBPOYS8wWr2IKVTdCjx+sdAczeMRfj2fbFmj6VxbAZ/qRk
	 ELx7sx2gKLLBiR6ZfH6KkYjPrHYy8AyS+sTS4owFPVDQ8hS3pLMYUMMG71bRcQ3ESP
	 aL99PxEoEaZwg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82AFF3780575;
	Mon, 10 Jun 2024 08:08:03 +0000 (UTC)
Message-ID: <311dbd5e-60bf-4e09-981c-238e7a9970be@collabora.com>
Date: Mon, 10 Jun 2024 10:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: Log errors in probe with dev_err_probe()
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240606-mtk-disp-rdma-dev-err-probe-v2-1-3898621767b8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606-mtk-disp-rdma-dev-err-probe-v2-1-3898621767b8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_010807_019126_44379A4A 
X-CRM114-Status: UNSURE (   7.38  )
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

Il 07/06/24 01:52, Nícolas F. R. A. Prado ha scritto:
> Use dev_err_probe() to log errors in the probe function of all drm
> mediatek drivers. This avoids -EPROBE_DEFER return values from being
> logged as errors, like the following:
> 
>    mediatek-disp-rdma 1c002000.rdma: Failed to add component: -517
> 
> As a side benefit it also standardizes the format of the error in the
> log messages.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Sweet!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



