Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJqs+QFohDw4GGOiUAvG1Dl+hgIjgfKcqVl/CiyA29U=; b=l6tzKyKXTf+PtJ
	pSkFbR9Bepc4rePw3NZXrCyi/9KdsgshAHUK0I1WISinSSKop0wKkA0axn8mAQXZB6zmU8tioQWTo
	dfCU2EClqmQ9jBhWVExRITLEbbh/A2vGU8sGzVrm/0H0d9pk+x5OR1+o6Nd4hhsxFLkhAZo76ihec
	VUckHdYFPPvR1FyLlOx8VROqoFrUcA/ewj0KsVDT3RHhknMDsxWl3jqPFJ3uPT3manYIkGTQJU4Gd
	bkgb0PrYnZBubFogtJBW7bHNMK3+c2RRS1DRvfFnwXPOgnp2KnhKlZx+dwCCqoiGKR/aYYtVLruRF
	OUKatmA8d3Llil65hWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9RZ-00CEfo-3C; Thu, 12 May 2022 14:05:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9RW-00CEaY-4J; Thu, 12 May 2022 14:05:27 +0000
X-UUID: d092bd75490345eaa158607b97cda2a4-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b387a5a6-6686-424d-958f-b079906d5d6e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:281efef1-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: d092bd75490345eaa158607b97cda2a4-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1632759672; Thu, 12 May 2022 07:05:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 07:05:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 22:05:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 22:05:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/11] clk: mediatek: Convert mtk_{alloc,
 free}_clk_data to struct clk_hw
Date: Thu, 12 May 2022 22:05:12 +0800
Message-ID: <20220512140512.10718-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510104804.544597-4-wenst@chromium.org>
References: <20220510104804.544597-4-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_070526_214456_E679AA4F 
X-CRM114-Status: UNSURE (   8.60  )
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

>-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
>+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
> {
> 	int i;
> 	struct clk_onecell_data *clk_data;

This struct clk_onecell_data also be struct clk_hw_onecell_data?
> 
>-	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>+	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
> 	if (!clk_data)
> 		return NULL;
> 
>-	clk_data->clks = kcalloc(clk_num, sizeof(*clk_data->clks), GFP_KERNEL);
>-	if (!clk_data->clks)
>-		goto err_out;
>-
>-	clk_data->clk_num = clk_num;
>+	clk_data->num = clk_num;
> 
> 	for (i = 0; i < clk_num; i++)
>-		clk_data->clks[i] = ERR_PTR(-ENOENT);
>+		clk_data->hws[i] = ERR_PTR(-ENOENT);
> 
> 	return clk_data;
>-err_out:
>-	kfree(clk_data);
>-
>-	return NULL;
> }
> EXPORT_SYMBOL_GPL(mtk_alloc_clk_data);
> 
>-void mtk_free_clk_data(struct clk_onecell_data *clk_data)
>+void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
> {
>-	if (!clk_data)
>-		return;
>-
>-	kfree(clk_data->clks);
> 	kfree(clk_data);
> }
>+EXPORT_SYMBOL_GPL(mtk_free_clk_data);
 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
