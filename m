Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFLI+kxFZcV15FyOO9z+/hZc6SWVYprIcCMgKItGAWE=; b=F4zo8oxS+c49sG
	xBIRVAJYuVyNfwHBU/MuX17OW6j6ya0PbOhK7MfNXiQTUuHezvzLRqJbGcBrkvp2/Y7YrsZcc2Xfo
	HWQ5D0lwMbTbZWiLrMgFMhyEl8qCpYb9vh1GCrZG1cAogxadiXU3ZMWPdoxbfzLRc3LUGEWwgtB7m
	MNwMRhQgJ6CaNB4tcpYiTNOr1L8mwPTAT4dwVwAfz4BL0IqqIx133xiQjWrrap1NDcPqjfM78UrL/
	RSObf25pK0/pbuuh8TfrQ9n6yWwmTdgpLzlnmleeiPbEt4B8WQ+VsD+idlmoUokdObK3fCrHZeGo1
	js47lV+CSmdk+PU3JhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGSf-00CW3j-V6; Thu, 10 Mar 2022 10:56:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPm-00CUJD-9W; Thu, 10 Mar 2022 10:53:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B624E1F454C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909581;
 bh=NzjD8M8Z7FALTKD4/SpsqIKFZb2xgKUIypduj+2Faho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mw8rhciUK0bnm0l8ajtjvgVsdanDHIGyhtsghP3gQXxXfM/WHT5/UgQX0XodPxX2T
 IrCsFBBlRhpf7veSTGNQZtUPN8Foc4Z7KUDCHCNFavxJn3Sv9Qz/cCbFLoMBXgzNjG
 6S3lb4OVkrLMrG8v9BfpY1xo+M34eGo626FeZbdx1GcaTogxafd/kejxSXbw6MzQbP
 8eWDB7q6RWs3VtO/d0MyyLj/vHlBqBGAMfrs8rWx6q7BssmS3iEURJkyjJerVZy3Kf
 MwLrPqxTKrQD2+c0vkb8cttYnmJGs9sPnj8RUL0DtMnBHWsItyvLBN4GLxm4uhC7CE
 rf4ogISZIlFGg==
Message-ID: <91129692-6706-ccac-6614-55f71cc30ce0@collabora.com>
Date: Thu, 10 Mar 2022 11:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 16/22] drm/mediatek: add mediatek-drm plane color
 encoding info
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-17-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-17-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025302_528596_C0555BAD 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add plane color encoding information for color space conversion.
> It's a preparation for adding support for mt8195 ovl_adaptor mdp_rdma
> csc control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h | 1 +
>   2 files changed, 2 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
