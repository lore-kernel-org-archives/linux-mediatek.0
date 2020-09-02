Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908BBC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 07:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F2E20826
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 07:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UQjc+o9e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PpDkPIlb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F2E20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVCvOGErBxoXiey+CQT7kJBSawY0Qm754Tic2jorTDM=; b=UQjc+o9epaxIt8NEuOfydfR0Ff
	wqGU/8hmzSECCxjMz2B3M6wX5xWr1xhtfssmXSgDXsnGysPPqzzxU8X7kDDhlM5IeFZIyGemlM8gb
	vUTtZv25cZAhCQfH6IGw2HYjtd7V9ZuDk2absjY1M3cr4gNm4H8duaxMeTZFYbIvYZPsexD2CnmXx
	o4Lk2dASiwFYBCb8YQmM+OCjN+pb58kAKq48xTuBO4bvgCeh8uTkLINhSfCPM7kg+ipW5/pAzM4Jb
	Zd62TuTAxMUJDQX4EsKgshZSmL7ogSxXeKSWxXniklBoHYZruZZ7BbFQ41GvKzgLvc9CKmXvRbzvE
	Gsju18oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMny-0005XW-FX; Wed, 02 Sep 2020 07:03:38 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMnw-0005W7-0j
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 07:03:36 +0000
Received: by mail-pf1-x443.google.com with SMTP id f18so2322088pfa.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 00:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d3dVKVv3rwmde4FZcFLfrQ3EuricDCMm/xx55xE2gw=;
 b=PpDkPIlbI3pmSeX+Nukr4RIybsQe9cOsOhnwhF5LDJyHWHPXGd+rcWdCE7PnqnNlF5
 W07tcwhKJuHPNdwfHafL5RLfRd/QgdzVfY/Wnj+zfAQQH0kjp3vo5rPIku2m+jV6+M13
 B91XQmD+dEe4ydLr4NHu/OcRPp3UdjNHJ4nJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d3dVKVv3rwmde4FZcFLfrQ3EuricDCMm/xx55xE2gw=;
 b=EKFHY2NyBCUs3LCWN4eT/exPNAncFfzivxLOsSwfY4NuexnE8GUkru0r4PsIm9scRA
 MFbwL5/mejQtg80imjGGhzupp6Qipj7i8VNRkFkoDFuusTUe59n2wsV3RNJ1GBDZ6ibX
 LLy7h3+TPW/A59e42u9w5ypzrtRL/z13zpn2AoPl189G6iOREe5A/jeP+gF0exYeYeqR
 HKA2U9TqgacXou6CmgdEbzGa8IQsrihmzh8ndyRKDG6I4AG0NbK2PU5iGdXJ1bm7kxf4
 crFWbc06uU0CNu9sSYwiAFO6Ark4SdN4KsJIuulx9zlweF9G4V0ikHQQD7eLyH4EXF5r
 ceTA==
X-Gm-Message-State: AOAM533TK6l3U0mR7nvfCNrlk7tJHXUu3wgq9mKzvXhs57fxfN0I8oM1
 ibL+Src01LpRFF6gOxGbBkEmew==
X-Google-Smtp-Source: ABdhPJynCCQ9d+vLlAgJ44e3oh8JI6xmdIbGo+8j27KwGUpeuqGpupWGerqTAEwhmi33venFduMCww==
X-Received: by 2002:a63:c441:: with SMTP id m1mr865573pgg.2.1599030212255;
 Wed, 02 Sep 2020 00:03:32 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id g9sm4525543pfo.144.2020.09.02.00.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 00:03:31 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date: Wed,  2 Sep 2020 15:03:19 +0800
Message-Id: <20200902150309.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_030336_084569_65F367D6 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@chromium.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

 drivers/rpmsg/mtk_rpmsg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee989d..f43b69c00e8aa44 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -220,10 +220,8 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	rpdev->dev.release = mtk_rpmsg_release_device;
 
 	ret = rpmsg_register_device(rpdev);
-	if (ret) {
-		kfree(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.28.0.402.g5ffc5be6b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
