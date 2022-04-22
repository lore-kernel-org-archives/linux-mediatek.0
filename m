Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5245C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9qYppkWIfdml2UTNG+WAEOpdbE4zA0hYLIfaEG6SpQ=; b=vwreylDKB4tMl5
	Z8dmZnv4177iYXmokZVwamUZXn81xiLye+DrOFRbOISPpqRhIZ6Cy9RSF6FEBfXTddSXbugubrAkR
	5hwQr5/MsFAhR0APaH3ZeSA4kUMIDpEtaBBJvD8lUs1SWlxNjBm2ezFxOxUSilavt6Ogtm3VO8SuV
	4r91CKCxfrF8zeQlNUKQk3eBmhW0AAhCrKeRjBkWiX4QtM8s2BylMWVMPcaDC5lqbZDM1KFnbWP35
	LO72HSpuQfVMrE/meATexpDlWMj/YFSW8tE7h1lIRavT9VE6ISQi2bv9n2reITWxUmNPJQCFleczd
	7lq00+abVbO422/SskcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhjD4-00FklP-LC; Fri, 22 Apr 2022 02:39:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhjCs-00FkhO-Gn; Fri, 22 Apr 2022 02:39:39 +0000
X-UUID: 5ea3d2addebc4b35995397f1e15113ce-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fd6ee7c9-f6de-4e38-974d-d81b80776b12, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:32c38bf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5ea3d2addebc4b35995397f1e15113ce-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 521148978; Thu, 21 Apr 2022 19:39:28 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:39:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 10:39:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 10:39:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v1 0/2] Add MT8186 support to MediaTek ADSP mailbox
Date: Fri, 22 Apr 2022 10:39:07 +0800
Message-ID: <20220422023909.6584-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_193938_590830_026C67A1 
X-CRM114-Status: UNSURE (   8.14  )
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

Extend MediaTek ADSP mailbox driver to support MT8186 SoC.

Tinghan Shen (2):
  dt-bindings: mailbox: mtk,adsp-mbox: add mt8186 compatible name
  mailbox: mediatek: support mt8186 adsp mailbox

 .../devicetree/bindings/mailbox/mtk,adsp-mbox.yaml        | 7 ++++---
 drivers/mailbox/mtk-adsp-mailbox.c                        | 8 ++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
