Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B26C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 May 2023 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CN7SpqPpnTLaTS8yv6ryFOhSM4GlgAMCsKR/+z1mcI4=; b=0YoPbpKJAGU061yfh5T3229ACd
	5HNAaTQ12l8E0mgsHddvwkjbQY9K9aMpymWqdi2gmWPnn4u/dm+wUy2ITgo9je7AK8n/BJ1+B+0Re
	CG/vOonm7miCnayy49jxAA38WfykrPEYSRGjT8wFETEvwSx7oG6JVE099c71WXFWhqSf1QwQEthq1
	RV2Wk5PdIQaBo73lT4PU0yylm3lZXTOpiUzBACN4oI804OHtmv2fSL/H1ryZIG3sVA76LXwzhjnWV
	rMGooUFGnkzD31hrTJTgGQlStnxaO+HDryaQMAs1fkqL4IfMOrJIUoLgzRHTitTKzVNoQPaB6Bv0x
	mnWLAdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Kkq-008CIV-0N;
	Sun, 28 May 2023 18:04:32 +0000
Received: from mx0.riseup.net ([198.252.153.6])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Kkn-008CHx-0n
	for linux-mediatek@lists.infradead.org;
	Sun, 28 May 2023 18:04:30 +0000
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx0.riseup.net (Postfix) with ESMTPS id 4QTmky2dsMz9s88;
	Sun, 28 May 2023 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1685297066; bh=YanqDXt4gYh4Yg3JqmV9JtAyudOLfmWpefbYo9liq3c=;
	h=Date:From:Subject:To:Cc:From;
	b=bb23lso99koRLCKNFf16IDGcxbFpr3mit3zTeQsXBTre+pNWPDOViI03ChiHtQwyy
	 7J0F4/hkI7Xe/37c7sgZZFoHYm5n1yP/zT6itopoXhWGAvnCx+lUnXVKxZLZxGAV4/
	 G1r0tb+hJsdMGLxb82mJiunyMkiP7iHsouABMy1s=
X-Riseup-User-ID: 6A7FC8C9BCBCE7A3C029150DB0000B24648A75844749123286731A8FFEC99756
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QTmkv52D1zFs02;
	Sun, 28 May 2023 18:04:23 +0000 (UTC)
Message-ID: <2c9d0354-1fbe-b468-8afd-30689e31e60b@riseup.net>
Date: Sun, 28 May 2023 21:04:21 +0300
MIME-Version: 1.0
From: Rany Hany <rany_hany@riseup.net>
Subject: [PATCH 0/1] MediaTek MT7915 AP Start/Stop Hang Fix
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.wu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_110429_344887_E955A7C0 
X-CRM114-Status: UNSURE (   5.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

The below patch for mt7915 fix a scenario encountered by an OpenWRT
user related to "/etc/init.d/networking restart" occasionally
causing the driver to hang.

This patch incorporates the fix implemented in mt7921 for mt7915.

Rany Hany (1):
  wifi: mt76: mt7915: fix command timeout in AP stop period

 .../net/wireless/mediatek/mt76/mt7915/main.c  | 38 ++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

-- 
2.34.1






