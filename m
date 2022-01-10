Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5610C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RhMClSxs8C8HwaA/3hzhRfrsCtuBIrYW4sFTwjVnfRQ=; b=eh9x2KxID86sAZ
	7OF/3rlqDsTSWHB6yFh7GuBqnJpbYKih1Ro0G5Va4s6pR8dVJPpbCSC7w3D3f9qOVKrWq7+zPCKRw
	Y9uwnzBoR2RHT2dd+uc6/wurKWf+KbFyO/5kufZnKmu9ET7yXuBGb2Prdmb8BJBP7OYvkfSxHTO2o
	0KYujRWVWTNOUuPwjvvxi8VbkKkLBAowOQQXXJry/2af/g2wE5VMPE90hgPCTqb0nCsuXfX0UmN0A
	un4MxVAUS95jP7YbxoQdBsPBJafUEaJ4igPw7lOZSUhdIMIlF4ug7jyTpjdMxT24fw55HvbCcKeQu
	onj23BKipCtlzDPQksFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6yBY-00CUVp-GD; Mon, 10 Jan 2022 17:10:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6yBU-00CUTC-8V; Mon, 10 Jan 2022 17:10:19 +0000
X-UUID: 4fc2b860ceac44bda08a9a9f02bf1ce0-20220110
X-UUID: 4fc2b860ceac44bda08a9a9f02bf1ce0-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 602881645; Mon, 10 Jan 2022 10:10:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 09:10:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 01:10:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Jan 2022 01:10:07 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: clk: mediatek: support COMMON_CLK_MT8192 module build
Date: Tue, 11 Jan 2022 01:09:56 +0800
Message-ID: <20220110171000.24316-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_091016_358031_D3113029 
X-CRM114-Status: UNSURE (   5.24  )
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

This patch set supports COMMON_CLK_MT8192 module build.
Boot-up tested with builtin and module build:

load test:
clk_mt8192_venc 16384 0 - Live 0xffff800008ff7000
clk_mt8192_vdec 16384 0 - Live 0xffff800008fef000
clk_mt8192_scp_adsp 16384 0 - Live 0xffff800008fe7000
clk_mt8192_msdc 16384 0 - Live 0xffff800008fdf000
clk_mt8192_mm 16384 0 - Live 0xffff800008fda000
clk_mt8192_mfg 16384 0 - Live 0xffff800008fd5000
clk_mt8192_mdp 16384 0 - Live 0xffff800008fd0000
clk_mt8192_ipe 16384 0 - Live 0xffff800008fcb000
clk_mt8192_imp_iic_wrap 16384 0 - Live 0xffff800008fc6000
clk_mt8192_img 16384 0 - Live 0xffff800008fc1000
clk_mt8192_cam 16384 0 - Live 0xffff800008fbc000
clk_mt8192_aud 16384 0 - Live 0xffff800008fb7000
clk_mt8192 40960 0 [permanent], Live 0xffff800008fa8000     




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
