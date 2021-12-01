Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D206C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+4QWgJNo9jO/wBL3Q3Sx/Ul0zraQfg/6pN6Asgodeg=; b=h9NbZGUWyEKIBgaG/VBZJAylwk
	rJFYRGsUKEj87Runas08dkcJTzV9kmNvv+HySG/Zo3K05sX6Aja45QO/AQkk5mVqmEe6LDCfQyH4w
	X1JoHzrKS66Ge2Y1A19zVbzubFjRyrfW5loFE2rtkcDxDYic0rZ2+mEiRA5f8B/gFsBBNmCSzoO9q
	VUrEehxIcSaecF6Aj98mJKe8RzUecSLlUeDK+4PPMsoZ0W8T0JZ1MID2gIphP7KEJ59nQtpMgPPCF
	7+mEK8zOhurn53ldpEevrFKimBM0cK9fQVrwuPG/J8QH7AGD+lAmW3u5JklIi763perJjRHvRIgzC
	gEOoy43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOSe-008MQF-Ep; Wed, 01 Dec 2021 12:11:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOQ1-008LGf-Tz; Wed, 01 Dec 2021 12:09:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 20F951F458EB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360540; bh=e6GNEu+wR3rqkC7g+n4jt6R8FC/jvcD5LlLpfyUKevg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VqJz1bIHMb5HoP/P4opc9HPfG7iK1rCTWApS2B5acoRWT9mCRCnuain9t0YnHzexF
 qHJ88mE/PiqXBmKXm8hg33riacLDMzs/mMWiRGGv2sykNbRqgM9gKVwfrcbZM/zjM4
 136OPMrVKAuwcAuPwHQOhhZibY9RPLJcJBXFJKg7ERYxEENSwqABTZfhZ7osoRqTPF
 TWLslssNBDT1VxQ4EgB4ZsBfy82/WYlSGSP0moa7h0TPoanLREVUtUU4ZaWoyORsgx
 BChCZ3DN3kCERAiucn2aPhflUQbasMzW4Q8HHtqI2umDDv1cCfjCRlPwycaWsVSHcO
 G8URgRKgQUGng==
Subject: Re: [PATCH v11, 18/19] media: mtk-vcodec: Remove
 mtk_vcodec_release_dec_pm
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
 <20211129034201.5767-19-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <540a5ac7-80a2-a72c-87fe-5042f21f8deb@collabora.com>
Date: Wed, 1 Dec 2021 13:08:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-19-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_040902_189754_0051742D 
X-CRM114-Status: GOOD (  13.30  )
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
> There are only two lines in mtk_vcodec_release_dec_pm, using
> pm_runtime_disable and put_device instead directly.
> 
> Move pm_runtime_enable outside mtk_vcodec_init_dec_pm to symmetry with
> pm_runtime_disable, after that, rename mtk_vcodec_init_dec_pm to *_clk since
> it only has clock operations now.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Co-developed-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c   | 10 +++++++---
>   .../media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c    |  7 +++++--
>   .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 12 ++----------
>   .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h    |  3 +--
>   4 files changed, 15 insertions(+), 17 deletions(-)
> 





Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
