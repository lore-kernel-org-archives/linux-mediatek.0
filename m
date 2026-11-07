Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BE606A32E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 00:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDibntGP;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TT6lDaci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=; b=jDibntGPLtZTpMyx7rGOsYpHLA
	hL6Jaqsaj2skRX304UunFpLyCHqSJHW0VL4FS1OWx0zxlB5AUWed//fT7gatKo5IIEgrtbq+wx1tw
	fgU5DIbzjYrWpZupWqSpm5ZrPNR9K81fa3C7E8x+6zCiw3/nnq/2u9v8lnJIs/36ZCBMSk/qL4zxr
	PpypWGSvYfpjUiz3Ll+pbaFkrj5TZrsrknZt2ZjO2or23YVcAewdEmLDE8GY5v6Qj2DedJ59iD61Z
	5XkFryd0xFUBipKmUeeDFUvHBgELZQCs6rxbB0rZUu8s+RMp1/Pvjy9mh5NdDhA+2bEETtVCkyXoQ
	Byy1pGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPU5I-0000000DuNQ-1oaQ;
	Sat, 07 Nov 2026 00:15:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPU5C-0000000DuMC-2H51
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 00:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
	b=TT6lDacixGosxWdcD2b50CLxI1afEyyBKYMASU0D8pTGnvD9DyrDE4BeK4DexzBRGnWH+l
	srnIzef60tmrrWmY0j1PKL/WDjothdhJQ+RpJs1ku9sGI97iuNSqZhJ/6+ybvmTh9Jl4vk
	cpA2r7AKJx+x1oIdhqy1jj79YWZ4xOk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-TK_R08NkNqeI-qqtuGue2w-1; Fri, 06 Nov 2026 19:14:56 -0500
X-MC-Unique: TK_R08NkNqeI-qqtuGue2w-1
X-Mimecast-MFC-AGG-ID: TK_R08NkNqeI-qqtuGue2w_1794010495
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so23362751cf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 16:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010495; x=1794615295;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
        b=coCtI4vNXriUdoowOE+AyoSv3hsJApZkzOewFqSmsj3MV5pJzjZW9/xGCQluAtBsHx
         wNDs9av/JGZSG20ufCuo2SdcYrI7sVAKeUesKXedtKjtBdOp44FPsy1338DyWEL/Y4KI
         quVEf/sMXE5qQUEAO2ZH9DWxeqw3ESD4umOd7AKWhrwFwhD45HRUP+5dkZ0EZHJuTV2N
         WRWVtkZPzmWgdmkPjfkWj6vkLVQGbbI0k6xJNzq0GTlEySVT6V2Jg5hPEg2/jhg6vPm6
         6C7XLukt8X9tV4Rh7jgNA0OtXOnCDTb2pluD0xziw3ZNlqSY25RS0AGqE5KgrzTpSx0G
         cu8w==
X-Forwarded-Encrypted: i=1; AKwUvByD4p86bRXE4dlojTOTCUTI9z2Yaa+Rk2XmrxWzH0MNlBvvfGA6KuBSxunqOjaxIg/oON436u+gEQtNF33rbg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9iTfYPPNtH4m8Vmat59X4W9xGW4j2T0HjrMI4O+xpDTsoMRZtX
	+eBKVJiiklpSpqron5MJKUpGVhZ3dn4Vc97CoUCtin6mYdueDYYh+fVadfVoF5CaFsCcbuBV33r
	hV+s/QeUxjY0nk3m2PZxxV2ffB8psD3CRBQ19rpayEoLpuXu58ndFIuYlBSlaAtAQK9qOVaJWqQ
	==
