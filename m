Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7918CC00523
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E0A92075D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cOIMPG6F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k0t/rtWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E0A92075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KmU0mE4eirnf1//FNIwZJDwHI0YLg2UyehWczaphQW8=; b=cOIMPG6FxWwbpx
	2Cm1PytUvUO2Cw39S1EQ+p0C9clw+dxIRC5ZV380L/Le9kZW7P+Q6Ydz/YRiMwotVSfFVpD0JOt6w
	oy7WYQtWFVzitWLwBWSYVkm5Td7dzHKFYZ3+dNtcP0Xidz+/qQmw73MiQyDqExc2q34bxWYiWILRu
	8kh6yCazbVtS/cXN07gXF/yulRuI3IplMu1/3VkUwksg+srZ3DzXV6L/0COlxDdd9Nf+wJdWAnIAB
	g7zMUuZHc5xwgRckPA5vx5CKz/FXLXvDiov+xhJjXF8FMezdDGuXCisZXET7GTJ+iUT8GppCz8qwo
	sMsEMuwULU20esVgSvUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip51J-0000gn-BU; Wed, 08 Jan 2020 06:40:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip51G-0000dy-Qf; Wed, 08 Jan 2020 06:40:44 +0000
X-UUID: db5487678c36409696981b668c7fb660-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=C5uYcatcL7O3L8hFISr3vserMmDxuM/EyNyUSLNixHg=; 
 b=k0t/rtWVUVJ0T2VJ+NxbrexQW/YLFUNRu2AJthf1yIGAO8CIHo6arsbhqjWpqxhVjaVpySlTmbBuUVneR4ktMaDDmjnkamhGzmYeT59c6LhJlETUftc2BgLGavEwk84CWiZ9qZJ4U3BM1Z4O7g/YGjGzQDSqTb63e5FlKZgCQWY=;
X-UUID: db5487678c36409696981b668c7fb660-20200107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1200836504; Tue, 07 Jan 2020 22:40:32 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 22:31:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 14:31:03 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 Jan 2020 14:30:03 +0800
From: fengping yu <fengping.yu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Olof Johansson
 <olof@lixom.net>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang
 <Anson.Huang@nxp.com>, Maxime Ripard <mripard@kernel.org>, Leonard Crestez
 <leonard.crestez@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>, "Marcin
 Juszkiewicz" <marcin.juszkiewicz@linaro.org>, Valentin Schneider
 <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 "Thierry Reding" <treding@nvidia.com>, YueHaibing <yuehaibing@huawei.com>,
 Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Subject: Resend [PATCH V2] dt-bindings:input:keyboard:add MediaTek keypad
 controller binding 
Date: Wed, 8 Jan 2020 14:29:21 +0800
Message-ID: <20200108062923.14684-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_224042_896711_7146642B 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


fengping.yu (2):
  Documentation: devicetree: bindings: input
  drivers: input: keyboard

 .../devicetree/bindings/input/mtk-kpd.txt     |  52 +++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |   8 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 357 ++++++++++++++++++
 5 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
 create mode 100644 drivers/input/keyboard/mtk-kpd.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
