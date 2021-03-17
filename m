Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33387C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 03:43:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A34F64E04
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 03:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A34F64E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/Khw7CzAAKh5dK7oMp9OTpsUHP1VEItKaKgCEc91g4=; b=euSRXXgQ9HofnMbwKJ3lwMkwRc
	wkknRcN1fFUVojN3mSPfOS4HYM+r2cSyGsRcRl1BjD4W3BmXkGoCMyDxC3XIn3vT8f5OKvuhKBEBW
	8sEhDmTPYZEzj98ItBdCrLk/teokMxrOPvGNyQyVk9dp74Ie3ZYMvFMpKIuSybbs3W28UJQo/uKF3
	SdAcgzmPlcuToylP9BXD3Hn9mNW6iYd9VrQsGQda/dUGOHNyV4oOfuAMtFpi+u/8+TycfuuL2eMwb
	P9brjIXaCpWUbXPhlt21G8kb9P1PX7MRohdgh9hE0CVqNdK7SaApMfL6+BAwm9KiD/grR5SMgOwcl
	Q1ZmxXYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMN5w-002McN-Q9; Wed, 17 Mar 2021 03:43:41 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMN5s-002Mc3-S7
 for linux-mediatek@lists.infradead.org; Wed, 17 Mar 2021 03:43:38 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id d15so26746468qvn.16
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Mar 2021 20:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=SAgc2wml3XejvpAqr2JtaDLGmEHKA05COtq+ks5Ch+g=;
 b=bEuTmKXAqskBXFd/wy/qeNIg15UPYvp24wIFqRiPJd8UZ9zZqsSAzUdx2kA3LnQIzd
 97WhiztLf4v7ezD/UpiOFhdSIOIIrFxXPVRlMgOj0AMFev7fqFAgbDHa1rs+ntw8mzB5
 aBqTX5CQwoAxcVxSbpoY43JJrOe3QYlUKx/m4fIGVocMeGBG73DTLgyqBGfPIK0g6fR/
 pb0/t1OZf+aYRFwJoWJ1Ny2TB31BGrYMNdfKDtLAwXxAKUGBYgxQFG1AD1nAJyyOgqS3
 Ul1MKYE1SJGj4+Vpug2mKa88fIHSBuAaoHl2D20vi1dhLx69Nx3nLuNWt4zOlIWRQ9fE
 /Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=SAgc2wml3XejvpAqr2JtaDLGmEHKA05COtq+ks5Ch+g=;
 b=dWuAIKY9M7/Kjm00gLGurgu7x2zsaAY5gwY66m57JQa4OQS22wHcAxePHR4ZWA7WpL
 sK9XAxEQ2xgrk/M7pPMtz3O5TY+8xqS7T9ratBtYm/q0/dWrth3dRs/Kz1GmTQVVAno+
 Nhm5q0FM3eP2hQyv7u6B9m53DH/DituEB5aTifPC2TKWfSuIl2lp6Otn6kejOyy2xQRG
 l9/82K67pvEKpzzT9zrPY83wCWlTDCCCE+cbO/lzOnmr4UycSXffQR/SXkpHH6lVOYGC
 KsLK8lL/SpBc8uD+vgb6RDNTO7m0kAJHsCScj0AVdeoVYOrSLZqgOeSiXapv1HUpp+X6
 yi/w==
X-Gm-Message-State: AOAM530J8+iZiRUm0G+hvrEptxgSlD23GqZCas3fW29gb10IpIWyW0R6
 pRPM7N9pJWNFH2727Tfdo7WDxmaqtlHk
X-Google-Smtp-Source: ABdhPJwhV5Ka0bq0Atr7uO5myqhFwKRA4fz+GSInT/He1TD10XiQ4javTnVT3LBOtwlLJTJeGeM8D73sgMjY
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:f96a:1dc6:88d5:6b7c])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:90b:: with SMTP id
 dj11mr3054173qvb.52.1615952612400; Tue, 16 Mar 2021 20:43:32 -0700 (PDT)
Date: Wed, 17 Mar 2021 11:43:11 +0800
Message-Id: <20210317034311.2281708-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, tzungbi@google.com, 
 Tinghan Shen <tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_034337_110145_FEEABBFC 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DEVAPC (device access permission control) is a MPU (memory protection
unit) in MT8192.

To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
domain 3.  ATF (Arm trusted firmware) should setup memory range for the
domain.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 2 ++
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 61901f5efa05..2aa9fdf5e59b 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..50bdec5a97e3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set to DEVAPC (device access permission control) domain 3 */
+	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
+
 	return 0;
 }
 
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
