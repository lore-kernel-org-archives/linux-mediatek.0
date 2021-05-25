Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6355C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39FD613F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39FD613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXTKp2cWcKMb9QHqCEIz7Rrs37gKy4WXmRoqOFG1nsM=; b=yk+A3khQTYMC6n
	SA1MJMDEYY6ZDWlTugNeHkLeIy69R7fiSDGLe8QYeok7gvq5mdOpR58WdFTRkmHeRmLDd7s3ESj1b
	eyzjv8VCZtdcXOemEmin/O1Ikd1oClH/86NtGfn0VPXRmOAJOOXddsKb6xAMUwvRGdJbtar10zsyC
	jd2f6CNSZhZuB0Gu2VtoH01kO3BhL+lM+wg3yu1iCSZyTCiielowDvh2zg00N/TZ8tRvg+7kDubhs
	RCcmmLF0yMOlABQvfH2qN4kC4uDGrIoyB1TQyxC+J+g2C1xLPPwuyzGBcnfi2cnqtXy/ZFoh7unPH
	urZJTKjAy34TWEV7VNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSua-004EnY-AZ; Tue, 25 May 2021 08:59:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSuW-004ElA-QA; Tue, 25 May 2021 08:59:38 +0000
X-UUID: 42457dab3ff349359f821e4149af1c3d-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TfNlcLUA2ZIU63dXxswsfjCNfMJap0carwNNiCaUKzg=; 
 b=uVIs7gGadEN7ZJs1Y1UAGsscVSJAkcu+uabLqCjx31RLC43vB7o/xV4+8q7KP9ly+SVXGNdy2GkADZY8RIt1ZQ8KbYEN9JBcxsFpShUZbn2JK8QkoCGMlA/BHmgoQcnVPgXZOsTkIjv3EEfUwejh93rEDxCx1bG5MyjWq9ozKvo=;
X-UUID: 42457dab3ff349359f821e4149af1c3d-20210525
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1708606250; Tue, 25 May 2021 01:59:35 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 01:59:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 16:59:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 May 2021 16:59:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/3] usb: common: move usb_get_dr_mode() kerneldoc next to its
 definition
Date: Tue, 25 May 2021 16:59:23 +0800
Message-ID: <1621933165-9661-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2977430AD55DCCDB2143F58A4BF46AD99FC6668D274A0FBE524214208E31C2FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_015936_893324_E664EE5D 
X-CRM114-Status: GOOD (  13.20  )
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

Following a general rule, add the kerneldoc for a function next
to it's definition, but not next to its declaration in a header
file, meanwhile fix typo 'correspondig'

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/common/common.c | 7 +++++++
 include/linux/usb/otg.h     | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 347fb3d3894a..fff318597337 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -187,6 +187,13 @@ static enum usb_dr_mode usb_get_dr_mode_from_string(const char *str)
 	return (ret < 0) ? USB_DR_MODE_UNKNOWN : ret;
 }
 
+/**
+ * usb_get_dr_mode - Get dual role mode for given device
+ * @dev: Pointer to the given device
+ *
+ * The function gets phy interface string from property 'dr_mode',
+ * and returns the corresponding enum usb_dr_mode
+ */
 enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 {
 	const char *dr_mode;
diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 69f1b6328532..a86ee6aad51b 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -120,13 +120,6 @@ enum usb_dr_mode {
 	USB_DR_MODE_OTG,
 };
 
-/**
- * usb_get_dr_mode - Get dual role mode for given device
- * @dev: Pointer to the given device
- *
- * The function gets phy interface string from property 'dr_mode',
- * and returns the correspondig enum usb_dr_mode
- */
 extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
 
 #endif /* __LINUX_USB_OTG_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
