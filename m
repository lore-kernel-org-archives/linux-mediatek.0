Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA910C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=; b=NL9bgU17Y7i/KFJy6rGbigtk2z
	ze22bak7tXkl7O1lSlunEcLj3AgWyU1z7KL5RSBKiUQnHFFmGLk7u8gdC2Km4ozVQdS+5G11KsVHD
	LhuLy8xZFPKSLcXyFb939a5x1IKjfYJw2mJuWz8WFT2wG9HSqKWmjDcgwiUQ05PCdoMQVSk0KsENq
	18nyvBOFRVResQ+dn72UEjizjj/jaGCd5VYCsiHUXYePj5pWgsWXYNFXqJxJ9kqZ7NBU4ZOG1F2SP
	RRbAa/jsYBeTxxGgezK8k6xM2vyZDjgub5S0SWmqDb23YLpW91L7jORqLBI2MDnZdl4cwBA1R7jk8
	Pl1Mz9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpw-00000007fwa-1fwS;
	Fri, 07 Aug 2026 10:30:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpt-00000007ftl-0kie
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 10:29:58 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceb096e675so38959625ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098596; x=1786703396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=;
        b=Rq6xeFOQ5PwmfHDPSOfdEArr1R3vfL8nt60n7X31dxQ+b7ua907ZO/x+mFBA03x0Ky
         iY+RFjucZI13mLKSgJ3DzKLF6XwnBL5pS3/Qp8IyqqwO5NXTar8q5WYHPA+PN8MCVaP3
         mR8afD6J008K+c/ok+I4YeA4WO+sQXHM8aJKvhWlN5bK8slRRlrEx1S4cwocEP2+tJWO
         FoRHVMuNwFK1u2EGiK/20VT+cMHQKmwnBsXiuOjIEo7j4CJBy6qjNw2NAh1UMt29pNFn
         3Zq3jRYMgD84WmRWQJop15L2gVqCT86TcQKEDxhFh6RwWJzmf/6+1IAURRDeLHrTFKaB
         M7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098596; x=1786703396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=;
        b=TSf/yXhb1Se06K3A4y+Vh5js+pmCpbCqNQV1HNVGntDaPibYAM8TWyskf0SQDQ/O50
         bFi9s+nVzR6oI6FvJ4j1Xd94RrfSCfbq+6Xr4BNoRtWKxeKkGUoF/4sWTARpq86B6PQK
         OKxGNaUOCNNHpUDhRn4WrY9qa7I+R8D+CaEDYOU7CY8amKtSSn8DEGjIrCXgxriy0sqM
         vrBH0tuAx5skjt319pXyoMJVpco0ugHi4sNzNoUS8UgDC857M1+D2RXJh+3yQK4sPTaT
         xoLBC1NLbiC/ymFIXXmqRCmO8traRMZ5sclsh4i+vg4e+1VhZbtn5vxlUH9PYzt8KI1P
         H9LQ==
X-Forwarded-Encrypted: i=1; AHgh+RrY39dnejxpB59tcvdv0uTt0tiYHnTVVVkl+08vf+RmUUJBGt2cgCaMLeebn6ELZTAYc788ZErsspONJnY87Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEh8tZ70DbLWlszmTXrJ4oYZNo4vrK+w5ErkdTJFODA768H+q8
	rjKWZxlQZghG3NJYU+Fyhax6HSG8wCWe0RiStfzWuPZCmmo96ZxMOd6g
X-Gm-Gg: AR+sD11inkjEY/a0C0DuLYKNmClvVIMTxSc7vKCtNWo09JaQXcgHgK5dhMjxlYzny2r
	eHfKK98Lj3rM9cNWoxGwIIO+o2YUYvJTBuV0UrQMTxhosD3SWBs6yycw5ZNC5UHc4hy+PVU55Hz
	YWrAKW1GYrIeY8FUa3wRLtLa3Y0cUhNL/3OUCozoOYglgtHq0alahqqU1VFEQ7Olm6mwr1tynzl
	czEBVMnPlP74Nr975E3tS5JSt/lb8Fls7Rq7JuIF2kd8DlD/Xf8nAQS0MhFTBfQ9E/yJCwbMFzM
	/6cNeFXUDTFl6Cs5eIgYYO+q/s3/UmQLDlRAOXGGZrfth66LvK6xRQxY1551k4AGfQXmW4hvD1j
	fqzl6xoejVl+yP6N30Vxc0qmhYBZvjPS1A4rcp5f1n91xuPgO/UvjUKHzUPhW+O4D/S2eEuB4LI
	mEmkpDJotsyenbOG3D0mzjYDaPGNQaJq7zdClF8g8N9GyQxWESI040U+nTSj8b/6zI4Yrfyzzse
	q2Phe+kWDzhIbYWGoLnNhpnljtX5XQF1Sh8fhfTphZBd9n4uAYzSK9PsmcELPi3TVk4kfBJKKCN
	kTYL
X-Received: by 2002:a17:90b:57c3:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3903c5589e0mr24025142a91.1.1786098596171;
        Fri, 07 Aug 2026 03:29:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1389e1fsm1133614a91.0.2026.08.07.03.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] spi: mtk-nor: Propagate errors from IRQ request
Date: Fri,  7 Aug 2026 17:29:31 +0700
Message-ID: <20260807102932.45785-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807102932.45785-1-phucduc.bui@gmail.com>
References: <20260807102932.45785-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_032957_218123_C6C47FC1 
X-CRM114-Status: GOOD (  10.96  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Treat a failure from devm_request_irq() as a probe error instead of
continuing without an IRQ after only reporting a warning.

Return the error through the existing error path to ensure the driver
does not continue with an unsuccessfully requested IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6b9a5d728549..c1e15246120f 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -905,6 +905,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 				       pdev->name, sp);
 		if (ret < 0) {
 			dev_warn(sp->dev, "failed to request IRQ.");
+			goto err_disable_clk;
 		} else {
 			init_completion(&sp->op_done);
 			sp->has_irq = true;
-- 
2.43.0


