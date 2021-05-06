Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D07C43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 07:37:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6378461185
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 07:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6378461185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ke13MyMNgO5COwOFOJeMuotkr+y0+dtS9/X+46pxpuM=; b=Zyy1NgiFH5uCSHusbcVDJ+VEzL
	vsUlMb2IIZGck55yN9hP9yxn/JLF7wzsqNeYT6BBK9YD3HBgXF9bEd8XOw8Fe5qe1DSrR7/tw6JGA
	NQkB6DZi2jMjYjIRsaJvEF14i9aKUzrWSL8JUfSmVsKapFv18hwjLXm18CvM7k4aSnV3MLP0tyJhz
	TKs795yFJCHvWqL50rGEBaZDQqpPYX3cfSUF+h0h8luzJaEryM/FAjQ9eLn+rXU5pFqFi+dIKVGEo
	Mctn4CV8O0cofd9QDNH2PmC3+HKBGtJDfPoy27xG5FKlMkxW0HoL8X87ElYgzLDzWjldA4TWE69Ws
	NxbSXoUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYZ0-003VSV-DC; Thu, 06 May 2021 07:36:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYYi-003VQr-8k; Thu, 06 May 2021 07:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PKCo5KDu2+MyV2fo3U49lafquNmsvewQjGTpnCl8jB4=; b=ZXIhZWHPhg+oODRrn49P44bQMw
 Y68DEBbv29E0bJnC8beth1RweMvboT0x9R2xJLXYJv7wlKTYdr8/vGJnBpIXvP69dhU/ALqEanskx
 rQix6vjYCc+yecpbYZZ+ByaNpRKiKuXSPvgEGLf7V2x+jhb3NWUEP38K7BUm/2Vo90aMm9K4n/h3r
 Yn8RYHzT88cCTugCL0Sj4iMILd2FOK2BhZN4Bhal8b1cBQSFMS+GQw7+wybcEp2epbu8ieRHF2quG
 nK4A0Am9S80tdeuPkALB+BO/KwjH3+tF8WMdWbZ8LQosG9tPomFUmIw2Z7aQKTNCcvHgiMW3rTuyh
 NaSurJ/w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYYf-005fhZ-38; Thu, 06 May 2021 07:36:30 +0000
X-UUID: 0d09cae4985e4482bb878fb2d2c07725-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PKCo5KDu2+MyV2fo3U49lafquNmsvewQjGTpnCl8jB4=; 
 b=h+fBzqdXTQ8UvXU0FAhjnlU3e2nT7nW05VgOD0TkkE69TfM+hn+SBjs+8w7I09JY1eTZ5dFjTCA31NJk+d5C2Zp6K57y9Srcsw3gQVCEiqXrJIHEXV7WUWQ5J47z2fAe4zibricOZ91A4iLI3KElfb8G3xSSSWFXVp7JusWAKvI=;
X-UUID: 0d09cae4985e4482bb878fb2d2c07725-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1588041638; Thu, 06 May 2021 00:36:24 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 00:26:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 15:26:19 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 May 2021 15:26:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: dwc3: remove repeated setting of current_dr_role
Date: Thu, 6 May 2021 15:26:08 +0800
Message-ID: <20210506072608.32320-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2C439D80F58E40FD8183C9D9B57B59720705FA2E6781ABE2D1FEF57C1D3205B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_003629_159512_2BE55A0E 
X-CRM114-Status: UNSURE (   8.24  )
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

dwc3_set_prtcap() already sets current_dr_role as
DWC3_GCTL_PRTCAP_OTG, so remove the repeated one.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/dwc3/drd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index e2b68bb770d1..8fcbac10510c 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -596,7 +596,6 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		dwc3_drd_update(dwc);
 	} else {
 		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_OTG);
-		dwc->current_dr_role = DWC3_GCTL_PRTCAP_OTG;
 
 		/* use OTG block to get ID event */
 		irq = dwc3_otg_get_irq(dwc);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
