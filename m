Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0BCC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 10:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751B4205F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 10:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j2ttCwr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751B4205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tziMjBronlfkpY2asxEAOmkQMjGKHUoe32rQz5I1ruY=; b=j2ttCwr4HVuoUdJNR8N2pXGUEJ
	Xc6E8YCDSz0rr18z9odOdPXSWYICcdn1B/2LU4AeGNsZpJ37z1kJS5ebGNnW+T55nnEk57iwtrT2i
	mgzBDiajLlGru83evixvvrucUwlhz7Cw6XSX/DEOg4tog8+cnBRQdh92Jqf843/lZ63y9bde/woBY
	yTJ6nEq9YdAGLToR8uHrL1GdEm2B3YuGFDzxBlAHi5GXODdmHj/nndCXRMswVBXv95jU3zx0Kq13C
	vjguAWSBlWFhVHc6L32A17qCXvyPvcsRbbFooThePJQGr4XJf7rloLVfVW8LISRZfjDQUTIQXT+bR
	Lf4nO9dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kibJw-00037X-4N; Fri, 27 Nov 2020 10:49:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kibJq-00035I-Nt; Fri, 27 Nov 2020 10:49:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 084C11F4616F
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: mediatek: Add dsi and display support for
 MT8183 based boards
Date: Fri, 27 Nov 2020 11:49:27 +0100
Message-Id: <20201127104930.1981497-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_054938_923429_2B20D691 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

The following patches add the required nodes to enable dsi and display
support for MT8183 based boards. The patches were tested on a Lenovo
Ideapad Duet with an out-of-tree patch that enables the display for that
board.

The patches depends on [1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013

Enric Balletbo i Serra (2):
  arm64: dts: mt8183: Add iommu and larb nodes
  arm64: dts: mt8183: Add display nodes for MT8183

Jitao Shi (1):
  arm64: dts: mt8183: Add dsi node

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 224 +++++++++++++++++++++++
 1 file changed, 224 insertions(+)

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
