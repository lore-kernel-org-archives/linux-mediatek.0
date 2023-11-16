Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70833C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 02:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=; b=wLy+pKSpRWeIAPqTevY95arhd9
	XiKHOwGXYweObJe+seKtAdTdswjDT5lMKMegSzvn+N65RxH59qTlykcZrE3Q7D52yRvzkwXc8Daum
	GG5pCaXXrnwomWkVJTsMzBRJd5Qd01tUG05mE4Gcstq+qSDoFURcl8wOAWC6N3uMmVSVoCUiOyhIi
	NZxPTT+FU7v4VBT0BZ+UK5IhjPuxUwdArtT9pkqYGraHN+PKVouxiyQcW8SoUNU8t6YYo2IpLa1/1
	8UEXaVWHOgskbIh8i2/UFV89lBKSNg3McryAW86JsLJ6coODY7mVUczJIR94vsNZGGiWSts0ownxf
	XL2zohow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SQ5-002Gc2-1J;
	Thu, 16 Nov 2023 02:47:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SQ2-002GbU-2P;
	Thu, 16 Nov 2023 02:47:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53fa455cd94so258353a12.2;
        Wed, 15 Nov 2023 18:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700102870; x=1700707670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=;
        b=i85pDsw6PoC1W6hBqOfqov03AjgUCVRVLOJ0VIDvz3N7CcFfvcm2ZFybiT5PlydvI5
         4fcuxn6XFT+1JpRtmH+eXwWvD53IMX6JUkp+Nf6nikHqKWGR4UAe4C+OFL/6TnBDjjEr
         4W92Y3f5UI7F8Vz3gdQjqvomct0nNxZAub2XXdYSYAsAD8c1M4oAkCO3b69Y64bxVl3D
         EDfp2o6Cw9qjPpuat1amFQpJAEjFep1bCe/lJS7Wh0nu3EtOjsB/fiawmoNooIF62EKl
         wDJxZVpTVEpZaJZNIXV1GmaBJAGdELZKdmZwIeIferQJl3s0kbxw8gm/UpElwD8x9dr7
         3Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700102870; x=1700707670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svtH6nB/hE04ntCGkIVPHKITT9cDPQUxSxeC2R+EmoI=;
        b=d34y9qp4x/WBtcZpulHti5+qA8z+rTCoUADwwRTpQFHo3RMzVXrq73BAuiu+ccsRDe
         X3i71nc9yWQtNwgKRVcPKnjzqA8z9gDHcjulG/0gPOe7B38vpvjDb6XvsAkqydRzq9si
         OCLFlOV3qNoxRxV+C/InFa++q83SFGoNVv0uFtcehYCV5bymtcjofssxSzF1TsXCRYXV
         s4xNllyK3fcUCYfgNnFqD6Qw1idc+K0O25eaFAghMCL2uUC6EUhFX7Ykd5lpIvEHRAu+
         t5j1oWzPLTbReeZT9H1DZBvAHt/21ADKZrnlsOzT/sbeS86ah4Hv85gZR1LHU76Iydgb
         Zgqg==
X-Gm-Message-State: AOJu0YwXJJglLCRTabDhatj0z5D70aQMgHqVXCjbhmFUtgokNXvXEVnP
	Ad3pLz2TzcwqUi9yfV+rJA==
X-Google-Smtp-Source: AGHT+IEssF56ALfrxIW+LldFPLXmzOUjVkBq6g/rv6UutDoRD7Ok3nF5TdlACFBBJkX1ZxxnUmzhUg==
X-Received: by 2002:a05:6a20:160d:b0:15d:624c:6e43 with SMTP id l13-20020a056a20160d00b0015d624c6e43mr15017621pzj.3.1700102870009;
        Wed, 15 Nov 2023 18:47:50 -0800 (PST)
Received: from localhost.localdomain (111-243-26-65.dynamic-ip.hinet.net. [111.243.26.65])
        by smtp.gmail.com with ESMTPSA id x16-20020a170902ec9000b001cc2bc10510sm7962604plg.128.2023.11.15.18.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 18:47:49 -0800 (PST)
From: Stanley Jhu <chu.stanley@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	peter.wang@gmail.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chu.stanley@gmail.com
Subject: [PATCH v2] scsi: ufs: mediatek: Change the maintainer for MediaTek UFS hooks
Date: Thu, 16 Nov 2023 10:47:44 +0800
Message-Id: <20231116024744.10795-1-chu.stanley@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_184750_809852_4995EEF3 
X-CRM114-Status: GOOD (  10.47  )
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

Change the maintainer of MediaTek UFS hooks to Peter Wang.
In the meantime, Stanley has been assigned as the reviewer.

The original maintainer, Stanley Chu, who can be reached at
stanley.chu@mediatek.com, has left MediaTek,
so please update the email address accordingly.

Signed-off-by: Stanley Jhu <chu.stanley@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be1cbc6c2059..4f6fb3357947 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22102,7 +22102,8 @@ S:	Maintained
 F:	drivers/ufs/host/ufs-exynos*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER MEDIATEK HOOKS
-M:	Stanley Chu <stanley.chu@mediatek.com>
+M:	Peter Wang <peter.wang@mediatek.com>
+R:	Stanley Jhu <chu.stanley@gmail.com>
 L:	linux-scsi@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.34.1


