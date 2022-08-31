Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE1CECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 03:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZlIvUYoUOUIVtQR817mktZPUPe5qU/Ka/DPqDje8IM=; b=bjAGRPeXDdLpSzo/i6J7DtT/l3
	PXZOzYFoY6X4LCs3YfnLOkLZYWFx7/+35rYPHLyADYPiiUyNhcXvMImtR4zBDchARWRcdw0Kaewjx
	K1DGohFaejMTZkfb67RKK05C0MMD6g0DxnCCk77VX7WytPPkEJxZaXnIiUi9+retMmowsSj4ggaf8
	hVT+Ye2o/0EQdyq+te57JCI0tMyPFggpzDBmwRhjg/qM1ZUAw8LPfzS0049HKIFOQQzfZX9QgIPjd
	4zisUnpAjKYHMJI/kGY5OlIWdg2Av+bC7xqEWPnYvA9ivvqVihPNOas6xKeMzf9WH/l0TOzcsixkj
	NhbCAfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTE21-003NUA-F1; Wed, 31 Aug 2022 03:04:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTE1o-003NQi-UN; Wed, 31 Aug 2022 03:04:35 +0000
X-UUID: eb128cadb7934461a8cb713c7d1de42a-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=uZlIvUYoUOUIVtQR817mktZPUPe5qU/Ka/DPqDje8IM=;
	b=L2vrZnZHemiioyZWmWct44W+Rkj9vnXPYgMhUQusIDeRunTyehka4NJyvrqAcW6o+Mygk9ZHWRcv8LWE+Cxa8BJAngZYO9SXyFIYazML5QhqVcvnHwhX8uJkennig44DiRpb9Wtexs3rJcabqblXQD8st1aZZaO+yfuE8uknal8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:72b64b82-e658-4ed2-96c6-60783840010a,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:165a9f20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eb128cadb7934461a8cb713c7d1de42a-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 556882288; Tue, 30 Aug 2022 19:59:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 10:29:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:29:18 +0800
Message-ID: <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 31 Aug 2022 10:29:18 +0800
In-Reply-To: <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
	 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
	 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
	 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_200432_993760_C2543640 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
> > Il 30/08/22 08:39, zheng-yan.chen ha scritto:
> > > Modify gamma compatible for mt8195.
> > > 
> > > Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
> > > vdosys0")
> > > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> Please also perform review on the commit msg and backport status.
> 
> Best regards,
> Krzysztof
Hello Krzysztof, 
Thanks for the review,
I will fix it at the next version.

Best Regards,
Zheng-Yan Chen.


