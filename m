Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DF2C43457
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2234C207C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SQuNzFxz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iVqFjW8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2234C207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qmdegnn/JPdOXVJVYmgTv8RX/MwPpZZJvbwFqZ9JuBU=; b=SQuNzFxz1LLLnd2CONRvxq9XW
	pLTnJpJlapY0ldFTAyGpgMMtuiipVPCqtG0P8VmupEKWSwjf00JsrJcy/NzjcskMU59YwGfV1rPRS
	vm67G3OC94eGc4eiZe09m930NcVioUnYo9NN86mwcfsOLFijeJcEGoUfzLSMBreTq7oPKcmLkFpBn
	E8UDH0WVbXMiPBVfK0g9WTqvryLbXKHj2cRrQmKok4Jxldn+2RVt9fVHC+mK+qWAFlRvlMmGgFDuv
	cbLN1CU33CT3PSKcDl7M/WqY0kxuMmeUvpwUz0Lemv7siguAsVlwazESjUdjEtytbA8IsbQ+UECz6
	3AFaUYaaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRAdW-00081w-8S; Sat, 10 Oct 2020 08:53:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRAdO-0007zA-KD; Sat, 10 Oct 2020 08:53:47 +0000
X-UUID: 810d0a89382a4ad79ba8b4d08fb714d4-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RlwrqT0bs3PS18yXEe3g2df8bGwD+XRsEbZm4K541oY=; 
 b=iVqFjW8gveQ4Y83ZtN1Ng9j5rKzueq/uqltRLuWVFMtHLS4vfF0CKoghxp8ALDhCm7nvqUC7dxQOCc0bfI2YvNBWp57gjHS+EwdaZUiAzwAMJ6X+j7q9zeSOS0fQVVszj5Njo6eTbEhjuTilPo4riBYXjI/IJQq9zUUa+O2WKmg=;
X-UUID: 810d0a89382a4ad79ba8b4d08fb714d4-20201010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 600352050; Sat, 10 Oct 2020 00:53:22 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 01:43:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 16:43:15 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 10 Oct 2020 16:43:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/4] dt-bindings: net: btusb: change reference file name
Date: Sat, 10 Oct 2020 16:43:13 +0800
Message-ID: <8b7dcc3e524dbf93a8c3cda5fdcc15362f3d1e26.1602318869.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5A2428CBF1E4D8350554801BDB74F1CB58F8D7B7EF0764F4C82C613BCAE61E892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_045346_797631_20C21583 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to usb-device.txt is converted into usb-device.yaml,
so modify reference file names at the same time.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 Documentation/devicetree/bindings/net/btusb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index b1ad6ee68e90..a9c3f4277f69 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -4,7 +4,7 @@ Generic Bluetooth controller over USB (btusb driver)
 Required properties:
 
   - compatible : should comply with the format "usbVID,PID" specified in
-		 Documentation/devicetree/bindings/usb/usb-device.txt
+		 Documentation/devicetree/bindings/usb/usb-device.yaml
 		 At the time of writing, the only OF supported devices
 		 (more may be added later) are:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
