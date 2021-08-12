Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D20C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19CB3610A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19CB3610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HhTewWAcrmtX05U66IHqn4Ntd+sZjagnbYja74ArXg=; b=Too9cLqZySh6fy
	gbzGPgu4GbSetbAoMdOTazOflyU8iMs8n+AWTXjJ0dO1UOQCI6Hy4+jIEZUWhqqFmWvSQSs2NE1hS
	opBoUopd/2xYH/l/zhHaVCizTclrZQQH08DNiua5Gu1DWcgvmEkN5zavy1CYbkTkyQJm8pLpFwWcI
	fM6Vc7cnzjwFsVMWQKxXqBVLnBWT/2dZAjUQeF/gNKUCyzHJ7HXF+mjPwno1ZoM8IbdrcNw6T9dRi
	zTihN6zeOb/JFeFqQThZ7bCi5FSkhqmUYig2dV9NYADTXMWLLnJypvMfzFekciDFFuJaygDsWczEp
	IjFinIsSzAB4ZNnZazeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEAfV-00AAgx-AO; Thu, 12 Aug 2021 13:22:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAfC-00AAbF-Sf; Thu, 12 Aug 2021 13:22:32 +0000
X-UUID: 14e5db1e517747d285271c67757996c8-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=isZewrvhUAspj+Ym9WjkmsDhRj1UHJLxR6oBM9ThYKY=; 
 b=t2dKCVn42kEXs8zLm1NLIBwiCaMIBcUYLcCM6z0N5LXDqRQTcADmM9idSjvr/NNtPScJ3/XKKzVw/36pDY9IFcKq3HfGDqN2b9GBuE22vP1JG+DodZLON9VfsTtb3jZzDTkFNneIVkEH4NQCU62RdOe8OhSvOCs3TQ9SH/RuI4o=;
X-UUID: 14e5db1e517747d285271c67757996c8-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 987583130; Thu, 12 Aug 2021 06:22:24 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 06:18:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 21:18:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 21:18:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 7/7] usb: gadget: remove unnecessary AND operation when get
 ep maxp
Date: Thu, 12 Aug 2021 21:18:03 +0800
Message-ID: <1628774283-475-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_062227_171205_8A6E74F3 
X-CRM114-Status: GOOD (  12.12  )
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

usb_endpoint_maxp() already returns actual max packet size, no need
AND 0x7ff.

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add acked-by felipe
---
 include/linux/usb/gadget.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75c7538e350a..f181c84310b6 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -491,7 +491,7 @@ extern char *usb_get_gadget_udc_name(void);
  */
 static inline size_t usb_ep_align(struct usb_ep *ep, size_t len)
 {
-	int max_packet_size = (size_t)usb_endpoint_maxp(ep->desc) & 0x7ff;
+	int max_packet_size = (size_t)usb_endpoint_maxp(ep->desc);
 
 	return round_up(len, max_packet_size);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
