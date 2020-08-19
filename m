Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1297BC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:38:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B1A20738
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y2zohU1u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wq6KxU26"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B1A20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=duOMDcQZj6CWqdwFz15gjobAOpGY8EPKTZIe/NaoMNI=; b=Y2zohU1uUrTC/sTFawpjXvNZF
	8Oxn691LUQeH/FgfcHe3Osmd/66huAWGkgst/I+thnSUYBRhqUQg1vTuhzeRTTmpzRJRRgODyyQli
	isA272Eua85DmjzLmEu3mxIMyEfND8smZdlE7RBwnOm8c/Zrsqop1MvUdkL9Q3JKm5Mc6S/Ag8ej1
	JhST91Kmot4Fb7F81tRxu5PQVQD6zOHkedqV4lzuBYb2TybNpokvyDZP8LhYH48UOJABHxut5IVqg
	OwbimpQElrkKM8adpIXeO3AetDdByO1OTqXocuhr6flV9gQshCiePoy5qC9QonyER4+xbwRoTsy7Y
	+cSgpacEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8IgH-0002yD-4t; Wed, 19 Aug 2020 07:38:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8IgD-0002wI-Hw
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 07:38:43 +0000
X-UUID: 1f58720f0c1e4c5e821195695d39ab91-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fA1ZbejQFXPVLQG+Xp5gLcjblRbOlo94pfMY0RDgam0=; 
 b=Wq6KxU26E3Hy1RaGgPDFkuiC1wtJh3NWU9TaEzhThMlD9GaXmHENZhNPnsPC7HQnnjXE2BwAhxR3HTpvzjVFRgW27h3lhsGvukd7t/hGDk2y7Wzq9Um8IcuWMPZ8ccC2tLjz+4opqS8oZ16viCadWg7a9/nrJLEIyjPMCuQ/D5Y=;
X-UUID: 1f58720f0c1e4c5e821195695d39ab91-20200818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2032377120; Tue, 18 Aug 2020 23:38:33 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 00:38:35 -0700
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 15:38:23 +0800
Message-ID: <1597822704.31846.27.camel@mtksdccf07>
Subject: Re: [PATCH net-next v2 0/7] net-next: dsa: mt7530: add support for
 MT7531
From: Landen Chao <landen.chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 19 Aug 2020 15:38:24 +0800
In-Reply-To: <CALW65jZRWwW4DqpsCM9J=GRp6KnxqT-9MHUO7WSRJtp4E9vnFw@mail.gmail.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <CALW65jZRWwW4DqpsCM9J=GRp6KnxqT-9MHUO7WSRJtp4E9vnFw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_033841_967038_4DF9CE0E 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Frank Wunderlich <frank-w@public-files.de>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?ISO-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi DENG,

MT7531 mirror port has been fixed by new definition of register base in 
header file. The logic of mirror port setting in 7530.c is reused.

@@ -41,6 +42,33 @@  enum mt753x_id {
 #define  MIRROR_PORT(x)			((x) & 0x7)
 #define  MIRROR_MASK			0x7
 
+/* Registers for CPU forward control */
+#define MT7531_CFC			0x4
+#define  MT7531_MIRROR_EN		BIT(19)
+#define  MT7531_MIRROR_MASK		(MIRROR_MASK << 16)
+#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & MIRROR_MASK)
+#define  MT7531_MIRROR_PORT_SET(x)	(((x) & MIRROR_MASK) << 16)
+#define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
+
+#define MT753X_MIRROR_REG(id)		(((id) == ID_MT7531) ? \
+					 MT7531_CFC : MT7530_MFC)
+#define MT753X_MIRROR_EN(id)		(((id) == ID_MT7531) ? \
+					 MT7531_MIRROR_EN : MIRROR_EN)
+#define MT753X_MIRROR_MASK(id)		(((id) == ID_MT7531) ? \
+					 MT7531_MIRROR_MASK : MIRROR_MASK)


On Wed, 2020-08-19 at 11:49 +0800, DENG Qingfang wrote:
> Hi,
> 
> Is port mirroring working? Port mirroring registers on MT7531 have
> moved, according to bpi's MT7531 reference manual.
> Please fix that as well.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
