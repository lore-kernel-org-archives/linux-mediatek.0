Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06140C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:17:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9C32078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTMoryTk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gx5ZakSe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9C32078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QWG77Rtx4pTEbIEoF5IOS66MyWfFy4HH3lDVRPZSDO4=; b=iTMoryTkFVn32ARLJbjkJ3gPpc
	j06T1KNWUDYggVnFg/d7f+Sw50w1/toeza3u1YRvRSrspWBnkOxAK0GuDH1Gcdc4UlVDALGgr2cXV
	/+1eaxIqfC0Rce+19x/dNqMu5Kg5u4slCNSHaA/dHKJvuXcX5ONtzgmFGpC3Y+VX1CPC4Up9s78oB
	NmPZltXRVIB8YQaZD3UAZ21Uq36FvtzLZDyNbYpAIlrawnbw2WdC81OF42VmTTlRcAT8/bpohsBm3
	zHb/bPXVcAewWUnkC7D5PTkOIad1QDN47SExqUBo/GQxL6AobT0LQ3+XC7+beQ6VgYB2HpuqUv6mQ
	JrxHv+yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB8Pv-0002DQ-89; Thu, 27 Aug 2020 03:17:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB8Pn-0002BR-QE; Thu, 27 Aug 2020 03:17:30 +0000
X-UUID: 69a47a6890c44b7abbf985a2ca6cd4db-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FtU44mDEUdVSDcs8ksi9dkzgI0uzEvYCzf0R73J3rdQ=; 
 b=gx5ZakSeYZ98h1tHYnWx59z8ewgvoSOATHv+dbhE+b0dTNHFVVjhRE0lItt0BZxUWB2SQkdppCY21nqyOaLBDy+ulUxla0wkQScbtHAMDOylOrz5yq9tFajkcA1VH9epqw+x4AL5Ld9J6csM09VT1TRTLEVsZWaZDF7eZCeLDHI=;
X-UUID: 69a47a6890c44b7abbf985a2ca6cd4db-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 831907032; Wed, 26 Aug 2020 19:17:11 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 20:07:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 11:06:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Aug 2020 11:06:34 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v7] Add MediaTek MT6779 devapc driver
Date: Thu, 27 Aug 2020 11:06:31 +0800
Message-ID: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 42DE1FA7C2D2CBDD32C793D8FCED04030561614808926235ED5937E19CD7B4E92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_231728_701364_0F33FEC6 
X-CRM114-Status: GOOD (  14.11  )
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
 drivers/soc/mediatek/mtk-devapc.c             | 305 ++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
