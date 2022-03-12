Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA51C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Mar 2022 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2NPNuWUZZSvySWMHe9IyjEh34HCXQ+5bwt7pq+5m0w=; b=pweby2D4R3eBY1
	bFZYu9fffl6Fo71gl6CuunzKwbLCd2JVohoh/dZmc89vxmzR0brpUALEqBQVaD2VfnLi85SO781dN
	DRzH90/6RZDkDfQzewZLsW8mOZhoVsCVlQIroIFs5IzyC0s0dHMzUfHCGVzZVjTIbiVcCnrHRODd2
	ubQb3GKQk/w3uj7bSWz1ZbfFldHpDwkv6sZSkoDe7pbbKrMFSzzexpHqIA7f6fv+Kgklr1ue4Wu0r
	TTLOQXSoa4ynR8dzKKHpUk6d/62+6WxqJ/+r6tVL1JW7WQ1UdbnjeXNKh9nOSenQtEAQIvLf7iN28
	iG9tv5RaKmLCkPY03E2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTB6y-001ywz-NW; Sat, 12 Mar 2022 23:25:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTB6i-001yrb-8K; Sat, 12 Mar 2022 23:25:09 +0000
X-UUID: 1b201318c7e6456599fef1b5c0fca0cf-20220312
X-UUID: 1b201318c7e6456599fef1b5c0fca0cf-20220312
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970573222; Sat, 12 Mar 2022 16:25:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 15:25:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 13 Mar 2022 07:25:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 13 Mar 2022 07:25:01 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <chun-jie.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <sboyd@kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v3 14/15] clk: mediatek: Add MT8186 mdpsys clock support
Date: Sun, 13 Mar 2022 07:25:01 +0800
Message-ID: <20220312232501.14710-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220311114229.32504-15-chun-jie.chen@mediatek.com>
References: <20220311114229.32504-15-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_152508_345820_E5D77849 
X-CRM114-Status: UNSURE (   5.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Add MT8186 mdpsys clock controller which provides clock gate
> control in Multimedia Data Path.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
