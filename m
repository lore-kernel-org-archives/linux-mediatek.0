Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF06CEB2CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 22:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xszBDXhCdb0aB17XDm2OeZTEXlfiZ1uBmMn3tuJfbM=; b=Alu/yBsF8l7K1kRCxJy0W09Ul3
	Btc/jKWuasZQ+XbA93tG4l8mF1bzwyHZnRzPvtuAXZhXg3jNCdO4gB6sJHGDY+YTQAfJ3jiuccXm5
	7o3n9eagmz1M4d+2B4zFcJtOLrxuNi0GQtdOWMW9AgYWhvVH7FzuCnEV4DdMXWK9KkQt8SlrnIiEp
	YsJItS1VxJCB1lmnOj231OMeF3gqJ/bj2O+cKflwULtqOICX8cOAr54MsdukrOqWAN2cnKifSWsSc
	HrV6JYVBL8g0GNynJoq5sd3WrR/CUmcQFXym3m2O6AauDtLMS8PX/wmHUqwl+M7tOfgL4KSi3WAQt
	5xyuokJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPEK-000000014AA-2qrK;
	Mon, 30 Sep 2024 22:51:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPCk-000000013jT-43kP;
	Mon, 30 Sep 2024 22:49:24 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso1361926a12.0;
        Mon, 30 Sep 2024 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727736562; x=1728341362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xszBDXhCdb0aB17XDm2OeZTEXlfiZ1uBmMn3tuJfbM=;
        b=Hw0PBMmzd5hrHi5QLxJSA5tJJ0w2owEaXbIvg8d9NcqE6LnLskx/Gb+rGXQBQnoDPq
         VzbYmg5s9Llj8QTAWGekaSKnsw3NJ6cMgDV1JR2NxLb+e5+ebJ4liWFdyGJJBYz8Mhu8
         MTwMglVpcpZsUlr9MikVEGR7qTGf+UfZDKz5lbB3skBOOdFyQPgJdobfmhzOY8N/U6sm
         CCj4orOwT8ubBqaIVDVmKfguWOXoU64sKHHyBrj2ikmE+jlkxZp9mAe+tFO6IcPrAsFo
         iKsecfMqZwe5M5btxiQYHEPJdB2v5+qIFt8Z2P/Xc4LnqZS+HTdkCTbHGZHgOo20xLMj
         jfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736562; x=1728341362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xszBDXhCdb0aB17XDm2OeZTEXlfiZ1uBmMn3tuJfbM=;
        b=aDG7oNKynnAFCsxnftB8+mIyO9softZuWgKwoXWBQRU0vG+1gKVkonuMupJAPGe4iG
         BMoPDq2gpdzU+HU0bKvpoXsKnN6BSN3hlEFzF4EgLJDyDw7AMRY2vaFu6mTTs2xPpwCr
         wq1RM+07/tZK3XNb2NNA+DAkbYmaACaAaVTegteU8DzzASnelMixgy6ujVwY7hcO8YiC
         QiNqJJshrp8N/GWe0KqYlnm8Ja93B2ceaNalWZ4OpDi9cBzPkzhZXE2ItzSMrJ6ALfp7
         COp2BkQIJIACglo5Dhev4slLsdRNagQagHm2cNFkmi5gBLvTNHXo+r9pbjkis8Sdhpiw
         qIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyxokV+FZ1tj0iTxN1Z7TmQMzc8aQmqhq4BqaOKrJ1//5ILIL3GxOx4HWOM4f/oHt1YkVV05+SWSlDXxKvqIs=@lists.infradead.org, AJvYcCWY3ieHUodp41F0nEnQ1WudNVIfdXrcUFWbHiFnQEdOe9T4VLEPYKa3Llcfi7QayZFAiwN87w0vo2/fK/h2XjtU@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEi0X3T+NyviCEqjyxSJkx9xpK5hY/0LzYndDWvzIKOV6X+/8
	Jfi4aSauXFxPlV+slqvOLaNDQQ82NtBraxDhqcxQXJMb19mIbaum
X-Google-Smtp-Source: AGHT+IEf4AX2/OJSd2OKQmIQAQNVzsNBaD7ptWjOXjS3029g3K4oYPIoj4Pii6mnziS2Ebog8LIKTg==
X-Received: by 2002:a05:6a20:d805:b0:1cf:4d4e:532b with SMTP id adf61e73a8af0-1d4fa806e2dmr18891455637.43.1727736561727;
        Mon, 30 Sep 2024 15:49:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b391bsm7029528a12.22.2024.09.30.15.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:49:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/3] mmc: mtk-sd: add some devm
Date: Mon, 30 Sep 2024 15:49:16 -0700
Message-ID: <20240930224919.355359-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_154923_036040_725BEEF5 
X-CRM114-Status: UNSURE (   6.36  )
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

Simplifies the code. Also a bugfix with devm_clk_get_optional.

Rosen Penev (3):
  mmc: mtk-sd: use devm_mmc_alloc_host
  mmc: mtd-sd: use devm_platform_ioremap_resource
  mmc: mtk-sd: fix devm_clk_get_optional usage

 drivers/mmc/host/mtk-sd.c | 70 ++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 45 deletions(-)

-- 
2.46.2


