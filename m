Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67A6C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45A620691
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wV9O2yqr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oFBiOJFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45A620691
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLvggMxewywmyBRZAxHJBCJazF/SsfNvzeuLagIbF/o=; b=wV9O2yqr0+Mj0Znco4KmiJhS6
	ICkG9OXG022wYKbDzCS1k5jya2KLC0qqWyP1aOk1hvVBjn43+e3wLuTbnGPgldm2ktcGW3DDeeqsp
	BUJ2UK3maqDJPtWrGaDLXikcKZFEs8tOOszD7WEORp51HaITeisM8f0YCPgXIvn1O99cLHJLKPX4n
	I97GMNhPkDuw3aZ5NNS/Sx9VBPpH0PX6heaCj1B+0Q6e5IHohFxfyV5D/Ggwcy3SP1xxFPQfo37Zk
	xRT13+oaY0nvyUSnsNAA4esncpnYpDxF2al3ph/Z+2KzK9ykhOBt+te3/DoX/241Mjt4zCI1oO4X+
	bt5Sbp7kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwaNk-00022D-Fk; Sat, 18 Jul 2020 00:07:12 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwaNR-0001uB-Gk
 for linux-mediatek@lists.infradead.org; Sat, 18 Jul 2020 00:06:56 +0000
Received: by mail-pl1-x649.google.com with SMTP id p14so7564691plq.19
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cSGrpEWuKSVf97iW7EL4KZRFYPfb7+inZKxBuLQuvAE=;
 b=oFBiOJFotgQsYiohUpKbkZXbMk0anIOETUAPGMRKbKBtkpfPEd8xLg6XTAXbyZcfoi
 BwNvvIaw6/t2CBTYGbvsBkLGxWK6++vWST3Aj1KHKgiLKceg0RQ/9jN9Ao2iWcVkzj7h
 2Q0AYvvuyzQfl95ZIplngHYn1lLuX9YOT4GvpS3gMS4mvYXyjnqEy+kxckIutRo4ELHv
 PD8Cy2kj4InW3oDPlbSPrZZ65B1YVO/rND51vigqVYZQjN2CHT4NeULpOgwFAekw8cce
 JpLLDWTXvh8nLo3nGfEzbkbAHILC+wrXQ/qljDHEhrL2d39+3a69ylcOh6DBU7A+ud7z
 0n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cSGrpEWuKSVf97iW7EL4KZRFYPfb7+inZKxBuLQuvAE=;
 b=odKpmaUlC4oGQZ1ivHZ7xWCzHnp/zZOy4XY28bUB0hmu9+aJ6bYz6HxbVOvA6/fx+i
 YhthCvRM7O+U32J76x2AZ7MX8g02gzfuU2ny0qagMwYIV83qR4OFe4lw7Wq7GlgEcpiu
 pCwD3Uy86b5zsxzzxKyX4NIYyowsHYD3fGfrGmUsBggBZ2xecO0lD1sKOnF7b02IsU8g
 InqsW1jFLwfXqun4t7GOWc05boMCmcLMAIK8z2SGvln3lRdk2mKC0N0fSx8TWzPGV7sw
 4HF6E9mj1IjcufWrrzti22/3CFrIJjmjnSLVFPYKEreo3uwaum1q0CeUu+qBcpN94CC7
 bZqA==
X-Gm-Message-State: AOAM530rZ3LcsUkURFcx8wLa9YxCACRK58JESLVsh9WbQrMxx/+k1ijc
 fHx5WjlT8+X1eyuzJTpwqBT6ejCBotowB7w=
X-Google-Smtp-Source: ABdhPJzKJZr8KDd4Yo0Wm5lo4eKhPkLN/TRhN4fCypWCbhR0OyB2ssX8VqDuXN35b/Dzh+f6roB+vXsTyHzgnyQ=
X-Received: by 2002:a63:7d16:: with SMTP id y22mr10135672pgc.136.1595030810200; 
 Fri, 17 Jul 2020 17:06:50 -0700 (PDT)
Date: Fri, 17 Jul 2020 17:06:37 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-5-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_200653_616013_AF5DC220 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Saravana Kannan <saravanak@google.com>,
 linux-arm-msm@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, John Stultz <john.stultz@linaro.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This driver can work as a platform driver. So covert it to a platform
driver.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/irq-mtk-cirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 69ba8ce3c178..62a61275aaa3 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -295,4 +295,6 @@ static int __init mtk_cirq_of_init(struct device_node *node,
 	return ret;
 }
 
-IRQCHIP_DECLARE(mtk_cirq, "mediatek,mtk-cirq", mtk_cirq_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_cirq)
+IRQCHIP_MATCH("mediatek,mtk-cirq", mtk_cirq_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_cirq)
-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
