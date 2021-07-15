Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CDBC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:12:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE1B61260
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE1B61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xHBxwk2IRyH2f/WJhBQoLNrIP5d7IP4MERjHrR4AfG4=; b=Od3RjpFHnUjNh5
	NtaBASsJwZiEv7Lj4H3BncbCIJBoWUw1cuBUMrAEN3fJz/+TgyBRohD2OUk6c+ZOjPY3L5yZHrZWI
	7d9bDF+pHxBkxVePGeF4F736WjVU1zg8c4paFVFLmW8Ln9ll3BXjkWc1/n/pBhGqFtGl39+5bw/NF
	1VMNnILUD823t0v7mk/2EH6ClwL5eBYVKJiMkWYHRMNOyBh5eHzkgk3gVIJ7QyZcW0ILSMK+CTox3
	ZX/BmdLVO9eRQ3ASp7uuF+TduUe/U9XTsWtDECuKVnFltHfNOhTVHRjN+CqaTBNdm5xEh9ErivnLd
	WcBRvTGLd5sjOTuf2qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xPm-0004O0-SK; Thu, 15 Jul 2021 09:12:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xPK-0004FW-Aw; Thu, 15 Jul 2021 09:11:51 +0000
X-UUID: 5f5e2cc811d54a9796fe7671f71eceba-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=UDDf2PSZSI6SITUDxxQeSaUB6yyMWSIKF4sb+gVdE+4=; 
 b=bVsFC3/oqDaIdXyaWHSGRyOtqkYeIQvoJE+Q50Q8WYQ3qSCbsKU4oAvrysXUdPg9zH69uuOFTldmob+C1K3Cf4i2qqA0Au46zUtTJFTJMw7rL5hMBifQW7v6fSamCPkObcd9R0iHDKxWL0/bnO0sFY9LrfsRUjmMc0WI+lYd7PY=;
X-UUID: 5f5e2cc811d54a9796fe7671f71eceba-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 683191325; Thu, 15 Jul 2021 02:11:46 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:10 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 00/13] Add support mtu3 gadget (runtime) PM
Date: Thu, 15 Jul 2021 17:07:45 +0800
Message-ID: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_021150_448607_D54D6367 
X-CRM114-Status: GOOD (  12.43  )
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

v3:
  add Acked-by Rob
  fix use-after-free issue when probe failed
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
 drivers/usb/mtu3/mtu3_plat.c                  | 166 +++++++++++++++---
 include/linux/usb/otg.h                       |   1 +
 11 files changed, 457 insertions(+), 75 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
