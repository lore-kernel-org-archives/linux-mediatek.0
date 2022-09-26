Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4F0C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqWG+Rd5bDpvf8CcN3vOek+fmkXK/Li6MsYuujgzbAE=; b=GL3Ek47aSjXw64WzKxVGgf/WY0
	wE4pxLWpvemClJBDU0vBr6ajvc82+cZwsgjq/C1JLlAMuNlR7Kn5qvBjUHMPUydSUYUYUMULMfiwq
	zYMnRzMjMCYioSBDBWlfU4oaTMBAVaJP8Q+tMQTs8Jqm1MA0usBcLzzDzsRNf+lzah5496ebTM7kx
	CZcb0K+OE1QZZ+8ay9jwCTYsuUbHQjFCVK3mYCLkm/yKmL1swVM869DBLMtpnha/EzOpIEYp3cYNa
	hHKHXOXOuSJ5DUexwmZjQWe9N0SAeNR49cKNhrFddyVy/hzeS6xHV5+WNlpQMA4EpRoojM8K34n6k
	Mk4r+Jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociT1-002ip0-7N; Mon, 26 Sep 2022 07:23:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociSx-002imR-HM; Mon, 26 Sep 2022 07:23:48 +0000
X-UUID: 764f53c757b74528a5bb663713bc90bb-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=IqWG+Rd5bDpvf8CcN3vOek+fmkXK/Li6MsYuujgzbAE=;
	b=HEXQ9B4+4SSU5ndOdu+CPN1+JU7Za8penC6q75Vfg7nBrKZYbig9e98l5uHNX3VdnECEX9Z1m30ddxDBA3/UokQIuUL5jbtbTCX6xmbSOhXyzSa2rsdJ1NV20Yihf7QW+/ddvw2MRAW3sNsN1E+CVo6H0aoTuF9bZynsJRGT9TI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b2cdf164-cf4d-44cf-8374-97005b675d11,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:ec300307-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 764f53c757b74528a5bb663713bc90bb-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1671743909; Mon, 26 Sep 2022 00:23:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 15:23:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Sep 2022 15:23:02 +0800
Message-ID: <63c1962b-26a5-0415-9035-580c2842e67b@mediatek.com>
Date: Mon, 26 Sep 2022 15:23:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: mediatek: venc: Add h264 extended profile support
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
References: <20220915115135.7271-1-allen-kh.cheng@mediatek.com>
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <20220915115135.7271-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_002347_592540_F8E2EE0F 
X-CRM114-Status: GOOD (  11.76  )
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

hello, maintainers

kindly disregard this patch.

The MTK HW encoder does not yet support this. (only sw)

Thanks,
Allen

On 9/15/22 19:51, Allen-KH Cheng wrote:
> Add h264 extended profile support
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Co-developed-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
> index 13c4f860fa69..ac2ef6275d78 100644
> --- a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
> @@ -243,8 +243,7 @@ static unsigned int h264_get_profile(struct venc_h264_inst *inst,
>  		mtk_vcodec_err(inst, "unsupported CONSTRAINED_BASELINE");
>  		return 0;
>  	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
> -		mtk_vcodec_err(inst, "unsupported EXTENDED");
> -		return 0;
> +		return 88;
>  	default:
>  		mtk_vcodec_debug(inst, "unsupported profile %d", profile);
>  		return 100;

