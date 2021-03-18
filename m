Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD47C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:25:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8B464F0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E8B464F0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NSJnJyYpmEqV69LKQiXaq2ptRnltuT5/9zEPO5UmYg=; b=UzA0tfvwHLKiOJMgUUyc30kE6Q
	guAs0RxnjW170pr16WgKaOB/gsN4Sn0iDJHRNx++mqjRNsSB56fdQ7MlT5jiyh9uUy74hO8hXdd2g
	tLINKlS0KjFLOKQPOIBDVHxtOMH592v2so7bIPLPWz8uENfC0VTj3aKBnNTPPTxF7W0trNpvVBZRD
	LejTqCjKd9614wmysZt3Oa3HHMueKfrA08vK+mcwmfrPgMudgN4MtL9EQTdeTq3fu55Pl5feP46q2
	bMJlE50BI+TJwmCpnbZxhsEJ9NUm82n8fUwTFdD7rr7Pu5Y+8V2nNPXHBgC97CYbBlflj1zCzbdqp
	kHStjXOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMhOz-004Exj-VW; Thu, 18 Mar 2021 01:24:49 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMhOw-004ExO-4O
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 01:24:39 +0000
Received: by mail-qk1-x74a.google.com with SMTP id h126so30590678qkd.4
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=re8CFH6xVx7G0rqwkXOZ6zKjwdjnXFBfLwv/BCyY/sU=;
 b=MVQAwNtEJ3VfQl2Ahy3+EYqM87+IwHkdbpVS6q/OySBJjv4Xs8TZuAmqVbocOKx5bf
 R4NqbEKqZhVQMoaGw3oB/yRViFz/mT5p0TLwP/wY77Q39lRMhGkvQf4gC6/4QW6GyWbU
 NkuNCOcRYk5hLWRMEqXVfvil3n2r6mykHz/t+OAY5zI35fg/ux5F1OZK08U/Xx0bUgZK
 IKlAmYZCC47MWrLqaMOvRMicgRcMdgtYSZW3zlOyQYRt0RrMAbN3q5xtLqBK+Kw7QVkn
 2N4kkH3Rr3Qp1H6TK6qAaAihSjrbL7BUQUfTDomuoJHceKC+2ALrSRKbAqn0MMAjYUSb
 yEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=re8CFH6xVx7G0rqwkXOZ6zKjwdjnXFBfLwv/BCyY/sU=;
 b=TLz7i+stJsezeg1GO3WXDN2Q329eQgm6ArZs0im6ZvemlD1UHHZH4hE+7F/mGSh50j
 tLgAfds/xggN0sWlBkbnPXUTYqhK9kKv5Rq9Dv3Rq2Ygm1fPW7/snOBvPc1MnnOeNmQs
 B5Cr3Z12tb0sEEd4xstSCgDB/qE69R+LHDm7Fb2Zz3ujNtXdDZXXYgo8CR6GeMTu+JcW
 76jnzzmTjDbGa5nNI8vEXjyBJ20GmCO4HT/9L7LzyZARgVmmvttcNo/akvkWipi7mnZ5
 tdtP3l05VEn6T1/wqdnCIYr+Ul9BwownLO8xSxyNn/rjMh2zVxUbEJs6hJfKS07ShKci
 Rb2Q==
X-Gm-Message-State: AOAM533su7BDV9uxYXsjg9ZiLcUra6EVveAw8+H24+2y5XKfef8kEplH
 PqouihWJqB/3hw1KreXxJ8iKleXY6FCL
X-Google-Smtp-Source: ABdhPJw+W8qroQ2T+CWFqK7FHAfCwwKrjdsAV9apnPM7oh0e1ffKyi2hS60dRCMTVrmsNNH5gJaoOaieslRu
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:f96a:1dc6:88d5:6b7c])
 (user=tzungbi job=sendgmr) by 2002:ad4:44b4:: with SMTP id
 n20mr2106926qvt.19.1616030675081; Wed, 17 Mar 2021 18:24:35 -0700 (PDT)
Date: Thu, 18 Mar 2021 09:24:16 +0800
Message-Id: <20210318012416.2816574-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, tzungbi@google.com, 
 Tinghan Shen <tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_012438_315674_2131C405 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DEVAPC (device access permission control) is a MPU (memory protection
unit) in MT8192.

To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
domain 3.  ATF (Arm trusted firmware) should setup memory range for the
domain.

Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1:
- Add "Co-developed-by" tag.

 drivers/remoteproc/mtk_common.h | 2 ++
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 61901f5efa05..2aa9fdf5e59b 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..50bdec5a97e3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set to DEVAPC (device access permission control) domain 3 */
+	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
+
 	return 0;
 }
 
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
