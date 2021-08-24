Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FA6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 06:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3D461265
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 06:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3D461265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zTzW/HXII0ZzztPzC7kUQnlInPaOsisvHivm7cvUDZE=; b=pInRD0dhrENz2H
	xfpGFZijwpAaYl7ym8n6KWIYIOHy3w/x/5gR2DzmmpqFduc5QOXKtGWYaVB4fzl1V6wDWsIMTHNEM
	lCi4QHfO35MLS3mdYz+VxK2v7xu+w4b8NtqwaR1mLWl/HISsBlvvSk1cPGN8XlOYtkYmm6Ho5AIX9
	jd0WRLGcVfxxcWegtuX5mPY0sumNl3CI5f7ww+kUW9YdzirnAIJshSbq5xqwZcgNrhqCyfzukTcuV
	Di7pOb//rgECkqmil9+5bAfDzzjzRZWpXNy1pMG2a3hQvF6emIaB1fgPVwd4LI4bsMPeHcOMwa7A3
	+TMYuoUigGLJJUKVi5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPty-001qZy-Mf; Tue, 24 Aug 2021 06:27:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIPth-001qWC-73; Tue, 24 Aug 2021 06:27:02 +0000
X-UUID: 6805485c2b034dc2b4beb7682ec7ef5a-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=65ntW6+EVPvFz8H0BDYbIbCEI5qWjzyZ/A/U0yppSbY=; 
 b=blAK/sVEeFCFh+ILDDpgwvNJ2KCee91m9cLZ7/SsQ3L6VygWOMCcZkTh2fEaR/BV5dDRpIh3hYEEXaC1l9fWwftcoLvVFQfTiq7Iby/vZ3lXN+xHdpY2LLRPAD9flhJ/iwaaRgbpZTmYTh9Ekb8TbV90//dbBkkOQJOQtNsCqJQ=;
X-UUID: 6805485c2b034dc2b4beb7682ec7ef5a-20210823
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 204066221; Mon, 23 Aug 2021 23:26:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 23:26:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 14:26:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 14:26:50 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <seiya.wang@mediatek.com>
Subject: [RESEND v8,0/2] watchdog: mt8195: add wdt support
Date: Tue, 24 Aug 2021 14:26:32 +0800
Message-ID: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_232658_705843_99E3AB40 
X-CRM114-Status: UNSURE (   8.73  )
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

Supports MT8195 watchdog device. Supports MT8195 watchdog reset-controller feature.

Change since v7:
  -remove "[v7,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document", because the patch has been applied.

Change since v6:
  -move the reset-controller header file to 'include/dt-bindings/reset', in order to be consistent with [1]
   [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/

Change since v5:
  -fix author and license in [v5,2/3].

Change since v4:
  -fix name formatting in Signed-off-bys and author in [v4,3/3].

Change since v3:
  -fix name formatting in Signed-off-bys and author for all the patches.

Change since v2:
  -fix typos in [v2,0/3] [v2,1/3] [v2,2/3].

Change since v1:
  -Remove the unneeded tag in [v1,1/3] [v1,2/3] [v1,3/3]
  -Add of_device_id of MT8195 in [v1,3/3]
  -use more proper prefixes, such as "dt-bindings: mediatek: mt8195:"
  -provide more information in the cover letter

Christine Zhu (2):
  dt-bindings: reset: mt8195: add toprgu reset-controller header file
  watchdog: mediatek: mt8195: add wdt support

 drivers/watchdog/mtk_wdt.c                |  6 +++++
 include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8195-resets.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
