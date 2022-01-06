Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC75C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pOUdHILENyt6wo7DS4qPaV8TWymz+ex/tIm5aCwVP+w=; b=Vt2JtGbJ3WQEI1
	5We4rJ+CNRuc5ZTOaTL1jJoRYvGUrnxnbIm+6KJ9PNs0HGKbECDp9bNl9zQikBxbp40HjZJsJXXzu
	UHx0+yBsBgFnDkWdLbUMO+maPtXafS8FbSgPJn1AJ5a3rwWy9wrBdLVZd+Wazx2kw/F8tJz5CHTYD
	FjZyYgjtcGj/4V7L308rGT/TywBk2dpALQ14A4mKj3c0FC0FHNko96GCcgvVtkrdtXfjKAXSkZdBC
	jb2js5hb+z9f91aWwDViv9y5Sv81XlujA5b4TpJn2UDzZjsomVeA43muK4ClbS1Esyt/E9ZRtmrK7
	MPI0ukv5lno4zD2YIaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Mff-00Gmte-PK; Thu, 06 Jan 2022 06:54:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5MfK-00Gmmp-Lw; Thu, 06 Jan 2022 06:54:27 +0000
X-UUID: 08779d85185046b3964e98f9b967ffe3-20220105
X-UUID: 08779d85185046b3964e98f9b967ffe3-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1605816020; Wed, 05 Jan 2022 23:54:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 22:54:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 14:54:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 14:54:17 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH 0/4] Add Support for MediaTek PMIC MT6366
Date: Thu, 6 Jan 2022 14:54:03 +0800
Message-ID: <20220106065407.16036-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_225426_742953_0856102C 
X-CRM114-Status: UNSURE (   8.76  )
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

Johnson Wang (4):
  mfd: Add support for the MediaTek MT6366 PMIC
  regulator: mt6366: Add support for MT6366 regulator
  dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC
  dt-bindings: regulator: Add MT6358 regulators

 .../devicetree/bindings/mfd/mt6397.txt        |   2 +-
 .../bindings/regulator/mt6358-regulator.txt   |  22 +-
 drivers/mfd/mt6358-irq.c                      |   1 +
 drivers/regulator/mt6358-regulator.c          | 213 +++++++++++++++++-
 include/linux/mfd/mt6358/registers.h          |   7 +
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6358-regulator.h    |  45 ++++
 7 files changed, 280 insertions(+), 11 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
