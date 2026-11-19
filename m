Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37130606A324
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxpjP8ru;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oREPfXNb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UdjPNcmatNIX+1KGlhz64cm24KVbVuKMospPTTHbxLU=; b=kxpjP8rurn80WQTcnT0s1Z9qIq
	6knftJwqxBbD2QM71BHPhdWnRbWoMuwL4jd8saWolW+0MCs6opqc8KFKmFMXaPtM//xSQixSkS3qK
	oQvGNVGoMFV/g2D9akJ7pyUy4u+um7TR7ZFfBVTYmVc9iTkDtWEx+cwyPCTVGlyIrglFEWRk3WOO5
	1mg61bm12/k14zEFw3oldt1ButUCJ5I1sfiT1QraZM6TbVYWeEkxWh6PMRYbfEJ1pCfSzp0EzriZE
	6wdAYZWKIZf+Xim+Ejnq/OMRoRDQoW3xNGU6ffieksI6lRw+sVNTE8RpkcSKKzOn3e/fYwTty713I
	zY/ZNBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx3K-0000000B7yC-3ArO;
	Thu, 19 Nov 2026 07:59:30 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx3D-0000000B7vh-19k3;
	Thu, 19 Nov 2026 07:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oREPfXNbq9pUlOmdRIhWWrPWgkyv47/NeDgwJYlNg+HMQ+EUOsaHYr9I6qcidSMdFhj+ihUluVV4w
	 71l+uoqdEvdr15c2Dh7keE7qv9k63PSqCbL/2eECezh1LdnyR7F2VPeSgabN1s95mbbTC9chxpBtDZ
	 BQfSvlW+abQdynWk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afeac50117-e83cd;
	Thu, 19 Nov 2026 15:59:19 +0800 (CST)
X-RM-TRANSID: 2ee66afeac50117-e83cd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afeac55dda-f590c;
	Thu, 19 Nov 2026 15:59:19 +0800 (CST)
X-RM-TRANSID: 2ee66afeac55dda-f590c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mediatek: mt6797: Fix runtime PM handling in probe
Date: Thu, 19 Nov 2026 15:59:17 +0800
Message-ID: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235923_895652_534BE7D7 
X-CRM114-Status: GOOD (  11.07  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6797 AFE probe registers its components even when the runtime
resume fails to enable the clocks. If component registration fails
after a successful resume, the probe disables runtime PM while still
holding its usage reference. The runtime PM disabled path also
returns the previous successful result without registering components.

Use pm_runtime_resume_and_get() and stop on a resume error. Drop the
reference and suspend the AFE on either registration failure before
disabling runtime PM. Return an error when runtime PM is unavailable.

Fixes: 3901b9fc0f0d ("ASoC: mt6797: add mt6797 platform driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 2069c340ca39..406a86035785 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -828,16 +828,21 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, afe);
 
 	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev))
+	if (!pm_runtime_enabled(dev)) {
+		ret = -EOPNOTSUPP;
+		goto err_pm_disable;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
 		goto err_pm_disable;
-	pm_runtime_get_sync(&pdev->dev);
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	ret = devm_snd_soc_register_component(afe->dev,
@@ -846,11 +851,13 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 				     afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_sync_suspend(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
 



