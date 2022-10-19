Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3612AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+3N5jdI5Vdo+TGFz2Tt3Kx3wcLZK4tfh0R6kaTzfo4=; b=UMZpexvaBNMywSzgw6HWJ97Ct0
	7OGWi1aN4K94A0EClLD0SdjMunAuXxAH31v7iUNcbxWRAfWmC3jjZlzOnVJDinRbA1hH5D//bkI5q
	LxdruLJ2YP4PW/EKnF10vgbWW4Al9gEK2EVieABJXeEk3TatVghkS1Io2dcKu2q0F6WyPpy/db1wI
	zgsPQR2XZg8ne5Hw8Mg2z4bw9CKuJr4U3JMQK+ZLh1EgHnyoL5qYrptwFcsZ0iSDjKznuyUhiHjtF
	g7hkpz8Id4L+i8QZHp5gAm0EDxuKXmbUh+EAwRVAwQ4hDoZYbMZydJ/Q/0ja2BNQG4W0nPusSyRdf
	qRzcDmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5zg-0004DB-FE; Wed, 19 Oct 2022 10:08:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5zd-0004CS-9Z; Wed, 19 Oct 2022 10:08:10 +0000
X-UUID: 69c29fc60dde4e4e94419d92bebe3883-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=F+3N5jdI5Vdo+TGFz2Tt3Kx3wcLZK4tfh0R6kaTzfo4=;
	b=PjTvdmEHWiqw09J54bOAxr1dmCDvPJISe4/WmVzzTmy5hNfTZ22RP0DMYxSQunnyICJEYduLDEr+nrt+ZSLaCD+Vf+fWvG1hG+tfrEH40/aTzC9dII87b5bK3XosHeM9kzlV7tqv8JoNvMYN5T1ltkY+UGPM/C1AffgYpM0dC4o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ee7b8cdc-5354-4947-a4c1-8ffa8f0f9cb9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:42d74ba4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 69c29fc60dde4e4e94419d92bebe3883-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 23128873; Wed, 19 Oct 2022 03:08:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 18:07:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Oct 2022 18:07:25 +0800
Message-ID: <d264de2367a777e310b0824fb2e04bfb37d46d3d.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Skip unsupported h264 encoder
 profile
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
	<acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 19 Oct 2022 18:07:25 +0800
In-Reply-To: <20220926093501.26466-1-irui.wang@mediatek.com>
References: <20220926093501.26466-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_030809_346496_46F04DD6 
X-CRM114-Status: GOOD (  17.32  )
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

Dear Hans,

Gently ping for this patch, could you help to review this patch?

Thanks
Best Regards

On Mon, 2022-09-26 at 17:35 +0800, Irui Wang wrote:
> The encoder driver support h264 baseline, main, high encoder
> profile, set mask for V4L2_CID_MPEG_VIDEO_H264_PROFILE to skip
> the unsupported profile.
> 
> get supported h264_profile by command: v4l2-ctl -d /dev/videoX -L
> h264_profile 0x00990a6b (menu) : min=0 max=4 default=4 value=4
>         0: Baseline
>         2: Main
>         4: High
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index d810a78dde51..d65800a3b89d 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -1397,7 +1397,10 @@ int mtk_vcodec_enc_ctrls_setup(struct
> mtk_vcodec_ctx *ctx)
>  			0, V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE);
>  	v4l2_ctrl_new_std_menu(handler, ops,
> V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>  			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> -			0, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
> +			~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE)
> |
> +			  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +			  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
> +			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
>  	v4l2_ctrl_new_std_menu(handler, ops,
> V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>  			       h264_max_level,
>  			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);


