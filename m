Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD98C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 21:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06EB21534
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 21:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzKrluWa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2Q+nJPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06EB21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DWXzs5g4sB9918pJzpVPe8sHJ+McyJVN4tK7EkEg64=; b=hzKrluWar4k4/Z0Zhw2a1V+KGE
	gAlBPA/qz8P5O8uO6O12uFfpV1+5SFI6c97wl2aStT5YLPm6gLLA7SLGkYCtFD5E/OjEiv+SrUett
	kOS5Mb2Dpd+suI9dNajX1iURtFm3PnO8DRS+c0C3cSpE3MR9ugCqcmlTDIoAunLHBxaRCuYb92zkr
	xhADWO+sMr4PkKT+jl0TriPIUOl44XQLef/7eruHyRwh+1YCyyzK3T94Otyv010cuAOcAirnORJRv
	k/JI1Z0Do89SPZ6O10/FQJNhcL/8/XHqFmdHzVG3kwF6HCknMVS8NnpZyUVb7SBSyC9qPM+a2k7sk
	E00bJpvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kildn-0005Ie-Pf; Fri, 27 Nov 2020 21:50:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kildj-0005Hq-8r; Fri, 27 Nov 2020 21:50:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id b10so4199910pfo.4;
 Fri, 27 Nov 2020 13:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z2ig0YQSnUunmi3IX5y1I8JdsSlOi9idmsNtTiBo7ok=;
 b=l2Q+nJPuH8NmB2PzY1VrPimThUwNcXTaaau4xpvXD74XejsIqKORZEnL4B38xx49mD
 K8JEtwZykO/tjwfkL+2ChwaP699bdQW5TjaCwQd9gsXG++TC9jnQ84m+t+bMHFQ5rywT
 5kr5Bib8Zk0mcP96Ql/0clgy8QGTIiKL6cO1e+SpyLFtpzaBo6QaQ1V0OJD7sc2ipEKT
 u8eUiHBU6fMb+XCaYjuVMVsqxHd/FD7bX5s/OcPP9XEbwKE/zcEIoYxmU9F0I98CHxCD
 YSQodiw2rBrb4u/K08nXay/H3aioN5jjURZ4gJmi1KtslmDucGBwdN4A3Tg+ipkqu1Jw
 d3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z2ig0YQSnUunmi3IX5y1I8JdsSlOi9idmsNtTiBo7ok=;
 b=ruOB+/JsINWiupdafzu+We8niFRYXHwHH8yfw93lW3R8al6cKSHqiRxIhuaXuJ+XS/
 drbfrAaKc+KOdGg/1cldKlgslw9EC7mm/hcHAgx+p3aTPKUpNOdRaXpJPQLFyceKsaNT
 l6mIxolF7fAys7m1b6wURswV5nkKnmQOHGjkrW/0aC0hucYcTWA5yzOkQ23xMaWJoUm6
 mbnqUAv9XnGZrBxFRhSXZoOW89c2xH3yOagNj2RK5nIFiBtjcLC9N/3hKkOpt4PNyv0c
 wdi+zGZyPgcI0SLqkYeZxsXKQK/j2uhEIWNUkXk5rlM2efpvMKdwOfF6RkjF9xzDzzy1
 KWCQ==
X-Gm-Message-State: AOAM532XeoNOmRzmm5KHU5qnr2l9lZtPa5IHKgRAIWzXHTgqTXHaBH+b
 KyWZuzfKb8jbpwPWB2JKp+QSgvXemPrt2w==
X-Google-Smtp-Source: ABdhPJyMU67Zli7Ek+SiL7ugkA0JFhHVA+oYndLCD2wsRVJhJtVJufk0Oif0dm6UmkXVakJsIe1CiA==
X-Received: by 2002:aa7:91d2:0:b029:19a:8ccd:8b0 with SMTP id
 z18-20020aa791d20000b029019a8ccd08b0mr8730745pfa.40.1606513847674; 
 Fri, 27 Nov 2020 13:50:47 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.220.174])
 by smtp.gmail.com with ESMTPSA id e141sm8545912pfh.13.2020.11.27.13.50.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 13:50:47 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH] remoteproc/mediatek: Fix kernel test robot warning
Date: Sat, 28 Nov 2020 03:20:55 +0530
Message-Id: <1606513855-21130-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_165051_399354_0C00FC30 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Kernel test robot throws below warning ->

>> drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable
>> 'mt8183_of_data' [-Wunused-const-variable]
   static const struct mtk_scp_of_data mt8183_of_data = {
                                       ^
>> drivers/remoteproc/mtk_scp.c:765:37: warning: unused variable
>> 'mt8192_of_data' [-Wunused-const-variable]
   static const struct mtk_scp_of_data mt8192_of_data = {
                                       ^
As suggested by Bjorn, there's no harm in just dropping the
of_match_ptr() wrapping of mtk_scp_of_match in the definition of
mtk_scp_driver and we avoid this whole problem.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7e0f1e1..5f42b9c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -772,21 +772,19 @@ static int scp_remove(struct platform_device *pdev)
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-#endif
 
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
 	.remove = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
-		.of_match_table = of_match_ptr(mtk_scp_of_match),
+		.of_match_table = mtk_scp_of_match,
 	},
 };
 
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
