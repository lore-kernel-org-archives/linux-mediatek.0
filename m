Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145F3ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3RdqVd1gkkXkZVjFlpJYrbMBbFDmrTcM7nhqoe7Ckc=; b=ntmIyT9HJ2TBEjyP//shB7muNQ
	TBtG1fi5Wn6noz+u9SmEDundVUmNbUBQccqcxj0yDb8Qbu0+LuQ7b24toQCRRo61/Pi41WTvnPAP5
	UntiHbJjK2rIXtvH8yS4YEVuUKynuKTOgdQFCvwgRAS3qvUvrnX5WmOMwRjcA5g/Nh2MDJbRJNV8g
	JKDcuZompcSKEo2/FkucqmnCSItB2OslBTRS5nEW4KIi1c0yhkvdmMMfXpqD2ngf+wQPyi6K6YnJk
	9samI72K7Skh1YW6FrbBrgUaIw5Z85lyIgUZ71tVSuOeUKki3tGif9oNA78v4xKtqIHedmIJ3QOSd
	0Rw5jkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW46y-00B4ck-IA; Wed, 07 Sep 2022 23:05:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW46m-00B4V6-Hn; Wed, 07 Sep 2022 23:05:25 +0000
X-UUID: 9845fc7a241146b4aa28dd72335d7c13-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w3RdqVd1gkkXkZVjFlpJYrbMBbFDmrTcM7nhqoe7Ckc=;
	b=Fq5PPwrlPdf04Mc7k6Z0nz4g43WDqVRMof6okhajJyWIY9Qj5XhVoJhWKcZjha3I60pY9H7unFKU5G7u/aP/AvSaxLAO0TaoTh3RxnAMxVFucNX/kE+7v7+sOMenjLZKMx0ymfgOdkX6UsDg0HuftB1eQSfLYsH80FiwZ/mRqEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1ebcb72d-de7b-451a-9808-5e06f855433c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:e2320457-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9845fc7a241146b4aa28dd72335d7c13-20220907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1390460778; Wed, 07 Sep 2022 16:05:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 07:04:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Sep 2022 07:04:42 +0800
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
Subject: Re: [PATCH 04/10] clk: mediatek: mt8183: Add clk mux notifier for MFG mux
Date: Thu, 8 Sep 2022 07:04:42 +0800
Message-ID: <20220907230442.10633-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220905100416.42421-5-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_160524_621825_00739BDB 
X-CRM114-Status: GOOD (  12.83  )
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

> When the MFG PLL clock, which is upstream of the MFG clock, is changed,
> the downstream clock and consumers need to be switched away from the PLL
> over to a stable clock to avoid glitches.
> 
> This is done through the use of the newly added clk mux notifier. The
> notifier is set on the mux itself instead of the upstream PLL, but in
> practice this works, as the rate change notifitcations are propogated
> throughout the sub-tree hanging off the PLL. Just before rate changes,
> the MFG mux is temporarily and transparently switched to the 26 MHz
> main crystal. After the rate change, the mux is switched back.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> [Angelo: Rebased to assign clk_ops in mtk_mux_nb]
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

