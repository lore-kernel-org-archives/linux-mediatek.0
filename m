Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54158C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 00:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hoAY0kyqzuXtfrgGNI2tlDRjz/6Hkf957hlN1DteyY=; b=R31h3tNI2kTvTS
	K4JxIHgAyMlH/z4gXLiLTWEvBRUGX7UlZf1hNNf0ZUYMggfEoQ33l9TAIMZOGtSpPs9p0jybUC3AB
	avHxjZwrwpEb6U0v29h7GRrNyYRv4lraSXMas9J95u0TD42slu+CjWMAW3rCjY9YFVJ14fU5bP4Qr
	3SpJtoP3H+LwDi7X+i81szl1TwGWy81UTW7Y2auplA2DKn8YUL3ghNXZqgqWHAxCZ5kVDFX0XAKfN
	iECk7mNg8CdOZB9DMszURCqnq9cyf+f/rdaFiHaNs993sOyojwMxaI5t8Py1C7T/IfZFL/mTzsc33
	Bl7kQ10uzYF/VCTrZwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTBfx-00224w-Pb; Sun, 13 Mar 2022 00:01:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTBfu-00223e-IP; Sun, 13 Mar 2022 00:01:31 +0000
X-UUID: 5e3099a226374f0d84fa83f49b38c482-20220312
X-UUID: 5e3099a226374f0d84fa83f49b38c482-20220312
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 752179623; Sat, 12 Mar 2022 17:01:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 16:01:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Mar 2022 08:01:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 13 Mar 2022 08:01:10 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <lkp@intel.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <bjorn.andersson@linaro.org>,
 <kbuild-all@lists.01.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
 <matthias.bgg@gmail.com>, <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
Date: Sun, 13 Mar 2022 08:01:10 +0800
Message-ID: <20220313000110.3869-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202203120056.qtDEVoye-lkp@intel.com>
References: <202203120056.qtDEVoye-lkp@intel.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_160130_652454_2F81D114 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Tinghan,

>      418 |                           MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                           MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS
>    drivers/remoteproc/mtk_scp.c:418:27: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/remoteproc/mtk_scp.c: In function 'mt8195_scp_stop':
>    drivers/remoteproc/mtk_scp.c:592:28: error: 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS' undeclared (first use in this function); did you mean 'MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS'?
>      592 |                            MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                            MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS

I tested this patch and it can should be caught by the
internal build test.

Could you do the test before submitting patches out?


Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
