Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC50CD98CE
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=; b=Udyq/qJscJZaZl5U6riBVsr3uE
	YzGsMFWq0A33OCUAcBiDcul8OWjm/qCOfEzBV5JTcgdPsO+Y07B80FjoHttfgt29gZPzauG4FZmFD
	Mw/v00fW9W6xjq7mvTtk6jCG/Ky7+nYhWcRzKtLZ43gUg6a1P9cuneStbORokW19wk7bVDSBy+TZS
	LxVq6qTZjN09d2GpylUBVO/HlOuMQyQSfL3mpmRpkPiaHuLbZTOWDdj9/0kIF+PxjDhvOsPveJHuS
	Vx0LzV4VLETW5tAlLRepdhEKUBdl03L3PrhwapdIGQ/1QtNXi3q6wpCXe+whzdXogzEqBQdQlh0v4
	kT4yerPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDN-0000000Bpfc-0CKp;
	Sat, 13 Jun 2026 00:27:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDL-0000000Bpev-02tH
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 00:27:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so1119235a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 17:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781310426; x=1781915226; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=;
        b=WM7a0JNxXaE28nw/TPCdJyXnK2Ykcz7B8sDoppXzpbn/JDK9GjWOoaXrAt/efv5lhD
         Vy5tVZGBejRbCqDNcBbK2A5AJryOn+91cC7gyb0grVj5oZjDb9mmibjFUJ/yBFsNg3XR
         pNMsRTYetoTyEa9aLPmOlvayzkL6A2VnLvXhe9BsrEX47lzOvWm2Hs3oBFWfUd+bAb2N
         LpHNnS0RTEi68kGn26XmMh0T4556l1KXXWj06x9KqxAaTB6WSnsPPfF7AVvBJltiLUKn
         XlciNXw8LwWcZA9N67GO9dnMYzFr7/mkf9Z0FsTFWcReWufc+W5S0PmG2YUnb58dBzCJ
         b+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310426; x=1781915226;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=;
        b=p448lKnEKxcG2tnW9kGhb4dNy9Al6/gUL+zv2RV0MnXsrNzi1zcUGfk7dDzniaWP0q
         3yOzmHZm0uaqQBLY9dU2/7/PJR0dZOKyYdqOwUDi8jC74E+aHQIbKT/shM19EFOmK6JP
         f2BcJCvHbmE42CsBbwL+a5ay6+rqdfAW5TttbR09lHKHj/vHX3j9IZ/28eotjZ1XxKHf
         0U/UvBfSG9dyiTyCFcSnaxt8oM8n0z9MW25LWsRyJFZ3Oi2wv02QGF/mwSyDFN9fjl5L
         Aj6/xI72+ZdMYoeMH1FqHwO/k3OAUwIaZamAZzmk+72Po3f03WxKi/G4Z+J0E2DxXJqf
         CxPg==
X-Forwarded-Encrypted: i=1; AFNElJ/oq6N8Nz9pfTSQKQZfCo3o9d0aGlo/Xy0NuqFeFLrcOu4rD3Mf9/PtobKK3n/458WuqSbNPldbIK6X9jAfMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMIOfR1SeHWL8vU1H+vLcJAqbhKivjc2EPMZlIY6IQZ3FhLvx
	B/MQ3N7CFKC9hYUu09hb+FLnztKmj6jqOBxT31+HGWjP61iMjofahBSs
X-Gm-Gg: Acq92OEtqV4jUMvpUh3Btx/SX63L4wIbHWG5+a1X9FDcagHmO0SId9DEB2ZJSt4jePm
	Cxx81IwuhxoVxIHTS4nrkIKYmwPObv7xZTloLpheisnx3fH/+0ISc/KnAtTvrnyLKSbCMYoPciz
	5z29KI7zvw+EJd29NBoJ2bsiXoQwAD6uhc9TUr8HX+SDdg2RW6uiiDJ3GJ6Va/JIcUp1upJKLcJ
	i6PLA1kOolXrNF1yfW461IqqQ5ROfd8LOs97jN86FGl0kJSU2BlhQQ1VsHci30ksuVSNOvou1T8
	ze/bXQ/s0f6JlEdYe3SyVugk+moO9SvGYboJ+8Uz9tVycXBWv3merjsQHS4mJxF7MrGsB6rPbU3
	MYkUTylGR2ke1ux33ioPsapPc2AP6Z1Gdp1ZSOeYiy8SittKZ2H8mCPGiVzvT1DeFlJTrREYKtt
	OIQfQPbCASxC7acQch/vEUMYzJ3hU=
X-Received: by 2002:a17:90b:3d01:b0:377:23bb:9b88 with SMTP id 98e67ed59e1d1-37a033e024dmr5562386a91.12.1781310425834;
        Fri, 12 Jun 2026 17:27:05 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8ea7sm3441412a91.1.2026.06.12.17.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:27:05 -0700 (PDT)
Message-ID: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:22:31 +0800
Subject: [PATCH] net: airoha: Fix non-standard return value in
 airoha_ppe_get_wdma_info()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172707_047916_7F0CF9F5 
X-CRM114-Status: GOOD (  10.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

airoha_ppe_get_wdma_info() returns -1 when the last path in the
forwarding path stack is not of type DEV_PATH_MTK_WDMA. This is not
a standard kernel error code. Replace it with -EINVAL since the
input path type is invalid from the caller's perspective.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..7260177 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -264,7 +264,7 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 
 	path = &stack.path[stack.num_paths - 1];
 	if (path->type != DEV_PATH_MTK_WDMA)
-		return -1;
+		return -EINVAL;
 
 	info->idx = path->mtk_wdma.wdma_idx;
 	info->bss = path->mtk_wdma.bss;
-- 
2.51.0



