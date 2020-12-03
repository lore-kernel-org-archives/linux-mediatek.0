Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3271C6369E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F71D21D91
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F71D21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v/a3034s1fBJW7FW284ay15uK9GYp0yWoAUbJEBbzks=; b=zT/uoIcEAAPaRqN6YB6yQfxZur
	n17X3L7Gd3vbVBaU/UGgWwRdEb66D4ipJtdpceaLQk8/7xb4yCnTxBBHlbHpvs/EQoNQeTWfGTRtM
	b0PC+FkQDZKlIb+8RlEdRU5Aon6CXNXpt9uGN6RLPOvJ/FEY+mfFOaqJIkIUN+k6dUQYCZTsip3uz
	+YdlYqq99sJvKI7Dwml8jVRPNU1hUsNEdU51SB4c7HgVJ4vVg1sbb09zVMC0ONs2K7HxW8fEev7Xd
	di5MVuDLFRhjNUWjH6vplDbRYdFmN0LJsr+Sd7m1hiYdOFGN1WWY84NXurWjSVTlxnK9/f1TEJmgl
	7wO7lPqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkevP-0004ag-3p; Thu, 03 Dec 2020 03:04:55 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkevN-0004Zr-Ei
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 03:04:54 +0000
Received: by mail-qv1-xf49.google.com with SMTP id v8so534396qvq.12
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Dec 2020 19:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=n1Thr1QG5H70oA7HSV+H9a2yla9+nJFCx4pWGGue+rc=;
 b=JRy3NfPfy9ofYP9u1wWVP3fc6cRMdScZf4wNMqGwvV1gBZuWnVIIp2rD++NJpZ4/Sb
 utQwHGmxkLC6g3oNyjqvZhNmLITEzL8FIE9+QJ+KsbeIV6nLKKl/Hpm0PtJc+YTtXLye
 rlN/RgeYKXW+hBkt8dbox++A+LErAiihLO0GdnO3sA8LLCK6vveLCWuvLvlqZ4DfQLtV
 61veTGfVo4uxvCPOcFSHIHSSVB8KLRXOveEisluSDDRrNiL+XOz/RSWS8wpz1YX9KwzH
 u1CJYeVZ3AkbXJBS1zh6vdHVsVRW9N/fgl2cIcNkcOg5iOOoo+knyvZFY+3GwoAP32/s
 c5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=n1Thr1QG5H70oA7HSV+H9a2yla9+nJFCx4pWGGue+rc=;
 b=fJ/xnZSOtZ7q1q+4FQOBn2y6vR5wtG2ayiUDWg0HxMOn29RqbdIVPNVBvP9o4lwZKG
 gWBCZ2R9xwL7KmMbEwA42OLm1YauXdDmYj5mj46L3Fa/rei5b/GgGUCOh2gcjMYHVfUO
 u05o5PD6K2h8GN+LjXa+5+9vr5BV/vfc/OXgqnj/Y/e4gZtbKmv+8JilDf0MVcNYcUGq
 jL6QCrCf+Xl8UsAhQDFfc2DDpZ6lMJyZP+P83QONKJz78+1uGAFl7jSdJX3YMeHV1Y9s
 94P1xUFKD0iIYurcowJCiixjSGkxGrYRVim43g+FX2GR/i0aaYX80Li0bPoHgWjYtq69
 F4lQ==
X-Gm-Message-State: AOAM531XIVhcrmh04gkgxuuaT1Ec8C95voClzx/FLg4tMMy4GEAY+6cF
 nwmAksILNJWSUuAYSDVDIpdTBcXr7c0m
X-Google-Smtp-Source: ABdhPJy+sHblLew+WFUgX1IsEjUCzi7+3RCW9sClYSBseRZ/jc7YG/WQXsgDxOg9FRePGawd+N67BpTmdy6G
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:18d0:: with SMTP id
 cy16mr1092968qvb.3.1606964689440; Wed, 02 Dec 2020 19:04:49 -0800 (PST)
Date: Thu,  3 Dec 2020 11:04:36 +0800
Message-Id: <20201203030436.3583198-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load fails
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_220453_542764_3E116F08 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the error handling to unprepare clk if scp_before_load fails.

Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- add "Fixes" tag
- remove an unneeded change

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/

 drivers/remoteproc/mtk_scp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..5e5705fe35a8 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
+leave:
 	clk_disable_unprepare(scp->clk);
 
 	return ret;
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
