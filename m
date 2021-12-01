Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FlhaBKn+fVD21RNrLhV/8Bcaqdn/PYL/ITKvWGdRDo=; b=3LwMs8jUlTmXQtx3Iw1yS2QtVE
	Hjjpzxau7FHl8i199C4O4DV5CJMEpwaHDy/6iccy8RoqjWbUNk/eP8ojknxZv/LzCwUuP8Y7gPsli
	+kOPVepdLDmQcDs40zeY0TRskvZsN18y78MuA9OcNDXHPu1zCNq+MXogloOOv6UqCrzJhZQQNwacH
	3o5FYdZG8qDPfsyGofY4fO/WMdgCs0dgMHKPk5Qq8uqjORyQe17h0tnzPbvnsvfqbvaatyTk3OrWT
	zcqnX9y6pttsh4JUaFY61Iyqml/+JvQlUoufNAUJ8l+lQCSsjZ9tuAZA4sea9Mi5gaOkVtSk0x+Fb
	ymkhqWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOTv-008MxO-2J; Wed, 01 Dec 2021 12:13:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOQ3-008LH0-3X; Wed, 01 Dec 2021 12:09:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 42FF61F458EC
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360541; bh=Pph0h28u90fWIpAEnT37cWqdNQe0Gk7uaTOWOIg4P9Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vp1a4AnNC/hCYZImxafQPXGE6lBaxAJp+NpFtPmFYARGG2tdk+b0/U3v/ustS4H9i
 FOI0ql6mGk9KG0SaguWGmT6UhxEwnGwSmL+2qwZIywym1GVTRPNz24PHdlOSoHySWu
 XsicMKGJWClwyRyX+Ja3p0V4w8pMICqADb/r1CZjrz+F/x4pshyu2+wWx2XYRrF09G
 7Nf4XpjfXAvLfyiql6V/l9x0v1pAatAEAB4JqRfbQd43e4j7sJQH/yjOVeLixF+vSv
 gTGDoYq6xP8fjVjYw4geuQp2PQzBvMkVn7LvTmLJSkHme3Cf1NG2FTPqQ1z6gxCZp3
 FG0bomir76f/g==
Subject: Re: [PATCH v11, 19/19] media: mtk-vcodec: Remove
 mtk_vcodec_release_enc_pm
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-20-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5d235ba6-213a-598f-e18f-93b51e535285@collabora.com>
Date: Wed, 1 Dec 2021 13:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-20-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_040903_326084_E0097949 
X-CRM114-Status: GOOD (  13.28  )
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

Il 29/11/21 04:42, Yunfei Dong ha scritto:
> There are only two lines in mtk_vcodec_release_enc_pm, using
> pm_runtime_disable and put_device instead directly.
> 
> Move pm_runtime_enable outside mtk_vcodec_release_enc_pm to symmetry with
> pm_runtime_disable, after that, rename mtk_vcodec_init_enc_pm to *_clk since
> it only has clock operations now.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Co-developed-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 9 ++++++---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 9 +--------
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h  | 3 +--
>   3 files changed, 8 insertions(+), 13 deletions(-)
> 





Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
