Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ADAC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC4uAuvxSOmf12akbSmk10WfE/U/wkrEANgyWfrwhNU=; b=GRPGUz4UCDklNKZYry+kkYTVFj
	WBJ7zJPRpGDkQN70NQmsAFTgNNz4+l6sUYPWjAJyPAHhnC6oF4FxyeE5fwyKXdUWZmQdUI46iywoM
	/yD6ZIO6eKgeVDtr7dQV7Ffxs0+AW6D9Kd2hPH6K5tvWTIE7Yki0/qOy+QvvMpintkHNqjBYLh4Y5
	ul9vM4K3m9szMAiVT0ucraBfL1gt9l7kI5YrZTAazMwbWbyEfMuPdfula/eXfzVL7nqID3NrO6L/w
	a4e5ILA4Z3KirG0gib91vjC1O6AxV0q7dIrNDv2EaLU8kUMnCT/4HrXaA43zaK5r1ihAa0B1iPHzy
	rXGw87hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPI0R-0000000CcDI-0yaJ;
	Thu, 04 Jul 2024 08:39:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPI0D-0000000CcAe-3qH3;
	Thu, 04 Jul 2024 08:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720082380;
	bh=sA8QHdLjPfav8TbcR6YQwgjbQ2b9bEIoala4MwhSdHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=16eO5BK7kK2Lkg2zf6iwJnuoX6jV/9md/Okmd/oDGJysDlbvLlL+iiBSsjnBCrVmB
	 o7NgTFQSGV4KKd60agtZrmIGWQa494sujbbYTh3It9tz5hnGCIJyBBgsnzipSnFd6o
	 B96BSRjoOKoI4mbGiywgmOCdDPRzYcmbsoPvJ2hGmr+6iUv7z/gogwd6jn/knibjpu
	 OICww3UMFyne62ITObPlocHg65aSvPjJsMzD/wc5PDofjTzs1jepFIi2dPP2qHX4jt
	 kU9sTEjwzjgIPwjI7Pm64pxGb2yAZsTBe4A1LFgz5F2wcO7zFsFw/ervuV56PP9vHo
	 vAkfAa9Sd7knA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4130378216A;
	Thu,  4 Jul 2024 08:39:39 +0000 (UTC)
Message-ID: <7c1d5e3f-ed2d-4f12-945c-32ee90e78e2a@collabora.com>
Date: Thu, 4 Jul 2024 10:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>
References: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_013942_137399_B7716EEB 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 03/07/24 12:33, Jason-JH.Lin ha scritto:
> In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
> generate instructions to cmdq_handle, such as:
>    state->pending_config
>    mtk_crtc->pending_planes
>    plane_state->pending.config
>    mtk_crtc->pending_async_planes
>    plane_state->pending.async_config
> 
> These configuration flags may be set to false when a GCE IRQ comes calling
> ddp_cmdq_cb(). This may result in missing prepare instructions,
> especially if mtk_crtc_update_config() with the flase need_vblank (no need
> to wait for vblank) cases.
> 
> Therefore, use the mtk_crtc->config_updating flag set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't be
> changed when the mtk_crtc_ddp_config() is preparing instructions.
> 
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



