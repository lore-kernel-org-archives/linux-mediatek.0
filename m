Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6818C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589216023E
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589216023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PHHWqSISsRWL8a77ez/piPXLf9fpy6gyzwbqjie3nBQ=; b=Qj21juJ0fYNX6yCPW29h5BdFoT
	WJ+40qaLTum+Ttr+qnN7ipB9tjaWDn2qlCLWKjTrNKS5B+8FDthC67NcgkEXS3aat8yjJhZAjRdS3
	iK+WmD67q8bNc6nxVMuGzuA7rS9vOsFYnxhQ9rMBsgnxAibGt6EE34PQZYrKnSLlVt0y9qvZC2Aq/
	hN7UEtyLNeabd3ZxorA2XG3tCnjjbky507d5aJC/1mmmJAgeVC516yFBDcCc8bkhseWAxOFn61IHb
	2z3imt9hgYISsyMHexBd12X3EB3rec83CxWD6yHdDIoKxxMuUKvmYBB6pnAzvfmH7KAxg7Y8Z6VRO
	n9X0FqgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUmK-00A4tE-3f; Mon, 19 Apr 2021 14:21:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmH-00A4sa-TB
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2OjrD1lxBkC9xp3tJG+NPG/LiZnPSfumZV231nlEaD8=; b=O2EyNZPIw3JAN/7kMKMUJfTI4F
 vf6sFJbpX7W80MwyV1XYPHSUPqiSRiOuyWRaBTr/Y4ugI32Jx8K31d8m5M9uIQu1uDh04ASobzmV5
 wBmcCQXL0Zlc/fLz3L/Jdlub9bMZGIbA8nOv66DwiOadgY2CoycUzLFPFqGTFkz0QRg52866u7obg
 cCuUqwVMh71OFyNPAtONzI1HU49c7oq8/Hxl0F/434vCSbVcaqYpKAfZ0zGTOo8rg9oOjRjBXRAE6
 j/cnNJuoaFRiqYBZDdHUIJ7vu/Cys/jGe2GmdCYarRE3jPsr/zrFj+Uel/KgpB858F7TAhHnGqpQK
 /t51ZgNg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmF-00BRk3-Du
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:28 +0000
X-UUID: 00c1f844ff484d3594eb91e07c29a04d-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2OjrD1lxBkC9xp3tJG+NPG/LiZnPSfumZV231nlEaD8=; 
 b=o1vzo3f2ysv8niYlt+wFJiM3k8BjiobpUJVg7qbHzdLixY4jxBmo0HWPuX+7BDGmAnWzJlJvcEf2tNldye30wAp+fXGE7o/Amxszjh+dexuHIUO+pU/0KXk7TbFntfRtpn7zNaB4i4r3/xRgKmG875LNPTHeOQ65pGW+ZUjI7OM=;
X-UUID: 00c1f844ff484d3594eb91e07c29a04d-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 659211459; Mon, 19 Apr 2021 07:21:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:20:59 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Sean Wang <objelf@gmail.com>
Subject: [PATCH v2 0/6] enable deep sleep mode when mt7921e suspends
Date: Mon, 19 Apr 2021 22:20:53 +0800
Message-ID: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072127_516604_EB118D5B 
X-CRM114-Status: UNSURE (   8.42  )
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

From: Sean Wang <objelf@gmail.com>

Enable the deep sleep mode in suspend handler which is able to reduce the
power consumption further.

v2:
- rebase onto [PATCH 00/19] mt76: improve runtime-pm support
- change the 'From' tag in 4/6 patch

Lorenzo Bianconi (4):
  mt76: mt7921: move mt7921_dma_reset in dma.c
  mt76: mt7921: introduce mt7921_wpdma_reset utility routine
  mt76: mt7921: introduce mt7921_dma_{enable,disable} utilities
  mt76: mt7921: introduce mt7921_wpdma_reinit_cond utility routine

Sean Wang (2):
  mt76: connac: introduce mt76_connac_mcu_set_deep_sleep utility
  mt76: mt7921: enable deep sleep when the device suspends

 .../net/wireless/mediatek/mt76/mt76_connac.h  |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  22 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  10 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 208 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  94 +-------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   8 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  12 +
 8 files changed, 205 insertions(+), 154 deletions(-)

--
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
