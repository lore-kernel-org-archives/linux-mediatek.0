Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89720C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3ob91j0lcfL1pesad51FJ49fh3D74MrunjhMGGr0/Q=; b=bCPa/jT5sGTCr2
	wGlZviBfn9d7VR4ynKQIUqBu8+MItyolK2fpWAioOJxcthQMR9+9RaE/yl1+jDKjVpXNOLQntpyWz
	ofUTfT/SiSyq0k6lBB24l2F80CQKtV+rhEIrV3S8EQJW39UQ4R98yORnmdLO1DOHjA4y5VOVhUv8b
	fO3/VVifyQ0kl15rrgaJLCtAd2pNf2QML42FSIeMpqI9dIDdHgSeZym3XnphaagykgRmC5uERAUy/
	TFT92zweifI6hG5tzcsT6ngwPJAjDvtnglTU63WUV+tbFtA8IYHkydWQw0cH+roMCddRHsRMwuREA
	p6SQDDUMhy+N36NcTIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrUt-005ifG-ML; Tue, 03 May 2022 12:19:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrUh-005iXK-Cp; Tue, 03 May 2022 12:19:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 60A651F440F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580343;
 bh=sxf/W13yVe4Kgm26SjBv1lwhUCOHzwyJNbXYMsV7XMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P6/X0iY5iC51JE7taRgE4+AbKeMuJ8OpyI9cqNDdPWin6ehVRQXCsTX3go4fjRe48
 lmR8lrhFZObtGmsZYr6EeHfI46pnCYUeRSUo/kRVq5XTN3bJ7Hl7F73awPXAEwqWrN
 0s9DLOO8brYtCSa50Yo7USlJbwbVeHNDuko5QEXfPtT4k9Ws9PE/j4mkusFOFQ3PXU
 d2kdEVOz8OFcdLtWbaG2M/G0OnKQu63b/qEGMWlyA2TJQRVtOf62MejgKZjlzPuuQV
 wVqTezvGRofz9dvSHzsMg71Ox+wIf1/9e+ZepXrB7JmmNg/8ffvCcX2S8WSYpPzHpv
 fTvB2ZsO73+Vw==
Message-ID: <dcacd46f-368a-e955-a635-0bbb31176c31@collabora.com>
Date: Tue, 3 May 2022 14:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 11/25] soc: mediatek: add mtk-mutex component -
 dp_intf1
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
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-12-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-12-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_051907_703900_37CBDFE7 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add mtk-mutex DDP_COMPONENT_DP_INTF1 component. The MT8195 vdosys1 path
> component contains ovl_adaptor, merge5, and dp_intf1. It is a preparation
> for adding support for MT8195 vdosys1 path component.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
