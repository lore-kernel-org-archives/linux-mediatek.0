Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F730C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAWe64W2NwnFAQiXHeHZ8EMU8gr37Jq34GIw0wUlRAI=; b=zzUeHibBszDSwqCZrV+IKCQVn2
	lb7xo64wphu/ULCXybkZUjmpBb/5cBNccoOwhrmBgKuLO5r5z0jq/njrgGrcVUNwROXS4yXB7anIn
	dYSyFYvIwDwoxtUWdTWRJlbB1WrAICWq6NdM2JnQggD4c31uG9cA+s/D9/s/m7C09xhnADY/i6xgG
	5Lrb+R7voCzd0LZsRxu85RIIIklbhmbQXQQVnhXnZPderAuu3YQWP5rrkIGYnOhULbgLxdnZ5fE/w
	2fkr/PcOeGUvcMzo696FY+fK8uymo9rtdBgrGJu8+xb+gKYtEumSwMTHcvcDM1ZR5QsXgK0KRI5SR
	3lBz3V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrm-0000000G3n8-2XlK;
	Tue, 30 Jan 2024 09:57:18 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrZ-0000000G3fX-1HxY
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 09:57:06 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d8df2edd29so597343a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 01:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706608624; x=1707213424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAWe64W2NwnFAQiXHeHZ8EMU8gr37Jq34GIw0wUlRAI=;
        b=gFgipmO8N2vQH0hj7eN97zhGH8pUqwbWhaHqEOR5KPhEaQxkuw74V6P04eadmT62zv
         2v/lSmI6KdxvHE8n+mApSYlrog/UjWgFcDBRXCfGB3rTBL26BncKOfpAp5mygTTsKREf
         EfpmpXmwvxIV50+JctyYC6d3ctQxKoKHlgX/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608624; x=1707213424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAWe64W2NwnFAQiXHeHZ8EMU8gr37Jq34GIw0wUlRAI=;
        b=cXT8zrlWWfLp5WQ3D+fPD50M9e7/V81LUzWMO9YiZIm2B/3mfAM2CSvmQ0wV/JLAnB
         b+9LVjiWeAzOzbH5xHOVSPNu+rTKH9KX+6QzmceBNMkcBPAt85KP8b9HYjdGQ5xkPPWs
         Q3IRK1jfrODaWuZu7mOloaW4JeGS2Np617V52wjPEG6+T2xJNTJoLA18FIu7tRkK7mBj
         J9cY2a3zaRUZXvSsdJo3t0Bh/uYHNsuvRSH8oLLR0TYIolUCwPLSZJ7HyurbcwEx+DYo
         Hgjt2z95UMplJ7r4tcd5LDsHlpd9b5OAjYHFDV/hY3vH8JkrJH6I/nMnj4wt/OXUe8DY
         0SmQ==
X-Gm-Message-State: AOJu0YzxaSlPcrF7Djf0Dzik6+C1XqumJbeF5zWXroGooDF1NQfrKNOq
	p9mgioijmw1xDuhsrlD4CWFwCNym8AdlVMvCh2HypSuGU7E7T4JvJDR92BpWJw==
X-Google-Smtp-Source: AGHT+IFsG8Y80ah1dIgzlZvXYiG5Z2lLgwRHRKU6R8YE9ltRgG2UNVPQyVsusIsxO+y6QwQmac6yuA==
X-Received: by 2002:a05:6a20:2d0f:b0:19c:a389:dd6b with SMTP id g15-20020a056a202d0f00b0019ca389dd6bmr4272695pzl.20.1706608624676;
        Tue, 30 Jan 2024 01:57:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:469:110f:d748:6896])
        by smtp.gmail.com with ESMTPSA id sm5-20020a17090b2e4500b0028ffea988a2sm8069810pjb.37.2024.01.30.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:57:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH 2/3] soc: mediatek: mtk-socinfo: Add extra entry for MT8183
Date: Tue, 30 Jan 2024 17:56:52 +0800
Message-ID: <20240130095656.3712469-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240130095656.3712469-1-wenst@chromium.org>
References: <20240130095656.3712469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_015705_391388_A3FAE975 
X-CRM114-Status: GOOD (  10.29  )
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

The MT8183 has another socinfo match, with the second cell only
differing by one bit. Add it to the driver.

Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 3909d22062ce..42572e8c1520 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -45,6 +45,7 @@ static const char *cell_names[MAX_CELLS] = {"socinfo-data1", "socinfo-data2"};
 static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8173", "MT8173V/AC", "MT8173", 0x6CA20004, 0x10000000),
 	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000840),
+	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000940),
 	MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x81861001, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x81880000, 0x00000010),
-- 
2.43.0.429.g432eaa2c6b-goog


