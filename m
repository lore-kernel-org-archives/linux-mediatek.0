Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9EDC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18+zD8zJYi3/Cfjv44S8LZuiPVGNRYG6CxrA5L7f37c=; b=tsqtPx7p+0a1CKC3bOyRtUZWR0
	fY0OKe+Ab/2qYyB+jUPv716CK5WdUSoUh1126aJxlmnsqXewSUinj1XlbBc0uH2GdjSeck1KYUqhX
	qJgc+3k+laSMIoWi4D23iIGpsu0mnj/UrgFskfnKp4lKv2NIMwdlzFU8As/yl/l+W/TObiZb+ndIm
	beDAmxqCtan5mj0CD2HV6cwCygmrrh+xncfNHJCH1IO8PZDfOpJDkyZcIySdNu63g2MHAKFwdktYO
	lUgrqmFVSgv0Ytd1XmK5fM60UorpKrbHXc88QiaWfwgQuLvDGEOl6Qfg5lCdvwrPnqHRm5FYRcqg5
	7u0UJ3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9v6-004CdD-0c;
	Wed, 03 May 2023 10:41:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9v2-004CZk-1s
	for linux-mediatek@lists.infradead.org;
	Wed, 03 May 2023 10:41:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-305f0491e62so4435948f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 May 2023 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683110466; x=1685702466;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18+zD8zJYi3/Cfjv44S8LZuiPVGNRYG6CxrA5L7f37c=;
        b=pJJ5gpIVOdGJhMps7tKZauJYNEF32/NT8iGK0CuyrDEMVE/+NBU3KOqSMTj9UrNyxH
         yh/mmvEsDhCerh0pN6S2YvvP317oQzB7NpLlxLEMd8exJoQ3WtTLvenIe8rrvw5tksJI
         9bMdxotUdgPuRgbPr53Q0DIRKEwizOkOpgz4WPR2SaYSgLLJQAqJCT/fXY1dYluBqQr5
         sL7lU3SPvBjKCj5N5RDsALucCOjJ9LZg9edK22h+/i+33pi/ryAYptI8g2Ye0C4pmGy1
         IIrZkCMo02AhdeWs9zNglu94SXjxtdSx5EY0EvurVmzqaZ4gdLFAnnM9FlXJ7iZmTjlr
         VgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110466; x=1685702466;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18+zD8zJYi3/Cfjv44S8LZuiPVGNRYG6CxrA5L7f37c=;
        b=aZ5Z98T2cCVs6zjsyUU2yYzFuBn/ogs8XOY/CpbqvqGtKub7vMou3jVgmQ1hLODZvv
         jWO526WkwgGABeBiP3+9DI5HjjmUND3KKto0r8dHF5hht/fVm2sShI8djr5kpCJE8ugM
         7U1MWbYS7l10bLU8Bch6ABBPcOfsGmSkddNfNOtvqA8jDQFXP0i0i4Zs+iiNgg2HZ8jW
         MWnynC9XjpoOkWngBOvbpQ2CTF8HgkDFTEtGMNi8NGgaIoyrfcNTFh2lV516pKuIqRFe
         Mt86Lz3WG78cxRWfdUNWpUeQkiY6C3EExgzqkkfAaleb920azbzVsDm/lcdgDU+N81JQ
         2DhA==
X-Gm-Message-State: AC+VfDxaADHQDEx/hdl7J+X1OQjXP4SycbOv3fpBIxBYQjGeGaEI1aGc
	QY0/3WZTCQoMYGL6W09jm+9DJg==
X-Google-Smtp-Source: ACHHUZ5WMJai/7lvt00NBo93bMqGBV8AwVXXrIpyWqT8UcwT9B2mcylhVQ9xuSDVl+13JhaF2VwWsQ==
X-Received: by 2002:a5d:448a:0:b0:306:459b:f575 with SMTP id j10-20020a5d448a000000b00306459bf575mr554124wrq.12.1683110466641;
        Wed, 03 May 2023 03:41:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h13-20020adffd4d000000b0030631dcbea6sm6450573wrs.77.2023.05.03.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:41:04 -0700 (PDT)
Date: Wed, 3 May 2023 13:40:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>, linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: ufs: ufs-mediatek: delete some dead code
Message-ID: <68fce64f-4970-45f1-807e-6c0eecdfcdc2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_034108_628513_F24C959D 
X-CRM114-Status: GOOD (  10.34  )
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

There is already a test for "if (val == state)" earlier so it's not
possible here.  Delete the dead code.

Fixes: 9006e3986f66 ("scsi: ufs-mediatek: Do not gate clocks if auto-hibern8 is not entered yet")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ufs/host/ufs-mediatek.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 73e217260390..a054810e321d 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -410,9 +410,6 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 		usleep_range(100, 200);
 	} while (ktime_before(time_checked, timeout));
 
-	if (val == state)
-		return 0;
-
 	return -ETIMEDOUT;
 }
 
-- 
2.39.2


