Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B278C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXzlw+MVoGUjKtFSOC9bIcLVcHF4FW3+g/1PpSp+nPE=; b=pNo8FDtiy5aMK/z8Jzxc4PB747
	Nn7NbDR5sAn8ltJqn3dlbhc8Ss02gvnr+pRZgbEzCpDI8OEr/wXrzZIrBw4F7wR2xijznJHMkeyu6
	ntMWWG72DHdye/Lwxr/qIE7DERQUiEbkDl7MxVV/iwSyOvI/dP+EtvuEZ8TmwLWkgwv3UynM3BeqI
	ckuvV6RqmfYjWQpjGcjpBBm9F2GNHrWAeeA5Vpy3h8XcIQyOlqXMZXAtJNl5G4eLSjg04c0HKGImZ
	K4t/nRGVYcq1BKK5MROr9YNNv2SCL7UZCJ7il7RBQBbiKqd6rvWx1MxpUcOWrUGc4Hvz+7gZqqHb5
	Gy8gm33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAQi-0000000ASiB-3zE5;
	Mon, 17 Jun 2024 11:21:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAQf-0000000ASfh-0hOp;
	Mon, 17 Jun 2024 11:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623299;
	bh=mlQWTkQYV0ADJmxV/Ck1L3uRlKxNKrUqgQ4/I0kF5RA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kxDNctCDIHKiq9FyLiTP6yQCEf0aQeHTGeZlv9KFLLMfw9IT8srMcKpebr8FAH5o6
	 z9CGm/LPMG/xAdjBL4O06RbUOsZUJMz15ImMPn+NnNi/tLxueIlg+pywIGOlvTIBEv
	 2Gyd0916wzCgI/Db78HQGxNPFtjsyyaUGDERWIi9tKX72ToklvSVeYXyPqFd4pgJrj
	 zd6bjuRl/m/5MnOGdDTILRtd/qpegwbiM6Xy3jVc+xpMKkdoa6hutzSZ5XLrBdjIHw
	 xzyG7MZCAfCcyBSuBK8ji3SOoWIUDIObuom6JW7kFyrKXobZK/ZwAXojFF+B9Ri0lW
	 yRIRCaEfXjt+g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 815AD37804C8;
	Mon, 17 Jun 2024 11:21:38 +0000 (UTC)
Message-ID: <88c6c2df-44fd-4f87-9d71-1d6a29aa4754@collabora.com>
Date: Mon, 17 Jun 2024 13:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] drm/mediatek: Fix XRGB setting error in OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-9-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-9-7e8f9cf785d8@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_042141_472132_22D92F0D 
X-CRM114-Status: UNSURE (   5.25  )
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

Il 16/06/24 10:29, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> CONST_BLD must be enabled for XRGB formats although the alpha channel
> can be ignored, or OVL will still read the value from memory.
> This error only affects CRC generation.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


