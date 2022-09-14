Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D5DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 02:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta+YHsk3ffo3PkrDC8wmZCz3T2bZWUiw2Eo5f/KC6Rk=; b=GoQ/YblrWCfyiRsRStueIH+0eQ
	I6Av8oS9vB+Nzymr3FODpLDTpQJDe+WwcyMr7SX4thnioRYFS1iapWaXvWMSS2KL6xZoWDegFioSo
	Pru9LFcY4Qu4DuTa8zEGtw3XpvA6E8ahevltKXKgMpdlcoAzICJTFUGvZzwdAPccvSMkoespq8JCo
	GK+05Td1y96fL/DKpq4ZfNLqHbTWDtL/ebmK5vLiZ4HP4YSwC4w20sARcUbMYuEPUC9bCsEvU6A4O
	rwb8RCxek/1gr8su+/3+bKO6+kfh7b+9QM35WkXuexfJD48Tc8eETKS6M3zh/33xFjmk2+jpn4eLc
	8UYRz1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIIe-004jna-94; Wed, 14 Sep 2022 02:38:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIIP-004jc9-6t; Wed, 14 Sep 2022 02:38:39 +0000
X-UUID: 73008c83fc564acd904a835d8e8eef3b-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ta+YHsk3ffo3PkrDC8wmZCz3T2bZWUiw2Eo5f/KC6Rk=;
	b=rOUX9ka/OmRa5dm9/uule4yd8To8RwUzi2xOQWBETGObcfNdZMlQlTReoJs7ohgLEb/pWGh6KXL17VJj4Ptn1Yw/K/QpZeIj/5t8zy7gLxKT+QuoDh+uusdZbut4Iqks2RkoCZ51+c8Zpi8sbOIQ4fZPmVxwURm+lZ81a/+eUEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fc784e8b-fe70-48f3-9c37-6ac680b1a0d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:94e48e5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 73008c83fc564acd904a835d8e8eef3b-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 560907762; Tue, 13 Sep 2022 19:38:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:37:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:37:55 +0800
Message-ID: <b8089e55cf4a44c30936be7a56f286e2f278a40c.camel@mediatek.com>
Subject: Re: [PATCH v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to set
 gamma
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:37:55 +0800
In-Reply-To: <ed7ca57f-81c8-514d-2c64-26a4aa8e75d2@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
	 <20220911153734.24243-9-jason-jh.lin@mediatek.com>
	 <ed7ca57f-81c8-514d-2c64-26a4aa8e75d2@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_193837_962047_DDB0933D 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Angelo

Thanks for the reviews.

On Mon, 2022-09-12 at 12:26 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > Since the bootlaoder may set the RELAY_MODE to gamma be for the
> > kerenl,
> > we have to clear the RELAY_MODE bit to make sure that the gamma is
> > enabled correctly.
> > 
> > Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma
> > module")
> 
> This Fixes tag is invalid. Please fix.
> 
> Regards,
> Angelo
> 
OK, I,ll fix it.

Regards,
Jason-JH.Lin
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


