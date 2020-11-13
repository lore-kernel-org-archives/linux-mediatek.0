Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFE8C63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E010B2137B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xtb0LBi+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vVZ4pBXY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E010B2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zhyGyRY80piYIZUphdQnEQKWcOwg/wcMeGsmJWCRTs=; b=Xtb0LBi+i0FTaUIsHGy73JoO1
	PVlVmHIc/ckgoUYnS+aMMgGrHNoHrh3q4JbqzgBb3G3/wG8SUWGUu2M59jNOLCuOb0PDvnUCJZdTp
	KfoNYQj5oAu226CfkxeLcKutcasY3bOlnO7Ud/L77Od06Xg2XnYxYEl6XCWGKfeRQxnvxlgEkmKiC
	lz3aXJjCJ185OXiJ+A9MdhNprIUGJU/P7QizyqJ+EQ8BO+ywPGN26ZBLuKT9TNwrL4ca+IwMONJgK
	E4SJ1CWkwr2fyJ09YpWXWsHnHlYe5AfAjv8bPp9yjd/foocF10avDIhT0e+CN+H8F3ArcjUWxcZm1
	qXmzuyWqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT6U-00024X-J4; Fri, 13 Nov 2020 07:02:38 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT6J-00020q-VX
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:02:29 +0000
Received: by mail-pl1-x649.google.com with SMTP id w15so5369744plq.17
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=od5RzXQQDUYNdgHqpNLuL0ghCcmfAozESYAcDCe7NAo=;
 b=vVZ4pBXYbM3nzNUI1cLnpzMC29BCXXpYtA5AMN+l263aJDpnRb2tDK+Ts1e7ULWBvH
 L0NPUQTsoBc01RAQPpDr7iqR+uWyyn4oNauHZU55d1UHPgMzxVPDFe7JjBUCvWz+/yVI
 935k29j8WUY2NO/EY38KYEFBIWOiBBEiVQ1JOglwOy7oNuI+dz6472ixF/ShVRqnchlu
 mM8/dfep+ArTnx1ih6xHVBBBizLe7na/YmTjvZ2FkhNKOhqU0DctIDs84mZwOgbzXHVS
 xWy3Qqh2YbAMwCAd1aVjjfATU6mqQ3tNcQ0FEsnJ3cPgfhQZnve17bfRDJE/x8FXpetc
 ZrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=od5RzXQQDUYNdgHqpNLuL0ghCcmfAozESYAcDCe7NAo=;
 b=UWCdOutO6CU9gVYhLXGAJOkzs1bk+X1CUWuZ0FcP/IU/PLCsdgxxfLqO8GBSvxK7Ui
 YQ5EuKn5EwqbGXN0mjhszE8UKYk5UQpcAXYYirUMVRsr9Cb3j0tWfOPPS3ksJMqzz6Yu
 WkL6dmSeRzQIQ2BfejrN4/bDjtEROJR3Cy8mUxnB7VhWzYMwY++Dp40P2A33Bc0hJf+R
 fD86++cL1PdWNbUDttKUt1j+EPKEyi+qkUj0pc0hCZ1cF1Il+kefk5td1E6sMR/eghJH
 UolP3/CaUsE7waItojOIkrkMp0I287L5gp2DUeceuwvKEJv0FgoVp4zdA/RhPjCduHs4
 BBow==
X-Gm-Message-State: AOAM530ixcLo8knb3UzmiNg+6KN5bGfDBD+A2oXhZ7i1vwnlWzYkJthm
 XQjMsXY/NaYtc9MQ/StWSlxgnezFAHw3
X-Google-Smtp-Source: ABdhPJwTrEoI2V870amcgehFqHWitjg4WqLqzPkOKYCxwyxo0RZHFnPV/ysQuGnhBWchSZF6+jQjlqEeiqca
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:aa7:9e4e:0:b029:18b:7623:7cdb with SMTP id
 z14-20020aa79e4e0000b029018b76237cdbmr790147pfq.45.1605250944835; Thu, 12 Nov
 2020 23:02:24 -0800 (PST)
Date: Fri, 13 Nov 2020 15:02:06 +0800
In-Reply-To: <20201113070207.836613-1-tzungbi@google.com>
Message-Id: <20201113070207.836613-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201113070207.836613-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 2/3] remoteproc/mediatek: skip if filesz is 0
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020228_131255_8A574025 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The main purpose of the loop is to load the memory to the SCP SRAM.
If filesz is 0, can go to next program header directly.

We don't need to try to validate the FW binary for those filesz==0
segments.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7ba00305009a..60ba4cece074 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -234,12 +234,14 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u32 offset = phdr->p_offset;
 		void __iomem *ptr;
 
-		if (phdr->p_type != PT_LOAD)
-			continue;
-
 		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
 			phdr->p_type, da, memsz, filesz);
 
+		if (phdr->p_type != PT_LOAD)
+			continue;
+		if (!filesz)
+			continue;
+
 		if (filesz > memsz) {
 			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
 				filesz, memsz);
@@ -263,9 +265,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* put the segment where the remote processor expects it */
-		if (phdr->p_filesz)
-			scp_memcpy_aligned(ptr, elf_data + phdr->p_offset,
-					   filesz);
+		scp_memcpy_aligned(ptr, elf_data + phdr->p_offset, filesz);
 	}
 
 	return ret;
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
