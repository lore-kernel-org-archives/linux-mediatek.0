Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D82BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 05:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWEebljfdFOyYEhD6BpamOQWMZl/LoHI045PBrJCSRc=; b=xRUgKZuX+q9uBtPfyJZ1kUhwgt
	O53gqgiXOecBWIi15260Jz1MFiRQsWYGYnpuSlhEVVPG8HwohYNopI264x6oc8SBfSgfjAHTsARpw
	gyZ2uShBFsobYcTIsAbS81D/agCMJLOoqFd62TK7FhRG3XCrrQjlHaajqD8Z9pTaR9qIbLNSwpTwl
	19GdRD1EwlzYUb6lCzLnq9V7QEj4priByKP0WTBGvVdyREUyVb1gGafhsYvXwdyrfXTP4t5Y0jXUo
	mN+Wk19wQeAfkAXskrXwaLQgi4uODjQ6s3n3FzzqSpYsNUYmUXVQLNh7qCkY2MYbIyHIAlFAlfTAm
	PkrICr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8N9-006Bxw-Kc; Fri, 30 Dec 2022 05:56:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8N8-006Bw4-Hn; Fri, 30 Dec 2022 05:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LWEebljfdFOyYEhD6BpamOQWMZl/LoHI045PBrJCSRc=; b=pD0FC8zAgG8b5OrHUoiaPfdOhk
	dXriRV7z+X8XYUhg9Qlw00lDHDNspviix0TICmifFBrMdzou/YP49osiBm7sxmvaExWPcomSP7qml
	YdJNxfG1S2iwiAEY+Q4I/aJu82yvPNau6b76QQZORahnuh1ftYc6XgfiPFq+1/U0gBoJeXU0XEqs+
	jO5IVWn8aRWwJzow/OmbHm45e0jff2T5mJNfT8UU8KDjrXQL+HSXha5px4+fOlaqbWFSqJYD4FUiq
	R6462FAbKzANiS6QJZhZZwAe3yu3NfjMlj9hRiwx1Y4X4ksigiQzx8ttxQZLpa6TVhovT7WC9IMfA
	YnIZrciA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pB8Ms-00GjLC-1w;
	Fri, 30 Dec 2022 05:55:52 +0000
X-UUID: 150ec371ca0f431d8ac5b7570a317324-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LWEebljfdFOyYEhD6BpamOQWMZl/LoHI045PBrJCSRc=;
	b=tLXIQAEU0rhllbC035fO/X12zj8d+cF1D4J9edI+trMvaHr6HO35XKbt+J915Wpgp3EYJZm7uWhr81rQh+0MidNlk5HTbHVqhrKgPsSIk2WDvdsee8rXlYyiBj1f91jX7MfUwhyiJ2A4WlpWEx5YbuBJOASW57XVLS2v9IyqfbY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:8cceb860-3298-46c0-abae-1fb14eaa32f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.16,REQID:8cceb860-3298-46c0-abae-1fb14eaa32f6,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:09771b1,CLOUDID:1237d18a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:22123013552182WNUJH3,BulkQuantity:1,Recheck:0,SF:28|17|19|48|102,TC:
	nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: 150ec371ca0f431d8ac5b7570a317324-20221229
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 455083683; Thu, 29 Dec 2022 22:55:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 13:55:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 13:55:18 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <daniel@makrotopia.org>,
	<devicetree@vger.kernel.org>, <fparent@baylibre.com>, <ikjn@chromium.org>,
	<johnson.wang@mediatek.com>, <jose.exposito89@gmail.com>,
	<kernel@collabora.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<ryder.lee@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
	<weiyi.lu@mediatek.com>, <wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<yangyingliang@huawei.com>
Subject: Re: [PATCH v2 20/23] clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
Date: Fri, 30 Dec 2022 13:55:18 +0800
Message-ID: <20221230055518.16113-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_055549_602529_44C3E2DD 
X-CRM114-Status: UNSURE (   6.33  )
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

> As done with MT8192, migrate MT8186 topckgen away from a custom probe
> function and use mtk_clk_simple_{probe, remove}().
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

