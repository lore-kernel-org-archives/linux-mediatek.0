Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E316C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:47:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D910B22D6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D910B22D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nx+tJQp/fztnvMIOfE+FWw5m34MR/M+ExeYqEcjlO8I=; b=2GBjUqiuuXEVhPq38O8yaxpr/
	+U3nPtNnZMswwoRvA8oX2JfzUdv3R++yVk2fleILq/3SWVvQ+Di9NeEIscK3xW3hOgWHHePfsOnh0
	u5kgE9/yLwu4dVNDst4iIfXOH+qm7tZPfjF02Dcz49Rhr85fslE9vPYWDdHXeL4aXGc4QCxNTbtR2
	s3YCWduck+N5E7y3RFeRV9Iprq2AIU0VdTPwL9qqJ5uAa/YyHnD8jAi9LlMWCxv2seJ+NXmhomFxO
	Yy5WCZp+QTGG+bS0u1F9StvRsbPj78J6+KDDUecal6kxtPcT/8er8I0emfy5cHZz8EDYuz0cYMD6r
	eJOo5X1UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8mb-00036t-SG; Tue, 12 Jan 2021 01:47:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8mY-00034Y-BM; Tue, 12 Jan 2021 01:47:39 +0000
Received: by mail-pg1-x529.google.com with SMTP id n7so383512pgg.2;
 Mon, 11 Jan 2021 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=dyLRtXDjB67vS15RLsmqGSUOvPPoOTHemszDDXF+TlQiAEsteD0YrxcYZwJDoUvbct
 uVNXnzERBcj0usi04XikK3DYBQ2KUn0Hm1BE9dC2/+cLnoSaPcw0nVTsEHjr0x0JNdW/
 zIEds6h0gVNU+76UE6+PGWSQXvNol7Gpue6C4enyaob+C3OhekAd3dIHXw0vGzclsXOi
 hUsxcAGxXZRjr/SKWpj6+GreRS3oI+OVtMpQF6aTu5ZFDHfjE5rG8//Rd+ejNrUN2FDB
 TpZG/to2TcodizTeA+CJTupytQCv1XwZIQuSjSUpkQZaZ++4KZgLAypg9ns8fciwU7CR
 H4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=eVjqFS9o2JCvmIPpLZyuDNrtDrxGGYIZmc8nufe14876BIdttxzkqDDWovmXk3yHZb
 /QmfPkKAazHhAsyeZz/+OzllQ4jgib92XZQu9OKC0be308xQI9rg7YXIIgyNx8VnkG6X
 cZ9ERaNBe1N8SjnMPQ2PoFekZga252HGg8DRmhWkBSYhw+3Zu0sfA5q0qHaocJIzqOwZ
 HwNnQ/kgMWnBP+HsA+Bmf6PU2kSdQqUoDh3fyYaNtOpFxrNsmjOxD0IBih5be3WTHPei
 SJf6ndfOnrIoLlV7rt0fJ1zo8KN0qIBJMGAaEiTjOy4gCR2xQE6D/hBy+OjVWC5NbYSk
 APcQ==
X-Gm-Message-State: AOAM531758hrtT32weOZXEgpSsAm3LX8JSsldbNU6WgonGvgdCiSHXE/
 yoZ/RT6aO4k5DR8w1QjOFyo=
X-Google-Smtp-Source: ABdhPJwnfmBvyejGqi0Tb2J3Dw3X+mlfmegsFTEcZ+clarKrFxuo2IsTMEoXTWC+GHMQHQp1daHk1Q==
X-Received: by 2002:aa7:8506:0:b029:19e:95:f75f with SMTP id
 v6-20020aa785060000b029019e0095f75fmr2142115pfn.7.1610416056325; 
 Mon, 11 Jan 2021 17:47:36 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:47:35 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 03/19] crypto: axis: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:34 +0530
Message-Id: <20210112014650.10887-4-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204738_419595_5B75FB48 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/axis/artpec6_crypto.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 9ad188cffd0d..52e0c7fdbfa8 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -2075,9 +2075,9 @@ static void artpec6_crypto_timeout(struct timer_list *t)
 	tasklet_schedule(&ac->task);
 }
 
-static void artpec6_crypto_task(unsigned long data)
+static void artpec6_crypto_task(struct tasklet_struct *t)
 {
-	struct artpec6_crypto *ac = (struct artpec6_crypto *)data;
+	struct artpec6_crypto *ac = from_tasklet(ac, t, task);
 	struct artpec6_crypto_req_common *req;
 	struct artpec6_crypto_req_common *n;
 	struct list_head complete_done;
@@ -2900,8 +2900,7 @@ static int artpec6_crypto_probe(struct platform_device *pdev)
 	artpec6_crypto_init_debugfs();
 #endif
 
-	tasklet_init(&ac->task, artpec6_crypto_task,
-		     (unsigned long)ac);
+	tasklet_setup(&ac->task, artpec6_crypto_task);
 
 	ac->pad_buffer = devm_kzalloc(&pdev->dev, 2 * ARTPEC_CACHE_LINE_MAX,
 				      GFP_KERNEL);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
