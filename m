Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34287CD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4I8phARquuRtcJ9dGFSKVepYNDlwt0kz9QDOiZ7JmM=; b=28EtnkkZW1HyrhBxLwRSMFRNjf
	SL1VsiWDHdaQZFdKRKT5OCCQNploCMauSEW0RUpfForMrKUG0Gz5tkXfop6OqjtWKYgOCLP9gfFEL
	0OrcelFNqJJ0t/q4RXPCnaYCy5E9WOxRk4vlhVeJ4UxX7rpkUeEaHENIyLQWXdPJ0x8OiycDQLbPX
	xEiRVPxF0Ff8xaHfNf2a09BySHrBk1WMW/OWesKGzdhI/MIYo4BO5cu888TbRFpBF5hvG94Fd2NEu
	7UwWOJcoqGKd4wr04RIiKSX1eiQbJiEz2vU/mJCb/bIeiIU3WLUaUmJJUCOeT1ZbCrH/er0pwIqrQ
	Ii6cBCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIGD-00000003lIx-3rXJ;
	Tue, 09 Apr 2024 20:40:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIGA-00000003lGm-0TUV
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 20:40:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41691fb4c8fso14312965e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712695199; x=1713299999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4I8phARquuRtcJ9dGFSKVepYNDlwt0kz9QDOiZ7JmM=;
        b=zoDdVKyDdtEU7bhqMg/3zH6hY27PyrAeEa+D4a/T2Gflm65RDMIDHd9uv9ksmExTzP
         ZhvkSLDCXSrGK1yk+mOKOrj4B82syEUM0oqYfzY9YUUF2RfrosaqJ/LO1DRG2MbJ5hKg
         1mHVrVU04yrxt4E8DMqW1vTeOEh7yCfU6fONZS97D4nuyjsc4FeA8dtHMC452fEk5miu
         XDyr5XusYp0u5nrSdKoW4hMzDD7CiEq9+Y3k2x8CF2PBl9WDzTHA6mqJxKEsTkYWg62L
         Fs5Rq8iYjknMVCBpZbKT2qmtZOCRm3ejjr80a29wHq0pUBiXm7B9imSH2KZAX420ADb4
         UuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712695199; x=1713299999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4I8phARquuRtcJ9dGFSKVepYNDlwt0kz9QDOiZ7JmM=;
        b=Yf5DA8Jfm8SPwP4GOoRuIH/SnOcHEtKVTiHDHOR+iQ8ToIvlA71gyxrbTEDqjDpJgx
         Yl0PBSvoHAowM6rNdLepltJLlfnMrJjqO2Jo1oZBZnaR/5JCkkal0pbdt2LaUPdHrA99
         XZaMcxVen2+TELFQfkKQhwhUOscer6EcmwFDPhYERzTOb0hlCSFtugyVNlNtbVv//cEm
         HKGqNjs3g8aCSsRjFqFEHtMh/O3qtBrGJeiMdz8tnDNNanGMJD7qUQzQyBVn5ruIZ/dD
         5f+k0nLeoaWh6OIjQ1TJ+VNSRLCpK14mHXNZtoJWU0O5yjKL++JcQi6cbxJipSfHAUFY
         td2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWyh130zxRePkj4ER+qGV+sIZgZb7aLZhC1F13vK+jWsvKvQXZpCqtwjzjXYeEfAaTzJYUHUzqnq2JEyNq3rFl9An58HE0jFAwvHetOyaYg6qA
X-Gm-Message-State: AOJu0YyiiNaYOLCVAKT5OG2cWGuDYr9mXPYNrZGzCQWhQuXoodux4rw4
	xT1Rvw7Z38qi+1YLo4SLqBX/t/EnoVkOxHmK5LYvKJd/h012qVe0e+9iZuyCoAk=
X-Google-Smtp-Source: AGHT+IGeDCGRn+eN+K867Alrf3EerOJpky7viAd5Dpu+DzEMbQjNs30y2mzbObgPmejllvI8RirF0g==
X-Received: by 2002:a05:600c:310c:b0:414:102f:27b8 with SMTP id g12-20020a05600c310c00b00414102f27b8mr515611wmo.32.1712695199233;
        Tue, 09 Apr 2024 13:39:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b00341ce80ea66sm12267111wrw.82.2024.04.09.13.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:39:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Will McVicker <willmcvicker@google.com>
Subject: [PATCH] scsi: ufs: mediatek: fix module autoloading
Date: Tue,  9 Apr 2024 22:39:54 +0200
Message-Id: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_134002_398284_25CF17BF 
X-CRM114-Status: UNSURE (   8.76  )
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

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.

Cc: Will McVicker <willmcvicker@google.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/host/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 0b0c923b1d7b..c4f997196c57 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -52,6 +52,7 @@ static const struct of_device_id ufs_mtk_of_match[] = {
 	{ .compatible = "mediatek,mt8183-ufshci" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
 
 /*
  * Details of UIC Errors
-- 
2.34.1


