Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA5C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 02:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CA720796
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 02:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHVrHAGW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvJP719f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CA720796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=popzDMWNOAkdpWQQ69Olpdgy6s/GR0cqHmNCibrTGC0=; b=QHVrHAGWGaRObU/wUOq2AggZLq
	b1CQBd4eFbQxnj5G9XAYg69AP62hWPT6rX/DcAkKaBpNpY1tqofCiG4RpGOHcM9tNq7wgxmAJYxmN
	V+GdlDllIqxkVjKxJDAgxdC3QiOz8sPPUnp1kSIIvOj6HvSVt1lhGUrtbn1OiLzCDZLKLygjatv5o
	GJENb9Y5dqni5/hhpwPuirV0vUI/Ta3WG2NE/zKwVS6D6ZCC0nVWav2XPF84JtDa6j5/fSbZSlWF2
	WTzTRYKOac+3mdq5zgGFoynqJV1y9QGZyuhTuEqiHLs/qByyQNdPAOEQvG2EqHlYgy6zvVf8r9cZ1
	L2dPPdFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF6be-0000mD-Bx; Mon, 07 Sep 2020 02:10:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF6ba-0000lE-Dw; Mon, 07 Sep 2020 02:10:03 +0000
Received: by mail-pl1-x644.google.com with SMTP id d19so339686pld.0;
 Sun, 06 Sep 2020 19:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tgNahNYZMXrtXJeygjsMjzSrNWcxFP6xVcE3T4mcxQI=;
 b=VvJP719f8QWQzVGJalFHZZYMi8hRnozPNRGRWB+0qU7ISvLSjCGN+kaeYEAfQnZMye
 bjBxceSghaxIqi/nyyaR3nXWPxV1PbwDkXMei2gv0ul7scY0lumpayZBugh0JyNG2v0a
 E9zi19sZFzKED0H+p7+/Ii7+5tLXkmr98qT73yjGOlcMugMDVwB0GXP0NILMXw76HsIz
 SbWfXuev6KtS/BWjoGCLbUkGb3JstMzNEcrKDrjBI/+T1xNc88VrtytQKO3ojGBu0Jv/
 fVSY2ncosrUc/vLxJh91fAxSqsedrjW089Mo0CUVgd92nuP8ULLigzCYxF2GiWoK+Nmz
 yWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tgNahNYZMXrtXJeygjsMjzSrNWcxFP6xVcE3T4mcxQI=;
 b=kM5mYje09gP6bSX0khb+qoqI+Zc3Zdz3zZUODXP4XG7uO+izX8xtTAMHyagQEtYmB3
 LWzHryULC/hQTfu/Sgce6ILbrqAwKAHndnxUIvtcwbXhIFXZXQNfvrjAhmVn+oXSkMTt
 jy75RlqVaJpfKJ5iTC1DL+vh7K/jPPn9RmGREeJCss98KlUbJTtNDJgTKgVUN4MbeSYX
 zYiyhCrdmgBCWROOLtgKCB1VTPWckA3rTx0fFVMct2nsy2u6A9Go14KcJE+8dpItJ/Lw
 MyvAa+BOWz/rBOx4cJt001COBVhvGgCppNY/FeLh795m6Aj+7VMEUqNQGdgLKLHiB6xB
 i6DA==
X-Gm-Message-State: AOAM532A89TW/fO8VAhbB6TS06faxHKDcHF/3e4cUZ3CZ8ks5W+UD+kA
 Y/WXjVNuz8xcYZcghnNLUho=
X-Google-Smtp-Source: ABdhPJzL7EIeH3Kz/+E0cbeLhXES4APxDig/pgqS0vdAE0hr9pcBEymgTwUsjmk7EfzYu8WMVrFykg==
X-Received: by 2002:a17:902:ee0b:: with SMTP id
 z11mr17858138plb.268.1599444598464; 
 Sun, 06 Sep 2020 19:09:58 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id z23sm10531125pgv.57.2020.09.06.19.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 19:09:57 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v3] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Mon,  7 Sep 2020 10:09:39 +0800
Message-Id: <20200907020939.6817-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_221002_514984_07CD1082 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: dawning.pang@gmail.com, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the init loop, if an error occurs in function 'dma_alloc_coherent',
then goto the err_cleanup section,
in the cleanup loop, after run i--,
the struct mtk_ring rising[i] will not be released,
causing a memory leak

Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 7e3ad085b5bd..ebb3bdef0dbe 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -469,13 +469,13 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 	return 0;
 
 err_cleanup:
-	for (; i--; ) {
+	do {
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->res_base, ring[i]->res_dma);
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->cmd_base, ring[i]->cmd_dma);
 		kfree(ring[i]);
-	}
+	}while(i--);
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
