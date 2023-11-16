Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90186C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnEQrCoyRfCu2hu/S6XLLItLSdjRXFMjj6pmOE+hngo=; b=iEyZBZUsZwKFq80LF8oX9KzpJc
	3eiXEXxrEEWTLyxjIwBWjHDlNZnHqHN8wPlavKy9mL6fuJxgIjL/WzXgYN10tIgaMszaxXRgjR5kb
	6VdlN1pV7mOLkPE/LUeGto8EBBSrlqYSpGkFf1D21faj2BofdnXV7rRDDS1YdNCs8+k4rpJYpb8sO
	8G7GRJSOyHDE/o3CqZZ2qH0evFRcpyOKtDYXZOUtJH7ccW5YdHDFTlBiFNbVUNTnsX2KodJKAkzEw
	og5bmRmZZKn3lKBG+S0g2vYTMVMQ7FH6PB9kCwJAOASX19WsDs9NMrgASzjwT0VBsygoX/RI62f8a
	5RJ1NRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqO-002l1K-0Y;
	Thu, 16 Nov 2023 07:31:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqK-002kzn-39
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 07:31:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ce1603f5cdso4696685ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 23:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700119874; x=1700724674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnEQrCoyRfCu2hu/S6XLLItLSdjRXFMjj6pmOE+hngo=;
        b=h5d6uV19WwaUWNX9R1dhmwLmBuKfmFf34TtvEZpPZ62r+xdP9GT810qMc4JBHjDSHg
         D1QG+q7Pmn0fBf0tl8Ggjl7CvOG2GoIOdc/g9IxU4pVQOaAlRAkQRVr23dYKBlz2G17R
         nC8wQiCmlJXhVyZe6rNYoZ5rw3XJcbpPEJmCUAALKAq9lhBvPonq9s8c4EETET/+F2J7
         BhmkyezGW/fVkZ10rXRiZYFpNmXE21whhQdGM5JPaMidjWa6/OIIHmWbv/NJY+HQ5FGa
         3hcQ94Sx2bzucsTP/jGsPgVH83DNocUGKNF3K9VT7ef+ZnQJHQeqJBc/tGWvf7h2WpkG
         hdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700119874; x=1700724674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnEQrCoyRfCu2hu/S6XLLItLSdjRXFMjj6pmOE+hngo=;
        b=Hx8j6GTQpD4vS9USJ/BW9/h9laSxomQ8c4whe7akhIj9M0xrukjTP0e85CJae0TfC/
         zBazoZnvcytUUe92FitQYqKAMoomFLVwBYIaBc+UwsUL68dZhAksD/oM/HcbytXRa/Le
         KApkbXUmLkkknfoMFbIzg95x40p8p/Jm7JA0j29emQTQiQWy+9wNhu3XWUodbewLaQhs
         jZy5YXfh5xPhz9NVXF4tvitDeAIWjaz8eQJu7BNLthSso88ZBU1L/ck7565AfP5HpEcm
         Yp0pTc1Y1W5lwzSGMpQGysAL1Sbs8ZOIEknFvIAdJELk5od594bZ3GWZgtOVimG0B//0
         Rr4w==
X-Gm-Message-State: AOJu0Yy6RCsfnkIVbYY8qjAwjYSWPJgLwuz8FJAwZ5+z5wHmmyfj0s2O
	FCHRB0It3gWAHdgJ7bFvS/2HTw==
X-Google-Smtp-Source: AGHT+IGcK0oerhHWyXCpFiARKu31tBvM1A/MXvDWX9A83CgHg0U9ndFBJ94zDQLqujCo7dJJ6IU5xA==
X-Received: by 2002:a17:902:ecc8:b0:1cc:4cf7:2f5 with SMTP id a8-20020a170902ecc800b001cc4cf702f5mr9811940plh.35.1700119873860;
        Wed, 15 Nov 2023 23:31:13 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db8600b001c0a414695bsm8496706pld.43.2023.11.15.23.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:31:13 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v6 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Thu, 16 Nov 2023 15:31:02 +0800
Message-Id: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_233117_211450_E99F68D6 
X-CRM114-Status: UNSURE (   6.94  )
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

Add dt-bindings for es8326 and codec es8326 support. 
Remove duplicate code, commonize headset codec init/exit API.
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v6:
- PATCH 2/4: add a patch, commonize headset codec init/exit API
- PATCH 3/4: Remove generalized code
- Link to v3: https://lore.kernel.org/all/20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v4: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 2/3: Change the names of some apis
- PATCH 3/3: Change commit description
- Link to v3: https://lore.kernel.org/all/20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/


Rui Zhou (4):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 117 ++++++++----------
 3 files changed, 56 insertions(+), 63 deletions(-)

-- 
2.25.1


