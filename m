Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B36C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113E323447
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113E323447
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bwdanhse7AjJyJJaM2KjAmntrnNssmQZOw8oxyj7Wbg=; b=0GZ8PfEWWWnY1HfJD2ik81uGS
	u6VGTSDMB4hpH2JKyrIzGCCGbxM+XDPlJZeTJkIbQKChhixRUbO0K8qeAZ5vW8nbIMCuScsKftT30
	3TwZoYHY1Mix/1U3WiorxdEyigq8EuTP69KC8Yg1dbU1qaQILtRqVgbMu7HzKigH1YRLIkWTbKBX4
	Qrw66ShWubyusCJihzo3HyEQkdEpWp3FtmEoWSGWvdxory64X6z2iXsfub88DGKAQF5gfn4HHyBjo
	g058Aypnx9uASo6wyDFRJR38goAGbk3ko+lBILfmxqVGbpPqE7etKy5ZF32or7OD0abAErKOBTUk6
	uc0X4iEAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmyE-000396-Sq; Fri, 08 Jan 2021 08:18:06 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmyD-00037g-49
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 08:18:05 +0000
Received: by mail-pf1-x449.google.com with SMTP id l17so6144951pff.17
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 00:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MTRtl2UAGlXiRiGOyc8AHNRImXjzXH68pAaaOwyulHE=;
 b=V6EL31lTkHVGs10R8sodrz5276YWozWSBOItTi9gN8gncQV8Tjwe6RSj+PgZcVAoGV
 2U4TObb11sP/ILFF6IJYsHlKQHVF9DLwTvs992qHpCfPSMJlEOK0IFYVcCzdtidpHgtB
 pdC8DD4JR8/zqKrxfbQzsQS7svGn58Q41yz+4uJvKy00+iZmxFqtTm91OjE5PnYNC1ww
 +5fy/LHvystcDU6LK+0YhIXnj+p/aViMZY+LnxkjoZ9Je32qgLDuEUmsdtX9e6BT6IyO
 VGTl2hv/ITPcj+ME8pOhoY4kLJQIDiDqzzrjFOYxAjHfvcvpq1YRRIBRJWlZOlBOEw66
 jIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MTRtl2UAGlXiRiGOyc8AHNRImXjzXH68pAaaOwyulHE=;
 b=bfP8Czrg0Xo/x7juKuYoNan0Xf21oFJdE/PHot5zRdoRNkUUZva6TDvb+AkllbNGrx
 u0Zr9+22KaXmxl0m8P8g0/2FlbUqyT6lOzUMf4NyAFkVZHbRLrQMRRmgxf2QfDUoee5p
 kItcp0KHwQEAREC5k2xpG9jlGK4adLlpzbKH0dph5dF+rNRJnTuIvTqyo+A08OPSHWiE
 h4yVLDdMGQbIlZ80KyYca+wzfvObJfMel9GhV0t3cMAvf07C4z8UKhVsxRCCHuGbibar
 xDN/4TdeIvFkhK3j3DdHUcj96l0FeLfZjUYtoBotMqU2Lsyuio78EsgvxUR/NI289Tn7
 4cgA==
X-Gm-Message-State: AOAM531JmR+abR8PPaLwZrThc8TJCbRO+f3ADgJ/UirjjzfGAlTO+3eM
 zRZtPpGJewMsM3mAikP/G7uqIYev4wxy
X-Google-Smtp-Source: ABdhPJxmyHvyUBXGANKNPo0GB8zfz2o/IJkoe30Xr6ThffKBgLQZuYb5UHeFQfE76Cz/didQG1YaHoJjCMFy
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:1706:: with SMTP id
 z6mr1765727pjd.0.1610093876865; Fri, 08 Jan 2021 00:17:56 -0800 (PST)
Date: Fri,  8 Jan 2021 16:17:35 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 1/4] remoteproc/mediatek: use
 devm_platform_ioremap_resource_byname
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_031805_180188_714B0FB5 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replaces platform_get_resource_byname() and devm_ioremap_resource()
pairs to devm_platform_ioremap_resource_byname().

Note that, not every pairs are applicable to replace.  Especially when
it needs to access the resource struct from
platform_get_resource_byname().
For example:
scp->sram_size = resource_size(res);

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..1f0ed2974d5c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -719,8 +719,7 @@ static int scp_probe(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_init(&scp->ipi_desc[i].lock);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
-	scp->reg_base = devm_ioremap_resource(dev, res);
+	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR((__force void *)scp->reg_base)) {
 		dev_err(dev, "Failed to parse and map cfg memory\n");
 		ret = PTR_ERR((__force void *)scp->reg_base);
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
