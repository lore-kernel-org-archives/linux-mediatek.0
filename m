Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96758C55186
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E22208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBW0LTrF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSe7NVeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E22208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x9FqB2zZtjV+AZB1uzRsTBCFC7aQ8o9zjcfINuPluyA=; b=OBW0LTrF6zJjOY
	Yb3Ot29o7VRX6/labeiOq+J+Hdr79XlZQmr/twgbVV3iJbddXLpMUGQNJslrPW5HNTRb/5MouSrk8
	l7Hz0Z4T/TLBCNajcMlhr7DUtSWtYhEi/cLTXEdic8PC3gakCC4wYzl1NunVoCpiFTkxRDlQjMKyG
	4InqlL7O+sxqXvLaU92MbmqP6BvfdPMmu27WuBUSQDZUpLFZFSadFDbGgEW0qwcf9rUNrEY19OD7r
	N3aqbPDs2Hz9bBqqO7ODh6L+fvMx4nvV1ATcliJiQB8sAQAaP1i0vxYER0YbdgUvc64A1cbhS4wXU
	mpek0e/vPcClMmE8R6TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRcD1-0005p6-U4; Thu, 23 Apr 2020 13:48:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRcD0-0005o0-38
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 13:48:07 +0000
Received: from localhost.localdomain.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDD6020728;
 Thu, 23 Apr 2020 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587649685;
 bh=D8S/kaPUet1jtroDZoG5jlkLcoT7q3H268hed4qYzag=;
 h=From:To:Cc:Subject:Date:From;
 b=JSe7NVeOGu4ZItf1MTE63NMwPkzUG2IDMGsZ6T+gweEqCHIxDpAX7EvsLqqcKxwAj
 258xkme171oClv/VarOXjX648QcbFR86/iYKQ8FWWlO61CBV9bGq0VKKF+Z3ch30tk
 bjcy8u2kw5C9djv6v20AddylAZ3UlRb/EqOa3AwA=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/2] mt7615_mcu_add_bss_info fixes
Date: Thu, 23 Apr 2020 15:47:53 +0200
Message-Id: <cover.1587649519.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_064806_146875_79CFD2F1 
X-CRM114-Status: UNSURE (   5.52  )
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

Fix mt7615_mcu_add_bss_info for 7663 chipset
Avoid sta lookup for mt7615 devices

Lorenzo Bianconi (1):
  mt76: mt7615: add sta pointer to mt7615_mcu_add_bss_info signature

Sean Wang (1):
  mt76: mt7663: fix up BMC entry indicated to unicmd firmware

 .../net/wireless/mediatek/mt76/mt7615/main.c  |  6 +--
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 43 ++++---------------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
 3 files changed, 13 insertions(+), 38 deletions(-)

-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
