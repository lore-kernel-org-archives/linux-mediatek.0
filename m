Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDA1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:31:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAFC206D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6c7TcF1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="te5uAQYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FAFC206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phNczL1dBB50EnbSJ3O8pToALuG0gooSrf0vS8qtsKI=; b=P6c7TcF1pDpwX57YPX+cWa+n6B
	zi9FxTSm8K4Qv9h+2DZVhvfoL8r7Dylh4N4cFjSLCjLWszS6zIuzS+swxc2VK0p+gQpU4Yr2QPDK1
	RTkh96MRs/cwMgZzjnrcfG7C7YQ7gX/LGw7MM6mRqKB3EYu6YExkSWA0vTg6PHNAGMAJUyXdDTqOX
	vuGvloIX2sX4PzDrhltk51A9QUnZ4fGmbGGpKbGlAz+wyEzuo40hh2kCNzB6kdXxlH2mx8j2PiH8M
	Jo6n+dekXVk/t8to6dJNXxU0Xni5gOLchkelMHkaWAB9cNsm5KNMyR+x+65qa0ZcQfU7mtBAXcejU
	uLZ8+KeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0fcg-0002L6-UC; Wed, 29 Jul 2020 06:31:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0fcd-0002Jv-82; Wed, 29 Jul 2020 06:31:28 +0000
X-UUID: 6ef4c0076b37442d9d1d9f210f0c94f6-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7d434J+8AGhHBRMsSJUUAUNurMmar1Y1icwYzPXviTE=; 
 b=te5uAQYcYuJ0/XfyRUu7vI/xT6KNaWK7F8oS54bTmYS/nODZyEHD0HpgcxPmMiSg8Q8+zKa7f27Fqn8oMvUVO+ZXpgcKa9AMxaEXANDcydBX7cErZw+NZ8Hcwi7MHBbI8A7CwGj9NIbQ833oEwt/bjKIdMb/BRK9vCxd9XQv2Qk=;
X-UUID: 6ef4c0076b37442d9d1d9f210f0c94f6-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1208160411; Tue, 28 Jul 2020 22:31:23 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 23:31:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:20 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,0/3] mtk_wdt: merge all the reset numbers in one head file 
Date: Wed, 29 Jul 2020 14:30:46 +0800
Message-ID: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: A14E659C9980EA793FBB66FB1FB60E4DE883D1B2A701CEC04D273F5B3671698B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_023127_426916_B91CD383 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series patches merge all the reset numbers in one head file

v2 changes:
merge all the reset numbers in one head file,
instead of pass the reset number via DTS (v1). 

v1 changes:
https://patchwork.kernel.org/patch/11688915/
https://patchwork.kernel.org/patch/11688925/
https://patchwork.kernel.org/patch/11688923/

Crystal Guo (3):
  dt-bindings: watchdog: modify description for mt2712 and mt8183
  dt-bindings: watchdog: add a new head file for toprgu reset-controllers
  watchdog: mtk_wdt: merge all the reset numbers in one head file

  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt |  4 ++--
  drivers/watchdog/mtk_wdt.c                             |  3 +--
  include/dt-bindings/reset-controller/mtk-resets.h      | 13 +++++++++++++
  3 files changed, 16 insertions(+), 4 deletions(-)
  create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
