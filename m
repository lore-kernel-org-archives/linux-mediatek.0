Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65786CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UU8vhdLUhYxlnnYBEzixYEgfIvwEt4jjeyXiSasM6l8=; b=KTj1ysSzRcAgp0Irfa+dglPDCP
	3qmZ4hGdy2ihDY4Ls/f5OiPTMCM2/9HwgTS1pWfDNfxZskWaOV9g0FUVmDLI43JA5Xv/9rDnDUHsB
	liCvEsth853EV6+L2ZicauJg6G6cdQ7QacUBYZP+Q33xIOP7vyPy+fjZ8aSo4M7Q0lpT3verXSJRO
	mg3xQnC+M1NCKlSW/kCh04hEnSU+1mhIwcXyL5mduk86QtVNmRqTCTSot7r35xQ8BvhfQWOpYM0nt
	ziOnkAAIwEHlCfytgDCfEN6wsP1awhlvNPVXQ7akyWP8/ic6DscBIqeauMf5OWbwIa5FqFzll+/K5
	VAjSJ20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsR-00Gtwn-26;
	Thu, 19 Oct 2023 10:03:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsN-00Gtv4-2k
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 10:03:37 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5ae99bb5ccdso3284834a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697709810; x=1698314610; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU8vhdLUhYxlnnYBEzixYEgfIvwEt4jjeyXiSasM6l8=;
        b=C++a36suRzExSE75i/d7TZyMwfl05B4UNsNtP33asNLfrM4U5fadwtc1RTlQFNASE2
         RGOPZWN5VfBfdRP4XTScyx6vTANzhv7eVn6ITY2L+aUJR0wcQxiUrWwuLqSgG5BzuFe/
         J3yytQyT7rVfb8odX0z4YgVm4+gDiGDZV3JshdHR0uUfR++ossybz191rG47iqeEdB+p
         hSqQVRhhSUO8uXFRJq3OqC/Xw7PjiCIsqll2m4VErXf+i78qC+O9eUUGXKgCuD52sQ8G
         7l+fjZM3RMe6JbMv5oCA0DLv+1oZGI9SZcZm/T1ZHxdN3inz+79iHXCgYFrFKGSNp/pW
         Kd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709810; x=1698314610;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU8vhdLUhYxlnnYBEzixYEgfIvwEt4jjeyXiSasM6l8=;
        b=o0Tr+Gv+pNGZ1sb7aN9fXGtQwQ/4gSedisMIAvpX6EfiJ429geK+ETHeMvcXfeFL6O
         uKdiJNneSBdeslpNUO4p7MSRO6ASNaanD8YjtmfIjI1KEqwjE9blp5X2dFlD0syXn2wU
         AFi4bBOAbMZT7+yvJ9Plcq8/JCQRCXQZmWSEUQrIlUZBRo4meE5KaLANogp1YYroDqhM
         nCRcZea8V+QF54dzIbDRIWx0zTg42p+WCK5n1SGj9Z48PR1Xye98LMB2ZMhv23/Kej4d
         GmoISCtdeRvRyjf2tLVFePTudsc7nVD7bC5khI0j5RiD8HzdAyx6Y84CcY6RdCE3isv5
         VoVw==
X-Gm-Message-State: AOJu0YzMCmG/yZUmKa2VR6AOiStbRmBrpLp0RFj445b6Ph56A8ZpzLzE
	j+uiUYw0rtDrhgdlOR2uBeSexg==
X-Google-Smtp-Source: AGHT+IEeGCaPrMRLEd/eYvzO7rYsrCN4rtp0TdL8fRpUOBjF1tKZHCq9s97A9r8OreSdHjdDgpaw+w==
X-Received: by 2002:a05:6a21:1ca4:b0:17a:e79c:c5ab with SMTP id sf36-20020a056a211ca400b0017ae79cc5abmr1340158pzb.48.1697709809581;
        Thu, 19 Oct 2023 03:03:29 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:29 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
Date: Thu, 19 Oct 2023 18:03:20 +0800
Message-Id: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_030336_287941_BE67AD3E 
X-CRM114-Status: UNSURE (   6.83  )
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

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

Changes in v2:
- PATCH 2/2: Modify the code format in line 1058
- Link to v1: https://lore.kernel.org/all/54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com/
              https://lore.kernel.org/all/8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
  ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 44 ++++++++++++++++++-
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.17.1


