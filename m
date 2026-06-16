Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D57CD98E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=; b=gAAkcukIUy6Ecj/PTtIBULDuNf
	+GZ+8mMdY4oxRdY5SVJXAtCCiMYQCrqD0h4CZNn06uMq9NZZDGmjeurltLacMuAqYn3pxVGmQMvRS
	yr3UE5MuRSzo29t6eH3W9Utcf4p27wd+oonEP1CVCylupTtk8deFs3ihVwxArVHr9BM2DJdS2YMWa
	RcxlLB4shA4tItLz3JAznnGn0b+Y46RglTyia9XDz2PwFzSvpGE0tUWbo4gCOnozcphXQ+h4f8LU8
	j+tSk469IgCrYC9uooX7/IYvb3vgFKXUEMzMdY/icftmLjhp/BvoST+u/RVhIeODySr4qIjZVh8Pb
	OimevXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSUd-0000000FjUG-2Qjc;
	Tue, 16 Jun 2026 12:02:11 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSUb-0000000FjTe-0w4j
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 12:02:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84347ad88edso3070917b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611328; x=1782216128; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=;
        b=Sl4THNJA2rO16D7TD5brQ+RabfAHVVJDtE39JBTBKvK91tPMQucOy/1at9edz5ARA8
         JqTW7FnelHhygOiVx6v2DA7sgd1frcHFy2lxkhi/TBujWfrfPj+sJFohHXWK+h4dIU1P
         XWH/t04ovywoH1n09MWaBUNSADia7aEO/09dyiQxuTI/GdVVTKgp3AleWbZJRV+B3xaP
         wa0+IbdE5+/nItX+FBFwoeJaKdHXpqSCi5Gwxb35nV89Nk+kem3DWUvC2z/9yXVpFxii
         0mxwxVF4cEWl5/eNoX9vyzIwgwhlaVxZW60glSI0aMJBkY3cHx7w5QbvHw91NP3g/2aC
         hv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611328; x=1782216128;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=;
        b=Gu8Xylo9naeOiwV5rKWWR2jiCJoIxtnwqA1NnLacIBlrec4Oga5BkgtRGcyjaJa2iF
         uqCgWOnla+AmuREV3E8xZYBjTa8jVB3IKc9yCyx8uJkzo3l233voQzy9lzhDVBGXJyPU
         5A3+m7FDCTIGm6l4SiOHgVFLP6qYyenKtBCRswN7zMCO44XRljEphTseQPuWrPpDKDFu
         9Gud3c/1p4EQujvhYndHqsv5O8RAjO/KZlyCVPOu8HtBbKCSDQPHDcHrd4RbFsLovfj6
         ma2BD0oRqzbTP4CHkMaNjkoePaSjXOVoQyEnwT1q5RsI4QosheShfHdCSsxYR/c8H5UI
         Qrig==
X-Forwarded-Encrypted: i=1; AFNElJ93uXZBr06WXL3KEkc1f3GNWfus3C1fHStJ8XyUfM7DvJ07mvWIpampgrPOA6YwZDi34KcP7kWXwYNbtU3fgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHK7irPjaXoU0IGWFSdVszrz2wgWNuWiJPVVQEj+h+xoEUl97s
	9BF+nliauFedh+NF9g4f8HezXbhYrhoa0JB7vWywP9bkjR5yHsxqOGq8
X-Gm-Gg: Acq92OEk8+ovhc6+iqc0YjcD+M3bA+cUQqDHqIp/w3kVzReuXo5/i1IdwrmH4fH04md
	+w7DUrVQql+E5nTSv9IMwbFAVNXBB1u+y9yxrPtaG/IO8FQ+95udGrvqmRKtmN7lbtV3IWqFDCT
	eO5oHNxkBGkdiV3F8fid4KuYJQ4663mUBdyfDSN6ygxLgekM7VUfTaxwCG526sGrWdTto3i6v4l
	GkgRmul2jttu+TMSEEKm1rrrcU2icRRtNqv/9TLjg/SbAjT6b4kumiznfEAD0tCabUaU5HVA6Cm
	O/ss9/DrY9WFV7sYR1FfAcvZWzheNWvAcHAZwuVmfnyMSB4Ow05EUjTQhhOG42nj9jltqGN95Ik
	kQvbKMJRN9cZxpHdTVuMOLmymLVQ3Aln48uuk1A6fPUIVxlx5tPLu+rgU6OSZptKWe2+K39Nezi
	h6fBb4q7/IzRTAe1MD
X-Received: by 2002:a05:6a00:993:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-8451566da92mr3284092b3a.43.1781611328433;
        Tue, 16 Jun 2026 05:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm13341635b3a.12.2026.06.16.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:02:08 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: Fix QoS counter configuration for Tx-fwd channels
Date: Tue, 16 Jun 2026 18:50:29 +0800
Message-ID: <178161132384.2164449.18407700117859190327@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_050209_263701_1F458790 
X-CRM114-Status: UNSURE (   8.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
using register index (i << 1) instead of ((i << 1) + 1). This caused
the Tx-fwd configuration to overwrite the Tx-cpu configuration for
each QoS channel, resulting in incorrect QoS statistics.

Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
counter configuration.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..329988a840 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoha_qdma *qdma)
 			       FIELD_PREP(CNTR_CHAN_MASK, i));
 		/* Tx-fwd transferred count */
 		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
-		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
+		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
 			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
 			       CNTR_ALL_DSCP_RING_EN_MASK |
 			       FIELD_PREP(CNTR_SRC_MASK, 1) |
-- 
2.51.0



