Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F19C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B30610A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19B30610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpr1RyTPlcr1emKRJKnfGFi8JFIQIDv61iej1e9DEFc=; b=uka/FbF8jGjlC9
	OaKD39FYYWK0X/P3na5joJM7ch04rReoTr9BZpg4/jPa4Pf2aQ2TCOK+9u2KFjWI5NF3gHNeu4OOh
	1ksJNQ+ruAY8fYU4MqG4PPvw6iwA6Qq1gORLnkz0GDO/tEbsPyDqNA0yNHie/AyC55rWBUYxp1fVu
	DPrTu0ca7hyHRjxAnFmq70WNZZd0Mib+Q95S/ztgNf+tUpKQQ1fnA7UdSCDJgQ9TCSPhJFSI/alfy
	hEMpJrf0lDOEhPaklzjJK/06FhjRRbiq7FA8V89H0OdzoyKnh3wVnIAa1wt+aR0J05cgBxOTyk4HN
	VgA1rnJni5GYswrip1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEAfW-00AAhR-FY; Thu, 12 Aug 2021 13:22:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAfB-00AAaU-TM; Thu, 12 Aug 2021 13:22:31 +0000
X-UUID: acee62cc43894e4dba95f474bd1d44ea-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h5olHsLopR+BYtypPrnSTo8iOF7llh+07WA8pyjdOJ8=; 
 b=ei3jQoPnmx96WzbpqWNqBe0y0avW55+YP5uf0wWRKEkQ3FO/c/TgMqHbs5JVfEHZRHRrRexkermjeMlHHafejHjk9PSI56uOp6/a8Vb74z+Ot3m3YJ/eT86zHehtIZY5FgNb7CIcmdUcKyUBXHmSRCc/G/VIwLQkpbL7wUzXeFA=;
X-UUID: acee62cc43894e4dba95f474bd1d44ea-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1504328112; Thu, 12 Aug 2021 06:22:24 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 06:18:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 21:18:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 21:18:39 +0800
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
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 stable <stable@vger.kernel.org>
Subject: [PATCH v2 4/7] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Date: Thu, 12 Aug 2021 21:18:00 +0800
Message-ID: <1628774283-475-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_062226_017177_A789B0B9 
X-CRM114-Status: GOOD (  12.92  )
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

usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
of endpoint descriptor, not include bit[12:11] anymore, so use
usb_endpoint_maxp_mult() instead.

Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
Cc: stable <stable@vger.kernel.org>
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add fixes, cc suggested by Felipe
---
 drivers/usb/cdns3/cdnsp-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index a47948a1623f..ad9aee3f1e39 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -882,7 +882,7 @@ static u32 cdnsp_get_endpoint_max_burst(struct usb_gadget *g,
 	if (g->speed == USB_SPEED_HIGH &&
 	    (usb_endpoint_xfer_isoc(pep->endpoint.desc) ||
 	     usb_endpoint_xfer_int(pep->endpoint.desc)))
-		return (usb_endpoint_maxp(pep->endpoint.desc) & 0x1800) >> 11;
+		return usb_endpoint_maxp_mult(pep->endpoint.desc) - 1;
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
