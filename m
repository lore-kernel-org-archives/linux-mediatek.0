Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C877CC2BB54
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 09:25:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE3B20B1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 09:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lyHVnfa6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9cqC0pi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE3B20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MrGZ6miY5f4IJ4D3yi0rXypxMRrJqVmc4K95fuphr9Q=; b=lyHVnfa6beFmx1
	fZ5xwq1wWtyyAd7SwUbBZcTu+QHf2L0su3sxRTDlozUBnN99BWctynJzbDONYkpXPhKubu1xdIUsD
	0hnprdmAdH4QlE+nn3SCmQJF6ZzcSNW0G5/mRlAzAq1byzB/ihZmiZLIXnMrN+usOLp9eo3aJsPrI
	FFM2ZO1LsqTjmWy/mJSW8E6G37cILTEMgUlea7B7o+tk8zlAspS7z835CUer/FanwksRYGcq4oWCm
	RLfWyXiS0iEenK839YklrP16wYoMjkeVF2CJ4ISHNiivk4iyI5E8+ltGzfQZWIwRMnAGkRHwpxxe3
	zRftDWlN5KlICM6iSklA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMSpp-0000B3-S1; Thu, 09 Apr 2020 08:46:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMSpn-0000AE-Gh
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 08:46:52 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC72722202;
 Thu,  9 Apr 2020 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586422008;
 bh=jUfOmsLoGW71+bDFRzM3/lCI73zV3FaDo2M0AMpwE9E=;
 h=From:To:Cc:Subject:Date:From;
 b=J9cqC0piK2BIhOYYuXh5X0RUcjG9/HL/qaPq1ieiFVa//UN/eutlFBehlVPLCiZ8j
 AoYhYxwz7z0otj9BKCXZrZ7BTY1BlfnvOWEMmHzxTci7deXX0WjJhPDjneOZrxpl1z
 tqu0WcGt2m/ucCx5epCo7Yb/5RI9S8pGtNrlFWJ4=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/2] fix TXP DMA unmap for mt7622/mt7623
Date: Thu,  9 Apr 2020 10:46:37 +0200
Message-Id: <cover.1586421673.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_014651_597593_94691626 
X-CRM114-Status: UNSURE (   5.77  )
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
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 soul.huang@mediatek.com, lorenzo.bianconi@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix a possible data corruption unmapping hw txp from DMA engine

Lorenzo Bianconi (2):
  mt76: mt7622: fix DMA unmap length
  mt76: mt7663: fix DMA unmap length

 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 17 +++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h |  3 +++
 .../net/wireless/mediatek/mt76/mt7615/pci_mac.c | 16 ++++++++++++----
 3 files changed, 28 insertions(+), 8 deletions(-)

-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
