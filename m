Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1720BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Z8KIQr+SRYc+v9mBgxN5beBKNkcH0GSTuX+z1acSPY=; b=YmzaOiAIxsLBPw
	mvhb8UWn1kLiM5qO9cnwhicm69aA7YsKYZOQ7LnrXXFxbfqguqqoE8AT88+HRqwW29ygehmPvEVec
	naEN2FVhMfIk9xR6LCM5LHKN7FWQTtmDHksNnRwtgKlPMj4l3h92adfTQibIxSPE5Bc9NSfC2ATvM
	OWzQZUjqfXvKIM/kfbp5yxnTqBXp1wo1VyjRTYpbodx9778Ty2m6/jgHf5u5+MWCdZZIyvamrDa/I
	YbyMAp0GTmzkW95N3DT/8jwvmEHL6N7mDSuklU1iTTZmjk9InIOxTnNi9BkzOwPZzK7JlMKp2kYiX
	a5nWO28wcltM0Zn414bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsHH-000Mc7-Oz; Fri, 22 Apr 2022 12:20:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsH7-000MZ4-1f; Fri, 22 Apr 2022 12:20:38 +0000
X-UUID: a437898bd2f74b7a9dcaa64c32c0f44c-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:73b7d465-9c94-4e51-b494-cf7285061643, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:3b6f9ff0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a437898bd2f74b7a9dcaa64c32c0f44c-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1251697671; Fri, 22 Apr 2022 05:20:28 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 05:10:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 20:10:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 20:10:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/2] dt-bindings: watchdog: mediatek: Convert binding to YAML
Date: Fri, 22 Apr 2022 20:10:15 +0800
Message-ID: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_052037_156528_80BFA6C4 
X-CRM114-Status: UNSURE (   8.86  )
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

Based on kernel/git/groeck/linux-staging.git, watchdog-next

Add align watchdog node name with dtschema PATCH to fix dtbs_check warnings.

Allen-KH Cheng (2):
  arm64: dts: mt8516: align watchdog node name with dtschema
  dt-bindings: watchdog: mediatek: Convert binding to YAML

 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
 .../devicetree/bindings/watchdog/mtk-wdt.yaml | 76 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 3 files changed, 77 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
