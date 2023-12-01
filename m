Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C109AC10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2RC9FzC7iwPwgtlDLuitx0S/ZDsUva1kaWzL6Ox9kqE=; b=LMdFV4WGRbDXhGXFehBSAb0kse
	IebmklUtgvTVi4grzFAN8WoGunkjiPBG27h7ynP2aEETXGzw6CI3tfRY/Zv09eFKE7wt9gPCEG9fB
	zGmdeLQmLdqYTmTptH7qEl6nF5DSjYaYMZ3GPY6Fh06g+guBXrp0N7osdqH415FKZzNfU9xg7Rb3J
	hMmDyTvY9m6VfBkwCVRLlohk3F93ffgZGs4pFhJj+NPyUQg6stwmgZjxlC9aBUNAAPHee6z/LP1lc
	L6y2HXajKs/1tWtjURGAKemjm5I4hH2wcCersQ6NxZQGCKwM8M8Ekynf3Wtv5Wdyc1bBG+yaVo/P8
	VRQoqw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r90kX-00DD3Y-3D;
	Fri, 01 Dec 2023 10:27:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r90kV-00DD2j-0V
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 10:27:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d045097b4cso3194285ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 02:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701426473; x=1702031273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RC9FzC7iwPwgtlDLuitx0S/ZDsUva1kaWzL6Ox9kqE=;
        b=hxlc7iz+G5qW2nJF2TqJUKhkVNAKqtQV601OaM4rxh6/dSbguGj+dsr68UEEMiC4An
         2Bv50RlGpybxNPplqCy1in5YR8QNphppB8Onfk8Axhjv2d0GJffVUAz3P0w8RxhaX8gL
         +/dwaCAJRAue/E5tY6IL/PG/a+mReNvzb6d4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426473; x=1702031273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RC9FzC7iwPwgtlDLuitx0S/ZDsUva1kaWzL6Ox9kqE=;
        b=s2H3LTts+WyBLAeVLYFORRcdPxQ4CZLcCw4A6UvnzxKTKLp1C9NhB3z+7DjNdE40N+
         +BzorpnHAAcPuYwWTCao1Jo/BX8M6XL6zLzetRDKYi8Aw9GalBBdd+1RRUCsnhbFxrWh
         fq/1dKN2d6VI3Uo6zjx1jJKpXKIAbFYEENW3JU+EVUP02T4yQ719x3jEYU0l+vCNhXQC
         469teXNRv/6qiLKYX3YiJgVDx5fItBUHtV6HeKd9lFG3nFtbMhoAc4d/93MPAX/1DZOB
         3xiKwVcxuA/L40LVTBCIjNoXFu24nTfb4NY9zBJWS+nt+FGITr9W/aLYiVCeOt6FIwQL
         Yt9g==
X-Gm-Message-State: AOJu0YzqC4toFrltcgt5rZSjKXNJQFdkA9PQ4s1/xhSEztvcNuK3T/rY
	NSKCG5A24GVCJYWajbpJQsplqw==
X-Google-Smtp-Source: AGHT+IGCERlKGLeruUPnK4GdOVfqBQiVNvewSDpyal6DJA9WLBLq4tt7LRL+mCnc99WbZOcPHmdH9w==
X-Received: by 2002:a17:902:ce8a:b0:1cf:df4f:30d9 with SMTP id f10-20020a170902ce8a00b001cfdf4f30d9mr18630789plg.29.1701426473520;
        Fri, 01 Dec 2023 02:27:53 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:39b5:c526:2f63:2eb4])
        by smtp.gmail.com with ESMTPSA id z21-20020a170902ee1500b001cfc9c926b7sm2999507plb.75.2023.12.01.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 02:27:53 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ot_shunxi.zhang@mediatek.corp-partner.google.com,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
Date: Fri,  1 Dec 2023 18:26:51 +0800
Message-ID: <20231201102747.3854573-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_022755_208556_D2CFBA0E 
X-CRM114-Status: UNSURE (   9.71  )
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

This log message is necessary for debugging, so enable it by default to
debug issues that are hard to reproduce locally.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Only print the warning when -ETIMEDOUT or not in tuning process

Changes in v2:
- Use dev_warn() instead of dev_err()

 drivers/mmc/host/mtk-sd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 97f7c3d4be6e..6ae5e0a9fca9 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1149,9 +1149,11 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
 
 static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
 {
-	if (host->error)
-		dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
-			__func__, cmd->opcode, cmd->arg, host->error);
+	if (host->error &&
+	    ((!mmc_op_tuning(cmd->opcode) && !host->hs400_tuning) ||
+	     cmd->error == -ETIMEDOUT))
+		dev_warn(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
+			 __func__, cmd->opcode, cmd->arg, host->error);
 }
 
 static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
-- 
2.43.0.rc2.451.g8631bc7472-goog


