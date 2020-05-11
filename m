Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A2C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0817206E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gv6wDBjy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NizgOmG0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0817206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JVA8q8RpmlkfN5tYDhui2+OYDmJG+Sjr9VuZszKTyz4=; b=gv6wDBjyp50FPy
	S8Usvz82yUl2juRD0TBkM1iDlsgo0nleZ4NLMOrKtLcdYAvZUK4Q3vOd1i+aLGXGE0Trz+KreIzyW
	OT6rqZ0sUxcpAFyss4TIgHVQ8uGJkJt3IM3KiN1DlNOp3UObx54jWfW0JbPDHTiK6FGZ6Vo13hi/t
	xoV7P5EVsr6IT9tptLHkvZtNK0gnU7qdv04QKbgkW5+WgadrWVhWIG+D7KYwvXAqX6NCwFnwoyoCa
	THnjqA1i/wCN2KALXNRYrgRJt9R/4K1h9hr+MC+iuC8e4VJkbRtLOqoPesEovKcvoDzEU69kLo0Kp
	nbT8QtYBJULD3Wy8Pz0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxP-00054R-19; Mon, 11 May 2020 16:07:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxK-0004x3-Kq
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:04 +0000
X-UUID: 62dd076eecf745379442601778eb77ef-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GiF5ILJq4wBAN4esndmcCiavOhFccrw4Q/IlNZ6dRuQ=; 
 b=NizgOmG0S93BlGeHZ/7WiyP5HqPnbY0LTl3JokMzE9C8HM1F9/G0RAMeufjMtSgHEDkZQt0KGRVoQTGDcmv3ClHgl5KhsUl85xHOEVIJlCeFYO7HJq+rFLe54is1CvElf1PmeBkaf5Wraiex8lnkoWfOmSK59103WMQFl33lmWM=;
X-UUID: 62dd076eecf745379442601778eb77ef-20200511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1969053287; Mon, 11 May 2020 08:06:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:39 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 0/7] MT7915: add TxBF support
Date: Tue, 12 May 2020 00:06:31 +0800
Message-ID: <cover.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090702_694863_CB959B76 
X-CRM114-Status: UNSURE (   5.71  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This enables the SU Tx beamforming support on MT7915, and will enable MU part soon.

Ryder

Ryder Lee (7):
  mt76: mt7915: introduce mt7915_get_he_phy_cap
  mt76: mt7915: add Tx beamformer support
  mt76: mt7915: add Tx beamformee support
  mt76: mt7915: add TxBF capabilities
  mt76: mt7915: add debugfs to track TxBF status
  mt76: mt7915: allocate proper size for tlv tags
  mt76: mt7915: fix possible deadlock in mt7915_stop

 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  45 ++
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 118 ++++-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  49 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  28 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 457 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  99 +++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   9 +-
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  20 +
 8 files changed, 734 insertions(+), 91 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
