Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9B9EEB569
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZRRQPghwhfEYPJNyUekFiihmzSHXZ9ZapW/sGjqfdU=; b=ETht8fO8bvVpULXyzQVqRh2vVI
	XM2KlFk4SNxQSeZG+EYFjN5+ml/DKOIUBVH6wk3pLj1SYEzhoOVcEwshy/OOVX7GT4wBRNkudHJzn
	dl7mFTkDgcJgCEobVCrbSpLE61uVHFSvXtQX29dsQqowZpKBAofGuh3Qfe1JJ2ZBIJVFNXHkFOxGp
	hvSl4Q3eyG4ONaNl1uGGUB8w0QTWcqmI63/9RdWTm7Aa0EBgRijMb13zmU4csQ9dWx0c/rWQQyDMw
	4qtti/NQk0lBxcHYLlcr0Rle5ZdIT6teg/ds/RtGpo3hGoXi2vzTIPrKNWztPvltriZPv19Z3ssNm
	ZJU1S+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soflM-0000000CSzf-40zw;
	Thu, 12 Sep 2024 09:05:16 +0000
Received: from a7-29.smtp-out.eu-west-1.amazonses.com ([54.240.7.29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soflJ-0000000CSyi-3JdY;
	Thu, 12 Sep 2024 09:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726131909;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
	b=aCUFUUtoA6CaviWyQUW8BFB5LSp7jxDQJASTzRZyljZ2NGVHgwHPy+yFMvrrZkli
	sigAY1NBIXlivAa+SiEDhWg3TOmEtvdqiww7YuI/A9aa3aLihWSbQAxVeYeQ5LxOyQ/
	HqV2DtubHM8UH4WEuxClMOmZ6dofFu53NQdNCjoFHxGpPXe2kNBctzJauPskY0vWEnr
	MR9A9d5JxsN8ynf6nnv/1bU1DBALmQRvc/ovzd9DDNtzaxz59fXmQbEXPEcq2wzhWmD
	WWseEc+rRCqekmVGCbVHIV7xfCSnB/LEFNdbEll/G8HawdAe8az+PfZ6TkZMmyLUofC
	XRULCmMBnw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726131909;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
	b=XNjiDcpCvS80r6n8buYYjtUVfC+b8ki7uKSY1vF2aSJnotG1AYmi/hnkmG1WjRat
	KLNSgdZr3+133CzYSs/PJYGlm+bC86tKUKjBbtnz93qszw4TzDKgqwrIv/Oicdyjntt
	25hZtya2gSfxhvKHG9k5M12xVfY6bBA1VG4eILgQ=
Message-ID: <01020191e57ab41a-424e6c2f-08fb-43db-b45a-af4aaa22ef0b-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 09:05:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
To: Dan Carpenter <dan.carpenter@linaro.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_020514_037906_3428B23F 
X-CRM114-Status: UNSURE (   9.24  )
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

Il 12/09/24 10:44, Dan Carpenter ha scritto:
> In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
> set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
> we do not call cmdq_pkt_create().
> 
> During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
> is NULL first before calling cmdq_pkt_destroy().  Calling
> cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
> it will result in a NULL pointer dereference.
> 
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



