Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60B8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:28:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58B2206D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRRMmt0p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hw9t9DIJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58B2206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x5qdzsniEERkP3KI5k3qRojuNH1ooDQ9E4opTvq8BFE=; b=RRRMmt0piv9fMmWoihApjf9cXw
	Otum+KCV8WAY9LK6Zg+9rQvnYwn9A5oq+CgeJbT5SlJ3sd7087JQYzGu9nRaIZESCTgS7vVxG/ptL
	tKf4qXSHrn9bcf7sxRaQPPa3sa2nDy13SXQSoFPAiS0WCYv9JqczSqU552UpW+vz0zzDplClLk9wQ
	xOf8efe77G8H7IhnLcMQYfhGCuUR3PnutgbcLDKMt5AfI5kEFE8XhaIII6EXEtGC3fHEH8FRGLEjY
	zxLP8vuiHN3qQhGRx4XVBteu4eaNzcdxexqBhuhDKyBsVOT60dCUdNEPTBTDAjdcHqT3lsFzNp1lW
	BE0qhm7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hRy-0005fq-R0; Wed, 29 Jul 2020 08:28:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hRr-0005cG-PB; Wed, 29 Jul 2020 08:28:29 +0000
X-UUID: a6d54224edaf4d6cb782aafacbb7283c-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zqAS3nqWwaOf1gLGTu7eXkZFRUc9KnRMoBc8x/BNB/Q=; 
 b=hw9t9DIJBI+WRbeCFfS7aeTceU1YYHlEiVQeo4BSahSyIaI7Q9s7eQ+EunQi6R5cEmKfNEMZHlimgn7Vp98MAfQlDBNsXzUG87BWNfKMqszR9Vx32pWhRtZkEUzV+BGJFTvX6FH8iThKSKEgFu5+NEJ2cVvbuQW6LZW0kVJhiiQ=;
X-UUID: a6d54224edaf4d6cb782aafacbb7283c-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1920095358; Wed, 29 Jul 2020 00:28:35 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:18:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 16:18:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 16:18:10 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4] Add MediaTek MT6779 devapc driver
Date: Wed, 29 Jul 2020 16:18:08 +0800
Message-ID: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 573D8C7EE0780E84BDFC8EEBE19C98008274176CD6A0AF13C469C2C807706FB52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_042828_024378_D46F7553 
X-CRM114-Status: GOOD (  12.73  )
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
  soc: mediatek: add mtk-devapc driver

 .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
 drivers/soc/mediatek/Kconfig                  |   9 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-devapc.c             | 323 ++++++++++++++++++
 drivers/soc/mediatek/mtk-devapc.h             |  54 +++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c
 create mode 100644 drivers/soc/mediatek/mtk-devapc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
