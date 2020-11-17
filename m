Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9E5C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 08:21:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BE020825
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 08:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZUMEuQE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="teQWLUdH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BE020825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZboXqcbpx9xDVnxec+dADXjOadTO/+dMnCUl1MyxfqI=; b=nZUMEuQE8fV/NbmXktz11pcmWR
	deEp9o5NyED6B4/itbU1qCmCoJ7EOTmoJkTWhch/9m9RJSusI9WdHh7F7o1BnhexaJwMVb8aGaPmJ
	QVP0LdOBXKoOr5M/pJgBDR9VsvpPE/Vhm9vhgc30qv8RujjIHgUtOU3OitEA+Uawgiy9HAdAIY9Ja
	qrpoC4U/15zgw6d1Cpn23OxE8dNsoDWGb4+8lDoXHQV7VaOGfVCD1e3P5ojq064cIVoEK6UbBrRFf
	soIP+cZhKDDabjQOZ/8hpOelSyKUu6fG9UATlaOvQCJylJ2+WIgxkzCuU8qoSGjch2m7oFcL9bfYI
	MvFm6Gig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewF9-0007ab-Qk; Tue, 17 Nov 2020 08:21:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewF7-0007Zy-5a; Tue, 17 Nov 2020 08:21:38 +0000
X-UUID: ec3432d7f3aa47ec9d2249c2c73b2ddc-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ze3bLWXoVCGXWOH06/hk2iPR14th40hLdmiRA0dtMEQ=; 
 b=teQWLUdHhx4LxywaxYkkcEqGe5gvLOO0OB+nCRlby03aLjJzopMFAZW7VK887BMnHioAllT7ZZEl4d5iYIXEf8PpM/ux6aC7SRWBbjI5iNC8e+G1fd4wKHDMI9k+cObWUSS/cBEpodLIils79twdDztEgAQ1gS7I3tA1u3dDAPw=;
X-UUID: ec3432d7f3aa47ec9d2249c2c73b2ddc-20201117
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 562872082; Tue, 17 Nov 2020 00:21:48 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 00:21:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 16:21:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Nov 2020 16:21:26 +0800
From: <min.guo@mediatek.com>
To: Bin Liu <b-liu@ti.com>
Subject: [PATCH] usb: musb: remove unused variable 'devctl'
Date: Tue, 17 Nov 2020 16:21:25 +0800
Message-ID: <20201117082125.7619-1-min.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A52950D1BF0114C89270D23257F406A875C20222DDA92BD96092F5C4159C3FA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_032137_452468_5E3C6E71 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Min Guo <min.guo@mediatek.com>

Remove unused 'devctl' variable to fix compile warnings:

    drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
    drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
    but not used [-Wunused-but-set-variable]

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
 drivers/usb/musb/musbhsdma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 0aacfc8be5a1..7acd1635850d 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 				musb_channel->channel.status =
 					MUSB_DMA_STATUS_BUS_ABORT;
 			} else {
-				u8 devctl;
-
 				addr = musb_read_hsdma_addr(mbase,
 						bchannel);
 				channel->actual_len = addr
@@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 						< musb_channel->len) ?
 					"=> reconfig 0" : "=> complete");
 
-				devctl = musb_readb(mbase, MUSB_DEVCTL);
-
 				channel->status = MUSB_DMA_STATUS_FREE;
 
 				/* completed */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
