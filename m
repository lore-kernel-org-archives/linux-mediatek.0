Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D8EC2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 12:22:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5451261409
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 12:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5451261409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haN7z7V1Y05FrKGWE1hNAzPHBXIps28XwU5zmZhUPWM=; b=RmwbtHndy6fILN
	q8ucz1ueyf90G2ddksfPaGGO8v6ICFSEz/1qhOJJd9H31stbQt0ShO/ad45Rcc0ZE+nBvELJSYjoS
	7pIGaajSx5qBEJvmvkpewle2zuIVbwNZ5z4NJWhkn4xbv+et38t0J0cfsqAYMJw5ssBoD+/p4vEK6
	qGimJGQ6tPF3Bbmy8Uc2Z+4yl5R3CerUDosJzxKLitz7my/XdCw7xdtFIK8LkI2beQmD/wZRIJCb+
	m9DPLSej904Idd1sY8qDTME+4NOSxt+JVIsibLlH97zhAOKwc0lasVPO34IIWWScJQDJ9lzIl50Nf
	s/7OTfnht3FPO90xE0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llW4s-004zcd-6I; Tue, 25 May 2021 12:22:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llW4m-004zYI-P5; Tue, 25 May 2021 12:22:26 +0000
X-UUID: fd8a9ccec9d64ff3b66efda99e61783e-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mmBy6ux5CO9c+S9ek3oi3+EizhNVyUOy5b9O9ABmLHg=; 
 b=LU+IOvqgYlDMxw8e/RTuia2VcLTw7C+8k32fu4ZFLFuJIyZKtYFYisJfot56Sj6N6AlLJZftfXR18LLYiHoRU1KplHgx27p518Nhz5olv3zEUo/Hm1r0gpLSfyTP+XiLo33Zz3Jjo3rzq3RvYJVdmvVulev3PvznDJAXUcAvyEw=;
X-UUID: fd8a9ccec9d64ff3b66efda99e61783e-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 372626467; Tue, 25 May 2021 05:22:20 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 05:14:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 20:14:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 20:14:52 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v4,PATCH 0/3] mt8183 dpi supports dual edge
Date: Tue, 25 May 2021 20:14:45 +0800
Message-ID: <20210525121448.30075-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_052224_864124_BECEC2EA 
X-CRM114-Status: UNSURE (   6.58  )
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

v4:
Use output_fmts to determine whether it is dual edge.
Rebase to v5.13-rc1

v3:
Modify clock rate for dual edge setting.
Add more bridge function.

v2:
Modify unused code

v1:
DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Rex-BC Chen (3):
  drm/mediatek: dpi dual edge sample mode support
  drm/mediatek: config driver data to support dual edge sample
  drm/mediatek: dpi: add bus format negotiation

 drivers/gpu/drm/mediatek/mtk_dpi.c | 112 +++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 6 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
