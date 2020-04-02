Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8417C2BA16
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08F4208E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQXMzqzo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UH57ZKYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A08F4208E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWLDt8M65osjbN5NS3uzX8FJEthjv0cNDzOZHWT6Onk=; b=oQXMzqzoPtYHAD
	dvRF+fj4mSFplmsRdi2H3ItGy08l3QC7Bc0gR7xc9cklHNQ2ZkRXrTuGTGbriLa1Oso97uw0PeGXm
	jHHJ0tGg5peo2VtPg+LNwyDbdc3ivcDTxFxO00QA3L4jLK4gAEEf8A4jx7jy5ZlG+SWhZG0vre2dO
	I449POsdes5aMCsxxGXmbmU/1G4dIp2HMNIVpanUrYxYY3V2pqgQAiq0hlrKRi3D6wwDElPHsgxyT
	kNblFgjbP2X1SrMKdDUPmyw0W282NU9p3YBe6LSBeL2ye7TkTNaaWFOf9YVsN6pPMmGjJStQR34Oi
	oCW2GZEJzoX7ToI8QNDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK4Qm-0000ZO-8L; Thu, 02 Apr 2020 18:19:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK4Qj-0000Yr-Jh
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 18:19:07 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E31D8208E0;
 Thu,  2 Apr 2020 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585851545;
 bh=JQNh2VJzXoZ8ONdPCKN1JW38u+QpTzmFGYv1i90IxL4=;
 h=From:To:Cc:Subject:Date:From;
 b=UH57ZKYSugJM9LfVoCYkDYrV/eMzPY3Di15TIyX6AO7Ame1mG/Mb+kC0r18yBR74x
 e+gkaaFNlzT8tcGgjegYtloXk4GB+MxbFCI6c0mc1KuVT/2O14MqRHborJnNwh0hsx
 12rXTbE4kQcNr9XDDEBqjQdilwobSFnPfXLecl0E=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/9] add preliminary usb support to mt7615 driver
Date: Thu,  2 Apr 2020 20:18:47 +0200
Message-Id: <cover.1585851049.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_111905_665794_75AFBE86 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is the first preliminary series to add support to mt7663u driver
This series is based on 'mt7663 driver update'
https://patchwork.kernel.org/cover/11470699/

Lorenzo Bianconi (9):
  mt76: add headroom and tailroom to mt76_mcu_ops data structure
  mt76: mt7615: introduce mt7663u support to mt7615_write_txwi
  mt76: mt7615: introduce mt7615_mac_update_rate_desc routine
  mt76: mt7615: introduce __mt7663_load_firmware routine
  mt76: mt7615: move mt7615_mac_wtbl_addr in mac.h
  mt76: mt76u: rely on mt7622 queue scheme for mt7663u
  mt76: mt7615: rework wtbl key configuration
  mt76: mt7615: introuce mt7615_wtbl_desc data structure
  mt76: mt7615: add address parameter to mt7615_eeprom_init

 drivers/net/wireless/mediatek/mt76/mcu.c      |   9 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   7 +-
 .../net/wireless/mediatek/mt76/mt7603/mcu.c   |   3 +-
 .../net/wireless/mediatek/mt76/mt7603/mcu.h   |   7 -
 .../wireless/mediatek/mt76/mt7615/eeprom.c    |  12 +-
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   3 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 187 +++++++++---------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  33 ++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  85 ++++----
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   7 -
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  50 ++++-
 .../net/wireless/mediatek/mt76/mt76x02_mcu.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt76x02_mcu.h  |   6 -
 .../wireless/mediatek/mt76/mt76x02_usb_mcu.c  |   4 +-
 drivers/net/wireless/mediatek/mt76/usb.c      |  15 +-
 15 files changed, 260 insertions(+), 170 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
