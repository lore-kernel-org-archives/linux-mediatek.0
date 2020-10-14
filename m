Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA98C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:20:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DB722201
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vNxBiFx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KrFUI0fQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DB722201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Ox9807tuSm6FiNCA/MApjop482yEZ6NZ99eIQkITR8=; b=vNxBiFx1hJy5ALnxsw2qFwUZyK
	PjTYQ4qHngDm+CX6lZjl0UxYc7BaE8d6OyetFlkhqVodcIpNZ4Ettk11LKy9yH5dZlmSCA/+z9Lfm
	jGzkAYFraDeg63UyutGeW2q+q/junuk3MLF3FfxgTo6h0IxRfu3f28QCUma4FH7w1qAm9nJn/MEi3
	orFGEYPZGAtNZP9vi8yvjL8ykyaCzihpDbshdIo5giNd7sPVOfYMPmvc+XiedC5m0NGy59WyWs5+Q
	bYNhMyhC+5QbfhECg/7frupn8uU6m5kV/itMaC/YhhwnHk7VLAlOtEn3K3wRBs3DrOBQDabKH2wga
	0+97roMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSghP-00028c-Ba; Wed, 14 Oct 2020 13:20:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgh7-00020f-TC; Wed, 14 Oct 2020 13:19:55 +0000
X-UUID: 25bc72fb779b47c1acc3d3efff636ffb-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VKbmk+q6TZp792M8YotOsz2Eix0rdiCGpnXktYfljzs=; 
 b=KrFUI0fQZnYCJsT9rj2/FfJyHQk9IkMhm7ou2yfCkDe0MhvapxojZ0RgDvyIanOxFS9DVw4x/TZYiaq5drMYWNNOHzNgADWaG35JN/fCKOEQJ9CajopXaDkiKnMsKDxIRz5Yp2ty0pD6pEZvu5ckqNHNX8EMOZt6FFLaJLVhm9I=;
X-UUID: 25bc72fb779b47c1acc3d3efff636ffb-20201014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1293133198; Wed, 14 Oct 2020 05:19:43 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 06:19:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 21:19:37 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [v6,0/4] watchdog: mt8192: add wdt support
Date: Wed, 14 Oct 2020 21:19:32 +0800
Message-ID: <20201014131936.20584-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: AACF75C595E88535A25ED18B74F5FCCC1B0D61D4691CD1ADFFED2FA5B29200222000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_091954_104632_82229F89 
X-CRM114-Status: GOOD (  10.14  )
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
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patches aim to add watchdog support for MT8192.

change in v6:
1. add change log.
2. remove Reviewed-by tag on[v5,2/4]


change in v5:
fix typos on mt8192-reset.h (https://patchwork.kernel.org/patch/11697493/)


change in v4:
just revise v3 commit messages.
[v4,1/5] fix the description of compatible is Reviewed-by: Matthias and Guenter.
[v4,2/5] update watchdog device node for mt8183 is Acked-by: Guenter, and will
be applied to v5.9-next/dts64.
[v4,4/5] add toprgu reset-controller head file for MT8192 platform is Reviewed-by: Matthias,
and Acked-by: Guenter.
[v4,5/5] add support for watchdog device found in MT8192 SoC is Reviewed-by: Matthias and Guenter.


change in v3:
1. separate [v2,1/3] to fix the original mt2712 and mt8183 compatibles and add new board as:
[v3,1/5] fix mt2712 and mt8183 description of compatible, since mt2712
and mt8183 also provide sub-system software reset features, but mt6589 not
support this feature. (Reviewed-by: Matthias)
[v3,2/5] update watchdog device node for mt8183
[v3,3/5] update mtk-wdt document for MT8192 platform
2. [v3, 4/5] is same as [v2,2/3] (Reviewed-by: Matthias)
3. modify the commit message of [v2,3/3]
[v3,5/5] add support for watchdog device found in MT8192 SoC(Reviewed-by: Matthias and Guenter)


v2 changes:
Abandon V1 changes,and add the following changes:
[v2,1/3] update mtk-wdt document for mt2712, mt8183 and mt8192.
[v2,2/3] add toprgu reset-controller head file for MT8192 platform (Reviewed-by: Matthias)
[v2,3/3] add support for watchdog device found in MT8192 SoC( Reviewed-by: Matthias)


v1 changes:
Instead of submit the mt8192-reset.h, get the number of
reset bits from dtsi directly.

Crystal Guo (4):
  dt-binding: mediatek: watchdog: fix the description of compatible
  dt-binding: mediatek: mt8192: update mtk-wdt document
  dt-binding: mt8192: add toprgu reset-controller head file
  watchdog: mt8192: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  5 ++--
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
