Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE8C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0420664E10
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0420664E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f7w7K3NLZlAmt+RjgF/wVD3HzXP6DqkFUhD60A5AmgE=; b=hChfoJPIoFGbIw0Kz8RWD/IYm4
	n+MyesVZ91UIi2Hr8oPPo3V/4Vy805j5KiAY2cU1D5RVisn8XQCu7320lVd4gFybbRD5ITJ/Iw2GM
	AVw0XFtP6RFWJIs9j0VNgtU96G1PRfhdkgL+x+VKBFpdSo4jIIQUgrKgGWRs06OdogZ08qQCZ6z9x
	FrcL/eBZgdVnDELRqrpKmYCWHHUZllYNPOfal/ohzzT/kykgOM/W/aUoxqyhzhKgjQkHCOsB8ml+8
	dbWR06OSJ05zT+cyxVyohda9P0hh6zDRWwdQLRLJSrb0wAEQT1Kbbjt9oA9uoC57sBUeRcf7lbvxK
	hlc0OdsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l69na-0002sl-7L; Sun, 31 Jan 2021 10:17:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l69nV-0002s9-8i; Sun, 31 Jan 2021 10:17:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE49564DF5;
 Sun, 31 Jan 2021 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612088254;
 bh=4eczZv+hpT+gqQnuIVlGGfa+0AV2WlG4wGhPmrPZXmY=;
 h=From:To:Cc:Subject:Date:From;
 b=DjerGTVwdB1KFlHn0MpRDEMtdgNudre95AhlTUg7ElpG1b9k5Zuy0ZDkeyVDFqVeg
 gQObOmTyCbZchBg7ljrawiPcj8WvA0VnTh0xe72s8imTALZ+GUUl262zOsSCuvePC3
 7dlKBrwtlGCyHBkVCR/3DD1yCRdAsRCUVmkrNnUr/LnvfmSTjcrRBBa+vNQrXQXw7c
 DjXciwucETfrbddRiwnLKIybWjFpyL9cs0Zo6711vbrmRYNo4AejuaQM7C+S8+3RV1
 Ndg2QLd30GsM7a5LI+lxy3Ct20Nd9fUoRkJ23ikXXumjjx39scY5ON7odjxL9uAGGw
 XvhYJITJPMlfA==
From: matthias.bgg@kernel.org
To: matthias.bgg@gmail.com, CK Hu <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] arm64: dts: mt8183: Fix GCE include path
Date: Sun, 31 Jan 2021 11:17:26 +0100
Message-Id: <20210131101726.804-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_051737_387443_73C9D54C 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The header file of GCE should be for MT8183 SoC instead of MT8173.

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Reported-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..80e466ce99f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -6,7 +6,7 @@
  */
 
 #include <dt-bindings/clock/mt8183-clk.h>
-#include <dt-bindings/gce/mt8173-gce.h>
+#include <dt-bindings/gce/mt8183-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8183-larb-port.h>
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
