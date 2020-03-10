Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76C1C10DCE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 21:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E49222C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 21:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aIX13zmN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN1DJyXu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E49222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zH1vFknY+yz7WyQy0r3odyFT37d5CJtAErqOHfxMVpg=; b=aIX13zmN2vKJTo
	i01IJHPFDrFBdK9sSaR229K7FCXMeJdvqH2IsFTDfdg2waB/wxL5h6troLrVqmADaaXO2eGxufPp8
	qf8AG7Nha9Rdqgu3bkHEW7n55aTNXqnjyk5CDs17g2045So9T8NAXjOcGt7FZYXEWjpinF3D4RiWj
	FFt+sOC05npF+VacZ1K0UjIrmsUZXYsQZjNwKj7B2/Cj+eqGmqErgmDrFTpmDe2GexnVClMuUVDrJ
	SHD8ThoFQeax59Mp3Hvr908M6d30NJWNclVoDSi37iCrSANJFJ3IbkRyETX4UOz6bpJtBgmphUMJ2
	bVUce/TfNcAcrhhY0gLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBmDt-00040f-RQ; Tue, 10 Mar 2020 21:15:33 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBmDl-0003qx-BW; Tue, 10 Mar 2020 21:15:26 +0000
Received: by mail-ot1-x344.google.com with SMTP id s15so6444817otq.8;
 Tue, 10 Mar 2020 14:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7hNWBofucArT17MnCRXZQMQQdTzbenzVIK3M8zSgFrs=;
 b=dN1DJyXu9qxAGT5sUE6ZtOnH6zUyhErKldhJDm/7WbWLTndvrlMjzXlxKt0BofnnWE
 gH1NiZ39GxjP1zKwRIUjTFC78v6faijm/bXy1SykgDIiA9HQsxDhPDqfO0MbUk3w52cK
 NAPx3NUnmyHQqMvrs7UO60oNGKIM7di5I/ovX860fDPPgCrG+QntBATS4ZeoB5joKLJx
 VHIoh5WWDwrL+7hQIz6IlCuKhtLvjR66DH1AWCSMwwHVYrWSSThc/iQgU8Zsx5872Ouu
 FePQ3k15JNhQTQGFroMnrQZ/39pHC+lZr07mZXoOxcdm/2FlRaK/bwLZxC1FMUEW+aky
 47Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7hNWBofucArT17MnCRXZQMQQdTzbenzVIK3M8zSgFrs=;
 b=pRiOszUpHHdGDslg7WJpRHbxs62faCztXYy0pBmTGlSqJ62RJ4QP5bDQlnKVT/tdgp
 GU5v/f1S6vQaRqLVXC/dRK/JQLD7DSVgzA24cIJuTdMjemGFgrC07QAwPu0E+R3Pxvyl
 /cKFW2tTdG9VwG1JJgbqPI4j+Sft+/DadGDQVdwyHW8jjerkXMp3Qau12yiMgq73Br/a
 EaCVELgJA0HmhoenuCUZi2hOUi/syaMjiLdU9tXBnAsa8J3Af1DTaD62Nq5yV1AbscMJ
 hgbQ5mu3NQwEASEes/bO1Ydkvis3ktN/azZ4OMoBfGmy59Ljj3IbL3RyH5Mdl5Olls8n
 XtvQ==
X-Gm-Message-State: ANhLgQ3smcZ/GBTSuQsx13oHoSmkgrIAOwxzbOFjpmWP7/8gJF2DzIMi
 Ruhe4B0X40I1joItKMXxMeI=
X-Google-Smtp-Source: ADFU+vvjtpN/bwJQkI2vcndXaZbxD8dD0mCBVB9RhSu8g5NE5E5B4HBs9qwmz9bvppBuPjIrS4onDw==
X-Received: by 2002:a9d:6348:: with SMTP id y8mr687408otk.347.1583874924146;
 Tue, 10 Mar 2020 14:15:24 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id j90sm205345otc.21.2020.03.10.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 14:15:23 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc/mediatek: Use size_t type for len in scp_da_to_va
Date: Tue, 10 Mar 2020 14:15:14 -0700
Message-Id: <20200310211514.32288-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_141525_396174_E539E574 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Clang errors:

drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
expression of type 'void *(struct rproc *, u64, int)' (aka 'void
*(struct rproc *, unsigned long long, int)')
[-Werror,-Wincompatible-function-pointer-types]
        .da_to_va       = scp_da_to_va,
                          ^~~~~~~~~~~~
1 error generated.

Make the same change as commit 0fcbb369f052 ("remoteproc: Use size_t
type for len in da_to_va"), which was not updated for the acceptance of
commit 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183").

Fixes: 0fcbb369f052 ("remoteproc: Use size_t type for len in da_to_va")
Link: https://github.com/ClangBuiltLinux/linux/issues/927
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7ccdf64ff3ea..ea3743e7e794 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -320,7 +320,7 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
-- 
2.26.0.rc1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
