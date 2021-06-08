Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2494BC49ED9
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77CE61289
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77CE61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ZgBduqTWCP67PXVJK+Dg61j9rG+xFWnIosterIo1GI=; b=jelgND9wLvnPlb
	PUDY7XzBP/vvuXBF+Wb6xhnBH10xmK+E4F68g3MF78m5h8dreAQ6WxVo26pLg1DWsDKZEk4gEyvE9
	UDnw+sFSar/zCOGJ9qN7oFB2GOtRqX/aE82Zsr6AAC5R7KfoMr3lW4D0xz+PSz1JKvn1vSucpc5fv
	C19aS+gNk2q6wq6vEdcnW/Au/WBg6tYmdWAm/kFnTYdUbfb7ovZLTg1Mi2l1Lp9ud4JvdIvwnUs4E
	4Eo1dJRofdafsPULoVzOX2K5obG5ad5yEafNU0JpLwbBLElfaleTR/wbeMguSw/YxVliMWGaDu/DC
	ZAzxqODnwVWeaT07q7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWcl-006tYB-9D; Tue, 08 Jun 2021 07:58:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWcX-006tSm-Cq; Tue, 08 Jun 2021 07:57:58 +0000
X-UUID: 958e4e9aada14ec299b1050edf00586a-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KY96gyMFTz1Qj+V1ej8dY2jDOGZ1hAE+hAler+TvZ4w=; 
 b=AGGI2vYZje1mvm+Sf90dWbXRq+CugcI7WmgYgV4emaCkcIzs+faOVvUFxzipl8mwbqIH9KP3MGtcmZouFCyet91eq11vfGW+uMJfi/iFoHRUO7PD8VNdR/9NvInACcuxUOluD9wh/2FEA9Ejbw5pKq+q/SmsIO6xGmRuKtrG4aY=;
X-UUID: 958e4e9aada14ec299b1050edf00586a-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 528511832; Tue, 08 Jun 2021 00:57:54 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:57:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:57:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:57:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 00/23] Add support gadget (runtime) PM
Date: Tue, 8 Jun 2021 15:57:26 +0800
Message-ID: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_005757_477308_F71A8924 
X-CRM114-Status: GOOD (  12.81  )
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

This series mainly adds support for gadget suspend/resume when the controller
works at device only mode or dual role mode, and also adds support runtime PM,
in order to fix the sequence issue about resume and role switch event arised
by extcon or role-switch, rebuild and unify the flow of dual role switch for
all three supported ways.

Chunfeng Yun (23):
  dt-bindings: usb: mtu3: remove support VBUS detection of extcon
  dt-bindings: usb: mtu3: add optional property to disable usb2 ports
  dt-bindings: usb: mtu3: add support property role-switch-default-mode
  dt-bindings: usb: mtu3: add wakeup interrupt
  usb: mtu3: power down device IP by default
  usb: mtu3: power down port when power down device IP
  usb: mtu3: remove wakelock
  usb: mtu3: drop support vbus detection
  usb: mtu3: use enum usb_role instead of private defined ones
  usb: mtu3: rebuild role switch flow of extcon
  usb: mtu3: add helper to get pointer of ssusb_mtk struct
  usb: mtu3: use force mode for dual role switch
  usb: mtu3: rebuild role switch get/set hooks
  usb: common: add helper to get role-switch-default-mode
  usb: dwc3: drd: use helper to get role-switch-default-mode
  usb: mtu3: support property role-switch-default-mode
  usb: mtu3: support option to disable usb2 ports
  usb: mtu3: add new helpers for host suspend/resume
  usb: mtu3: support runtime PM for host mode
  usb: mtu3: add helper to power on/down device
  usb: mtu3: support suspend/resume for device mode
  usb: mtu3: support suspend/resume for dual-role mode
  usb: mtu3: use clock bulk to get clocks

 .../bindings/usb/mediatek,mtu3.yaml           |  47 +++-
 drivers/usb/common/common.c                   |  20 ++
 drivers/usb/dwc3/drd.c                        |   8 +-
 drivers/usb/mtu3/mtu3.h                       |  36 ++-
 drivers/usb/mtu3/mtu3_core.c                  | 117 +++++++-
 drivers/usb/mtu3/mtu3_dr.c                    | 193 +++++---------
 drivers/usb/mtu3/mtu3_dr.h                    |  30 ++-
 drivers/usb/mtu3/mtu3_gadget.c                |   5 +
 drivers/usb/mtu3/mtu3_host.c                  | 112 ++++++--
 drivers/usb/mtu3/mtu3_plat.c                  | 250 +++++++++++-------
 include/linux/usb/otg.h                       |   1 +
 11 files changed, 530 insertions(+), 289 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
