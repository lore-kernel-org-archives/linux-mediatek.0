Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A95C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39QOG4sJeS1NrG5QnJClDwk3zdSxQLPqAESz92UqgFo=; b=Rvb5NCaZprR2gUIR32hSMFlRti
	6Dkzi/MifQc3mZt6RpimXUX2ApT2pb7Z2ATSsIKjIXAM9zhBEliIZiZo2T2hWNbC6fEkqSO5A+HAe
	dtnLgvDu/qFMsri43k5gzOpoMaYdZBliQrjuvP388xGkKfDy7qOufeZYCV+vICRDlCyk5FBGm7nt3
	ECF2gF/DmR4makaMuOtiLk9F0wsXeKr9JaYH8YcIT45bOLkkqiTriYSPM5Jv2PIh2glJ5+tT6H2qJ
	svJJ1JMqrFyHJ4d/+xezejw/a0Bg2QHGW6aP0xNJc0OwipvR797byUcYWMby3x7tHWGelRSI69BBc
	Tjtc/6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaHJ-00000000d9S-03V3;
	Mon, 26 Feb 2024 12:40:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaGS-00000000cfE-1OsE;
	Mon, 26 Feb 2024 12:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708951163;
	bh=leBMz78ecPcrLpo4jWp3OD2kzCaYPdWixO79WpUqSTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gikzga5Nt88vHmKjoR02aYiPPaAHIRYRQMo9buItMr0k0CQLXw0R1p7nC7BhBButD
	 LsRc+BAhk3TlmKPkZFGSylmBpz59zUSg3eSF0MkgWANZLJizPexryHbslpF4nK2Gyy
	 jAsBdWAPNjSy4sg3IrlEglDI+Y1p3dG16ow44t6gSkXumnxA8D4TeYq/yBbnxmfveX
	 H8OOoZQUOg4uZgUBK+9kY8RrOdhZ+/ERUPiSwLxx4yZK/v3m5Iqg0v9RoSL+AF511u
	 wA9raKJC59MDuOye2oSGEA+DXQMl5pu9x51arabwGJzW+XeLq5mUTl+g5N3HelrK9k
	 YRS2BNoVv2PvA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0AE7F37803EE;
	Mon, 26 Feb 2024 12:39:21 +0000 (UTC)
Message-ID: <db96c6cb-2d7c-4a9e-8763-d2055da3a442@collabora.com>
Date: Mon, 26 Feb 2024 13:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-4-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043924_668060_0A2A6E0A 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 26/02/24 09:50, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_plane" to "mtk_plane":
> - To align the naming rule
> - To reduce the code size
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>


