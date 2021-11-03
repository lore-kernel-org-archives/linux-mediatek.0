Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA72C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 10:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E1F610A8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 10:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E1F610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ydbx7X5Cce+aL763ccj0UYbAo8oueY/R/qT8qRIbLsY=; b=iC0sAJ32mK6swE
	3m4v14taYHT4J9/DY/s4K5+BGyNfU7FLukSUpIOfCQujgLz9SZ+21LUxqHdrDgVoWQZk2l+i8iSpc
	6L6RGbUU1dintw1VOyhXA2uIg/oqHxXOPH/ah6CYVj0oay0yP7EPWzFGC541nBtOmJ+h+RDMKPQlZ
	JmH92SRbyPFcsse8sbiSmdo7IwMs4FCIurnt7zdSab8Hz8YQ8FPuu9AMr1qLP1TbfLqL39BnJRW3z
	ZW7nhpSJUhssWsqTE6UDGK2zvAWw3cdQPI9IWUztzrfFhdzjQ7La9q1InWNXjfqMqw/C5VOXdcLHj
	zZKwL7HtReGYkSJhgklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miDh1-004rBw-Qg; Wed, 03 Nov 2021 10:40:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miDgq-004rAY-4b; Wed, 03 Nov 2021 10:40:21 +0000
X-UUID: 01b8dfb7a0b9414db370ed8716c9a560-20211103
X-UUID: 01b8dfb7a0b9414db370ed8716c9a560-20211103
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 213038782; Wed, 03 Nov 2021 03:40:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 03:40:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 18:40:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 3 Nov 2021 18:40:06 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <enric.balletbo@collabora.com>, <groeck@chromium.org>,
 <lee.jones@linaro.org>, <angelogioacchino.delregno@collabora.com>,
 <bleung@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v2] dt-bindings: mfd: change naming of mediatek rpmsg property
Date: Wed, 3 Nov 2021 18:39:52 +0800
Message-ID: <20211103103952.12535-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_034020_211812_5F2545AF 
X-CRM114-Status: GOOD (  11.79  )
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
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
This patch is based on [1].
[1] arm64: dts: mt8183: change rpmsg property name
    - https://patchwork.kernel.org/project/linux-mediatek/patch/20210924033935.2127-7-tinghan.shen@mediatek.com/

Changes since v1:
- No change. Add dependency information.
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
