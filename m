Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21268C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:26:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E004D2078A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EyiGTifk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juyCGc0D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E004D2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfHsQp/s2SWdhfugM6D8oqfyDa0N5CC01N8u3hR+ZJI=; b=EyiGTifkDFRqgkyMCgX0+0RhWd
	NXvxv3fJ9ulqf6BlafufyJ2axS+mG8bEpaJhAF5gYWLPSpWSsH0uZHt4wmw5+h1CoPg0R6QAGR7B3
	ENqw0oUrPBrnjL9ymFi0pAi+4tqrHs5W3MSHYKxZeoHf5MGXFNb4BZvAbItgFRo6y/SVz4vh6jHmz
	fd/KKooQRhTcvCGFkH+vGDIKMM67QMcI2ObsSrWPnjoKzkpDUtfy+Z8Az8q1ns2dS4sQgdPERaeXO
	Ln6AFS8P+T3wGgJio6ym8r/zdsmdwngiLC8niBcM7E08kdLmVvgxbq2DlTnqn/Ff9W7XoLIi01usW
	CYdRXSxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB8YQ-0003Cg-W3; Thu, 27 Aug 2020 03:26:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB8YN-0003AR-5v; Thu, 27 Aug 2020 03:26:19 +0000
Received: by mail-pg1-x542.google.com with SMTP id g29so1320260pgl.2;
 Wed, 26 Aug 2020 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rN37qI20ECUBatR6H4A3g3beWRHeq6Mi+Lp9BztZsHQ=;
 b=juyCGc0DIHQSjOjHsrh+qOzPev0piOd8Bz8V5NomMrKpRtgz1hEkev8rk95Rfosf++
 lnk73HOq4CZaRbiG0/oPUOppYKjNDDv+GrKz5yob2Q+JLlv/uQhRgO5ugFKMGUCEMAJO
 HQoMI3sVkJ+892Dgoc35biNla/wrHNjbvXHmSuHdtOgUlE6ARLsD4FsGP0TfpePwMpoS
 iinEOqJzEcZh3fQje53unSjcBpdNpYqMREd+jzPdufjB4ixU9P6StstghAsr9tlHzPMi
 ZDvtBdi9SR1ibwo1pQDX8rWLe4aSnHgcfYebs+L6FpQM1Vj5hvbYYY1mQ9Zx6ayBfHA4
 yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rN37qI20ECUBatR6H4A3g3beWRHeq6Mi+Lp9BztZsHQ=;
 b=INMhgRdtsmG41UfmhxueI5YeEkHzg4tmbUaCdZwgEDAwbMJTG+GXrn7zMsPybkFNi7
 M/cYgbEuFN23wH+MYLUiGKcG4aunppU1iLCKpp6KUz97omPCWmOQykw4FFmStU0YfUA8
 kiKd+c0PfQEBuxHeJ/9SRX+3J81pe8n9uH7MR3lFGNidm065CVTJnkRwLWbvUZw2Ftum
 dz4oJCWVxBNxWwJ0GEnfu105J/hcgEmFN6l2gxxzzk5sDveBLk1+OMKE6DzZUAQGeGf8
 eu0kFt0Ie5DxIOKKLVmFz2a+QRoLFmmEwdGkfcLRuebLByEd9qv4S84PjSPJp/YtpEDf
 rbcQ==
X-Gm-Message-State: AOAM531qwUw7V4fjYzA/An+S7D+7EluoWge92xcssKDTmRy2q+Zd6u5w
 n/lkTiCyR5PQvDQv0aOs1LA=
X-Google-Smtp-Source: ABdhPJxs3SdM7Lc3+cmlB678u24GpPwR5yvBajty/DF5b6W58gTKmaqbA8z69x1z9NNVbSOoHjIFhQ==
X-Received: by 2002:a17:902:b589:: with SMTP id
 a9mr14117797pls.98.1598498776792; 
 Wed, 26 Aug 2020 20:26:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:57b:156e:1129:dc1b:b8d8:6430])
 by smtp.gmail.com with ESMTPSA id 70sm676982pfu.107.2020.08.26.20.26.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 20:26:16 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v2 3/3] usb typec: mt6360: Prevent the race condition during
 module remove
Date: Thu, 27 Aug 2020 11:25:32 +0800
Message-Id: <1598498732-25194-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598498732-25194-1-git-send-email-u0084500@gmail.com>
References: <1598498732-25194-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_232619_247019_4D711DCE 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Prevent the race condition from interrupt and tcpci port unregister
during module remove.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 6a28193..a381b5d 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -164,6 +164,7 @@ static int mt6360_tcpc_remove(struct platform_device *pdev)
 {
 	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
 
+	disable_irq(mti->irq);
 	tcpci_unregister_port(mti->tcpci);
 	return 0;
 }
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
