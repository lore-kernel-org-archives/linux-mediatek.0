Return-Path: <SRS0=dV3g=NN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32C3C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 04:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFAC6126A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 04:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BFAC6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFs2QApneRk6aPLxIbYF1CH2udUbzsIvs3VxIPnt9NQ=; b=wBIVWJUftawxYQ
	mcnnCdkAT38epgLx9vQ7E7AqzJyVz3sm5dgCZAjcP2MKqrXuwPKl+cSeneCzw8JVxOt1ErwpRMbGk
	ViqOEOU3CKM/Lso43XVcqIPFxFiOUT4tFomHTvjhjvEgCVSkjKbsgGiiYoE1td8csA7GY3lGEyPe0
	jdFAD0mHS+CapQCy3CRXiIjSXIRC5EaFxc58VfHFfElRbOeliF7rqkQuG7gJDqdTA6TlQmDs8gBkD
	3VSTaW5lJTSoPwMtwCDdHO4lhtL6a7e9rc/DK9ywwEA/AsmPVPJrk7t1NcADMYBDN0ihMt5KvZLrw
	KjwBHitZbiwQ10KSc4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHesY-00DUaT-Jr; Sun, 22 Aug 2021 04:14:38 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHesJ-00DUY0-76; Sun, 22 Aug 2021 04:14:27 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GshpJ6fHzzQk3j;
 Sun, 22 Aug 2021 06:14:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1629605655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpRlG5MqIG/F4622ScTOdfuZ4bsOknUt+3o0exi/l40=;
 b=I99RWDYF/bsIVjXTq1x3pIoRSdchsNNgkzDO9EP7TTJHuKjlTEHxeo9B95jvYPu1zKsFni
 sJDJKQWuqnoDP3DSggm1I8G/ziXaWvwpJ5bHzJqz1qRlRK7YPSOjMUF/7cLSz1sNvMHJ8R
 EcjZZqNBv6L4kkbcuYggPmzo5RZbVQxl3cR/8q5EPEJg0wEvJDSFY9kz5FPERqZLwmShwY
 wmM3xpb87DtlaqboZ6fGVTE1B4hByBFZdb2PGvNsxCdkQe6RkkzLdcE5yZVCElxD3Ouhk6
 9392+A6ZROHxe7g51TMJB3ngGPhj8mc3O8Uuijn9+/vT1XH/M9CRbCx4Dt7kUw==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id rR8IlFxswEMY; Sun, 22 Aug 2021 06:14:13 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v3 0/1] Add MUSB for MT7623
Date: Sun, 22 Aug 2021 13:13:32 +0900
Message-Id: <20210822041333.5264-1-mans0n@gorani.run>
In-Reply-To: <20210808123840.176738-1-mans0n@gorani.run>
References: <20210808123840.176738-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BDE161899
X-Rspamd-UID: 33c264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_211423_514932_A96AF127 
X-CRM114-Status: UNSURE (   9.20  )
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

v3:
* dt-bindings
  * remove the queued patch
* DTS
  * remove unnecessary status=okay from u2port2

v2:
* dt-bindings
  * add reviewed by Matthias
* DTS
  * rename usb3 label to usb0
  * move usb0 & u2phy1 nodes to the right sorted place
  * disable u2phy1 by default
  * correct u2port2 node name to match its reg address

Sungbo Eo (1):
  arm: dts: mt7623: add musb device nodes

 arch/arm/boot/dts/mt7623.dtsi  | 33 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
 2 files changed, 37 insertions(+)

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
