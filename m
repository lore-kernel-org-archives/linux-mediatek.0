Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9CBCD98CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=; b=Y2W3KPICJxHGCiz9HdOe1h/3i5
	HlS8tvknMYKrnVyT4+7adGd4upj5RXypmM9FpIYyP7DJSPkeF7mOv4Zj2cBoUxnRu7xSzX/8CK1I8
	AEWULgXCjCrEy8/rR30R5cKpyG3sybc9nbwg1bWjJiLM1usV11kn5x4qTyy4p8j/7sfkTz9IMbj0C
	7t4ezprGQgOhJ4hcalVOrHqg4PiomtbPkdq9bFPfnLP4aTq0MIhK/RY9IkcGcMpEnehmMMqhYQXza
	SiGWZm3whkHrNuPec5Nl2tHgxvatPUVWpUNeM6ICXlq6/CNVmfS4qfnlMYtaLlaY1D0mD6FqPEJdB
	N3+Xmj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRUP-0000000Fe7M-1ioR;
	Tue, 16 Jun 2026 10:57:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRUM-0000000Fe6V-43lg
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 10:57:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so2804548a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607470; x=1782212270; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=;
        b=SeBBTPKRZUzmLVfj+OwRmiI778wkirsRDY8LzFpkUmMEw9pl43p3rF6eeGifMW4cRt
         8R8VWoB/CXr/fYnjstrIBATPtaQhYUJ800KO6PFS0T865qWg31lF3YgBdCpIc1p98eFF
         4iKSj2+wpazmx2DHmhVkY0fNV7zGR7slUv1v/8iW5gdCByo1IQhOA4fuWFWTJ0j2Vs6O
         1Y7jX8c8IieydywD0OdZIiUu8i1neIVn+43Xp8qxZhLt9n8EiS0e5lD9rzSmr46C2TRJ
         nmng0EwE71QWZt+VDFk6vCn+9gs8R3PTZuk1+V5Mi4x8LorrSfItXv6/DTIwx7efABsZ
         PqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607470; x=1782212270;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=;
        b=YWFkB2B9XqZTl+BQK5kDeIJjxOiNWuwh01dWW8anKetPjy8QI3V2dFXPk+YZo4FN3A
         AJZWLDf19kb9EFZcHwMCCzNWocQ3TO03Ge7G2DOXyzSQ5vQq/sM4HNgf8EuweOd0DAXt
         7ld6t24U2tep6q9FgARYuJftkpYOcKGQAOa4i1NangE7WDr8VfTnDfyAqiLOv5p1tbiY
         DgsyjiZczvg+9Q5eJ9I1PP8tlC1Eq2yUUTQOuzqcUy6faPZOCchHOW2Iq1RLtXrsR4Vl
         X+CAGmCGjMV7CHnnvyeDOPllK96g05GapXIAjliDkonkC25RGQ9GjHSBWO20e/OnCxfG
         K1PA==
X-Forwarded-Encrypted: i=1; AFNElJ84vm0xSCm4VQDc0YIGBfyEUFjCwNgOtG2MzIPL7JBBQmXZovj1VNorFZbu8iA5gwtg1EeB9ilTSKKCpSkjRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4eAQMxMUt/V8ntC2gAXsKx+eDqNw9LFhRQMvfs1punA3Oyy0N
	2364wj6h9eKulu94XsYzlUqzY44/VINFZCvKhF0mCBpcRNlD2KsCZoQl
X-Gm-Gg: Acq92OEYpvF/ZdI0QbVY0H9AKw6Er2VWF+5HTXSz1SeRRpVbxcnvinlqIcs7Sv9lM48
	lnyv9TIYufFYJI9AHznvCbqVG1bnwwo9lzwNAvoaxNW0gJaZVGBwWkFgdl/8yMMO2Ch7jZmHAPw
	IHIuR4ZuArpzqn/MRihu0Wk8UVZHoUxu5uyrcNI1CsWGFoBpD6wJ3l4icYpM9FxRuVbaWBrsV+a
	TxB3otICn2o0XRzP/F2H02Z5rwfHqr1IjHVQ8afNBjWCwaBRUUmZ3uePI5jrMpVdYnEzlVqHa2X
	du43ffomB+T8qwdWE/SgLnHla0GOo346Z9ODkF1b33cyDGml4Qs0qyVfXgDRAdBqqWfv37Mf0dx
	KNCabk49q28v6eWb+WHbaGq7MDJ/VaGE3UR/wdABClxjOdKW5wXO9z6ZcVP2+RzwrdFf7XuWDDB
	FrZJrhUgH+sl/2RmqCSOyPmfASo18=
X-Received: by 2002:a17:90b:1fc7:b0:36d:633a:e8aa with SMTP id 98e67ed59e1d1-37c528e0095mr3107649a91.13.1781607470166;
        Tue, 16 Jun 2026 03:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e79396d7sm9849057a91.1.2026.06.16.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:57:49 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Tue, 16 Jun 2026 18:50:48 +0800
Message-ID: <178160746585.2156302.190868309474762875@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035751_029140_D4159977 
X-CRM114-Status: UNSURE (   9.72  )
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

When the last port is stopped, airoha_dev_stop() clears TX queues
but neglects to clean up RX queues. This can lead to:
- RX ring buffer descriptors remaining valid after device close
- Potential DMA synchronization issues on device reopen
- Risk of use-after-free if pages are freed while DMA is still active

Add cleanup loop for RX queues to mirror the TX queue cleanup,
ensuring symmetric resource management.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..9ca5bbf64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1771,6 +1771,13 @@ static int airoha_dev_stop(struct net_device *dev)
 
 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
 		}
+
+		for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+			if (!qdma->q_rx[i].ndesc)
+				continue;
+
+			airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		}
 	}
 
 	return 0;
-- 
2.51.0



