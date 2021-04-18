Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4973FC433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B028161165
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B028161165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DUZBmlFNnBJKGr1EmJWxIjzw5HWqz23ADUeoNaCPkuo=; b=gKvWP1mBIlQddFUjlR1K+D76Xe
	PBLkglshjcOU2Shg33P1WXh0ezgaEr5xNqXD8etDCq5eTPG5jFJ5Y1lInt/2303cBqQn2HFssokXY
	+EyCmbIHixB6ssrrf62Zu3h9FEmCAmgNWcHPX5EaPOCa7cxLZONftAWrYKXCy/WzF0Z964mjYFLkV
	YgglitAAnla4D6PnZBT3O5m1Eahr9QxPgTFPXHVifHhOOv5SFcHXSO8N6qQnhdeAP+8Rpoob62j/i
	pDKr7H8Rpo9jL7arXEOJK3bTEkz0Rn/Sbhsspsdbg1/Gct6Qg2zwtvQDC0IeojDjfUtWjbql8SAXT
	XYoBDPwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAPI-008Jy2-VI; Sun, 18 Apr 2021 16:36:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPH-008Jxp-Jx
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 16:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=MKtckZ9e6dIdAY3m77YIkrdAKCLzyRNEmGUfZbt/WRs=; b=WSZduM3fgQ+oxhkaByEx9vHUBg
 PLdZkbC0YrkmODNIRHtfzm9RiBMq0t8T3ko7hoKcXb9EfcEoYujyOk2o1KkoQAAubIud7k3utUpsl
 qYXeEYSdQLzU/BehXu2clt66bjllcZgmkUHHDDmN4nsOLueWOmDL8QfuCH0+d020tcHDiyxYuhY+t
 9Ezn6vvpNs6lvpxIeV3j/f8vW9Eqsjkx9dvOL3q2xoC8jrDUSKSP7aFP4carOCe91Qiee2aGr0I29
 pS5h7ll+3hQLNKW+0qaa86+NMnryLDhHmosVoiW4/63+wPECLMvVwgOAWnm6n0B7+/7J/AqcF/v7y
 CihRawBg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPE-00AVnw-Dq
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 16:36:21 +0000
X-UUID: 12795b3faf064e4982c696a7ffa72395-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MKtckZ9e6dIdAY3m77YIkrdAKCLzyRNEmGUfZbt/WRs=; 
 b=RHgdB5SrpRohKpgS7VWTJUD2FXvgDIw7un1j+GBQLmDOHh55bh+DyfZYNFix+sesDWd7yaNn73jcWcv5Td/iKpCahdavDYNRSemQcjLZbxnTfJ95UgCUFX+nQ+AGH3HP4K0BCNG+IFljUI/rnczC2WhG0jfJA6DqMHYnPpCLmck=;
X-UUID: 12795b3faf064e4982c696a7ffa72395-20210418
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242685052; Sun, 18 Apr 2021 09:36:12 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 09:36:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 00:36:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 00:36:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/6] enable deep sleep mode when mt7921e suspends
Date: Mon, 19 Apr 2021 00:36:01 +0800
Message-ID: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D5F2C5E062484233DDB16F9FAC75FFDAE0388D0C83E5CA575D7753A9C2DBD612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_093620_492830_0BF81C92 
X-CRM114-Status: UNSURE (   6.39  )
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

From: Sean Wang <sean.wang@mediatek.com>

Enable the deep sleep mode in suspend handler which is able to reduce the
power consumption further.

Lorenzo Bianconi (3):
  mt76: mt7921: move mt7921_dma_reset in dma.c
  mt76: mt7921: introduce mt7921_wpdma_reset utility routine
  mt76: mt7921: introduce mt7921_dma_{enable,disable} utilities

Sean Wang (3):
  mt76: mt7921: introduce mt7921_wpdma_reinit_cond utility routine
  mt76: connac: introduce mt76_connac_mcu_set_deep_sleep utility
  mt76: mt7921: enable deep sleep when the device suspends

 .../net/wireless/mediatek/mt76/mt76_connac.h  |   4 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  22 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  10 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  13 ++
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 204 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  93 +-------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   8 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  12 ++
 8 files changed, 215 insertions(+), 151 deletions(-)

--
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
