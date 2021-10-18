Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5132DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB7C60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AB7C60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cz+OvqcqabNfZwPmOf7GbafkgfuLEtcLr81oAM35PT8=; b=4CcWWfud/hRc96
	MzpUKdsoKxDjCd27vXPqjDN476Aj08D8N7QPsDcoEjAzuYzIU0XWihwOJ8ih82Sxt7tuJwkAGXnZV
	YOXjLgbsHatspEgmnZIw+AaWmffq6DBUFqG6Z5dKaXJCh6vuofZnPH/CyKgJbmXNaVryUmZI+g+iS
	dlk942W2tvAv0HsmDK4NviJiYKnnIfJZjLb0fclW0LA7akrUr4bxaZzev49qGCyddF5pzayUArzKI
	dGWNpu9LPO1D5bE7xJe/+IvSzawtii5v2qfk2ZUZAFBmJuPml/ImjQgbCXtoiG7iJvlz7lVyRS5/V
	t96TLP2tvfrgvDIesmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcRId-00FWhd-0x; Mon, 18 Oct 2021 11:59:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcRHG-00FVqS-NQ; Mon, 18 Oct 2021 11:58:04 +0000
X-UUID: 3eef06b12cb54a91bff5cc501fe344b8-20211018
X-UUID: 3eef06b12cb54a91bff5cc501fe344b8-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 114721014; Mon, 18 Oct 2021 04:57:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:51:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Oct 2021 19:51:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:51:16 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH] dt-bindings: mfd: change naming of mediatek rpmsg property
Date: Mon, 18 Oct 2021 19:51:11 +0800
Message-ID: <20211018115111.14096-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_045802_816800_959BA4E9 
X-CRM114-Status: GOOD (  11.83  )
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

Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
vendor name defined in vendor-prefixes.yaml.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index d793dd0316b7..0faa4da6c7c8 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -59,7 +59,7 @@ properties:
       whether this nvram is present or not.
     type: boolean
 
-  mtk,rpmsg-name:
+  mediatek,rpmsg-name:
     description:
       Must be defined if the cros-ec is a rpmsg device for a Mediatek
       ARM Cortex M4 Co-processor. Contains the name pf the rpmsg
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
