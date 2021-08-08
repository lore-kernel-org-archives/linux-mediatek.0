Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967DBC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF3B61004
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CF3B61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV9NKl0R202zWZIqaiDVxPE9XQLK+gzDuOiPysXHPNY=; b=1pf2wpu5AdVAKC
	5q+e0JPXVW3xCrYjdCSBurCQLs49L85AxUrW/N3DRKMz7d6GD/D84+DWdhFSndbPXsV5y2NKsJCYQ
	gwuF7EtW1OgpogzO6S50zgWdqTRc0Kc13arHbwzk8AbKKbUQLtJSPWrP3nEKpShZj/0YJHJomAQg3
	G07RaTzanzWhsM5E3TFaM/4qsztM7dcQsnkV6/kjEo2K2a38I5fJwLv1Rr+NoJ+4/jZ4SJGXAs7nH
	STaKeBiK64NRY3efGhH+7a+57/7zop07u4Q7b1gzmWqmhW6Qyfw7qRHxgRHY6sDPM29LRdlim+lrQ
	VJQkmWHzFjt0QJoODjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCi5r-00Fora-TU; Sun, 08 Aug 2021 12:39:55 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCi5c-00FooO-BN; Sun, 08 Aug 2021 12:39:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4GjJgq43NfzQk22;
 Sun,  8 Aug 2021 14:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628426373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNkho6kEYucAS56T6bDbZFEUffzkZUASAaEQ6TytiPI=;
 b=D9GRjbSNhqCNkMwYnMjsSl+PYAv9LKmRhGCUk/3/8ZhrS+bRg3Il4ESA3IcXnPxbCf5Q8X
 ru782uxEBeXWbPP2cAkjS6h4jWkIYuQ73/daemWpWOkeqCKW0XbgwaYZM79cRx32HNp42a
 2zXISb81Ffrwj8qdsoQcen1c6bq4ld9exBOVYDxZVMCj0spfn8dnQbHaE2zKZ88Y21nav+
 KT1PtD2cMhv6AseQYWO9jnwqh3u5XTklT8ZfyPrn8B1E0aMf5QHYqFdV+6yBy4+iIXYD6v
 dzBOKo0NXYc/wTgQbhe/xqM4MbPcS37tsFEtiaMXvyqadxF/1PULYyW647DQPQ==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id IvuHFhvsFGqQ; Sun,  8 Aug 2021 14:39:31 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 0/2] Add MUSB for MT7623
Date: Sun,  8 Aug 2021 21:38:38 +0900
Message-Id: <20210808123840.176738-1-mans0n@gorani.run>
In-Reply-To: <20210803151320.71531-1-mans0n@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9AAA31898
X-Rspamd-UID: d9b34f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_053940_586663_701AEB63 
X-CRM114-Status: UNSURE (   9.92  )
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

These patches add support for the MUSB controller on Mediatek MT7623.
Tested on Mercury RUSH-318AC Wi-Fi router.

v2:
* dt-bindings
  * add reviewed by Matthias
* DTS
  * rename usb3 label to usb0
  * move usb0 & u2phy1 nodes to the right sorted place
  * disable u2phy1 by default
  * correct u2port2 node name to match its reg address

Sungbo Eo (2):
  dt-bindings: usb: mtk-musb: add MT7623 compatible
  arm: dts: mt7623: add musb device nodes

 .../bindings/usb/mediatek,musb.yaml           |  1 +
 arch/arm/boot/dts/mt7623.dtsi                 | 34 +++++++++++++++++++
 arch/arm/boot/dts/mt7623a.dtsi                |  4 +++
 3 files changed, 39 insertions(+)

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
