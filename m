Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF254C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 02:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er1lvHjzvADNQzZeFzuyNFEHyrOly2O2osuwQkFE9GM=; b=w6+ov1PTDPNWTHcw2PQgqqsH6S
	j6wAffU5drTsJBUrKVKgLE9slgKW6tl88neTr56LBtVxzB1Zr5shMD/5xSHAh0wlVFjB5rBACxH6J
	VYBNFDpg2woo5/4Hj9eH4raQWG6X2LifI9XPqE4u7pRYeztuSCYyzBsR52hdStMLI7CdrSciBzDLK
	1slncH2dJ7N89ZMfT14gzFyGHikR60bpKNuM/AKv8dbnTD7NL2rNophDqdbERZNjFgQmQSuXZHu5Z
	TQ0bnjv84Z6Y+0Ix6YhQtpmcq19eQMzNhfnn0mUsUDitiVZrIs2hZC/mi2UhRz+ZHIr+0MTGD2vxl
	gTIeOgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5WS-006iLh-7t; Tue, 12 Jul 2022 02:21:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5WQ-006iJG-BJ; Tue, 12 Jul 2022 02:21:11 +0000
X-UUID: 650240185a074811a99a6474efe2dc1b-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:993f1a65-1cdd-4440-adf9-b5a371a2d87d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:257f36d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 650240185a074811a99a6474efe2dc1b-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <stanley.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 657628323; Mon, 11 Jul 2022 19:21:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 12 Jul 2022 09:30:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 09:30:23 +0800
Message-ID: <8c00f8c89b08ce108730d59afa00d3cc54cdcaa2.camel@mediatek.com>
Subject: Re: [PATCH 1/1] scsi: ufs: fix missing clk change notification on
 host reset
From: Stanley Chu <stanley.chu@mediatek.com>
To: Po-Wen Kao <powen.kao@mediatek.com>, <asutoshd@codeaurora.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<alice.chao@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <mason.zhang@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 12 Jul 2022 09:30:23 +0800
In-Reply-To: <20220711144224.17916-2-powen.kao@mediatek.com>
References: <20220711144224.17916-1-powen.kao@mediatek.com>
	 <20220711144224.17916-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_192110_417536_F407D58E 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, 2022-07-11 at 22:42 +0800, Po-Wen Kao wrote:
> In ufshcd_host_reset_and_restore(), ufshcd_set_clk_freq() is called
> to scale clk rate. However, this did not call vops-
> >clk_scale_notify()
> to inform platform driver of clk change.
> 
> We propose to call on ufshcd_scale_clks() instead so that clk change
> can be properly handled.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


