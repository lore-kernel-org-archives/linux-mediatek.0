Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00B1C433F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD71A20672
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+oyla/x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ffJU8tt9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD71A20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hv/zk6DkEUIW2+oOKJ5Iua1PSJD59nhW1MPkyMfiQgo=; b=t+oyla/xLUNSPvK6HJEbBVFi3
	HKZlzuKrn2DjBjkFo0kPbIau4V7x+DIkL+NzzsYLv1I0m0rBAkjVc5hkSB33zGormfGZN/kJf2z1u
	S0N/f/gPxr3EIkG0pjlgc07c/1pJZ7SEjRnTAA5RbG3QYZuAAmjmZHt0lvUL0+iM/Mf9+10+ue63S
	ZuApvg8CU5ZIaoy07OS0ygnoDxYftxJmri7UdHf1HQYm8iydal9gzIgofmbw6qQFQdGYmbdANDPmK
	pjTDqtKVLLUXbZW+kD4wEenmSuVxEroYfKUPgBqMzRzjbq/o1pe2bY31Tt7RPn3+WafFO8886tQxl
	+N3RxasjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPp-00076z-Kr; Mon, 27 Jul 2020 07:19:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPS-0006wk-00; Mon, 27 Jul 2020 07:18:55 +0000
X-UUID: 0a2bad32be37485d84fadf4c9db7a8dd-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cT1WlsLUGadWMwBtxpHqluQ3CTv7OXKHJE51u/qqiR0=; 
 b=ffJU8tt9gjO5ysNhJR0D0NOamzGGw6B6TJwIqkrtKGdKUQxeJ9Cp0ASmNcP8mHNpvzvLY9MUdeKj6bed/u2Ad4Q6xCQZD7zgDQBSHtKXnZC0GMKh9yT6E3FhppTdNcLg1hUiG84QtMtl5kNoya4uKJF8YPNXWaWAsvY9djN/9c4=;
X-UUID: 0a2bad32be37485d84fadf4c9db7a8dd-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2024944187; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:32 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:32 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 02/11] usb: mtu3: fix macro for maximum number of packets
Date: Mon, 27 Jul 2020 15:14:51 +0800
Message-ID: <1595834101-13094-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BFE475CE3B7308DA5BFF6C69C0D03ED50AC43C3E69D2EFCF840EA10C6840A9D72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031854_215432_339B0956 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The bits field for maximum number of packets is 8 bits.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_hw_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
index bf34f78..072db1f 100644
--- a/drivers/usb/mtu3/mtu3_hw_regs.h
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -134,7 +134,7 @@
 #define TX_W1C_BITS		(~(TX_SENTSTALL))
 
 /* U3D_TX1CSR1 */
-#define TX_MAX_PKT_G2(x)	(((x) & 0x7f) << 24)
+#define TX_MAX_PKT_G2(x)	(((x) & 0xff) << 24)
 #define TX_MULT_G2(x)		(((x) & 0x7) << 21)
 #define TX_MULT_OG(x)		(((x) & 0x3) << 22)
 #define TX_MAX_PKT_OG(x)	(((x) & 0x3f) << 16)
@@ -173,7 +173,7 @@
 #define RX_W1C_BITS		(~(RX_SENTSTALL | RX_RXPKTRDY))
 
 /* U3D_RX1CSR1 */
-#define RX_MAX_PKT_G2(x)	(((x) & 0x7f) << 24)
+#define RX_MAX_PKT_G2(x)	(((x) & 0xff) << 24)
 #define RX_MULT_G2(x)		(((x) & 0x7) << 21)
 #define RX_MULT_OG(x)		(((x) & 0x3) << 22)
 #define RX_MAX_PKT_OG(x)	(((x) & 0x3f) << 16)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
