Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0005C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 11:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBBC22208
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 11:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j96EQeo7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RfZ/Kz3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBBC22208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KCY0oA7b6/VMs/m/dLPIJKveay6260GPcy+AqVrVP4c=; b=j96EQeo7Eq2Wugo+NquR0YjD6
	XMjSEoG35iTwkVMNMUm4UcjViELuaV4R44WJM2xdVAy7Ye5+m6e5t23Xo/Se9muZe+nw0ADCX3Zxp
	gmkb72dWyGEnOmnjL7ZzhM2Wg0mV/5AjDWRCuL5S3nrb5GUDMUPvqYS6ncU64X5MWmbvy+yU6Czkl
	g6XpZ0IY7LISHN19NVFQVWMWQXz78GYgYfh9Lf7R6gkPh6lGAbvoSdU5IzGPOfQP4/5pSA6TgPcaN
	WnqmRE4v3AdAuvrdOiGGjTpycY2I1x94GgqixRSuEtjepFjGv326LwcIzmFDrgsgfU/TszqV2JnjY
	/2iRNrMpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvIum-0003U0-FE; Tue, 14 Jul 2020 11:16:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIud-0003O0-Lx
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 11:15:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id o11so20919927wrv.9
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5xJlzZ+5aNa1GB1o6zmShj2PdHMF5lWE0KYZLpqibo=;
 b=RfZ/Kz3I91qMv/2m0Zf4ivjprRznfDKxRo5ZqPfQhhX9PSZaThHJo6P+kCgKU3rr8P
 ch5dX9+quX9ibe+sKu0v+Q+oiCV4mvt9tXT+dOpTZlx3dlk3pFSFYEBV9GrqzAU5e/qZ
 2wuJ02QboJI8XWG+i9e/liAXGaPAVnPv3+356DXkW9YOG6Yu1G48GvrBl69d/svmIOHf
 M7goBeDf5RKNAnR9LAsrJsJn/VUl7itgVGaOdoTZU7JX7at3D701oJQUMpkJOWv5dSvN
 Vqzrln1AVz6HaXiepPBW+suT8kz9j6tWg2CRXWblQOSODD48YjXUIjfkxnM1sVlC2Ha0
 P9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5xJlzZ+5aNa1GB1o6zmShj2PdHMF5lWE0KYZLpqibo=;
 b=RHmQfRPlHa9/+HTQeVitSnpTprAZexLrOdAdu+LXcDtnFlrglgBLJvQPcldcncxdTT
 aItq8dUxMhB1AfSn+OYGS5VP03zYtR+r62PwvGcdx+ytRn5s8bLqI13ZAzMkHXlszrNU
 +h5THWAhMTMarM1F5i5yMKvyLRMt5TGLNVqeLpXMkknjHjJDEtiH2UgZZcwuXJngzPIt
 ETwfcOI+IVuAtqgiFccgFx2BzjgEQgEVQxTI2Ll697Jl+WtmSd5BtYo2cHe5K0HsrbpC
 bu8XqodoaaXr/HSp01YY5btqrX/tUyzkOfYdmFjg7I++SmdCo9iEPKWJQyKBEEls73Qy
 +MYg==
X-Gm-Message-State: AOAM532i/J77xmiwMU/epDkxqcxXg7lRQZ9GBfPswy9RNkPvNNV033yo
 E3LlLdEtR9PxFxfycGGf5LY/Xg==
X-Google-Smtp-Source: ABdhPJy+IpSkDvt0gKhCLe7N/pHcRPdSZRSy6u7pwrYXAu5aBo0g8In969/7Eo5zqi8LjXxj6Yj/1w==
X-Received: by 2002:adf:f388:: with SMTP id m8mr4799959wro.338.1594725350794; 
 Tue, 14 Jul 2020 04:15:50 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id l8sm28566052wrq.15.2020.07.14.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 04:15:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: dan.j.williams@intel.com,
	vkoul@kernel.org
Subject: [PATCH 01/17] dma: mediatek: mtk-hsdma: Fix formatting in 'struct
 mtk_hsdma_pdesc' doc block
Date: Tue, 14 Jul 2020 12:15:30 +0100
Message-Id: <20200714111546.1755231-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714111546.1755231-1-lee.jones@linaro.org>
References: <20200714111546.1755231-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_071551_763399_CA3EE763 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dmaengine@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Struct attribute names must be an exact match or the kerneldoc checker
gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/dma/mediatek/mtk-hsdma.c:120: warning: Function parameter or member 'desc1' not described in 'mtk_hsdma_pdesc'
 drivers/dma/mediatek/mtk-hsdma.c:120: warning: Function parameter or member 'desc2' not described in 'mtk_hsdma_pdesc'
 drivers/dma/mediatek/mtk-hsdma.c:120: warning: Function parameter or member 'desc3' not described in 'mtk_hsdma_pdesc'
 drivers/dma/mediatek/mtk-hsdma.c:120: warning: Function parameter or member 'desc4' not described in 'mtk_hsdma_pdesc'

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/dma/mediatek/mtk-hsdma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 4c58da7421432..f133ae8dece16 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -107,10 +107,10 @@ enum mtk_hsdma_vdesc_flag {
  * struct mtk_hsdma_pdesc - This is the struct holding info describing physical
  *			    descriptor (PD) and its placement must be kept at
  *			    4-bytes alignment in little endian order.
- * @desc[1-4]:		    The control pad used to indicate hardware how to
- *			    deal with the descriptor such as source and
- *			    destination address and data length. The maximum
- *			    data length each pdesc can handle is 0x3f80 bytes
+ * @desc1:		    | The control pad used to indicate hardware how to
+ * @desc2:		    | deal with the descriptor such as source and
+ * @desc3:		    | destination address and data length. The maximum
+ * @desc4:		    | data length each pdesc can handle is 0x3f80 bytes
  */
 struct mtk_hsdma_pdesc {
 	__le32 desc1;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
