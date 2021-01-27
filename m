Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A368C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 11:29:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011182076D
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 11:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011182076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wSepq+89mkz0gXYP8l7cl+D0mkx14M9wuT2iv+dz2J8=; b=0Cp+SqNkGuZ4DehnwH1CKoz6l
	VK5jxkABDODVdFDliNJVWIuskdnfhuMfKkylzw5kmbQMEYikQ2jH47wrM2C/8YF3K6GDzL9znqgkq
	2NkUu4DyoONf3Z1QCF2NzZlOvlBWAGKib2iP20FGSrkFHfAzfp6UhgGYEl0G2JPQYsvSvMSd+nPdV
	kcaIYP71ECfZ7VxV20xdpMBjeM/2ig0T3T0MBBSpm+cmgGBfEPtWV3RNeLXUJmBwbFYwqnUDjDmvz
	ErkTHfF2IwQBSVErCEE9c9uKR2+e5nUuYyPDCj8fOkKfKHP+/ZnCJKD+AU+vJoSi+fKX625csU8t4
	MjdjDzY2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4j0j-0007RH-1t; Wed, 27 Jan 2021 11:29:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4j0U-0007Lo-G5; Wed, 27 Jan 2021 11:29:08 +0000
X-UUID: e0eb2c13203f4a7d8061fb7d8218e99a-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vBX7wOF5hYwfoQ5iImx0Cq6u9nrg95L11st//pLahzw=; 
 b=D3djRkb05wZNcHsKwW0iiX1wijtCanzKTUjvaripcDvyb/dACXcYLISx8B+OFBO6+DhVPNtciaKkFl+RME36CC4E8myTSVYc5SGvBYvkOHU6AgJ/TpGA7rvunJlYF9nNQtFtsVM4JQpOEmy/rnpYR5Pdv0SB6qbDYiqnsTp6xXc=;
X-UUID: e0eb2c13203f4a7d8061fb7d8218e99a-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1100244356; Wed, 27 Jan 2021 03:29:02 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 03:29:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 19:28:51 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Jan 2021 19:28:51 +0800
From: EastL Lee <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v1 3/3] arm64: configs: mt6779: enable HAVE_MTK_MC config
Date: Wed, 27 Jan 2021 19:28:44 +0800
Message-ID: <1611746924-12287-4-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611746924-12287-1-git-send-email-EastL.Lee@mediatek.com>
References: <1611746924-12287-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_062906_670229_6B1EAEFE 
X-CRM114-Status: GOOD (  11.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, adrian-cj.hung@mediatek.com,
 linux-kernel@vger.kernel.org, joane.wang@mediatek.com,
 EastL Lee <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

enable HAVE_MTK_MC config

Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 17a2df6..f4de260 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1091,3 +1091,4 @@ CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_MEMTEST=y
+CONFIG_HAVE_MTK_MC=y
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
