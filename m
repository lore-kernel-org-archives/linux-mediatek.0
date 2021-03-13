Return-Path: <SRS0=A4vX=IL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A15C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 08:17:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5601B64EF2
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 08:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5601B64EF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/D6K0CLK2c/0qkWv8Wy3rKfeixjXsdDy1cBFpEYqXk=; b=EtyCN3leEhPln2DEpuWQpJWCky
	E9yqM6bSD2wk86Q2TV4aEUd44BOaBW+ZGhaPzIEzTHgFWhllYWRDdu4KdNHeo+OB1DAH+cFl1RJmu
	h5YwgMVZOTPuq3Ji+VPlVm5VpxYDY4003+G79OLs5CfpDZX7Zor6dUU5v7qQnx+0wiS/qLra92SC2
	tHA1nLO3mzZ6tE/zc9c53D9L6/0ssVPyOy7xXJhjrG7nhhj5VDPs/LulEAruOL1sfCttCbl2LZcsZ
	EVsfOEKvDNWoFEr4EaOm3BOwXXd+IVqQtsRxvxIfbqV3vW0ehdXsbz2hb5Vgp3rmy3OCyCaGB7wzi
	VRS71Tjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKzT2-00D0CH-5T; Sat, 13 Mar 2021 08:17:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKzSe-00D0Az-CL; Sat, 13 Mar 2021 08:17:29 +0000
X-UUID: 841a315bae0f4022b2fd3fe746ce0c76-20210313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GtI2vYYB9CAiabJltqxFldhVldGiKnjQFrb6s7EPY3Y=; 
 b=ffZ59rKVfPM69iyPEt4eVJbHIi+xHG4WFDB+Tigp9n01WKjrTpPaLiA9avdPu+i1bDzjIDxP/JsCNe5CfKt6E98MaI9aHFc+PXQVt/ybq4S6C5onf5FNpblkPEf5tH2FKcGk4WAyDRD+y2/gOjwGrNeELali4/RmYhtAphnBkfM=;
X-UUID: 841a315bae0f4022b2fd3fe746ce0c76-20210313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1993541750; Sat, 13 Mar 2021 00:17:19 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 00:07:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:07:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 16:07:14 +0800
From: <qii.wang@mediatek.com>
To: <robh+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>
Subject: [PATCH] dt-bindings: i2c: Add device clock-stretch time via dts
Date: Sat, 13 Mar 2021 16:07:09 +0800
Message-ID: <1615622829-15167-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_081727_142935_6845D8B7 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Qii Wang <qii.wang@mediatek.com>

tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
clock-stretching or circuit loss, we could get device
clock-stretch time from dts to adjust these parameters
to meet the spec via EXT_CONF register.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194f..97f66f0 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - clock-stretch-ns: Slave device clock-stretch time.
 
 Example:
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
