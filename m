Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7350C43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D720613A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D720613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qi1fbyQanHuKt9fjK6qEfPwMOccfQzXApWiHgCPC5Hc=; b=HNFsBeDPIaQ6QibyKmTPhxQQkZ
	QRqZsZ5Gr4l5IibYc8y3JtEiqrD5fWx6d5Yzx6p9lYUUyYDsyg9+wzsb+9QsSEmddNH3VPnsojfBl
	Fkky+xgi5Fqcp7Xa2RiopX+WCG3xVQkqFsvLt+AAsz1M9ZTo+JebMXEM9WLXvdeP3QdlgggSTYXNl
	ZaPIG7ITr2ZU1q7ClPbqZ9crN1+5qf2EJaaEKyMXDRYEA0irCFeWG1b15QIaYq4kIarECM21iZQi8
	PKlPQ67io0o0v+4RXLGvWYHnmYNQXhVhfq4pnNXqzegkdmgncn3GwD+yxa8iS9vuu8JAmCWKECOP0
	nZGgNZgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU09W-0043lN-Jf; Wed, 07 Apr 2021 04:50:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU09S-0043jv-E5
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 04:50:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so594659pji.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
 b=roY/yLJtJzRhg3AFY5kSDhSdJzO7TXsC74zJKVKeUspDEKjofDINCo3OIsNJ8aAIhy
 ZqlAc69WUGI4DTk2wDz61IpEh/q8U+hB1v37/3I+9CeVRXzgQz/7liKOINnPfwD/iadg
 ZoU6lGUBUkI3lTT2pqoD7bTUL487cp5i7vzh0WvtoFZtzOMMQgubNQF9T+ot35w6SQmf
 CfS3Jo6JPrSprlsL6QkVpJ51y4oZDLoRcjSnSG+XUa9Etafe645llvI9mbDvAQcB0mRb
 EF5NVOr2vF50EhBbR0AcriXLgHvMXYxgvGz7qs58yWr5HHzhtCgH+PNEjzanK223MHpt
 0qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
 b=ayW84mUe+sZ34iFVXO0iKv9jnTvtFH07sgNhJckTuwMonwfCM70G47hxMCXB4+gFGl
 inhpzuxgecIOd44cdReC4UMnxFYTxKHN8WENk3RRDtiwSro5X71qWRPPShicNwrvf7Tg
 yerlFPyiFVC0PEJQ3DQJzkZ1mq38EZjBnD5plBOF9p0KEJiFUB8dlh5+Lc3f4OxGzUi8
 EaTVccj1i0TtBWa/tD7l2C+RZ0EFtCJJW0BCsgP+2N0OA6x+tZA+S3JO81QhYpg36toJ
 LfZGcWWOU83Zt6AkbmhDtWtTXhgGUuioE6YSWj9fWFZKjD3Ior9SEkOhCjvG4xNM3PKS
 KrAg==
X-Gm-Message-State: AOAM532KwaB3V5JxonzPspu5tXzV/B7/aRy5+3O5ycjXgAU4pS63M2Hx
 rq4VocZQ1qJ61Lq1ap3Yaf4=
X-Google-Smtp-Source: ABdhPJypi5n57JibwUe2l03PZQJOpv/eeU/jgVCqqreTiZ/weG7cr23O4MMOTkU2gI8gQYx8/djOSw==
X-Received: by 2002:a17:902:bd8f:b029:e6:ec5a:3a6 with SMTP id
 q15-20020a170902bd8fb02900e6ec5a03a6mr1526114pls.31.1617771049034; 
 Tue, 06 Apr 2021 21:50:49 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:50:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC v2 net-next 0/4] MT7530 interrupt support
Date: Wed,  7 Apr 2021 12:50:34 +0800
Message-Id: <20210407045038.1436843-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_055050_830158_DA496AAE 
X-CRM114-Status: UNSURE (   9.73  )
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

Add support for MT7530 interrupt controller.

DENG Qingfang (4):
  net: phy: add MediaTek PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   5 +
 drivers/net/dsa/mt7530.c                      | 203 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  18 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 109 ++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   3 +
 7 files changed, 323 insertions(+), 21 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
