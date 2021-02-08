Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E06C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E82064E27
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E82064E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ME7Yq/zxXxsNyBhjFZcp5qBCa29Hn1uMQdP0Uh6c08c=; b=PeXAZG5kQU6n+pnVjrOVnyMA5
	bLrpKGtKKASqVJRGEUVUKQaqW3PTKavcBOyNi0UmnNQTv1Gaiymrl4DjKhBJdnyU53VDhvwF5pVNs
	ZdztjcEoNeiIGIagNGLmIQk3SiR/0cF4t+8Dmf4dQPsyBBnX98HvuBgZHbhgtrt5qzE1wwehm1u9w
	bpKdUQu2RYQtKLR39JSv8nUo7SIsrGpQkAwELzUY2OUH76ADI/gJlMN3zIOdg8b4cd44qMhXASFmm
	W+/rSiuC8icJHw0dEhNg1fLRt/5M7cQlQYAIfAlA6fxbJW5IacUg56frONxNz6VU04TOOhONWBJA8
	t+7gk5CXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l937O-0007TW-9C; Mon, 08 Feb 2021 09:46:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l937M-0007Rk-3p; Mon, 08 Feb 2021 09:46:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id j11so7507704plt.11;
 Mon, 08 Feb 2021 01:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=uCYoZg2R8/14y0vFMLpPaQrQnJMbTKrlnsoIPOS5QGxuth7pVrBwrA6j9gye/csbVB
 j+5RtB1vgQ/mWJWxDFGUR3KtlxSichulOWha+IW3/EorGaqTwmHXEicitQnSp8F7qo2T
 H4eCH5JgjaxXZAVWGSmV3s1TNTnZX0F6jCFyziRIAFb4TX8fKB5rld8F/WFR79ktoXDA
 tOxJTl4TOaA1rZRtpJV2v8r/6EHbrW7ivVSuAOmysEsiDzLM22xgt3fiIobRfWrcjANg
 apZiOo9RQ4NrxVP6+BYZYoL1Y4yC5j1VVpEPnVW0V3PZhttbddwkfshnBuy8i6z3muY5
 dHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=HGBmWFQBYx8eMrSyQ5mU8ItjnG6RLk4k6eNKKObOZU3CwwKDYvGxhwUOa2PyUAsC3a
 Tu8kuBGD+sOp3uYepmV4rMM73laBcTZVhKCyqEIw5AV4E1yMbYR/jHpW5OxJZz6iqdUh
 Q8/rUlGtCcUjdeOAsr0sTIL8CvSpQ1+NuHlHy5HX423NkrB9KEE9bAVb7LG0imtbcnsW
 yW8cgeVBEJVBbKyu8bpg5X0CAPhjgTobFtREUtXYR5N2VAk8fW3UbC8BM1OAfpBtCZ/a
 gmgvRou/dcYR++CkbIui1Fw2AW7mghzXilH/XvDtUFDj5RML8AquQLnxqyY4k1fYQJQV
 6omA==
X-Gm-Message-State: AOAM531e+cmxbLYDkxyXQQ9cHbQJcFXlNOHm/bSa+XHPrl8muL5fRqS1
 KWuIV1tiywLXdVUoXAM8cfc=
X-Google-Smtp-Source: ABdhPJxFAfA3xnZa/SdlnyWSMLtUZfzO6fW1PsgSY+mW3dZpcPzfVsYschVtjHAKOzf8A52dbNSn0A==
X-Received: by 2002:a17:902:c242:b029:e1:8332:f14e with SMTP id
 2-20020a170902c242b02900e18332f14emr15645661plg.41.1612777561736; 
 Mon, 08 Feb 2021 01:46:01 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:46:01 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 19/19] crypto: octeontx: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:38 +0530
Message-Id: <20210208094238.571015-20-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044604_186616_5A05EBF4 
X-CRM114-Status: GOOD (  13.56  )
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
 linux-crypto@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
index c076d0b3ad5f..831550123719 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
@@ -17,11 +17,12 @@
 #define DRV_NAME	"octeontx-cptvf"
 #define DRV_VERSION	"1.0"
 
-static void vq_work_handler(unsigned long data)
+static void vq_work_handler(struct tasklet_struct *t)
 {
-	struct otx_cptvf_wqe_info *cwqe_info =
-					(struct otx_cptvf_wqe_info *) data;
-
+	struct otx_cptvf_wqe *cwqe = from_tasklet(cwqe, t, twork);
+	struct otx_cptvf_wqe_info *cwqe_info = container_of(cwqe,
+							typeof(*cwqe_info),
+							vq_wqe[0]);
 	otx_cpt_post_process(&cwqe_info->vq_wqe[0]);
 }
 
@@ -41,8 +42,7 @@ static int init_worker_threads(struct otx_cptvf *cptvf)
 	}
 
 	for (i = 0; i < cptvf->num_queues; i++) {
-		tasklet_init(&cwqe_info->vq_wqe[i].twork, vq_work_handler,
-			     (u64)cwqe_info);
+		tasklet_setup(&cwqe_info->vq_wqe[i].twork, vq_work_handler);
 		cwqe_info->vq_wqe[i].cptvf = cptvf;
 	}
 	cptvf->wqe_info = cwqe_info;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
