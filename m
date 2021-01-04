Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E944C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:48:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC5921E92
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC5921E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T4WR54XBzbpIFO3JcJblqOITk3oTTC1dbsbP3Sp+hE4=; b=K16pkWoE2bSd2Hyxzhgo6L6rKo
	b1j7GXUqQ7K6aY7Ij/owNn9rjIc8WwdHNDhzvFTJQBndKZ6cDp8jy5z5SAxWdDSHLjlUcXusjlzo4
	rIDWmdXFDHg+QPJavfxubQqzEEJZFzocSCJUs0jN28y28/jUadv4ic6Vy+iqU6yWOSi3Jf/NfYE2X
	Uqcht9MgSFw1d+pYT315NrxJEn2o6bj+6wzu6A3LTp6EU121a+r0ZTBp5wRmRf1HD73H3aV0c55s6
	HyVxhYHTDNV3Gw6ih2G9nwbhNleQjoGkAyRbJyX5CKOYdiRg1jnxIExe0NHPUtPXJ3hNPW4sZrLY+
	EolQu0/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNPh-0001WK-51; Mon, 04 Jan 2021 10:48:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNPc-0001T0-83; Mon, 04 Jan 2021 10:48:34 +0000
X-UUID: 343d78cd83b44c7585e5a0be30627149-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=23QHnkLuinGYm8rKMPXs9fE4z8hMKaNYhY0miIGa8A8=; 
 b=ZJ+y40vPGqylYQHkHMiR3JKCkdoTbqoG4PB4s4iPi6tDlNDruXMN02LzD4+FZFEZrYG9ANk4c445a2kKmzmiagJToD4xBd+xf3SPp1DFLFGmUhHnoLCFmf+UcznYLADeVHP7UEZ3tCefzE3BDlSA2rfTDNMoH2dafwhm8Juw2ko=;
X-UUID: 343d78cd83b44c7585e5a0be30627149-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1759609996; Mon, 04 Jan 2021 02:48:25 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 02:44:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 18:44:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 18:44:57 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 0/2] Fixes for new SCPSYS power domains controller driver
Date: Mon, 4 Jan 2021 18:44:51 +0800
Message-ID: <1609757093-30618-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_054832_618025_514C3827 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch is base on v5.10-rc1 and
series "Add new driver for SCPSYS power domains controller"[1]

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013

Weiyi Lu (2):
  soc: mediatek: Add regulator control for MT8192 MFG power domain
  soc: mediatek: Fix the clock prepared issue

 drivers/soc/mediatek/mt8192-pm-domains.h |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c    | 73 ++++++++++++++++--------
 drivers/soc/mediatek/mtk-pm-domains.h    |  2 +
 3 files changed, 51 insertions(+), 25 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
