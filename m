Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7094BECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjRt+wNHF3dVVkvBVf/EVLn116VkNseKdsavsd/XDvo=; b=2IXtubDW+L+LN8ydhzDHS/hP8Y
	bEW5QjclUM5M2zCLMo0NwcV1z+k4hzqfNVsxM0yhTGVeEScS2lvSW7kWxhFoh7Ts5hQj3GwctGDLU
	Oa4a4oShckaDQ9O51FVTLRGKkiCbEZwq1l3o0ntzeDaNv550zTifj1sziKAa0DZxz6rN6rBycm99u
	nG+EMa0MIa5d/EAhuanLXXA7qzFe+dYHgSweQusma91VaAYKOpvddM1Gw3naJTqE/fSslmWs2nhkO
	+Ct7t7zC3gZio4ECKmGDfFiXEwVu0RmyFxAIXXRBW4BjwdGHDqxg6xRdO5FRXcG9EduumUlVeHfmd
	CeSnbjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4uP-00CLsd-ON; Wed, 07 Sep 2022 23:56:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4uK-00CLjp-Rp; Wed, 07 Sep 2022 23:56:38 +0000
X-UUID: 722c326ba6974323857b7d69f0ff4089-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mjRt+wNHF3dVVkvBVf/EVLn116VkNseKdsavsd/XDvo=;
	b=UCl8LSAIrfkawgXjQM3XozxlxxMn9tnoO8R/3MrbN3CxYv897LvpwzJp4LJvMQ7GAKMDUWRJDqPbSd4riTIx1l6qXi4uukCIA7gDGoiTR6+BozKdlv2qdplmz+i17kA3QrK2DbQmYXkWN8IUx2fykhAh5vxMbNmNywaYGU6k65k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:22e61152-b82c-413d-a8e7-4097644fe35d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:21c80ed1-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 722c326ba6974323857b7d69f0ff4089-20220907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 81012324; Wed, 07 Sep 2022 16:56:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 07:05:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Sep 2022 07:05:55 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<drinkcat@chromium.org>, <jose.exposito89@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <mturquette@baylibre.com>,
	<nfraprado@collabora.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<sboyd@kernel.org>, <weiyi.lu@mediatek.com>, <wenst@chromium.org>
Subject: Re: [PATCH 07/10] clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
Date: Thu, 8 Sep 2022 07:05:55 +0800
Message-ID: <20220907230555.10691-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220905100416.42421-8-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_165636_932761_FF328DB4 
X-CRM114-Status: UNSURE (   7.44  )
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

> Following the changes done to MT8183, register a similar notifier
> for MT8195 as well, allowing safe clockrate updates for the MFGPLL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 


