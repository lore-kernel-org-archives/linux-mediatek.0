Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2235CE7A8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=; b=eTma90Vd0jvc4UohBdwTxjMAMC
	yFBBDtlA3BExtvbOS0Bm6XXUKdjPQuC8RDkM++WQa62gUz9jSD3dgb7vRlGpLXlCXj64bxPbhctvw
	/YAAd5vtrNFc+bNMrK5g3b7QEaQebj6IFjjdmBPDDwA+A+Py3WXnaccnesEElYbbdwhCkx4nD+JNB
	3K/sI6G+AAzzOS9Qv5I+YcDhNmm/ZsCBmj3XEn5q9lRgrXl4yAWAKvfhzOM+E0xuLMfztuvXXvsAh
	xX4eaOVr9rpTkCWzGAkAjl6eR5uGvajfhisXBekMfSXh2gCNubMPS6+Dh6D7gB9An5ZjNALhj3uzK
	wd5fF9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7O-00Dks4-1v;
	Mon, 25 Sep 2023 08:39:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7M-00Dkrj-06
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:39:01 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2745cd2ba68so4454837a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1695631137; x=1696235937; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
        b=Bzl56KYkvCmZX6mIBq+0JsvHBrbG9FcZLAfers/Bt11BdqyJujn1UvmrNldLTIttUi
         wkeUe1uzm/t4SXPioZw6tZk2rnQy8AHrFaFyUnacn+xZL813iKds9P+TR+iM6j81Zm5M
         s1GOtPGoaQ5K4u9lh0Xp1eLy9z/ZOxK8aEG1T17IJHh4TechwM16pvfP1K4CFuYPSfcp
         ZgpAcrpdMLQtlhhUCXWLekBUCwWK3p0727KuxRekqnqlhnVX/KCDm+dXnLGcH78foSG5
         +9FGAWshBtTnHQ/FB/1oFT6cvKwoM4aJYVQqfzsH7mzipuYNmmBcVXIdROSoWUkRBmS5
         dEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631137; x=1696235937;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
        b=T3CfWSZ9l13ux7lKJLehnDIMmZcXaKdZdJvCHCQglI+5xGhZOd7uvVgV1jiSvJt31U
         10WXUqtJmbEUZysifKpDwNtjJZ7tBRnbEeJn0C2OjH1Y+MUCnLxTv6cjvXcnG9h7wUMV
         A/PUmSY5+03Ex2qgIhIkidUdwRICqSQFkWQVARhpFRDL+Qr60Q+Lswe8lvE8r12rJURL
         fAX0ApHim69YRxjFDfCnwGfY3eFjsQPepHA0EnV0klZflVQdL8umCyBXR5qB81O98nr7
         n0S5a/wvhNF2yJX4j+idAliB8SNjnjLRfW8GSK2NjewDbVUjZ+uVl/h9gn+Qs0mX26QY
         y3sg==
X-Gm-Message-State: AOJu0Yz2fYNoImYG+wHRy9NKVWUlRb0yfr+vjphGXuRs+iXIwwt6Wp5n
	exfq9BII9W3uIV6DJ0qY/tengQ==
X-Google-Smtp-Source: AGHT+IGRzWUFKvAXUdW7P/gM1pTcDYhfc2VIx4gXPNUiXkY34HMjyU1m/YIX7/WbQhw3zmUkXjMlHQ==
X-Received: by 2002:a17:90a:2a4a:b0:26d:2bac:a0bb with SMTP id d10-20020a17090a2a4a00b0026d2baca0bbmr5300954pjg.6.1695631137400;
        Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Mon, 25 Sep 2023 16:38:45 +0800
Message-Id: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_013900_280418_F0DBED07 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
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

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682.

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 154 +++++++++++++++++-
 3 files changed, 155 insertions(+), 1 deletion(-)

-- 
2.17.1


