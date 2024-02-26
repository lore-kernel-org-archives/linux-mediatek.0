Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59E5C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC8L2SX4DtqymIdTE1vAxD0llvvpr8nDn4Mud7lnSyM=; b=uNJgoe+Bqu1/0mvjHd3DaRUUBq
	zfaKiRjfwVmhEk8aIMRwclIP5DDfEashhm1n1rZXJIuDR3iFnBh9qmr1VDRnvhthYIv1w++nghmN3
	UhMx9hhNzHnkIAr9pgw2ilZtf7PP7oQXpOAunX3VKBAk3wPylve3uRucNnbC/XQe8HHY3+UHzKG9w
	UevEImOKGA8m0+TlIhpxrNgjjObah9Gv6X9EvhpujEdLB0+iTOmTVGxLzXwoiw6nShU7MF47sg7o0
	yMckmzsfp1kZPEWR0Fe7LeYeiURh9cOZKle71VLEof6lHn662EH3iNnTqi0ugARZaToEP/1akrWek
	pmwBU+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaH0-00000000ctw-0tZL;
	Mon, 26 Feb 2024 12:39:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaGN-00000000ccZ-1mYU;
	Mon, 26 Feb 2024 12:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708951158;
	bh=ssUCrohjGs4Ygd/5Qap/4ztBIgAopUsbSegnQlFXBuc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IoK2SJZKpm0P3y5QWkmCT+CPMGfrpZr35MgbrCienTK3RajBgjOuKBbToeXDXD/ce
	 oUGse1nuo0B8diR26ZyyFpJXIRE37sM+EO4Nxh2B1EBp2jjOaeQoMe3DI5ZoRzwW1D
	 wS8mmdYYMNWm8Mh8BeiNyO8jx/4E0cDJYs6LzeOtFFglldRUVBTKXq3WjgrC/UQuL8
	 +62I+DlDPILBrBWAQcezRfq3HN/pQLVJsnhynHwMu5taQquVn+/tXUx++MA0yIf5QL
	 VLEemCo2cSf6+Kmr2/46hl5nT8l9Vv/2ulhu76SjstCIYeKCp7Kf9egfusb/C8SqRH
	 PZa+CLRCsuaCA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0501A37820CF;
	Mon, 26 Feb 2024 12:39:16 +0000 (UTC)
Message-ID: <4a17e974-ca9c-41b4-aa5c-2d41598120a6@collabora.com>
Date: Mon, 26 Feb 2024 13:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/mediatek: Rename files "mtk_drm_gem.*" to
 "mtk_gem.*"
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
 <20240226085059.26850-10-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-10-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043919_778335_2573A0A7 
X-CRM114-Status: UNSURE (   5.15  )
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
> Rename files mtk_drm_gem.* to mtk_gem.*.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>


