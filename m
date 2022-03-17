Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3649C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 03:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f37yXNR27XYdvqlcHTovHORTnd9lzgal/5Lu07rvUPw=; b=gSto78JNZT4j4J
	TAF+vhEQCz8xuuP/6ksNfoKXBkgTNyohLukynf7HduPlEM/sZvjrpK1yL06IPGg5gZijC0R0vT6J2
	76dwagIR9mjM4Fg4waFPz/KYrx+fcVn3vk6a707I/K5AFU26wwmtYpP8+Y38rit6AOhjVUJfpsugq
	6AXUCRcdiGNlyXdRDW9xKIkebEZpcCVs129WAmKhkkb5PXvz5Cg7/NTIdONQx2xXKEl/ohzy/fe/6
	xqTxy2KpLwUHARA8Ntvu1VzZdtL0RFdrYxqTsRp9Y1FhqaiWEU+fKW6r5qeu8DzF76vcC0PaJRjMy
	fEvWXsUTjevT1g1FUWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUgRG-00EmNl-Jt; Thu, 17 Mar 2022 03:04:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUgR3-00EmKH-2k; Thu, 17 Mar 2022 03:04:24 +0000
X-UUID: a30bd0fd683d4d4992f4b26bc77f84f2-20220316
X-UUID: a30bd0fd683d4d4992f4b26bc77f84f2-20220316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1020911449; Wed, 16 Mar 2022 20:04:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 20:04:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 11:04:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 11:04:07 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v2 0/2] Add support for MediaTek PMIC MT6366
Date: Thu, 17 Mar 2022 11:04:00 +0800
Message-ID: <20220317030402.24894-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_200421_150383_1A3E0830 
X-CRM114-Status: UNSURE (   7.55  )
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

This patchset adds support for MediaTek PMIC MT6366.
MT6366 is the primary PMIC for MT8186 and probably other SOCs.

Changes in v2:
- rebase on Linux 5.17-rc8
- change subject line

Johnson Wang (2):
  regulator: mt6366: Add support for MT6366 regulator
  dt-bindings: regulator: Add BUCK and LDO document for MT6358 and
    MT6366

 .../bindings/regulator/mt6358-regulator.txt   |  22 +-
 drivers/regulator/mt6358-regulator.c          | 213 +++++++++++++++++-
 include/linux/regulator/mt6358-regulator.h    |  45 ++++
 3 files changed, 270 insertions(+), 10 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
