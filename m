Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F09C04A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7zNk55ctYek/Lc3Rk/kqJN4XtzyQcphEfTsz8DV0W4=; b=1TaXWiRhYpNb+8pnyLcTv4Ozp1
	wx/usInV2jWG7138nYG/dgmPNtnhQoS4syqLQvnd3dMOmcj26B/x4OrGDjshmcoIfxVS+/Qj27stg
	RpreXqlZWj0WUlUb7q3Rg6SB5bxWMyvbHF/3x6SAdwjSw6GdWrZ4Avsscv1ZdtwF5MqyckhgFeJDI
	8rUB55s7t0XcliMZlkhB4orQigSwOxxzttp3U8bWqRb+y6JxUrK3iyAectrVYe4G3OcTdiPOxa+uQ
	YRN2HtWk9S8sjMPS32qKnZwMgI6uXXT3i7tLXxg9kochFEe1nU41Cliq9TOzYN4P5rQC9Y4gncUF4
	763jDQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceYS-001IRN-PC; Mon, 26 Sep 2022 03:13:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceYE-001IM8-Qy; Mon, 26 Sep 2022 03:13:00 +0000
X-UUID: 7fe70bc278f54a93b40c331d1dd0b27c-20220925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=J7zNk55ctYek/Lc3Rk/kqJN4XtzyQcphEfTsz8DV0W4=;
	b=TDwFywZGWOl6uialaC7BiDdjQ8oSKPgc9fps4OOV/Cx7MGuJrN1hJUoa992AXpsYAfO/2HvjYRhsboiXCaioUCSg1sWg0PlKXlwKLoG7yKrP6SoV7ZgjANFa+j4zR8ICIrOcxpsPvvP4Mlx8Fwab0YfucsRpft1o4vnVbeVI3Jo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8749b842-1920-4158-9774-a735cf552151,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:625f07a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7fe70bc278f54a93b40c331d1dd0b27c-20220925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 105032906; Sun, 25 Sep 2022 20:12:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 10:52:05 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 10:52:04 +0800
Message-ID: <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 26 Sep 2022 10:52:04 +0800
In-Reply-To: <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
	 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_201258_899106_34744898 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > From: liangxu xu <liangxu.xu@mediatek.com>
> > 
> > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > 
> > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > ---
> 
> Where is the DTS? Where are driver changes?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof:

If you want to see the synchronous changes of dts and binding files,
then I will attach this binding file changes when sending dts later.

The driver change of mt8188 reuses that of mt8195. The driver link is
as follows:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040

Best Regards,
LiangXu


