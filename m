Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D678FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:28:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DE420866
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5RtiCBN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="uqimuOg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DE420866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nfSixgkXZ0OzEl9v2+Q5nOSlC5rENqC7S4CZ9078Jx8=; b=a5RtiCBNDsnTbnMuIrQESj0BvN
	en8p1AEn5X0vi474+N6b2O1X7oTeqcm3YBitzSAJ+KF2TL/HAohYzghWoNudKuRLoPc0wMgCRTjzq
	75sm87Wy0ykL3CuuO/FeNpOlu5p3FBZrXREkZjlQ/l9ZyG6ZfhpHZe230UFpufLHNptNroCkT395N
	CUc6FtSy+/zDF4ynIRnyvNZS67A58BVtreZndH4kj/n+yxOMykChGZ1h1LU2lJKacXLrvaoqjDdTz
	L3ld0VoUYinl8DqAwfdwigjT4nxD712+QWk48d7jOJxBMBD5ZB+bm8ZTJXCn73Pg1XS8uql8BrW65
	52XGXUvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3xk4-0004Sm-Iu; Fri, 07 Aug 2020 08:28:44 +0000
Received: from mxwww.masterlogin.de ([95.129.51.220])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3xjx-0004Pm-C0; Fri, 07 Aug 2020 08:28:38 +0000
Received: from mxout3.routing.net (unknown [192.168.10.111])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id D24B8962D2;
 Fri,  7 Aug 2020 08:28:24 +0000 (UTC)
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout3.routing.net (Postfix) with ESMTP id 6350E6046B;
 Fri,  7 Aug 2020 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596788904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LTTAvZt84zMEQxdjDVX1V/pS94sBHBnf+fd0mzHYS/Y=;
 b=uqimuOg/kuqp201562Tk5tMiic7EnABOEvs/isx7WG+CtjSeH2dKoqLArQs+ySCEX70ix6
 U0jevTWjWKzlMTBSt9EqBh7V/OawRj62Pdrr4ALsqU/DHLAHhd85eTAvr49/PsmP7M4tWZ
 LkQtRB7QwmFj7Mc6FQDoBy6sWhaKAsw=
Received: from localhost.localdomain (fttx-pool-37.60.0.190.bambit.de
 [37.60.0.190])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id B424B808C6;
 Fri,  7 Aug 2020 08:28:23 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: 
Date: Fri,  7 Aug 2020 10:27:52 +0200
Message-Id: <20200807082754.6790-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_042837_550066_0F70075F 
X-CRM114-Status: UNSURE (   7.89  )
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

Subject: [RFC PATCH 0/2] move/add display relevant nodes to mt7623n

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
