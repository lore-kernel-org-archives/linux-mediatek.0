Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8BAC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PEwCfTaICvYvCwQRPGK1g4zyztT+iiOIX15/8C0y2cc=; b=jotZygnNmbhlS8Ld47kO0anABg
	BOPm3H1EdtAWVN1f5FaXwVyDZZUEf24sOnlgIUgIFnZ1GhPLy/9o+eNNg39h/nDdpP+MWRDGErloQ
	TIqohaTgN7C/ywN5/kkF6t3rMtuyJS9H6nNISyiXuACrVU32QxuSv+zyAUJcLakybZbFhFK46qptp
	cTsjU8LdIObDKs6VbW1JZjCe4qvtMRbxLGEBsC4P/G0ZMlbVKmJLCT8VwIf0kNqde5T/FPLZrxaZL
	G6BpHdKchP6Z8/JgV7kJlOUAUHkru7nfyuDgR3c6ILMXl2snJ7eH0oHfInTTOFXsxufPRXgEbJhPu
	2QrKEhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FQw-00GJVG-01;
	Wed, 31 May 2023 06:35:46 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FQt-00GJUE-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 06:35:44 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6af7e368bb7so2260766a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 23:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685514940; x=1688106940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEwCfTaICvYvCwQRPGK1g4zyztT+iiOIX15/8C0y2cc=;
        b=PuIbwlKaUGt9MSo2eWXDmtINbwnWoPk+SXdAsF5fKni3qVC7byx8t036vE/O7cKTOo
         Rys+j9bafeFY3XdNeAnNbXXOICeOd7OOBoCryHJzpL5RcJSd1i4MJ8aY4e22e3eA2r1v
         UjJZXafKix/LQs2iuVCFBB5xIjflONwWQorT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685514940; x=1688106940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEwCfTaICvYvCwQRPGK1g4zyztT+iiOIX15/8C0y2cc=;
        b=k2uNiNNWdeq/AQmk+HvzfySOMhMOKvUSS5PVF1GU4FRqBDPID2PFZFil73gnGIKF5R
         0pHE1d8i2MlRS4o7G2R+MVt5ZIHwu1y4YgFiWslrbtZVW9iC3XBp5tTVcPvvPhagIsDC
         N/fYyh9yZEV1HWwfxEl7pa1YU5Fl9JV+/U4urgM7pjctB+xAJXws09j/fJ7mj8WxsM/B
         lPa8YyVGY1LERtf5BRHLqxFVIXOEvwdHUW98R+SIpVcD8H+UdAFf+71B1wFTX9jegOzi
         Of8vDlJ7N929+AbOfDGhaqn602/gK+PKgxdFw3s4qaJ76DsYrOGOE0cAOah4Zf/hV4Gv
         0Smw==
X-Gm-Message-State: AC+VfDxlXeVqjTJ5sv13D2TXufjG8gmhkbaBHrDkm71HyLzlSWRJtzMc
	Xg0ENmSslwtZDLIjWqGaoTb0Mg==
X-Google-Smtp-Source: ACHHUZ4quZpuYe7FI5h99AuDIMN0SwFckVXd0u92B8fxRkbiGlGOHNgDRF5LdN1wZA7gprk0Iz5naw==
X-Received: by 2002:a9d:7546:0:b0:6af:9738:3483 with SMTP id b6-20020a9d7546000000b006af97383483mr1195796otl.29.1685514940024;
        Tue, 30 May 2023 23:35:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:3052:fa:c737:8f43])
        by smtp.gmail.com with ESMTPSA id j12-20020a62b60c000000b0064cb0845c77sm2581010pff.122.2023.05.30.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 23:35:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: mediatek: SVS: Fix MT8192 GPU node name
Date: Wed, 31 May 2023 14:35:30 +0800
Message-ID: <20230531063532.2240038-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_233543_113409_C35B385E 
X-CRM114-Status: GOOD (  11.92  )
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

Device tree node names should be generic. The planned device node name
for the GPU, according to the bindings and posted DT changes, is "gpu",
not "mali".

Fix the GPU node name in the SVS driver to follow.

Fixes: 0bbb09b2af9d ("soc: mediatek: SVS: add mt8192 SVS GPU driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-svs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 81585733c8a9..3a2f97cd5272 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2061,9 +2061,9 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 		svsb = &svsp->banks[idx];
 
 		if (svsb->type == SVSB_HIGH)
-			svsb->opp_dev = svs_add_device_link(svsp, "mali");
+			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
 		else if (svsb->type == SVSB_LOW)
-			svsb->opp_dev = svs_get_subsys_device(svsp, "mali");
+			svsb->opp_dev = svs_get_subsys_device(svsp, "gpu");
 
 		if (IS_ERR(svsb->opp_dev))
 			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
-- 
2.41.0.rc0.172.g3f132b7071-goog


