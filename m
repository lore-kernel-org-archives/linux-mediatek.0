Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EE4CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alpUmaCmdlDoaCHUeaC8UcakneumIRpiVZcKZs/FcMo=; b=qFV1ti2vVJIeeW/nsX8Rzz8HXW
	zBR1JAs4VNU+BdjNqE6aDRxE2uVvaw1UjEQwf+Lfs6yGutkp1lTk9NLwDT6mEop4bJtjJ7Dxjhj0R
	kXQnTDA8IO4Pzw0QK1qMlzuYImrkEGSyHLFw/AJJB7TtEPV6Q6afKpLbX8VEKPO87hYZegRy+Uucb
	BpWLwpIEj3q0shsEW/qU0RKLaLg4M29bJdjQrjigPmamYoIx+w+48Hde8e52GPUiVjftL7LB7hO+I
	+dIZ1gzIDWuoJS89Z/8OOkIfWp3/klj5U1pmU3GFVgo/JjSy7uWab8dd0d4gr1GWPlD8elD7y5UcG
	XWNpKJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlA1-00000007xmP-1xFH;
	Thu, 26 Sep 2024 09:51:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl1R-00000007vZx-1Hdp;
	Thu, 26 Sep 2024 09:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727343771;
	bh=VRydMshYTcpp89zwvgwY5jyig5NMTUMTx57WtTy7YHY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YiSTg62kMzECHoXWZCj628zq47jQgcqJs9vcJnYXQ6S8GTuRu0MlvBicXD6jKohaC
	 EtP+4NYFwKGTQXiPGYeaAQH3XW4TpRdouBMhdzrlct1AVkgwAXSXiyyPoopM8SWKnC
	 MukYsrPKIHdmiiRSPvjmtsDWwTw3PUqsbFowxKCft/pFX9xMg8bJS/8pf6qyA4ltIq
	 3O9w+qOT3BesCIpOfbmNmhbV2yZ/0yUljpxTE7w3CHQrj3eGWPbUCM4cqUvGhtHOSJ
	 UNBDfZlG7ea9EcLk+olkbtSGJ1++AGR41is/A0mkXqmfvweTNJqyKxn8Wx/AHH0NDl
	 x2B21tKXnTQzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67ADA17E10AF;
	Thu, 26 Sep 2024 11:42:51 +0200 (CEST)
Message-ID: <e44cafc1-b350-4058-976e-13d6fe4fd4b2@collabora.com>
Date: Thu, 26 Sep 2024 11:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240926083526.24629-1-jason-jh.lin@mediatek.com>
 <20240926083526.24629-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_024253_541676_8F69D3BF 
X-CRM114-Status: UNSURE (   7.90  )
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

Il 26/09/24 10:35, Jason-JH.Lin ha scritto:
> Since some SoCs support premultiplied pixel formats but some do not,
> the blend_modes parameter is added to mtk_plane_init(), which is
> obtained from the mtk_ddp_comp_get_blend_modes function implemented
> in different blending supported components.
> 
> The blending supported components can use driver data to set the
> blend mode capabilities for different SoCs.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



