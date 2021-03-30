Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEB5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:47:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB13F6191B
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB13F6191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lI3Qe2uK1lcv7zsd17hS7eSKEAk+g6ZPcrgXOHTYoi8=; b=ZJ9+zQ3srPAdhXRNgqLqa27Chk
	dGG5rU8Z4pMYToHhP/HbQVGzrRQEkKDF9P5fO8DwoAOB/LAWVQVbSiQGN+91szBI7SMgWhZoSZ/Ar
	dvCApNnM5iqqbv9CY/JzLe5pkzU2+Hhq3jJi/TlOlWZ2JeQyE7XaUnqoTFWk6PY9SC3mNmzfyyDn1
	nDEkVZHQkAnc+MloE/WCieChMwGf6Smp29SZoKVSfSNOICr9TaGPoAGeIHW6AXHPogRtToQe0JBgX
	hoAmZO+LnZ2vxaLCOXqVa0bHxUA60Os6bFSQlLc7G1cdBNLEDr2+LmolafCAFWz6RwIKPzR2pvRUD
	4dmyyipg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRA2E-0035D8-Nl; Tue, 30 Mar 2021 08:47:38 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRA23-0035B9-0n; Tue, 30 Mar 2021 08:47:28 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lRA1m-0004fg-PJ; Tue, 30 Mar 2021 08:47:10 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Argus Lin <argus.lin@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt6359: Fix spelling mistake "reate" ->
 "create"
Date: Tue, 30 Mar 2021 09:47:10 +0100
Message-Id: <20210330084710.997731-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_094727_152300_6452B942 
X-CRM114-Status: GOOD (  11.28  )
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/mt6359-accdet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 0bef6eaad5ad..4222aed013f1 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1019,7 +1019,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	priv->jd_workqueue = create_singlethread_workqueue("mt6359_accdet_jd");
 	INIT_WORK(&priv->jd_work, mt6359_accdet_jd_work);
 	if (!priv->jd_workqueue) {
-		dev_err(&pdev->dev, "Failed to reate jack detect workqueue\n");
+		dev_err(&pdev->dev, "Failed to create jack detect workqueue\n");
 		ret = -1;
 		goto err_eint_wq;
 	}
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
