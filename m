Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BAAC3B187
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68AF2082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlCZMAmQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E/gRbYuW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68AF2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdNOqtT241X27tXmjYXy/uUb4XE7HdzVK5etJwc5T4U=; b=FlCZMAmQVKjlsX
	trOdHEaPMYUDmxKO7V+4ZfRJidsE9k43gOawKY/E2powy37re4Z6oln6EsLAZu5ts6BqyNzKikBBM
	CiCYWgSKkkXrUxrEExefiFZidTf0OhtqZ6CUIk/DwEQxBhCqGM5+bUuEhfXDZYFUE/zSy1PmgmRqS
	ZwgnPt9IjIC6DjLCOQk602WPuUDBsnYbORxEmOQo9UGcwMAqtZnbFRXFKfD2r2iOWCqxme5nr9Xu1
	Hc1lkouPXmhrFeyu5DbdCsFs7deQ+JhWzJqHrXPj4qu0yCbro05q4dgxIFISuCSPmaoWnYEzUhd//
	1SfvC7YEoMCG+X+wMTIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1hsk-0004C4-V3; Wed, 12 Feb 2020 02:36:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1hsb-000449-2T; Wed, 12 Feb 2020 02:35:58 +0000
X-UUID: 23eb5c829a9442418f02556ed75cfc02-20200211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=steg/jhASvVNwtaBUkvukNOa1G0B8v/8ufnbMNN4fNM=; 
 b=E/gRbYuWaCYM7zjxePIkIPiq3DdZqzhTFMwOu2wYXyLt2pGFPfWFBDCzoNUv5OuhxRLREz+P4BNqI9ihng9jiac2mydofwisDnBsGlGoTCBnx+BPrDKsdpbHw6VQQ7P6vWYUwMQl2fEqOmCChh+TnWKALlqraYEq3N5tF7556ls=;
X-UUID: 23eb5c829a9442418f02556ed75cfc02-20200211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 28706282; Tue, 11 Feb 2020 18:35:49 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 18:35:57 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 10:34:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 12 Feb 2020 10:34:48 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [RESEND,v2,0/1] Add mt7629 pwm support
Date: Wed, 12 Feb 2020 10:35:25 +0800
Message-ID: <1581474926-28633-1-git-send-email-sam.shih@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_183557_122783_4E7C3584 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sam
 Shih <sam.shih@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A gentle ping on this whole patch series

This adds pwm support for MT7629.

Change since v1:
remove unused property num-pwm

Used:
https://patchwork.kernel.org/patch/11160851/

Related dependent driver updates have been merged into maintainer's kernel
source tree.


Sam Shih (1):
  arm: dts: mediatek: add mt7629 pwm support

 arch/arm/boot/dts/mt7629.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
