Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RGGmO1KOPi05ygxqfj0bIflj2q1uQ5Ns0Zt7E7ik448=; b=e0RWhPlHXocAgZ
	JwH5K4FQj4YcQ40RCdXR4AyEspRL6ighalsqx94pTlmSsJrPc2i9nysghjIxNSIOf9M4Ajt7yzAzb
	R6CA+fykKy9GH4ktOmYu3FaDhxMBA2OqmlRHv9ZiGLO3IP2aQ1Noazm3AWTtmHoz4BmkzE7h2WdhS
	Ln6OmmtmAQ5ZTj1T69lOLEE3BhGDyw9wBPpLfdFyAKuhXFfR7zIOnWilf5Tafnnqhq2js7nacrsfe
	ogOswC8MWFzO3yAu7v05JMUAVlZk0vKwrX0EtbqwbYBdKLnUcGilvAAPd/yaQSdwcnE1z/zW0ff7h
	TyTyj2Sk+ki2O7HERISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myUt0-00DDWy-13; Sat, 18 Dec 2021 08:16:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myUsn-00DDUE-PP; Sat, 18 Dec 2021 08:15:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9027F60AE3;
 Sat, 18 Dec 2021 08:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECE3C36AE1;
 Sat, 18 Dec 2021 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639815355;
 bh=HYrFoZHYUYlXc44YFnFqBufY+oh5rcfMio9k12chSNs=;
 h=From:To:Cc:Subject:Date:From;
 b=hL1oDTStOuDAPwSDvcF+ZbWPQ8xRrjRWonifZ5GZXS+AQafEAEwc3LHXj21hmWt14
 JNEScmKR0C336CcCPxqnKZ9xdYToKhLFntRm1MI67Z8utYfDGnNwX+0idRKmFiPqBr
 hOTwGqZ+JgVPmyZxM5j730jJp/Ad53GtXgxUdwxadTFyrXzyc3dUhQXW2zG5kG7gVb
 U2COcORHFXw/NtqwSzhX0YUBykYy+oJF/+Umk0XiBPCjQV0hlCftWGSmpNlz/itKaj
 p+MHSxSATmxQKIrCmS66o2HySVacfjlNaH0xTCrosBMzmS+rN8aQb7KHoFrWejKv9B
 c3MjD9nbZHCag==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, bleung@chromium.org,
 groeck@chromium.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] mfd: google,cros-ec: fix property name for MediaTek rpmsg
Date: Sat, 18 Dec 2021 09:15:43 +0100
Message-Id: <20211218081543.3851-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_001557_913702_6A25800E 
X-CRM114-Status: GOOD (  12.41  )
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

From: Matthias Brugger <mbrugger@suse.com>

The MediaTek rpmsg-name is defined as mediatek,rpmsg-name in
mtk,scp.yaml. Fix the binding documentation to match the new property

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
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
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
