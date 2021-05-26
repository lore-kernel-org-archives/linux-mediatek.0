Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A65C47088
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 13:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6500060FD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 13:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6500060FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s7GtY+T3ZKlEgdHTg2jzW07e1VN7+y3DVacdP+J6Y5E=; b=tExaPjx6pDofME
	3awlEk9x+QKoAhm8WinEFKgoFHH0QQ0pcjhPc976e1PZfWuVT3Z5dBeAx7ouS2ojGAFcoIZ1XDpYy
	vrhknps5cRQ5Y67SpNoe+/QHZKWLGPju+Sy9DYobwTDh9faS2hMxuKQVy/b7GmZQE9v1KIubJkCc4
	D7FtdwndmfRvhASe9JlzGfXlbiPap4oDAeSE5VD+6u1qbkk+I/D9xD3azrND2hbE8LHyNEOSSFj2M
	EAQ12zt/4ofVky2wi+ZUAfml9l+KqxPW0i3URmYFpDvQ1oFYg+YvSBXc5WY22sNuU+bdQwxloPN18
	f+K9D7CARlDRKhatwT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lltA6-00EEu9-G6; Wed, 26 May 2021 13:01:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llqtV-00DEwq-L2; Wed, 26 May 2021 10:36:11 +0000
X-UUID: f69bca44fd8f49cc8a8c3545ad4b874c-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Np3pIDonDmLcpS8azWVffoX7bu+RZ+Cqq0zEWIIIwj0=; 
 b=oS9rVc/0ZN06hJQAoyzi/UMPFWWjsH7AqOA+m4yboBey4NPIrJ5rr5F+GlU3GK2lqh5aY38Heq2KeGITQf6FM2pZ04fYZ66FbjNrKFhHcjWnI0vtUotXJugwuqjCk/nvg3znHr5MuybC1i4yyKPqO7GAbQaYDnRiCdn8WzXRatY=;
X-UUID: f69bca44fd8f49cc8a8c3545ad4b874c-20210526
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 612591321; Wed, 26 May 2021 03:35:58 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 03:35:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 18:35:55 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 May 2021 18:35:55 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 0/4] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date: Wed, 26 May 2021 18:35:40 +0800
Message-ID: <1622025344-31888-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_033609_760891_8D7074AC 
X-CRM114-Status: GOOD (  13.30  )
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

This series adds support for new SoC MT6873/8192 to the spmi driver.
This series is based on Chun-Jie's patches[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=488239

changes since v7:
- rebase to Linux 5.13.

Hsin-Hsiung Wang (4):
  dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
  dt-bindings: spmi: document binding for the Mediatek SPMI controller
  spmi: mediatek: Add support for MT6873/8192
  arm64: dts: mt8192: add spmi node

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml           |  74 ++++
 Documentation/devicetree/bindings/spmi/spmi.yaml   |   2 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  17 +
 drivers/spmi/Kconfig                               |  10 +
 drivers/spmi/Makefile                              |   2 +
 drivers/spmi/spmi-mtk-pmif.c                       | 465 +++++++++++++++++++++
 6 files changed, 569 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
 create mode 100644 drivers/spmi/spmi-mtk-pmif.c

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