X-Gm-Gg: AYBFou0nC3T8sVOQQP+8tV4IkGZwTCfMSA0cVs7XjwBl9c2oojRFqiaqha6ancWJq3W
	NJLepMmG+sFknKGl9A+wScXY5IkETmBXcG/7+DZZ3AvqeXFqTfQdzxHzjS6sAd2XlrJmcMbNZaR
	aHEbo5hAsqN3pvls6oi2SakVcp9Y9mK9oR4PZGPB3xrq3XukaBRl7AZnjOZgy9cNPzWJBZmoy0M
	c2vJl3Los4udd9UUnqkkqq9sqDhmcZiomlMpUN9BK1o52wpHZ+9TUnTzLLAJ0UDKMtz9hBHgyRB
	SnDco6AZlxK5GQAioaXPOhy9+GkeTmIN9xlmKe1zYyqlMR96eEC/jmtgKNxxRr0uMMhZQ9OLHMA
	Vodsiq8BdrzceyQTEPUYwQ4bijRNcToeTcObEOroS9xTWfA/Co/yzpvRWGsoMXft0mIc32E+l9+
	lAvlfWQzX3DrAoMJtq
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73961141cf.28.1794010495447;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73960931cf.28.1794010495047;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a591a4sm31938846d6.20.2026.11.06.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:14:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:14:21 -0500
Subject: [PATCH] mailbox: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mailbox-subsys-v1-1-a0696237223d@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNuyhLgVOWBnMPLXDiK5d4vDp
 77vvUDIMgnk3gWWdhaeJwfte2C6ampJMTpDGISJ1kGixoqHej6UbLWcojJEjKMUIyID7rRYavj
 4gkX52y17Mutbgft+ADFe+d9yAAAA
X-Change-ID: 20261106-mailbox-subsys-9ddd537d3eec
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3AfqlmxfhvtOFs2P8v1lkeNi768e0FuNou3yM1xZYxY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5Va/njKX4/zvh8ZCU29Zn++fUlxuaP7/8lR/lw+nt
 x5I/K/a11HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELD8x/FN2Dr8RvTypYk7L
 5G0vZQtW7Jh4dPsWLhmFiWsSK35ysSkw/E/vjD12wDx/od6djL7jvetjL7icSr0fsDtr9cdTRTX
 7S5gA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OFdtMgyBtqpMup5R-vlIqV67WSHEctP5wIMWXqE1u4k_1794010495
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_161458_688346_BCA4BE94 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
 drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 12 +-----------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 1f87a84e5995..f489bcabceff 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
 	},
 };
 
-static int __init slimpro_mbox_init(void)
-{
-	return platform_driver_register(&slimpro_mbox_driver);
-}
-
-static void __exit slimpro_mbox_exit(void)
-{
-	platform_driver_unregister(&slimpro_mbox_driver);
-}
-
-subsys_initcall(slimpro_mbox_init);
-module_exit(slimpro_mbox_exit);
+subsys_platform_driver(slimpro_mbox_driver);
 
 MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 96462ca84471..262832753fa5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
 	}
 };
 
-static int __init cmdq_drv_init(void)
-{
-	return platform_driver_register(&cmdq_drv);
-}
-
-static void __exit cmdq_drv_exit(void)
-{
-	platform_driver_unregister(&cmdq_drv);
-}
-
-subsys_initcall(cmdq_drv_init);
-module_exit(cmdq_drv_exit);
+subsys_platform_driver(cmdq_drv);
 
 MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..f2a082f2dc7e 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1023,17 +1023,7 @@ static struct platform_driver zynqmp_ipi_driver = {
 	},
 };
 
-static int __init zynqmp_ipi_init(void)
-{
-	return platform_driver_register(&zynqmp_ipi_driver);
-}
-subsys_initcall(zynqmp_ipi_init);
-
-static void __exit zynqmp_ipi_exit(void)
-{
-	platform_driver_unregister(&zynqmp_ipi_driver);
-}
-module_exit(zynqmp_ipi_exit);
+subsys_platform_driver(zynqmp_ipi_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mailbox-subsys-9ddd537d3eec

Best regards,
--  
Brian Masney <bmasney@redhat.com>


