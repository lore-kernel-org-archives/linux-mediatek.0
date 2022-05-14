Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IaKulJQHLZc5kHpxiciQM5uoCRqOGdBkr3iHb0GAZ4=; b=Tr5kV0MYDlEr3j
	dftD6oWy755i82YAW8YZVbtOdXWvmZYH7C44bzRVLQ8ApgI7UckGzHAYdaZqBBsiYDG/V/+XXfdNT
	SfwzILJSS4jYnQU6aSbto5EJVKror1/0FYD205osikOIHdrwWaSuobIHQaOYT1b/vXrxIjwjRoGZ1
	w8rAdppOmmm5MP+Gdl1LXduTvdoe55VluMsIVByJrpIeH2pb4qp7I7oDqoNNGfukei9DWQo3LPY2O
	E+8zqVOZEb6n3NOv3m7/2BywmfPz3ntS4Xw0y5lFeHsoryc6NAsckM0nj6wxjAjxtVbQnTnbdEpx6
	J96Dla00lThxG9K3sqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npvLg-001uOs-4Y; Sat, 14 May 2022 17:14:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npvLC-001uHj-7C; Sat, 14 May 2022 17:14:07 +0000
X-UUID: e83337bacc1348e380f51c51c1d34092-20220514
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1c384b81-167d-44ba-ba1a-bca5bb016aa3, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ef974da7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: e83337bacc1348e380f51c51c1d34092-20220514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1019463787; Sat, 14 May 2022 10:13:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 May 2022 10:11:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sun, 15 May 2022 01:11:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sun, 15 May 2022 01:11:13 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>,
 <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>, <wenst@chromium.org>
Subject: Re: [PATCH v2 00/11] clk: mediatek: Move to struct clk_hw provider
 APIs
Date: Sun, 15 May 2022 01:11:13 +0800
Message-ID: <20220514171113.32747-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <18fee6fe-2378-391e-993d-425c887ba40a@collabora.com>
References: <18fee6fe-2378-391e-993d-425c887ba40a@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_101406_466134_82EC4108 
X-CRM114-Status: GOOD (  11.17  )
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

> Hi everyone,
> 
> This is v2 of part 2 of my proposed MediaTek clk driver cleanup work [1].
> 
> Changes since v1:
> - Rebased and added coverage of new MT8186 clk drivers
> - Split patch "clk: mediatek: Replace 'struct clk' with 'struct clk_hw'"
>    into arbitrary pieces so that they don't bounce from the mailing lists
> 
> This was tested on MT8183 Juniper. Apppreciate any help testing on non-
> ChromeOS devices.
>

> For the entire series:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ...and this entire series was tested on:
> MT8173/92/95 and MT6795 (Sony Xperia M5 smartphone, clock drivers not sent
> upstream yet), so you also get my:
> 
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested on: MT6779

Tested-by: Miles Chen <miles.chen@mediatek.com> 

> 
> ...and last, but not least:
> 
> Thank you! :-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
