Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52417C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 08:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FF66103A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 08:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21FF66103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AEMGqPRu/Ww3CxewbZKVSxWhj1lMYFcU8OJyIqPpZPQ=; b=YfSSwKiwuJ/C+w
	LiUcjORMWmGE4sNqaCNgn1eH3bKmS9cE6W4sYayWtebc66tOk5ztvyZfIu0qdNHx75XjEfhUm2brs
	kuikc8I876+EaZUlzKIHg+jqYI3lrYevF0+t+xKD073ACCFhj8ta+1obw7SiEqRrSQ+GgzwXsHfqz
	25A2MsZU6Jvp9El23m46qkT9koyn3J3Yof4cpfaqccCvxHlokEOPXecljz5MbaTXHGFxN49ERNqpG
	sQ82Dx33FmIzyCJSxVGb+Z87ENLiasAVUp/1JP4YlPaRpzGkunQqchJu1PD1fs9K1R0Z0sAhIVXAY
	2+5mDfsAeaEaxlxft8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAsg-009YiM-OW; Thu, 26 Aug 2021 08:37:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAsZ-009Yh2-WE; Thu, 26 Aug 2021 08:37:01 +0000
X-UUID: 6221707ff8704694b0c70edf133d0fb8-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SlnDhI1+DwM1NOfL6vJOCWQpmeBDc1Q7sW6eQODMaig=; 
 b=PX5lV6jX5F97euWb4KysZScL7aXhG3cB7zYJkkDDGOSvSrbKuzTGh0X1jNWCEXghvy7/tcEZ1JQz50b0TyNADkrB3yy7t03X+W0jHLO9U2p9whcKclNUyU/byICNHNaDbntufHB2ATty3lv8tHXL4XcLGRBUTcYjXIEbN63wVOM=;
X-UUID: 6221707ff8704694b0c70edf133d0fb8-20210826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1088556555; Thu, 26 Aug 2021 01:36:53 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 01:36:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 26 Aug 2021 16:36:38 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Aug 2021 16:36:38 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH next 1/2] usb: mtu3: return successful suspend status
Date: Thu, 26 Aug 2021 16:36:36 +0800
Message-ID: <20210826083637.33237-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_013657_492695_66C2F6BE 
X-CRM114-Status: UNSURE (   9.28  )
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

Forgot 'return 0;' when suspend successfully, make the mistake
when I split patches.

Fixes: 6b587394c65c ("usb: mtu3: support suspend/resume for dual-role mode")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 81266f34986f..5b3f7f73cb40 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -502,6 +502,7 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
 	ssusb_wakeup_set(ssusb, true);
+	return 0;
 
 sleep_err:
 	resume_ip_and_ports(ssusb, msg);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
