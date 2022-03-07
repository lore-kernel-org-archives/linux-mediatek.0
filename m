Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cWCP/iJohXXwxFZxjiA6kJWADXYSBXbtQnlcsGXOe44=; b=nmxTE0ulQsBAZb
	649krm6VYuq3BCr508GWm/xj3CQ8ibf+EsMNMYDzfhpiZf1X+/ISKpysfwI4VTqnErVTcapt79s4f
	d658pBKOpxlYjmyMbcLS6zPwwBqtsqumk9iXML/HEWATYnTSgv1NZlsZcEy29gk3S+0DQtM0S6JxF
	jIijCgIiFpo/daoOHAlFVa/YEUL8MkXOFRVl6lG3kes7Y+QSQgiZHDlDWx3nIcR0HL9t9nBN77EuU
	PyR8Vt8yPkwTzIX9uHt8cFcln+ZB05+gP+N+1rfEusi7PRZbwFAvin5yAgW2xWKlQq4Xws28b3pYT
	64zAXOtKEjcLftNQJvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR7ID-00GAjl-Tp; Mon, 07 Mar 2022 06:56:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR7Hr-00GAeg-Pv; Mon, 07 Mar 2022 06:56:10 +0000
X-UUID: 97873fc2029247c9bbca8c7913d2dce6-20220306
X-UUID: 97873fc2029247c9bbca8c7913d2dce6-20220306
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1790129420; Sun, 06 Mar 2022 23:56:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 22:52:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 14:52:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 14:52:33 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH V3 0/7] spi: mediatek: add single/quad mode support
Date: Mon, 7 Mar 2022 14:52:23 +0800
Message-ID: <20220307065230.12655-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_225607_870438_188C2759 
X-CRM114-Status: UNSURE (   7.99  )
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

This series of patches are based on spi for-next, and provide 7 patches
to support MT7986.

v3:
 1. add Rob Acked-by in "dt-bindings: spi: Add compatible for MT7986 with single mode";
 2. add a fix patch "spi: mediatek: support tick_delay without enhance_timing";
 3. fix Angelogioacchino comments;
 4. use mt7986 instead of ipm in dt-binding.

v2:
 1. rebase this series on spi for-next.
 2. fix Rob and Krzysztof comments in v1.

Leilk Liu (7):
  spi: mediatek: support tick_delay without enhance_timing
  dt-bindings: spi: Add compatible for MT7986 with single mode
  spi: mediatek: add MT7986 single mode design support
  dt-bindings: spi: Add compatible for MT7986 with quad mode
  spi: mediatek: add spi memory support for MT7986
  dt-bindings: spi: support spi-hclk
  spi: mediatek: support spi-hclk

 .../bindings/spi/mediatek,spi-mt65xx.yaml     |   6 +
 drivers/spi/spi-mt65xx.c                      | 512 ++++++++++++++++--
 2 files changed, 487 insertions(+), 31 deletions(-)

--
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
