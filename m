Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAB8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1E8FaeEXOaFC0eCzbjnFP8K081LnYEvpyUI9em1l5vI=; b=kbm+ff0+BBIDtTcuYe7ZL1XHLl
	pgyZ3tgKvit8yD3chisH1e+kG+hohWdu0P0dyjteVK/o7YJjIGlHibbw6sM4wCfCy9DdzRmaU3nAL
	j0fLPXo+CMoFqJyTPOC+YlfvfWDpCcCe+ZGmV5y6QxnqK47PF1cmvE65BguHR2dNICohMbgIqEntt
	lo31FDaG/ypP9Z36aIXAXxVGEWxp+FnCDysXo3YExM8XLAE/h2eH4ep+KpVrrroMH9t5qBmWGrVsa
	SkbQ4rADPJVgxVIg85/HFLCwyLdo62yadRJ6CUOYkOVBd5WCCnH5C7kMhC42JTyXGuiZ/csFvsQ6O
	ua4ZTFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrc-0000000G3hz-11Q5;
	Tue, 30 Jan 2024 09:57:08 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrY-0000000G3eG-0IIC
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 09:57:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-290d59df3f0so2837086a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 01:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706608621; x=1707213421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1E8FaeEXOaFC0eCzbjnFP8K081LnYEvpyUI9em1l5vI=;
        b=ZQTCExP3uYO2mGRmpOr7QzRqokVHFU4dlJeydj9IKFf+NnEz7nZ2V3/qVnG4nvh0Tk
         a2HbE5MHfaH2oCTS5yUvrdBGVXlrMEjalMSCXCz8HT5RuhX7xEA3flxM/6XBxREA55Mu
         AU4E7ZOeaUiVD0iy796mYvfWV0cqxismEbGmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608621; x=1707213421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E8FaeEXOaFC0eCzbjnFP8K081LnYEvpyUI9em1l5vI=;
        b=HKhi5hmHARf5g2waFpTaAlt+ZDdOjGzvTEmI81brx1oCDdF0LmdNZYm4Du4hkac1RN
         K4jfyuxFvBA2fwIbc2ERJTCF/sY00fP4BiObL/D2T9bib2cOeHJ7BOs2N5CqzvWBR/A8
         FwZGt2WbqDyZq5X4ZxptUnjkfuLgNmwET4ix7XOag/UjVh7WNpupUJMipbZODU4YIefn
         OdDnFRJzPPGijKu2RuHyk9jp4F7fcr6IhOnjuraAPF/m00HLH5Vhk6xqvBGsIOyhLKEb
         bNIE984/3CAzQOjUa454qXU6R6g/pviMlg6zpruha9Q4/10/8S4aklB4WHQyS4f0Nx/O
         K3iw==
X-Gm-Message-State: AOJu0Yxi9tdcU795tJ97S2VMM6CRKolVBSXYcrHcjzc0ojLadblphZJX
	F1i5AyJNZTXaF8aYVpPZ+43E12gxUtfq4t5C8XJqIxqjYWq+4+egcyMTipk8VA==
X-Google-Smtp-Source: AGHT+IEhklyD2jX0T8w1fgxrasE/X8QO381avV5owsKZFBkH/q5N+2daMyJs0ABiAgETVQ3QeKrdRg==
X-Received: by 2002:a17:90a:6303:b0:28d:74eb:97c7 with SMTP id e3-20020a17090a630300b0028d74eb97c7mr5294648pjj.34.1706608620693;
        Tue, 30 Jan 2024 01:57:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:469:110f:d748:6896])
        by smtp.gmail.com with ESMTPSA id sm5-20020a17090b2e4500b0028ffea988a2sm8069810pjb.37.2024.01.30.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:57:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH 0/3] soc: mediatek: mtk-socinfo: Fixes and cleanup
Date: Tue, 30 Jan 2024 17:56:50 +0800
Message-ID: <20240130095656.3712469-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_015704_154005_BB519A66 
X-CRM114-Status: GOOD (  14.04  )
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

Hi,

The new mtk-socinfo driver has a double put of the nvmem device used to
read the socinfo data. While fixing it, I rewrote the read function to
make better use of the device node and device relationship.

Patch 1 rewrites the cell read function in the mtk-socinfo so that no
resource leaks happen, and device lookup is more efficient.

Sidenote: I think the cell read function could be reworked a bit more
to return different error codes for different failure modes.

Patch 2 adds an extra socinfo entry for MT8183. It seems that some units
have chips that have this one. At least mine does.

Patch 3 drops the custom nvmem device name from the mtk-efuse driver.
This was previously used for nvmem device lookup, but on MT8183 with
two efuses, one would fail to probe due to this. Since after patch 1
this is no longer used, we can just drop it.

Please merge. On the MT8183 ChromeOS devices this currently crashes.


Thanks
ChenYu


Chen-Yu Tsai (3):
  soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
  soc: mediatek: mtk-socinfo: Add extra entry for MT8183
  nvmem: mtk-efuse: Drop NVMEM device name

 drivers/nvmem/mtk-efuse.c          |  1 -
 drivers/soc/mediatek/mtk-socinfo.c | 17 +++++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog


