Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF9FCE7A8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=; b=kTezqG1jBohFuagSf+d9PF6kOc
	4jPPW5Fnu/6AtcWpvsSY+R141ypoGRPhul80R4eDklqjDdhPGEuWgHBI6VQ0CDhxtmVBKnNIl/eEV
	QN1R6qOIn88Ei50+s9cPKmWvRaNXkX5uqCX4H71927hCXSmsV7QpZ4dEhC5T51kOunavI2N5h7igK
	8PhtkVtTbP9ucmx3Vc1Y0POTX93WP4tqDdksHuUxh5luTcbmvUB5FtoEeWgpaBVOL9s8Bb6iLT7JH
	ufSoknrfeyx4S9uRDeY2BtaC4AnPu7VagHeQ7kuFCh8kkT2f02cdcquWatyLahFGW//I+uEHdvyQx
	4ScytbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7Y-00DkuC-0U;
	Mon, 25 Sep 2023 08:39:12 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7V-00DktC-1O
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:39:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-564af0ac494so3638559a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1695631148; x=1696235948; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
        b=qg5l5oe/qJ2CyxWaPSyjiU9bT1TFYu7k8En0aAcGRW5wGOFWQpbVc2WHX0JctrrIMM
         OcketHkj2tWpgVBGNSMVNi4szYU5UJq/Amrz3VMhcfj43rX2J5BhdtBInD3CSkwGVlUw
         HY7JlC3kArcdlYcQ1yn3GIRmunMjQDCl9myk72U6AdBb4TVaGCCNUORYW5QVQGJGD5Fy
         pSHwBR+GkUS/R8DL5zeEULJhaTIsxYZDEWLK+4GcZhKc1RMwP6Hcd8S5f1HRW0lfeum9
         crzO2mI7VuKmn2NjVz7WYYU1PeItm/32WrT2YO7XdLvmk/Hc7UXfEu0/A5ynWhcv9spm
         qIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631148; x=1696235948;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
        b=K4NzaKRfS2QBDeIF2hnpBN1sFKTzA1c1xfw/ayZRXtiRLcWfQ635uX9M2KR1dbS3D/
         vh9WIKsGdu7+QOciMVd8Cqa+JDAUJioO6tSPmVoRrjZps4QhENQjQlhLsfBw/0M3dqWP
         roLy/Fqal3RuLeay2hjlDU1i6Cmr9FwM5qfZ671cgJHeNiwh+rkcEx8RSuNoC2cxe04A
         zDji1KuigIBecsDOyF1b4PDZzh7BPOcnlugGfNt9jmc2Ket0SeIDchXleV1QNz5nXmHR
         ar713AAtpT6fGSX+x2+JkEqYnqVp7FtjvqOce0qlGsqR6RU7zgK85RfvLAW9eAC4tkYl
         gvYw==
X-Gm-Message-State: AOJu0YxT6aBj/w522fLA7bK9gl/431M+6yelje1s0dWhkwE/ymOEDsSS
	oy7zfoHp9hUnEe8jjjdkHSJ7FQ==
X-Google-Smtp-Source: AGHT+IHx3J5ySfw9Wuxosg5Z6sG1PprCJbEmmIZOATHNOQ864gnhC7D7+VS5LClGiArL8V2tqHkKDQ==
X-Received: by 2002:a17:90a:e50c:b0:274:1bb1:415a with SMTP id t12-20020a17090ae50c00b002741bb1415amr3509215pjy.41.1695631147932;
        Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
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
Subject: [v1 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
Date: Mon, 25 Sep 2023 16:38:46 +0800
Message-Id: <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_013909_468149_6EC2F6AF 
X-CRM114-Status: UNSURE (   7.49  )
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

Add compatible string "mediatek,mt8188-rt5682" to support new board
with rt5682s codec.
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..92da36137270 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682
 
   audio-routing:
     description:
-- 
2.17.1


