Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19B6C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 14:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB776142B
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 14:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB776142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QWSgecpcKlpF9txlVJZkDkUQs7/a2ydkzNYSJC92rv4=; b=ENPVYftiEXGYlA
	8CJ4XEhNeK+2QwvIbSn5oULL9HE0Imk9CJnksoBlQdZ2x4BBvhWoHh5X7gURI/IiybLvKvAiwAGUi
	4l0e0GLgPh7PyP496YWmZqpiCO6oPjOwfE+hDJMmkjiaiMYTM548d4p2hjz1hMOsPtwvFex04cqUH
	M54eMuayBXdWL3sRLRJ/WmhYp1udiGYkGk4y5loUN3Dfy0rdvCIedwk0l19bpsIDGFHC/ZtwfClb2
	WKQomrUkozZXUrU9nwZPcnz8/QhLjzShBvHxU5n7snGdlu72D+I1H0XDPbgWRfbZIvZty0nvWWA5B
	2AUzwcjjm9Nm5fdltCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzK3T-003FRv-B3; Fri, 02 Jul 2021 14:22:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzK3O-003FRO-Uu
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 14:22:05 +0000
Received: by mail-pl1-x641.google.com with SMTP id s13so2554057plg.12
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLyiXBRytwa/KX87QfGpWD6i8lQbUDmQ89vq7Dciep0=;
 b=h45Te8Su5tQ4M5/XKj+htL9DakKPj5hxB2r/2Sfh3FONMfiWAV/W8bKhHi0i8OLXFk
 8ZS4mxSSS19xegeJszQxyUw6XemPbESDKeZD3nRWGJ/Vyd29cW/pbAC0XQ37qXlxLjz/
 6yg0PG5r4eY0ohawwXcv/ygPzShIBwwl+KI01SJiGoagM1B/quDHL0JVikuKyL/5GsWG
 pZulYm0PvEdgg9fCUU09SBJISos5a46Bacf6noAus+aponJqVEGjzVgNW1uz0yKymxF/
 61jgI7i60DBfu85Eqnyfok1Nq3LYP/BJAyVZIRnJnoONUA9c5OCykcfPmxQOZuvOP4aF
 3IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLyiXBRytwa/KX87QfGpWD6i8lQbUDmQ89vq7Dciep0=;
 b=jJh6jnZadxTKSC7QejpWxVeRuH4zyCZWjZybUo27GS5emydDHqjCloM+apXZ9aAr7m
 SJYsBraR3ymA4TZlPJAcmLKmyT6NKJCrPiV80IGZEChgWtNBdJRFp+Ix4+sFH4Z0UPX5
 dycOz8x2Imum7VraiRMWLNHSadH+HPyFC3HBdtzdJemv14SNR4bidpqnj2J8nd1O+Ic3
 AJhpIlAHd59dOiJvlx6yH8FfQ5DgsjqF4NvwA+ryezERYXDpdhC5G0k7AF5KkwUJJNC6
 p2EtjJoChAvL6WnUxnc1VOzWtwlrgRjBqLjB2l5zdlUZVd+w7iNmsfOZr3WCH8juu5zb
 4gcw==
X-Gm-Message-State: AOAM5335uFC4nlm/18nqygLd6wfbU6P2Re1g3PEf5m0jpP+kAsNIYOQa
 EhcjA6QbwzSbVZYtlg8sQVFUUw==
X-Google-Smtp-Source: ABdhPJxMuvypfVbLtKDMfWpThhq9vF234lyb+dahtuMwJHzTH9rTgPUc52YD/j/AOAv/OrtP9LadSA==
X-Received: by 2002:a17:902:7fc3:b029:128:c222:a745 with SMTP id
 t3-20020a1709027fc3b0290128c222a745mr77674plb.56.1625235721516; 
 Fri, 02 Jul 2021 07:22:01 -0700 (PDT)
Received: from localhost.localdomain (122-117-179-2.HINET-IP.hinet.net.
 [122.117.179.2])
 by smtp.gmail.com with ESMTPSA id 133sm3882755pfx.39.2021.07.02.07.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 07:22:00 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Mark Brown <broonie@kernel.org>
Cc: Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] regulator: mtk-dvfsrc: Fix wrong dev pointer for
 devm_regulator_register
Date: Fri,  2 Jul 2021 22:21:40 +0800
Message-Id: <20210702142140.2678130-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_072203_087602_03479C89 
X-CRM114-Status: GOOD (  12.77  )
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

If use dev->parent, the regulator_unregister will not be called when this
driver is unloaded. Fix it by using dev instead.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index d3d876198d6e..234af3a66c77 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -179,8 +179,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 	for (i = 0; i < regulator_init_data->size; i++) {
 		config.dev = dev->parent;
 		config.driver_data = (mt_regulators + i);
-		rdev = devm_regulator_register(dev->parent,
-					       &(mt_regulators + i)->desc,
+		rdev = devm_regulator_register(dev, &(mt_regulators + i)->desc,
 					       &config);
 		if (IS_ERR(rdev)) {
 			dev_err(dev, "failed to register %s\n",
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
