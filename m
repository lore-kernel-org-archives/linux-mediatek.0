Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9FCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F07D206D7
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ri82rqoP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cQI9Bg1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F07D206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lR2hpAzRszTgFMde/rn2vsoL1Z8x8TlxsNoS+WFzKEw=; b=ri82rqoPJ3U6Fg
	JUERhm2m8up1V6T1hMm6h2Fgh9WyRTJA4b5fCaJU6ATFHZkp675vx0DMJrhvq4kZMwD2as783IdEj
	lpuJtDRC1sDGc+vG53sY3TtxbYFMUWBr/NfElXFkGdrPyPfhm5rReuHOC7umZ6my7ycUsvrC08Pfz
	4gS6eWnNwMvI6Gsw2NOImXeNLm1yoQKqrR0qgShZDpvjBGaG55GShPG1G/wHtZekUgNotd2sU4zUI
	8ELFo3ezyLazRPRj+vYsthv76ntm+pts+HIQuD1IK4NPVPQxiMTqaTZvtd3uMbzmb72jwOqQZuHPW
	kGmir58li0JyYPadUe4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jknVV-0003W2-Q6; Mon, 15 Jun 2020 11:42:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jknVS-0003Vd-CF; Mon, 15 Jun 2020 11:42:27 +0000
X-UUID: 778cd13d7f1344caaac70a030b8fd222-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Mb9ECmQLe0cOF3EpJy9V6PKEB18+T/abvWwavIKQcog=; 
 b=cQI9Bg1sMGyRgvhMx9OYnaqyRGdh//MMMTJWq8nxQeqRIzvk9X8VCGMA3h4iY/ZS2Bgb++A0sRUCeFtg7A+U1+eQecWp7GcK08UB2oq3yyTMHDcdaYYkeDH1mtJtHiH90ghLa+CsmT7LVUh5nJ3iTuouPfjK8Fj7poxM5xW892g=;
X-UUID: 778cd13d7f1344caaac70a030b8fd222-20200615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 981966433; Mon, 15 Jun 2020 03:42:19 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 04:42:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 19:42:08 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 19:42:09 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Yingjoe
 Chen" <yingjoe.chen@mediatek.com>, Pavel Machek <pavel@ucw.cz>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
Subject: [PATCH v1] Add vibrator driver support for Mediatek SoCs 
Date: Mon, 15 Jun 2020 19:42:00 +0800
Message-ID: <20200615114203.116656-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F5D2DB50CACE471C1E30A4653E561A353A9A15052C4081FBD7B7B57F381E53742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_044226_427560_81B879F1 
X-CRM114-Status: UNSURE (   6.57  )
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This serials adds regulator vibrator driver for Mediatek SoCs.

fengping.yu (3):
  dt-bindings:Add vibrator devicetree documentation
  drivers: input: misc: Add mtk vibrator driver
  defconfig: Add CONFIG_INPUT_REGULATOR_VIBRATOR=m

 .../bindings/input/regulator-vibrator.yaml    |  65 +++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/regulator-vibrator.c       | 422 ++++++++++++++++++
 5 files changed, 499 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/regulator-vibrator.yaml
 create mode 100644 drivers/input/misc/regulator-vibrator.c

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
