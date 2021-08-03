Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76BBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FED60243
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86FED60243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MkFC6bP3GTBkGLqFTZ7nNurnHONMhtpWibpI14tvJOM=; b=LT5lew7h6cNnVX
	SaY9h0fSFuRIyCtKXXBkXGSqRQpzc8ndlE5SxcORMhFKjnHGC2nEfHz0yPSVeS68K/TuPhy5NZ5s0
	ObdoFsCZ6JAuD22/xOoeWOrpeqZbN7owPFofu3w87o+wI73Abg6v2pMZyXia3vtlNlf39Tpanvsog
	FNkYPe1GT81Q2AJtNSnjAJ7n6hYqKtX9I90s+eZysaCNyfhT4neN+LUX9aXXWNGwj9vkyB5q7u2br
	2XovIz8eI/nK1KLkUwQbSgnpAYf8HKP2Tb1Bnx6iTicyyIWk9QGFQ41QNRKbdcSdS3pl5zcK0HS3V
	sTWiNiVvUTQefRB2NqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAw7n-003MpM-Jj; Tue, 03 Aug 2021 15:14:35 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAw7Z-003MnJ-2X; Tue, 03 Aug 2021 15:14:23 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4GfJLb6TSyzQk1r;
 Tue,  3 Aug 2021 17:14:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628003653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jpnrv079HohfYHZxHFOih7cazCqNwznCHGvgjVDV5OI=;
 b=cPSRzG5fVE5ANJTePkpxHl2VaB6rm+S7H32l68zL0PeiJ3pUG7IcAkHjCICir+jPJ+D8yp
 BwVW8r15/M6T0RJnyHVDEMIQvtVmUvPMyikjhFbxNsb1puF5Yi3zEHQJzRRsplkAvDDZC6
 MM5U41bztqUj6wFJ3P35dP/T2CWTBmwes7oZZYvFGxg76IKkrgRXqfUg8oO3OMgKdqR0kk
 P+/+EXvUPz3BmGQ0E4ogzwoyD/R9hMsrHFOoQX36+4RCUjJOPsyKYLyMGmz9S5kIOCJ/8u
 PKW/bbrPWTNrpiaa8nDBVEmlgiZ5oFyw2Oiru+sZT27nMrKZTJmeGEEKu9XCpA==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id eYw7Q2qDqF7P; Tue,  3 Aug 2021 17:14:12 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH 0/2] Add MUSB for MT7623
Date: Wed,  4 Aug 2021 00:13:18 +0900
Message-Id: <20210803151320.71531-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 887F618BC
X-Rspamd-UID: ef8fb2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_081421_335371_4691610C 
X-CRM114-Status: GOOD (  11.48  )
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

I got to know this from a BPI-R2 forum post [1], and managed to make it work on OpenWrt snapshot.
I'd like to know if this also works on BPI-R2, I can happily share the details if needed.
And I've just copy & pasted nodes from mt2701, please let me know if I missed some big differences between SoCs...

[1] http://forum.banana-pi.org/t/bpi-r2-otg-port/10551

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
