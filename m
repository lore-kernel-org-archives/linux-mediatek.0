Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F69C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM1qgq1MV7finP/aae8s5yQZ0OBqyz3rZqiMvkPhvrk=; b=zg7HnlQ6wIaNpdjDiUpW/RQWJW
	0A6+VhJLghpL81/61Ry1h0NtEWzaPD5DvsI7eHRul5AYJBmijLz2rKj3MuTCDbUqi+PdWi1F/5nA3
	OsAVw9abBHHNfP+aAQbLWm4qLX9qQiaOqHWP/Vk8fkh3fYynwk9SSOmYm+M8DIoYG8B1YOKhLDOzf
	t00Ms+tmxkhhK9XCVXoZ5pcld8v9FghGNVFj5SBntIMaKL2K2XEG3wHEXRkaG/Npn//PVD2osIuIq
	Z4fxSXuwbokTFLb8dgiRu+Gw2hRI+JcuarTDWsUhG5cuumriroJ5SggtQ+VKCWCUBDQwW1V0Ujihw
	QQDlrb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1AU-001KDJ-Ls; Fri, 02 Sep 2022 07:32:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1AR-001K5Y-LY; Fri, 02 Sep 2022 07:32:44 +0000
X-UUID: d0e07dee85994d5881a6ad8bd4611332-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qM1qgq1MV7finP/aae8s5yQZ0OBqyz3rZqiMvkPhvrk=;
	b=G4r3C5h5cHvAVDcRRHHgoPLBhlLRM0Vb4tnJrd/KpEQwrnDgIiM/5pzW4RcEgdoVbJkT3ez4P0ZcOB1hjX2oWRZwlO7/ExPeWm61Y+LPFtIefh41VHAXhpbR7+pWlaAIv0U7NP7YhRZpMaI9OJfwSgs7cRi72eukcsdlrujD/ro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ac1abde1-7f9e-47e7-837b-70df5149c052,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:5bf7ec20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d0e07dee85994d5881a6ad8bd4611332-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225137003; Fri, 02 Sep 2022 00:32:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 2 Sep 2022 15:32:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 15:32:14 +0800
Message-ID: <8ae888c3f478112bca0ae40543de878f829f2470.camel@mediatek.com>
Subject: Re: [PATCH v17 05/10] drm/mediatek: dp: Add multiple smc commands
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 2 Sep 2022 15:32:14 +0800
In-Reply-To: <20220901044149.16782-6-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
	 <20220901044149.16782-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_003243_727777_4822213F 
X-CRM114-Status: GOOD (  17.47  )
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

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> The smc commands of eDP and DP are different. We add smc_cmd to the
> device data to define them.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2696c1ac1a47..971bd744cdb2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -112,6 +112,7 @@ struct mtk_dp {
>  
>  struct mtk_dp_data {
>  	int bridge_type;
> +	unsigned int smc_cmd;
>  };
>  static const struct mtk_dp_efuse_fmt
> mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
>  	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
> @@ -945,11 +946,11 @@ static void mtk_dp_video_mute(struct mtk_dp
> *mtk_dp, bool enable)
>  			   VIDEO_MUTE_SW_DP_ENC0_P0);
>  
>  	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
> -		      MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable,
> +		      mtk_dp->data->smc_cmd, enable,
>  		      0, 0, 0, 0, 0, &res);
>  
>  	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-
> 0x%lx\n",
> -		MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable, res.a0,
> res.a1);
> +		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
>  }
>  
>  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> @@ -1981,6 +1982,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops,
> mtk_dp_suspend, mtk_dp_resume);
>  
>  static const struct mtk_dp_data mt8195_edp_data = {
>  	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
>  };
>  
>  static const struct of_device_id mtk_dp_of_match[] = {


