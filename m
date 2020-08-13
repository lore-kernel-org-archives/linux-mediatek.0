Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9741CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 03:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59597206A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 03:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDDdwhfH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jyhh3iR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59597206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XDzRpce/oOC95DRGhQ5ZeNpaHYuwDKK+edexmShYH2o=; b=vDDdwhfHqFDH8iEgJRKd6kqS2O
	JJjgUyTn7s2jQU6OHHWd9Qw4L55e6lxOMN5pJ3K47AgsVK6Pzem2PdMy6ehcV8yue/bvjLqAdgD0Q
	0ukzpKIQTxuFHw8+PrUNBtxD2uyZiUdH1jtqRELcZC8su/3Ht+dA086/MS01cP/elcQzTXPNmBnCZ
	1E7y50hIjmrTirwzTNkoGI/hsEkxxu8L3fP8vaWhnD29B7jWReCxAzJPESVIbKZeVOjd5FxEzdCDQ
	nAe7DU3CBQs73W/nfqJgp0AAHopa55rhk4rWWr/42H2d8MevyKNSMGDUMbBblmkFPU5jEJWA4e4i4
	V4mhYLog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k644W-0001Po-H4; Thu, 13 Aug 2020 03:38:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k644R-0001OT-0Y; Thu, 13 Aug 2020 03:38:28 +0000
X-UUID: 97c09ab51ee84ff2989ab8f49d801905-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GXyvs9gvhHEWr1UkIPbeOiv49/Wc3S/k2qDEZ2S1xYI=; 
 b=jyhh3iR2ZpSIvxNkbT9EcJ8oZk9lkvrhSnqVbAz2nTpsrmyo0AdyGz8XOa6gjpmWFPBwbLhfUQmL/6D89scfB0FegeG7vogccqO3Uu4g/zAlOnC+eqnE0WjugKD1Gdza8BHM1IessAxGw9zoFvijMivs2AK90ZKRiHZU/xudcOE=;
X-UUID: 97c09ab51ee84ff2989ab8f49d801905-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1983654190; Wed, 12 Aug 2020 19:38:21 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 20:32:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 11:32:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Aug 2020 11:32:45 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6] Add MediaTek MT6779 devapc driver
Date: Thu, 13 Aug 2020 11:32:42 +0800
Message-ID: <1597289564-17030-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_233827_275446_8FA5428F 
X-CRM114-Status: GOOD (  14.08  )
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
 drivers/soc/mediatek/mtk-devapc.c             | 320 ++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
