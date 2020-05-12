Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C2CC2D0F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C088323126
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AYir2D3W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQUBIrb0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C088323126
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKKFO8BSr6kzB+y9Wi9VhL0PiWs8V/OM4da93bYzFyY=; b=AYir2D3WpzGZCR
	TJ58Kw7k/ettQMC9K+KJby0bngzL2nFYKsGehyKsPXL73OyJSC3RZMv/i0x+rvgxV6LB8PQ9eZNAu
	7ymv3dhvvSVXukF++prJjkR6jl7Inx1dRadFHIDFvtiA+62BLcBigGSSW/8uX9OHqYSjkbRlKUei3
	Vz5iQdvqJ39BAgzm99qC2X65OziPviQ7gZvxpmbpj11QReEsXRCrVv90ECVHfChhwTffAIB1WTHJX
	M28Mv8ig7hVhDptJt02Sfgtx2agCWj/kx73GL2wGiUkg0xQVJIj3of+/f39LaPXZE7Do8PZJoH5WA
	cVwyIiJdMwMnjEtBf17w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYb7E-00027f-PF; Tue, 12 May 2020 20:03:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYb7B-00024H-K0
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 20:02:58 +0000
Received: from localhost.localdomain.com (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9604F206D6;
 Tue, 12 May 2020 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589313776;
 bh=clfINjMJwZMYOtitD9gTt5jgrX1CRjxI2kkywm6EsF4=;
 h=From:To:Cc:Subject:Date:From;
 b=jQUBIrb0ncn3aBhgJCTWzavDoFLC3JBDJzwHp1b9YFuVmSHRMaRqtwqubT642xCF6
 45Rv61gvqhLWkfjMxRcLWQyRg/txBAqqxnMqxYFoqhjqrcc+RZ1tX5DarvBl42wqIi
 VU97s18n7kaoxm/IwtpA8UJqA48XQfo4v+WrQIrY=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/4] add p2p support to mt76 driver
Date: Tue, 12 May 2020 22:02:46 +0200
Message-Id: <cover.1589313659.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_130257_678670_3E9AA765 
X-CRM114-Status: UNSURE (   6.51  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce p2p support to mt76 driver. Supported modes:
- p2p-go
- p2p-gc
Improve mt7615 hw frequency scanning

Lorenzo Bianconi (3):
  mt76: mt7615: do not report scan_complete twice to mac80211
  mt76: mt7615: reduce hw scan timeout
  mt76: enable p2p support

Sean Wang (1):
  mt76: mt7615: configure bss info adding the interface

 drivers/net/wireless/mediatek/mt76/mac80211.c |   2 +
 .../net/wireless/mediatek/mt76/mt7603/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  16 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 175 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  27 +++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   2 +
 .../net/wireless/mediatek/mt76/mt76x02_util.c |   4 +
 8 files changed, 176 insertions(+), 58 deletions(-)

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
