Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B28FC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B6560FED
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8B6560FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwpWUOfsI9vqvMuWxo8ooSVBNLIzULKJdkN1/s8kGG4=; b=gPCMzG/o+DUy/3
	f5M3crmcPDi99kneQly5L+h/5BTmYPt7ppzmXwnh9W1MuuiHkGFbCUDqeV8LN4VNNuQdD0CM9jUgF
	tSl8DwzGnmPxXy71y2DwquYS9QDnaK4fU1yjc/awFNaqDw0wEsVw35RIgelVK+Er1dbZR3HEZYdL5
	+ujZm3Vbu+/QWurqVZAL9CRu+Q1KTT3gmVC2XXEtqZQOTR1VWNwsWiz51DR4OPv7qfT2drafth5wq
	Lp8URbVIxUPl/5XUZ39TlRAAzhPzwg00BbEWBo6t2baFjqw8DzYHOZcPHgJJAF4G5GV014iyf6yng
	W+FA8F/hJx7ZD+eW3CbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKxti-001ViL-Lo; Tue, 31 Aug 2021 07:09:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKxtT-001Vg9-Gg; Tue, 31 Aug 2021 07:09:19 +0000
X-UUID: 18d3984333924722af28cea38ab3fddb-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rEZ4NGp3PykcZ39S+rGWPc1JOrTJukfem2Dh5AYi62g=; 
 b=jM6KKckIw3xbH5klE4yaOsWEnSk9blHvYhxb/5Wk2oaMS1ev8cw3MdD+CE6hDELOOdYmyZ3K1QCVqQF+lCmaV4KRC5x2ed2arjCszoHEhozJ9o1q2e+TfvVLezzfZuQ+V6YVYEhLlw0BpEz+DpjVUBlRUrZN+9EDk23Gv4O2TvI=;
X-UUID: 18d3984333924722af28cea38ab3fddb-20210831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1843351361; Tue, 31 Aug 2021 00:09:10 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 00:09:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 15:09:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 15:09:08 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v7 0/5] Add gce support for mt8195
Date: Tue, 31 Aug 2021 15:08:58 +0800
Message-ID: <20210831070903.8672-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_000915_601176_DAA9A7F6 
X-CRM114-Status: GOOD (  11.69  )
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

Change in v7:
- rebase on "support gce on mt8192 platform" series:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=524833

Change in v6:
- remove the unused define in GCE header file.

Change in v5:
- rebase on kernel-5.14-rc1
- remove unused varriable in mtk-cmdq-mailbox.c

Change in v4:
- change clk array to bulk_clk_data array

Change in v3:
- fix #mbox-cless number in dts

Change in v2:
- remove the second clock in dts and add alias id for gce node
- find the other gce node and get it's clock

jason-jh.lin (5):
  dt-bindings: mailbox: add definition for mt8195
  dt-bindings: gce: add gce header file for mt8195
  arm64: dts: mt8195: add gce node
  mailbox: cmdq: add mediatek mailbox support for mt8195
  mailbox: cmdq: add multi-gce clocks support for mt8195

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  22 +
 drivers/mailbox/mtk-cmdq-mailbox.c            | 100 ++-
 include/dt-bindings/gce/mt8195-gce.h          | 812 ++++++++++++++++++
 4 files changed, 917 insertions(+), 25 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
