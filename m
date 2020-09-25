Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1B3C4727F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:11:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 189FD22211
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEwZJ773";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bVoOTlFM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 189FD22211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aG1xnLosfheTFR8MpkUer1yeAu/HY2WCZKEof6ct02w=; b=BEwZJ773VMMIWOmHUCYztc/SK
	+PMuC7nAtKJibnfh3o50xQTN6s+E84wmfl5GRlnqohq6lRWnbIqX7ITmlTJXPZDaCJZo0mtY0yuGN
	dsdgI5pW6eZNytakR0bkF+YfFMd/Qu4DuZiFH3uUzn5wiDAV5tdQn/K7T/OK8XHTb+F1aIx6l6TcD
	G86oFxlTCHXyCJDPvbwtsmKrP039AA/lVqRH/E0DqYfi1mT6X01EfPj4kim04XXqjoEqPj87DCLyM
	q5DzfbyFjP8RSrJnbhOM5PGnhRQEUhSq0z1XEInJYu7NlD83uXrTXgY/JuPIc4YS7MFCn4LXgEOz4
	CbrQqVFYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLgx8-0008W0-2P; Fri, 25 Sep 2020 06:11:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLgx4-0008Tq-E8; Fri, 25 Sep 2020 06:11:27 +0000
X-UUID: f4a1f3a21490461d852877353f88d97e-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5egQoq8hPPAkOfF/INbEfBKiZv1N/+035QYwraMLsRk=; 
 b=bVoOTlFM7PBRxnWJXFSc0NRHIZkf7tRoIJKeSasgRBNP5y6RgSiulGWQ6zuijRhSpOMMoTS8/yswmP7BzFAZsQIU0E8JV6NudRo2tL4qoeLOxglFJK9T7xDDWB1W0xrMpG+41iX6JeZjmnoizv8HAaYnxwpiw6+hVVBH3DkUO1M=;
X-UUID: f4a1f3a21490461d852877353f88d97e-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 709897690; Thu, 24 Sep 2020 22:11:22 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:04:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:04:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:04:22 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH RESEND v3 03/11] usb: gadget: bdc: prefer pointer dereference
 to pointer type
Date: Fri, 25 Sep 2020 14:01:34 +0800
Message-ID: <1601013702-29079-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B1B665AE6624B315DF54812A6B714A1C6DAD5B6E45F48398DB1BE1EBD0D5A25B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_021126_683463_EE146CD8 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Prefer kzalloc(sizeof(*bd_table)...) over
kzalloc(sizeof(struct bd_table)

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3: add acked-by Florian

v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc_ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index fafdc9f..76463de 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -147,7 +147,7 @@ static int ep_bd_list_alloc(struct bdc_ep *ep)
 	/* Allocate memory for each table */
 	for (index = 0; index < num_tabs; index++) {
 		/* Allocate memory for bd_table structure */
-		bd_table = kzalloc(sizeof(struct bd_table), GFP_ATOMIC);
+		bd_table = kzalloc(sizeof(*bd_table), GFP_ATOMIC);
 		if (!bd_table)
 			goto fail;
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
