Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F88BC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Oct 2022 04:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uo5RutZKIWxTF1v3lTWtS5MOGB5BHj7gJCREIvngKpU=; b=4lZ3Pt4yv3YiKTXOoZ41/eRTdX
	RbpVme0BhT3NsA4mGZ34RNlgkX5aIYNOi7iZ2JJXXD16keIoiRq6fB44mtgTVuIpiJXObablP3ibG
	5gCpKuRVX4UUGsIc0KE2cvwTEW5OQsNjs782AATygsythdDNf+gqdO+SppIBJQg0jX9PXKDe5WDvd
	NujPPyopXlJ4Urd53k6RHTYoqJvkZZDeNG7Fn4ykFtOQGoOB6MzLkr+wPAQGeXfUd/poKympuO3Wg
	6yrewhvjn3cWW+8N82fT5y/q8eP81yiXZx+86BHROYKgGAbMnKJgt9sJq/d8ZhD82KJfV+quDCrlQ
	EDBU9aqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojYRQ-00GPCS-9X; Sat, 15 Oct 2022 04:06:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojYRF-00GPBl-N4; Sat, 15 Oct 2022 04:06:19 +0000
X-UUID: 0d3a28db0b714267ba6b593fd929b956-20221014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=uo5RutZKIWxTF1v3lTWtS5MOGB5BHj7gJCREIvngKpU=;
	b=eaYYRbiasLYkqEb2KSu1d3yD+Y4OrDc/MM/xCNk5zMzs3AptIq+Prj3THnXvvSwWn0VO4BJeR1/ha3POeOIy7SSzagUIGG4A1S6CQvPCMxcit16xwLBP9/sSrkF1/hquuDYknvIG4I/Vb40irmPw89ZElO2tKNUiOUujxcTuuRw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:76d4639a-2660-4738-917e-87f66cc680bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b73f25b6-a023-44ff-92b1-76c504f71c7a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0d3a28db0b714267ba6b593fd929b956-20221014
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1677611620; Fri, 14 Oct 2022 21:06:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 15 Oct 2022 11:25:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 15 Oct 2022 11:25:36 +0800
Message-ID: <b07cc3c07f472c0ea746c7c75f3bd4af1cc11cfc.camel@mediatek.com>
Subject: Re: [PATCH v4 3/3] iommu/mediatek: add support for MT8365 SoC
From: Yong Wu <yong.wu@mediatek.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel
	<joro@8bytes.org>, Will Deacon <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-mediatek@lists.infradead.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>, Amjad Ouled-Ameur
	<aouledameur@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Sat, 15 Oct 2022 11:25:36 +0800
In-Reply-To: <20221001-iommu-support-v4-3-f1e13438dfd2@baylibre.com>
References: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
	 <20221001-iommu-support-v4-3-f1e13438dfd2@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_210617_772940_0CF8546E 
X-CRM114-Status: UNSURE (   9.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-10-14 at 10:45 +0200, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add IOMMU support for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>


