Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0D7C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B6E2068E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gScx9LfE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JsL/W1lT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B6E2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZbTupOGc+kiV5xnpOTNRIWk2yOemBntrsfrIxLMSp3w=; b=gScx9LfEATMyWuiyK+JqoWWlI
	eZaFFgmaL75ChJ4asrMvaBnN+A47TOHel21fxn29jZQooFsXzLBZJb8jra4nwdX9AOeUIbrgVKF6l
	Jtu5BNjMyZtt3ZkiCRzs0fKi9VIEst8uolBN/3EN9348GrQlY/4tW8dAcVpdtvsg73XIZDpmWQQvH
	nrNKAbQYD8osV6n9XjLTjn/R0j/OQG37gvZITywTjMFkBn1OYEhipCQOayOyylIT1sa7rccIV3ImJ
	hKmRFD3PcjtQoifpcd2VZ/JU2yyOHuE6jkuGVsj/CL2kJ5aPa+ZYuYIKFC7uaOtoV6oKB8w40Zcq2
	r1l82/y4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZqD-0007Pr-0c; Mon, 16 Nov 2020 08:26:25 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZq0-0007MG-1D
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:26:14 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id dp12so4441614qvb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=FGK3po+1mabmofbsrOAmqgZTB285sISrAEMhHIPEXVY=;
 b=JsL/W1lTuj6I5ZApSjpS7ca/5BQyo4GmrFUADec+nmp2dPG5WZqt3B+a7DbQaVymYU
 x6f2oycz6c8JtN9wbjU7JRHN5+lvqWJAIiT97Q5+7aQVf/Io/EUh2rKdP/QJ9N8XWQaS
 9gaGS9xBbiCluwBzhShkSc2E5FHOUW+cSc+46uw7R4MS5y94nQImZ2Ihb7HlwdcfFjgY
 L+SsuYC5oaTo4rUy5ZOGTDLTXH0rLMswsJHlMJrrSUkuvqVhGc+2xz75zROYAw52tcuA
 pz5sB6lq3VnDeAxlylx+pHesOCHROgprfGpQ9q7kY023QojLs4IjQ6879cCAY8Vn3Z3x
 C0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=FGK3po+1mabmofbsrOAmqgZTB285sISrAEMhHIPEXVY=;
 b=B6xy7yuvxZoqkJGXyzy+rV1/o1TV09dyhbV+lnaLY1E7vxJfnopcKoutbypp4oMO5C
 pxFiJRFZoazThPQSTefLDIW2O4D4zHYdQuI/QBai8OvEG3iHRrP2olqDXxOlCYXgmAzQ
 9XrfwlwCVET9aOycIxuAC9eFVeEQDzU9jKKXY+aW4LdErAxRziuMzb14FtxLSOWVlQv+
 eMQunF0BRdUQs2AK/9sSHFUsoS5R5Y5PTX/RzOYY+oGFP3K0JCjHWbxP8U7zyZEQDHl5
 dNgBrLbFdS7Lr/5ISvh0PEE5CMGjNv8jNqrx0dYHXHOXkuCIQNJGU0eIci0/+Dd9l/Ct
 VR2g==
X-Gm-Message-State: AOAM533zBT72Y2aJGiWPe9K88/cHR1QxYUsVOm7dUdE4TDdtCbZzqs5l
 5TjyuYMnDOnNPz4TN6UQdK/JHHWGUQau
X-Google-Smtp-Source: ABdhPJzDrTnHczzHtkZNBK/N7SQ6we1yTn8KBhiJm4PEqnZsFVM7m+93BhG3MptVNJqxfLnG0DfgmB+BOgq7
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:54cd:: with SMTP id
 j13mr13656224qvx.8.1605515168633; Mon, 16 Nov 2020 00:26:08 -0800 (PST)
Date: Mon, 16 Nov 2020 16:25:36 +0800
In-Reply-To: <20201116082537.3287009-1-tzungbi@google.com>
Message-Id: <20201116082537.3287009-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram power
 on and off
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_032612_122570_4ACEDF69 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: drinkcat@chromium.org, kernel test robot <lkp@intel.com>,
 tzungbi@google.com, linux-remoteproc@vger.kernel.org, groeck@chromium.org,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following sparse errors on sram power on and off:

On drivers/remoteproc/mtk_scp.c:306:17:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:307:9:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:314:9:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:316:17:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..8ed89ea1eb78 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void *addr)
+static void mt8192_power_on_sram(void __iomem *addr)
 {
 	int i;
 
@@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void *addr)
+static void mt8192_power_off_sram(void __iomem *addr)
 {
 	int i;
 
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
