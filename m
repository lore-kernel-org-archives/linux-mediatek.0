Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B745C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 May 2024 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=; b=KusUJJ/mH07o+GEjuB+IX2teNH
	whzSsndmB1vxr7H/ENysi9lNDKe+DtVdMw9TNBVvF01Z8wMRwkxvqo8i5KM/PVJHaS0fo7WRe/0l0
	motq9XvR0IOGTWB7HJHHbFP9XN7y9+i8ouATUAIH1F56/NVCtChI+FLXEWlaKNTXYtg/5H6V7tE3h
	bKTUd6JJ6tmPiId8GrigvBOTQpnbNK5/OB7IFO2Oo3WBQEqin0F79vHxjL6R49LJmrE47NdMk5l08
	WY4hlmCXwPcgdht8dXLnuL4/VneL3uDa/vIdl77k1jQOmqCtW4bgo2D/+PJs8eCJ5d+rPoD56xGbW
	R+WCtUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3DXi-00000001sjm-3nVh;
	Sat, 04 May 2024 11:27:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3DXd-00000001siR-1zbs
	for linux-mediatek@lists.infradead.org;
	Sat, 04 May 2024 11:26:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so3322625e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 04 May 2024 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714822011; x=1715426811; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=oExoHGKxGokSDwRL/uIVpNuGXDAOHQ1Njyk+4O6DiH09D4Ff+cj+6eyAjvzJpPEsjV
         cbEjQusuFVOVQGqbIw6TrxKhejS06yBojGFE1zQybB3NLkfnZGnB6YzBRVUtq9DfwXKt
         fK1gmvYDRpv27Ony/bLbdtw/UpL1xCl26pbg2DwUqU3zuKE7emgOKao5KP56nhr0bGMO
         TBY1b9AzrxJ0E+Gttqb7m9GJLtm+NK7GrfY7zCpc2rWMDowce2amwjE6gHA29l5Jv2+B
         7AHbeuFGDw2I2Rf1jCWWXhegL50b96k9q+DsPMNFsXkLIhhZFIgu05c5KknsnTpTGghl
         9mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714822011; x=1715426811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=U0DYi8ZkkZ8OIEFAao6N8mDWWhiKO2XMHL9CW2uy6qvd/6tVrpod2GcaELrItR6pFB
         rs9R7MWi6xcyNdWFVEHkepisdZB52cZfGKdbrcfddSmTH2G96ISASbjFAzn5fReWNXp/
         HFMvZ2Cgstu8FeOxawjnVwoN5SHDPWbs10TBCqoRZbHjMZXajTfDiABhpgBAWgQutb0z
         3mK88HtT6thbeuPGQagpv1hBWoo7+o/zSNuxb94m1aNfo/HzGu3QmZz6iLcTq9UIcToJ
         po8k1lV5i5QFs+qyhMNK7aoX4045/d+Tjy+2kevJqzZHYTjS2nUkYJSYH+XdU7qCmEgF
         bp6g==
X-Forwarded-Encrypted: i=1; AJvYcCVKeWHkk5hs8cWbGr+B6Ma4wLaz1CHswRX+ZFXAgkSqOVIZQC7TkIIR8uhGJZpTMjPq2wrhezlZveJhJ9CspsN7xivDJv2iAaPt+Ue1BbUE3sYc
X-Gm-Message-State: AOJu0Yw3excEZJ98NGZB7fJKVvnLbOnMSe1v9C5tyhRuyvnHqIh8wKHx
	/oxlEU94ply/4D8Bv9yaEz+gST1ZA6U+b4xozZRPfA8ubjx2Hl202UHUm1K0b1g=
X-Google-Smtp-Source: AGHT+IE3ubSq/wuPsXCd+SyHjRU511lcaaoiLbDliJjNVBEkZCScLOt8UDgKVnn0wXxEtm0TJxiXFg==
X-Received: by 2002:a05:600c:4f52:b0:41b:7c07:cfeb with SMTP id m18-20020a05600c4f5200b0041b7c07cfebmr4493542wmq.40.1714822010816;
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b004186eb69a55sm8958487wmq.25.2024.05.04.04.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Date: Sat, 4 May 2024 14:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_042657_540032_79B20CA7 
X-CRM114-Status: GOOD (  10.27  )
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

Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
allocation failure it leads to a NULL dereference in the caller.

Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e281d28242dd..b8498772dba1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
 	if (!scp->share_buf) {
 		dev_err(dev, "Failed to allocate IPI share buffer\n");
+		ret = -ENOMEM;
 		goto release_dev_mem;
 	}
 
-- 
2.43.0


