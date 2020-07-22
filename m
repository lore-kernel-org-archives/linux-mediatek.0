Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3857AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:34:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F6F2065E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNgDC66F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JAxcXppL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F6F2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c20kEBs91NXnTyXacgVaHn3kOvZ9Fa9Vja0xrv4M0+w=; b=oNgDC66FIBa2aN02YmymlLk0xi
	gI729/vkjVESR2TkMCBYdHz9yIWB9wwhfBVPYzmG2mZmw8T8iPU6v3QHZzxdeWWpYn3A/YbSThMjJ
	f+sdfjB7RjlgjTyXX5dEAcTm7VsCFawj039QANUa/P/GCJuTh/qvNpjN1Gwh+pUTeOUqHm1H49bGY
	5GYjngf9hE2mjzERNqD5lCR0K0oU+AGsYtnMZbjgTQojIc0oQlSmCUSPl6/lJ634izVggcl2GC3vE
	Rm3y6vNNRESo+PDJ4nINYt7Hp03KzLwacmgUXgCdGW4oG1WuXlLbraSlzeCRwrK9GhqRAbsI2nCo0
	hhSA7W4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyDwi-0007eM-7c; Wed, 22 Jul 2020 12:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyDwd-0007c6-0Y; Wed, 22 Jul 2020 12:33:59 +0000
X-UUID: 9003cdb47c76486899a351c2955e4637-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y0cZt+gBSz7nBT4q4aJcK/JUpj5K4kPkSTxyRBuk+84=; 
 b=JAxcXppL3ceJmbacPTlcw8bcjFWX9PUJjxdZxJpOrk4P0Zhp9wro4DZyE819vt4ulIyqzJLJMOELiscXyMMJn6ihbn9s79LdK7f+6Hbp34sjb5O3ESXk2WrAa+olLOi7klgv7DceNBb1lIzUbNzh9oiuqsqeqoqhHtwEXmUnhgo=;
X-UUID: 9003cdb47c76486899a351c2955e4637-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1583893711; Wed, 22 Jul 2020 04:33:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 05:32:55 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:53 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 0/4] add i2c support for mt8192
Date: Wed, 22 Jul 2020 20:31:42 +0800
Message-ID: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_083359_244454_F7058498 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.8-rc1 and we provide four i2c patches
to support mt8192 SoC.

Qii Wang (4):
  i2c: mediatek: Add apdma sync in i2c driver
  i2c: mediatek: Support DMA mask range over 33-bits
  dt-bindings: i2c: update bindings for MT8192 SoC
  i2c: mediatek: Add i2c compatible for MediaTek MT8192

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 75 +++++++++++++++-------
 2 files changed, 53 insertions(+), 23 deletions(-)

--
1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
