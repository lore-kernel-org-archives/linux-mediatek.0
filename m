Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097FCC33CB7
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE252206E6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRYjB7JA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PEkYNhdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE252206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=drQBFrKi0v8o+AQkRSnLl7QdawEwjhZXrnPwRetflOg=; b=nRYjB7JAxCB2PM
	Ouazg6qEn9jmtM3cH/tjSCopuUZ1viDzeme6Llwjnq8dc2eljPiasYJvnQqj+/krRH5VLyjz+vKEc
	ltQnRL43zMsrOEQpBnBQ8Mf82T06UD1urSOcOvafVWc0smMZNOusNf9detImWH5vIrpa4BRUWie/2
	b+fWiOE2knSGNpa37iGA2MiPQJ7ipa4lHDhfaNsIdUeWzPE66HfbnOsxBpZLby0bfJBhJ2B2glo8v
	uiHtVXNNSOmMkDJtNfJiT2uO9OSemE6if9IvEhxBLDK9W6ArZxrA1D7gojXzBbpv3XA0WENTA8J9n
	j1aI8uQLUXTEtSSPrhRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixuwK-0000Fg-KT; Sat, 01 Feb 2020 15:44:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixuwI-0000EP-Dq
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 15:44:07 +0000
X-UUID: 6440c062322f4f5a9a36ebb0f2ff9c52-20200201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0csIRJLeMgqFDBc0WpZNMpF4/Ash9iE+C/byhNFJPjE=; 
 b=PEkYNhdUxe7MNeplDFBtV/7+EsJT9/a4b+ZdWgvNFsJJJq5EpJjG0nICR19/7GsqK1DPb6KjCS0pqLamd3km9kch05lOSk1NTkjKpTs+A0a5luzDDEfvhhrFKUkM7dsW8XoXNLclNSGFlz4BlxsUViFMdT3u6ys1QNnIQWIhNdU=;
X-UUID: 6440c062322f4f5a9a36ebb0f2ff9c52-20200201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1030051653; Sat, 01 Feb 2020 07:43:59 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 07:34:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 23:33:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 1 Feb 2020 23:31:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 0/7] switch mt7615 MCU command format from v1 to v2
Date: Sat, 1 Feb 2020 23:33:45 +0800
Message-ID: <cover.1580565624.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_074406_475700_D67C0288 
X-CRM114-Status: UNSURE (   5.00  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Josh Boyer <jwboyer@kernel.org>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This updates command flow to adapt newer firmware version.

Changes since v2:
- check the return value from __mt76_mcu_send_msg.
- rename dev->fw_ver to '2.0'.
- simplify is_v1 expression.
- revise commit messages.

Ryder Lee (7):
  mt76: mt7615: simplify mcu_set_bmc flow
  mt76: mt7615: simplify mcu_set_sta flow
  mt76: mt7615: add a helper to encapsulate sta_rec operation
  mt76: mt7615: add starec operating flow for firmware v2
  mt76: mt7615: use new tag sta_rec_wtbl
  mt76: mt7615: switch mt7615_mcu_set_tx_ba to v2 format
  mt76: mt7615: switch mt7615_mcu_set_rx_ba to v2 format

 .../net/wireless/mediatek/mt76/mt7615/main.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 577 +++++++++---------
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   8 +-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  20 +-
 4 files changed, 310 insertions(+), 307 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
