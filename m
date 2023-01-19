Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5914C38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 05:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Yi1/TMdF0ZsngPg/D7r3gCUq5DRgym11bWH2ZX2aA=; b=ig9a8b1bTN//PuFbtttxneS50Y
	PJnCNMvQgql6pvzBQ26XwWk2oUQlP0+/D2/vT1xX12ipcPh7mzmy32i4v0UDz0epofskLkLemaJxX
	+vXJXpEf4QtU5Q0KoZhWWjnnYAJro4VqCPWshYEFwocstoXskNAdClyy2BHz1gRedw+3/VaKs4yA8
	ngAe9tCqqB+pZW8nTKC29KKOQ/eJfxYcnGeAYhPIkf05Xr4/4JoqYxAiZ75hY8btuTzQMhxb9HYs4
	YyRszgKZKWAwBLi241XlIRm/Z7WZ70xd9+9GZ4GdSlzYW6nDGvQdbKLby4jiJNZiX/kr3Xb+TvNBZ
	nbyPZitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINPb-003fE8-29; Thu, 19 Jan 2023 05:24:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINPQ-003fCb-Sy; Thu, 19 Jan 2023 05:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/7Yi1/TMdF0ZsngPg/D7r3gCUq5DRgym11bWH2ZX2aA=; b=Uzo1ORVqKHgwOyjKfJYi2Fy9Yj
	1Is+zElmpII2ocH8yflQLfxpReUz5Z9/iHyhDHctNyl4kO9Ld9wWq6YhG1evyG5UPWGtdYYjY6IG8
	4IQ6InaNk79w62Z3gl6f6Tmr41yxycIRbbch6TMbbP1AQpdx8Zuvi3R5zD+XKl+QTLPYUnkOPMkk/
	T4J4tylBqBc+H/3YNUcGoQ/megOCw9Nitepqck3c8NdWXvOUKjQqJsDykmz6hI864gw2H3Eqi6TDN
	gyOw/gQURVoUb/r3JM/ti+oaa8BF1zl4nkd0bmwHgqobJp+Q2/JumYoQ2KuW99yytMgQHXyHPUg46
	t9IJJ5TA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pINOj-000CVh-1M;
	Thu, 19 Jan 2023 05:23:41 +0000
X-UUID: 6823e93697b911eda08d4d6090ec5a5c-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/7Yi1/TMdF0ZsngPg/D7r3gCUq5DRgym11bWH2ZX2aA=;
	b=e8yyzlcpYUExm4xjS1jPrciM7zF7of3lvO0A9m89cCdt/A+oCRqfdRes2wYn/GIqi8kQzRvmupToiClFJmcfO/ebEnOxQ4vuLJhDvt9aRLdKrvxT3u6DA+N3nQ+S3+d7qDp1phPQ8WHQ+MIzZthEdABZSRFZo+8La2vG/9Dbd7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:4241fc54-af37-481f-ba33-801b48511cfb,IP:0,U
	RL:0,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:14
X-CID-META: VersionHash:3ca2d6b,CLOUDID:92b5af8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 6823e93697b911eda08d4d6090ec5a5c-20230118
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1991981328; Wed, 18 Jan 2023 22:23:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 13:23:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 13:23:26 +0800
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
	<yangyingliang@huawei.com>, <Mingming.Su@mediatek.com>
Subject: Re: [PATCH v3 00/23] MediaTek clocks cleanups and improvements
Date: Thu, 19 Jan 2023 13:23:26 +0800
Message-ID: <20230119052326.15790-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_052338_730198_EBC9DF0F 
X-CRM114-Status: UNSURE (   5.99  )
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

cc Mingming for mt2712.

I tested this v3 series on mt6779 and mt8192.

Tested-by: Miles Chen <miles.chen@mediatek.com> 


