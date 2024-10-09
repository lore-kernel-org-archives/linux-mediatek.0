Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50CACEFC5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV5JYnc3LAToNWWq8oYPub5kYlx2ddPaIMebkJPTN+0=; b=ZQzdV9Bv93Qskf+vfJ8PZgqN+Y
	dEPf0S8Iu0D3kcpOOKz6WZUhIKPgXNrOBdxm4Wugw644/AJrjAqa2AD3TNVhWU9L7LwNw6UWKsSUf
	36dL5a+J5RsS2GhuVs1hPZDEH4VxAiz6DeI9Xis82am/E6S7/x/Qe5GbPtjey9kX9vApbTi+hKgyU
	O15z5ms3MiSR2OQrxhOViwnVcmH4MD7Bo9Nl+b6psQRKn9IPBehHHs88lashM0497ShaP7N7zP96t
	mhJ3iJIRiO0qF6/Y7I5gpl8qyKwqqYNLAeMKEKiVKod+jhCjkqxEvpJH0V0ZAKQB/mOSvOzWUuoRi
	CD/7jLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTbb-00000008oQE-2wth;
	Wed, 09 Oct 2024 10:07:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTVh-00000008nFM-0qw4;
	Wed, 09 Oct 2024 10:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728468095;
	bh=yOp0NvImxbBTVc57uS8Sx//uC+khLg+Tk6wsD0DGbDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MVJ0xQTnYZR94WuYkCWwYcsuy6YLWhhKTXsPzouu5dQ6DYBslc3Jt9mzfRrklehvg
	 XeVVoVcvFZ2PuR+gcstE3Wp0TsHHpQllffj/ERLVmnN+rki++mY7yU1HROcieNHA1W
	 gP+d4CRN/7LmC4hRpwhzjMallThcgz6pwfhhHnJ+dM6rgGfR/US/lYHEnM4EhB6uPA
	 YodryI9xvPRGEwwh+rMVV+rdQzq/hKthbGHj4J8LniHm93Ff8I6d1eg1R4DAjmLW3h
	 DrHbU6vDGbiViAFP6MC8rXkc//fIImKsorDeKxFXyW8CGUVjDrDXd85/7aTaAPcT97
	 KledHZ4R/o5VQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB78E17E1232;
	Wed,  9 Oct 2024 12:01:34 +0200 (CEST)
Message-ID: <59470ed7-621b-43c5-82a0-9384df7c7e9f@collabora.com>
Date: Wed, 9 Oct 2024 12:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
 <20241009034646.13143-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009034646.13143-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_030137_431684_1A35DAE5 
X-CRM114-Status: GOOD (  11.46  )
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

Il 09/10/24 05:46, Jason-JH.Lin ha scritto:
> OVL_CON_AEN is for alpha blending enable.
> For the SoC that is supported the blend_modes, OVL_CON_AEN will always
> enabled to use constant alpha and then use the ignore_pixel_alpha bit
> to do the alpha blending for XRGB8888 format.
> Note that ignore pixel alpha bit is not supported if the SoC is not
> supported the blend_modes.
> So it will break the original setting of XRGB8888 format for the
> blend_modes unsupported SoCs, such as MT8173.
> 
> To fix the downgrade issue, enable alpha blending only when a valid
> blend_mode or has_alpha is set.
> 
> Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



