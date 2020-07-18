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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF8C433F1
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93C620691
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYKpVwIP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Pc3OXUSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93C620691
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qaNBvXEA7irBzPxeMx3uqoop76qnjoUTO0O0uGmoaoA=; b=PYKpVwIPTuhkOI3aB8dwKAI6G
	DEhFBVfin1OVrzga2MGAcUxuGVn8FPCc4Yqn9hmkhZJfLV5HVwg+9qvjXvgD5j2t8WEKK4zRFDlX3
	3LrUZlrZrZk6pPcLAkwMOV3L6PZu4BQSFqHoJg+23Xwip/kM9uTkUTW2nfAeyyHNTVKrSc6c/pO+8
	kFYwCmmEebEMVBuDEuvwjW/52PJSQrJW255JcbE49SdsO+yfaIj3ou9szcuLv9wiTY5buJuBJ7NUp
	UTUqJVHwARhnx+ubK9F9lu++ykCh3g+4pgsqhTA+6LEdE/y8IJTCC0pLjeXeUZTN1ov7eoNcybE80
	UXEz4Hl8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwaNW-0001xp-6s; Sat, 18 Jul 2020 00:06:58 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwaNQ-0001ta-MS
 for linux-mediatek@lists.infradead.org; Sat, 18 Jul 2020 00:06:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id i9so2659826ybg.1
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9lliIP397BkHUMIYOIiz1lmKlM09rTtKqti3dJZq5NI=;
 b=Pc3OXUSRMtC51Xe5/XMfqVgGHTzqEztWThvDswR20yBvK4q20Xw3ZNE+8dkR19OmDD
 gDksFj5HOd268anWSSimT3Gn9d+v7SfcYJjjCEJY6k3KED8/Qg0cUFL25Q3MLk3u6WzP
 6SQOsdECq3m8nfn4B/G+qcw93FKsucGX6KBj42CnWiZKaOz2sMFI1iIBqIg8B/YnRj6U
 VozP0QbaLKiXIdIxryY+7xaJJEGEd8+z9ZmQZXSjBMWae0vTANsynMnqxGRMmmAY2Nz7
 y01D9HdzUEov/4to4JpMNjFHQb5ZWpIPNEGfCjmvUCtCL/gSUXe19cgBOBtkE/HRrupU
 dKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9lliIP397BkHUMIYOIiz1lmKlM09rTtKqti3dJZq5NI=;
 b=a/+AHHyDDa80NXXcR9rtu3OB2rDGS1WPILW7thHirdWPI8f3yR7lt1IiBIZsJyCH1A
 KdH83jjkZkKE8QHyxBuP3jZmXZht5RdEd/EryEBrgLLUBIajIHMxRVW6FGuCPPMWnbkt
 sSCTLTPvu+K138S/y0S1FkQTMCOuL53jNJ9/90aGM8F3c6OxJ0d+8o4zPM9GKU9bQutj
 Ts/FVocwjWS6tMF2U7qkmLWn3rkW31Bqi5CVQBGlua3tGJf1SdywQp9rF8rSHdECVY7I
 dgqPUSjU4kLLU8xIyYVWWvjSgYgLDUC5Iqa8/FMeltn6i/fw8+HKWpItVcqqdPlDttv4
 FTlA==
X-Gm-Message-State: AOAM532YThFQq1GwV5VaRO2zWie/cxvVUAt5a8DVf1aSPp9DggIX8OKV
 Au2Gk5HpLV9+m1EMQEM+8QeOycdXyfGnXpA=
X-Google-Smtp-Source: ABdhPJzaoGGT2QOhK85hcWY30M8zasDny3EJDQN0UI4RBnyRl5EEGtO+6Y9IPCYksqge9OpTXg7V9ykOWjui2KA=
X-Received: by 2002:a25:abc5:: with SMTP id v63mr17904281ybi.148.1595030807668; 
 Fri, 17 Jul 2020 17:06:47 -0700 (PDT)
Date: Fri, 17 Jul 2020 17:06:36 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-4-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 3/4] irqchip/mtk-sysirq: Convert to a platform driver
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_200652_877471_5CB7B73D 
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
 drivers/irqchip/irq-mtk-sysirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 6ff98b87e5c0..7299c5ab4d10 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -231,4 +231,6 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	kfree(chip_data);
 	return ret;
 }
-IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
+IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)
-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
