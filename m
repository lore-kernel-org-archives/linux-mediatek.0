Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqZtaUWa/EN2t9EmoOhxLKLXquYghJCd1bjDA8nxqSA=; b=YeAfc8iWAkhDUx
	dL4yx0mBvi4J7ksh7KAVQDBgL42D/0xZ7tK7fS9YiGn9Ip3Tvuh27lceWVnhAuE8wK6q3K8Row7UT
	KFgBnY94fDOy4Y+QPA04GMfOP+QvpE3WpJHO/yfyeJjpTxz25h4+1jI2MXwGHJVAeaCjxc+ID9gGU
	BzrFVD/p4F3RWMSIPloo4qqLOnyLJr1pBSsQx0gOPPdwZn5m9tmiMK84UMtdN4Gxj+D0D5rrHPkET
	W4lUTyRpn5WAMfBoztbuAioJ46jh6pAU3Fy16Ioz6JwbgqEbJB9C9Gbx75NlJW+9gPOukBDhD3BoW
	6VIXJ16OcCMea5G9FYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTeEH-003xgM-4L; Mon, 14 Mar 2022 06:30:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTeE4-003xcZ-EF; Mon, 14 Mar 2022 06:30:42 +0000
X-UUID: 440fbcde93864ae38a1ec86b549990ac-20220313
X-UUID: 440fbcde93864ae38a1ec86b549990ac-20220313
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1411379549; Sun, 13 Mar 2022 23:30:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 23:30:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 14:30:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 14:30:28 +0800
Message-ID: <bf6c9d9270f54fe7baff62998498c1a75a69f723.camel@mediatek.com>
Subject: Re: [RESEND V6 0/5] add display support for MediaTek SoC MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Mar 2022 14:30:28 +0800
In-Reply-To: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_233040_514179_73F02553 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Chun-Kuang,

Do I need to rebase this series to your branch mediatek-drm-fixes and
send next version?

BRs,
Rex

On Thu, 2022-03-03 at 14:57 +0800, Rex-BC Chen wrote:
> v6:
> 1. Remove mmsys patches which are accepted.
> 2. Fix error of dt-binding.
> 
> v5:
> 1. Add binding patch of aal for MT8183.
> 2. Revise enum to const.
> 3. Change to use enum for mutex.
> 4. Remove patches which are accepted by maintainers. (mmsys and
> mutex)
> 
> v4:
> 1. Remove binding of dsi and dpi.
> 2. Revise aal binding.
> 3. Fix indention in [4/5].
> 
> v3:
> 1. Modify display binding based on mtk display binding patch. ([1])
> 2. Remove patch: drm/mediatek: separate postmask component from
> mtk_disp_drv.c
> 3. Remove compatible of 8186 ovl because we can re-use compatible of
> 8192 for 8186.
> 4. Fix issue of space before tab on mutex patch.
> 
> [1]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd
> 
> v2:
> 1. Add binding documentation for mmsys, mutex and mtk_display.
> 2. Remove duplicated definition of postmask registers on mtk_drm_drv.
> 3. Add disp_ovl support for MT8186.
> 4. Add detailed commit messages.
> 
> Rex-BC Chen (4):
>   dt-bindings: display: mediatek: add aal binding for MT8183
>   dt-bindings: display: mediatek: revise enum to const
>   dt-bindings: display: mediatek: change to use enum for mutex
>   dt-bindings: display: mediatek: add MT8186 SoC binding
> 
> Yongqiang Niu (1):
>   drm/mediatek: add display support for MT8186
> 
>  .../display/mediatek/mediatek,aal.yaml        |  7 +++-
>  .../display/mediatek/mediatek,ccorr.yaml      |  5 ++-
>  .../display/mediatek/mediatek,color.yaml      |  7 ++--
>  .../display/mediatek/mediatek,dither.yaml     |  4 +--
>  .../display/mediatek/mediatek,gamma.yaml      |  4 +--
>  .../display/mediatek/mediatek,mutex.yaml      | 25 ++++++--------
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  4 +++
>  .../display/mediatek/mediatek,ovl.yaml        |  8 +++--
>  .../display/mediatek/mediatek,postmask.yaml   |  4 +++
>  .../display/mediatek/mediatek,rdma.yaml       |  7 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 33
> +++++++++++++++++++
>  11 files changed, 76 insertions(+), 32 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
