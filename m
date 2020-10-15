Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEDCC4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 03:23:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298342222E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 03:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gv7FoZf5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tJhrLAB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298342222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5lJqqHHtpt9ReZLgA731vbhqIRD3T86X+D4Z0eDhccU=; b=gv7FoZf5LiHWXV15lq5hdt8EXU
	e627y2MslpX7lxHkZJGAgV84hwsoW0NUUBXi0hyk5UDigaZKtLXsd7JhJYDxmW4/gAHRQPOrW0dvR
	YtiqdmFHYvZXYcBpjEzWT0I+VdWjCcyMHtNB6jopmBK0KKGUQqlUNLIPs/wiUUD4UlsH9WXuWH0NS
	HtaZjDVBDZPoZaMfp93UVzU/r0aqBRral7GbHKnntyQdcL5OPS2Z9bbhrMZWp7LfxRXsQYeB8kI3r
	hxCuzNJyb15PjOPLw2mQwjrj08tDX1IbNy3w6nNH5Vv7FSyzGda6h/Zl027626OPyeVs5Kz9MxnrT
	kWGsQ0lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kStrY-0004uo-Gn; Thu, 15 Oct 2020 03:23:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kStrU-0004ti-NJ; Thu, 15 Oct 2020 03:23:29 +0000
X-UUID: 5f176c17fd274da3ab7419d3988adb91-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vt87zy5BJM1AmjZx6qAP3QE6Ib1rAbIpP0es8xsUK4Y=; 
 b=tJhrLAB62qidQrVMKhkT6wzdSrfoVV5Fah16+Jkm/OithWi+kzNCI0A/eq1iO23Y1ISmzTpYJ5V8bipbTM5vZcjehknDEWnbM+YVKldpUuZ6hZtyDJ9eB4TAxN5XSS93Iz2VpePp3+owPvLkyafs0sNvsjFYyt56m7uGvA/ahkE=;
X-UUID: 5f176c17fd274da3ab7419d3988adb91-20201014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1880908448; Wed, 14 Oct 2020 19:23:24 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 20:20:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 11:20:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Oct 2020 11:20:40 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: 
Date: Thu, 15 Oct 2020 11:20:37 +0800
Message-ID: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_232328_918383_1C87FFEC 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduce a MediaTek MT6779 devapc driver.

MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
The security violation is logged and sent to the processor for further analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
The violation information is printed in order to find the murderer.

changes since v7:
- fix VIO_MOD_TO_REG_IND calculation wrong problem.
- revise parameter type of ISR.

changes since v6:
- remove unnecessary mask/unmask module irq during ISR.

changes since v5:
- remove redundant write reg operation.
- use static variable of vio_dbgs instead.
- add stop_devapc() if driver is removed.

changes since v4:
- refactor data structure.
- merge two simple functions into one.
- refactor register setting to prevent too many function call overhead.

changes since v3:
- revise violation handling flow to make it more easily to understand
  hardware behavior.
- add more comments to understand how hardware works.

changes since v2:
- pass platform info through DT data.
- remove unnecessary function.
- remove slave_type because it always equals to 1 in current support SoC.
- use vio_idx_num instread of list all devices' index.
- add more comments to describe hardware behavior.

changes since v1:
- move SoC specific part to DT data.
- remove unnecessary boundary check.
- remove unnecessary data type declaration.
- use read_poll_timeout() instread of for loop polling.
- revise coding style elegantly.


*** BLURB HERE ***

Neal Liu (2):
  dt-bindings: devapc: add bindings for mtk-devapc
  soc: mediatek: add mt6779 devapc driver

 .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
 drivers/soc/mediatek/Kconfig                  |   9 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-devapc.c             | 308 ++++++++++++++++++
 4 files changed, 376 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
