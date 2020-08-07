Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C03C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:30:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D9A22CAF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ffbVdPc+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="R68A8k1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D9A22CAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1O627aZzAYwvfLC1U5/5nC+uGAM2E18XzX50eUfp3YE=; b=ffbVdPc+yK3fUKLGCDmGhQOM5i
	0j0QZ7BF0M+fbOvF+SnLOrMve1VhLV61ggB9sAlwvPYhpv5DQL9qP5IQGmxGRDLd6/T55gcqIkrIW
	YFCZAvvIIUKYNecTYrhVncr/rg5kdLFxjH11j1YnLumqqW+/pRa4TsGWAIa+g6dVtDujQaR+pi+sV
	3CI038WPAqqSX1qMh+XmIb0Cl7SAZf2ASYMopwFDs85kHigEgL3XqADWqKU5IWPhjzWn4hxmSY/08
	5nr5nGNjNJmR4nvkgA/CeD4kGBvwhdEyuYZvA5dMQ9b6i1lKMOgQ+bkwY7/6OIq+owM+x/occstoj
	GwzBp53w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3xlM-0004rL-Tv; Fri, 07 Aug 2020 08:30:04 +0000
Received: from mxwww.masterlogin.de ([2a03:2900:1:1::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3xlI-0004p7-Eg; Fri, 07 Aug 2020 08:30:01 +0000
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 83489962D9;
 Fri,  7 Aug 2020 08:29:59 +0000 (UTC)
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout4.routing.net (Postfix) with ESMTP id 3A2B610149E;
 Fri,  7 Aug 2020 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596788999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wsClCJOlh8nQcRXuQ4gJeORkwcWKsYRo9CkahiSVwFs=;
 b=R68A8k1ZYv6NmCjF4ynccSvMG+0EG5Q2uB/fdU6Ij2znksMXcHYzj0RrReHIoZAwoODh3u
 DllYIHVIC966t3eRHy9qegKLq8GSfwYq1PP4pQsKP7RGaF1eNaO2sSXiiuHndIN7kOc/p2
 3epNkwIVOhf4KzfMUCZdbLPW79HLGxE=
Received: from localhost.localdomain (fttx-pool-37.60.0.190.bambit.de
 [37.60.0.190])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 80E39406DF;
 Fri,  7 Aug 2020 08:29:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 0/2] move/add display relevant nodes to mt7623n
Date: Fri,  7 Aug 2020 10:29:56 +0200
Message-Id: <20200807082956.7004-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_043000_650637_F14634E1 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

based on series from David Woodhouse [1]
i moved more display-nodes out of mt7623.dtsi to new mt7623n.dtsi
and changed last part from my series [2] to add these nodes to this new dtsi

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=329209
[2] https://patchwork.kernel.org/patch/11700699/

Frank Wunderlich (1):
  arm: dts: mt7623: move more display-related nodes to mt7623n.dtsi

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

 arch/arm/boot/dts/mt7623.dtsi                 |  99 -------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  72 +++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  72 +++++
 arch/arm/boot/dts/mt7623n.dtsi                | 270 ++++++++++++++++++
 4 files changed, 414 insertions(+), 99 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
