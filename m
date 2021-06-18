Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8489CC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421D0613C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421D0613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TP8PMt33PUbGKP8l5xow1jXdJzVVfZoGCF2oEbSZmNs=; b=zM145DyM08LJyZ
	rBg3XEd6B7uj+qbPcP6AGSlVYd0X0J9fDfFc5oxIYh858IAQG3fKr4AG6M5nYhRJ9xeid5LUzLbgK
	+HOQzZFt15CXd35UWYapWwbZleFrXZf53U2Zbim5MRvaIW5xdd/zSHVtEtFFN8RYf1+6R72P7q5dJ
	bhZyhzN2UEpurhXIS7rE0aTXXAFJ4qiK23SMgvTVvTFu4AgqlMOD7dyJPK51vNc91nCEvf9S2jqFu
	OKUn/qQRpC1FB49SInfjdqxAMAgnnhf+9xOS8Mi787N0MTPxvTTZ9hosMAsC7UTFGNBUTnTyOq61F
	ecrxqQKgA/fFhZol3nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luAwr-00DXaB-B5; Fri, 18 Jun 2021 09:38:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luArL-00DU7i-Nb; Fri, 18 Jun 2021 09:32:21 +0000
X-UUID: cbbb6111c2c5448fbda3a961a515f177-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SmDfECJw2+04FT9mA17PNkFAozNlEVpzMGmPP9TOHfs=; 
 b=PMyr+J19klqqr1tkySTLXwh2yfc7+dWGRSZUH1bIHuDKmzgfu6pNdieedMM0xMdesFyTjKaRTIp2SAjaWU4XcuSJvLj8b1p82FIlxCWUsGwV0QI4fpLwylWEAAAAdrIVwSOU3iJcRhhnQTGffSBKFL3H6H1baXwKvoAmVvAAqNQ=;
X-UUID: cbbb6111c2c5448fbda3a961a515f177-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 427985216; Fri, 18 Jun 2021 02:32:17 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:29:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/13] Add support mtu3 gadget (runtime) PM
Date: Fri, 18 Jun 2021 17:29:05 +0800
Message-ID: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 26C31FCAC5283B28118C0F50593B1879843ACA62262EFAA58B5F54223CBFBE622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_023219_840110_7808C6E2 
X-CRM114-Status: GOOD (  13.07  )
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

This series mainly adds support for mtu3 gadget suspend/resume when
the controller works at device only mode or dual role mode, and also
adds support runtime PM.

v2:
  Change the comment of cover letter and its title.

  In order to help review, v2 drops the patches about role-switch
  rebuilding which are applied, and the left ones are identical.


Chunfeng Yun (13):
  dt-bindings: usb: mtu3: remove support VBUS detection of extcon
  dt-bindings: usb: mtu3: add optional property to disable usb2 ports
  dt-bindings: usb: mtu3: add support property role-switch-default-mode
  dt-bindings: usb: mtu3: add wakeup interrupt
  usb: common: add helper to get role-switch-default-mode
  usb: dwc3: drd: use helper to get role-switch-default-mode
  usb: mtu3: support property role-switch-default-mode
  usb: mtu3: support option to disable usb2 ports
  usb: mtu3: add new helpers for host suspend/resume
  usb: mtu3: support runtime PM for host mode
  usb: mtu3: add helper to power on/down device
  usb: mtu3: support suspend/resume for device mode
  usb: mtu3: support suspend/resume for dual-role mode

 .../bindings/usb/mediatek,mtu3.yaml           |  47 ++++-
 drivers/usb/common/common.c                   |  20 +++
 drivers/usb/dwc3/drd.c                        |   8 +-
 drivers/usb/mtu3/mtu3.h                       |   8 +
 drivers/usb/mtu3/mtu3_core.c                  | 115 ++++++++++--
 drivers/usb/mtu3/mtu3_dr.c                    |  26 ++-
 drivers/usb/mtu3/mtu3_dr.h                    |  30 +++-
 drivers/usb/mtu3/mtu3_gadget.c                |   5 +
 drivers/usb/mtu3/mtu3_host.c                  | 106 +++++++++--
 drivers/usb/mtu3/mtu3_plat.c                  | 164 +++++++++++++++---
 include/linux/usb/otg.h                       |   1 +
 11 files changed, 456 insertions(+), 74 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
