Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62999C2BB55
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 11:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3412320B1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 11:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="go3aSOLl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J10f1+HS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3412320B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oNhq6dr0OTNoj6MIo/TAQVEYgRjbbw+uG6plOVtwzaY=; b=go3aSOLl1CZm6U
	wQL4UBvkTJrEo2uaSOoDE4Kvo+5ALii/aLJZRyxL6hgh9bvYiMnRMhKfXPVFQDSgkMBpXeWb4PGWC
	kyntPcYe/359tTx1On7W7DGc/MtewlN1UWuH6oHnivMON9DAzJ2yPQV2kgVvraZmVVYFxo71HdfKL
	ZMFzVKestN47rlh5FqkK7hrcXLwhTy58HKZnd71I+FwJwQOJzcf/SvubHnAQ4Mt5vbe+aeq8gd2+W
	TwiMfKN0Cl8ocujKpwoBt8+zWOV+CGrGDVBXsINfsRjdAhYp+FO3FYk2ZGLupli/uquYvqGmn/Dn8
	IXPVrOHpSpkLeLEsgNWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMV9K-0001wW-Py; Thu, 09 Apr 2020 11:15:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMV9H-00010c-CB
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 11:15:08 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5B0620757;
 Thu,  9 Apr 2020 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586430906;
 bh=G0QTWF9B9m5sqzs0Qv3MdvSUuoGSy1ZlZD6ekbWLFew=;
 h=From:To:Cc:Subject:Date:From;
 b=J10f1+HSrxk8CCGotAxiQQjaKwYrznBPolJ3c87aWsumVbniSbbNEhAFizfkpbnbN
 r8VWgH2JdJdKgeHwVCMQ6d3IpG/y+0Afwe/RTwe2zLjDHKOtjVKaROZNUfItzHzMY/
 frfNQxC72MEcNxQf7omQ4NlCx9BBhUzi7pNeDVbg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 0/2] fix TXP DMA unmap for mt7622/mt7623
Date: Thu,  9 Apr 2020 13:14:55 +0200
Message-Id: <cover.1586430566.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_041507_460735_218B299A 
X-CRM114-Status: UNSURE (   6.05  )
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

Changes since v1:
- remove usb series dependency to make backportig easier
- add specific macro for 7663

Lorenzo Bianconi (2):
  mt76: mt7622: fix DMA unmap length
  mt76: mt7663: fix DMA unmap length

 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 26 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  3 +++
 2 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
