Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77771C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A3564EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A3564EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=trd8Q/l8fCaf+QewsQ5kqy9KE2gMG0rRDoCOXU2XxUY=; b=GZX1vL75awq/65alOG5uB4Mxm
	V2LodJZF5BWOAspdPatPbXFOcfjo5cc257IqVPsN1zrfX4znyO9lXUlFXe1IuoHrpYOsdeYhyZ/gq
	tUO/gZ+c4yfKaZ5qbGyLiNxOJmtEaU/FNqHP4Rr4oJ5CKKPBXRYqqTyrQAn9AfkvxSAKzpFlwMq0C
	sHSY00/qlGsPYjEuRWNAcD8xrv+yu8wqx77nk0UXHCaSBqJxwDf4mwgTJW2gyfhI09Cbrq7AEHIGw
	n9G4YTRQfdRw/c5QOgFpK3awKME58s1EBE5fOAg8G3LxBTfi7wSK9QEb5r7TNwBcYHJeHifTOk6Jt
	IrIuzBa+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qo4-0000SA-FP; Tue, 02 Feb 2021 08:13:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qnx-0000OU-7p
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 08:12:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b8so12019833plh.12
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bXT4E5Sy6uZLs7wQdo5bJTu5WRYHheEqLaM47OwgPQ=;
 b=N9CZId4S7hNYbNn/EmNWWSAr8wF37aSzNhCtlBao3KDWLCsBnQnmZwcwgNMVJ+Qgwo
 aEvbUuzL0mg9ObRvaxRKPwBfDVNBc/IjdMlgNHMZ3Imd5TFB8ytiv7YYtsf12SVSmqA6
 D0RYUGNidfFwif5NovKfJrFGa4Yw/81TQFZvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bXT4E5Sy6uZLs7wQdo5bJTu5WRYHheEqLaM47OwgPQ=;
 b=bWCaZ7ZFxk76/2DgcwzopH8iPrlBXvlG82AzQ6pPJGyfjRPuRdccEkYWhArdDqxIw1
 XihAQdvEDzAT2O/oSfcbvno4VaU6wO6RD4MdPq4qli/OzvmlCd/+MgmNubyT8CRllBFq
 0emU6fxuiodYTrQsRkLtqC/HWuzQxiBgu2Z7Ow5pQDyTKJSDwNaX35VgOpLbou7MMNQE
 kayPxoCKpG0cA8YiN4BIZK27s8AGWlq40Us2GQ+n9IUKxKFY9Ni6N0FBw3/ADcZcRn8r
 qahqdH+Nx7EzQDVV0rgkQGNU4WDpzEwrRL37fCMrf9NObFZyLjny+1FlcHgQBJU5YBdd
 aXAw==
X-Gm-Message-State: AOAM530WenMrUmQ/AvhuLhBFYuRHPXVzbJo/bhllihy5ShRTvWHK/52D
 SNRdfwwFLoCe93UqAOnEMIiCPg==
X-Google-Smtp-Source: ABdhPJyLF2wHpV/D+HMLvMmxWe3iY+vP7l2QjMeBApFcWHo4WmvFIsbrCNchQ+/N5KYiGO8dwC/Qbg==
X-Received: by 2002:a17:90b:512:: with SMTP id
 r18mr3195381pjz.124.1612253575220; 
 Tue, 02 Feb 2021 00:12:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:54 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 5/8] drm/mediatek: Fix ccorr size config
Date: Tue,  2 Feb 2021 16:12:34 +0800
Message-Id: <20210202081237.774442-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031257_380507_FFE518F4 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Fix setting to follow hardware datasheet. The original error setting
affects mt8192 display.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6ee2431e6b843..6c86673a835c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -65,7 +65,7 @@ void mtk_ccorr_config(struct device *dev, unsigned int w,
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_CFG);
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
