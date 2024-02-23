Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A94C48BC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGcOet3ScuKg5kimztYFtWpdeXskQyF1v47k/1J0zxc=; b=CxAZWZy9d4fONe3DSMw0BmFQTM
	SaPD0XEZ1+1T+Ki5EUlcgIEXM6QHkGliaIlRtzGX0gZddgNRb4vNX+ndphpZ5apqtIb7e3f/1u1Sx
	QKn/PpTAlO1rftNK4Pmraq2vY51b3yxKGxGCMAssMxU6WJZWtZIT6X0NXIOjH2RNa+++MtD7F38DU
	q5iA/CoA/wMpNx4v3BiiNNeg23UMdl+MY09QKe2pAg5JOGCmKD4O7yyFqvPiNwByammVtaxBCy7ac
	Clei8N1NW9hxhhGUPWh47TbxJgT5bwli8dRbOOuKfoapGfn8sFUZga4+/mKKHg14FY5tCopkFln/Y
	Cg+rIaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRxH-00000008hBW-2EW3;
	Fri, 23 Feb 2024 09:34:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQvH-00000008TV3-1XyM;
	Fri, 23 Feb 2024 08:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708676911;
	bh=cWWIxYRgoOxuJ68j1q9tZim4FqZAlZlra0e2EyXAcqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VgbPUV1vaOZ1+Qy2HpOhr+qA2MyPZzmIs2aDRGaC6TtZeyXnn8i6yskawRRSDVrIr
	 B7vzNaGsr5cDdjRyl/AVD5xnzSCyfnsxkYTjU2fhroXaPw6CJyPpPLY2K/AWhEjsOi
	 imunYIf5BH1qCEiANnOjuadrvXGj9oeS+UHsE5f1WeKi+zwuFOvzVQZnzwoQDTktla
	 eXsGErXMmAoCKIFh4b/kWkmLJM8UpfW+RdLSTbi4DUXw9cqdlkGPAhOp+DWxHfkSqF
	 Ku9H6p347w1ZUsibw5cvdWulxsKjJzRM6h/UPryhiwhKm16Axs4TBhuMg5v4AuE0Qa
	 YhdbTBqgKGo+w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30BC437813DF;
	Fri, 23 Feb 2024 08:28:30 +0000 (UTC)
Message-ID: <298d953d-6320-4dda-b31e-c9503dc91cdb@collabora.com>
Date: Fri, 23 Feb 2024 09:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,2/2] media: mediatek: vcodec: adding lock to protect
 encoder context list
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Irui Wang <irui.wang@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240222092609.31382-1-yunfei.dong@mediatek.com>
 <20240222092609.31382-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240222092609.31382-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_002847_909988_E4006550 
X-CRM114-Status: UNSURE (   8.06  )
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

Il 22/02/24 10:26, Yunfei Dong ha scritto:
> The ctx_list will be deleted when scp getting unexpected behavior, then the
> ctx_list->next will be NULL, the kernel driver maybe access NULL pointer in
> function vpu_enc_ipi_handler when going through each context, then reboot.
> 
> Need to add lock to protect the ctx_list to make sure the ctx_list->next isn't
> NULL pointer.
> 
> Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


