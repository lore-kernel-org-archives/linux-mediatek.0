Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ABECCF9E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=; b=O0P0x438l1ut6awbOrg26Cj4pM
	pF3pmnoYz3DKMcGRMdeyXneZhCOC7Wy7A7eIDnlg5SOXl+EfqxpItAcHZ93P3xFMdO6E3pCkTc26f
	vmmdfiyxlmtQTYeCFo70N6Stuxr8njPzSWqGCYL4Tz8V1/0ruZjicdUkg3pegVlcTwBLQ4ag5RG0A
	nQVV7OzfcnENV4f1JYwsoq4Pkd6++Bnj3Msshdi7XlE8miVwnqyscQX5HZKgnc8wqJ79RtkOQiBtr
	HL9sVgOZEy0gz1BSS7iwAOty6o5jm3MKADP5a/wPcc4uTBS6bY1jz56GmMQwtuhOY/ZeSRfj5ISVV
	t3bM+iRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb5Z-000000054C4-07jx;
	Thu, 30 Oct 2025 22:25:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb5W-000000054Bp-0x53
	for linux-mediatek@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=; b=JEIyFgHKengqiu7HgOxNSXChn1
	xnFu5gDSkpe82cx+722l9H8sR5Ggde6nbuPdc+xwPhMOxnHjmwMRblcGik/H9b7riBjQJLEUYD8vU
	ExnyUgcKgf/6SYYRNOgdMQnTXta1aSXDy+o11Sr31DYEuDR0x6AW2qMCKjCF77Z+EJ5Hyzu2h6dRT
	Czd5likxDWLydbAE3BfMagM3tpAiGcGAlq0GyarxoraujsszTSsJ+RDL0ukfiPE8lkzSs3dk6gn5j
	FiYTG6FKC1EnWyfL6PX2aRCC01zKQrVLjw6jBOgLU/6OtYjR/t/ijUYS9/ugSlO6Cz3wVQ5gXsUWo
	vVbkTqJA==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaDj-0000000A7mn-3OTO
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Oct 2025 21:30:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso339745566b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Oct 2025 15:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761863140; x=1762467940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=;
        b=sLkgWLl34kevPuRJK2qq7LdinijiHQ/f3rzl/HyCC64jlPIBAswD2jaj7Asnf7esZd
         pDzQyCmWMfnM9FWLPIR0sXYsIo8kZWc3ICBqgUek2FELs4grwIrARgdQTMEbtJONSH8m
         CUt93px78GgaWcAOSmVhWz/byhn0lCPtszB8kAe7+nyEUZQL2wCpOP2Pq2973N2aUcbC
         Vj34hhzs43W2svmG/nKZ85n3Hq99H7S4GUyntL9xgia3wDeryXhvNgyxrqIlCwkMPb5L
         T7bSxTMsRo3ph/qfFZjy3Ij7ZyAwYUlujHlkGlwK3eVGQFU3SkOoN679c+XCkPj6PXXQ
         Pq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761863140; x=1762467940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=;
        b=r1P8xYiw0MDcq44//R8I2nahAiRQ30AhhbKKKYGVKRdNM7AN8WMEkXU1gJrnZ5ePSV
         gIKxV5v2Y/09fwLmOFsQmTGOEPw4KcdxzlymLI/p6hUQjaYlbraTegvRb3FyiT9vSlwc
         ViIOr/jHGY9V5BPZ+J5E8YTWBQRnDhEGrzc2gbN/pL0vSDduAvIrHi5nKvsN6CIjxauQ
         cjYt/Fje+6ajwzYGW4gMt3CPgN6NN0HkgH0B61nsR1B20spu3beTEKo65ZSmPBqnCzhn
         hLzAISWIy1xicc6h3yy3Ahlsdm7WS5sH1DpxlwaHj6U44iipOT0cqGISvP+p9HNoj/Lk
         pmXw==
X-Forwarded-Encrypted: i=1; AJvYcCVlUc2+I/cMYfiKivzq9MPpArAfhctGAdnIQhzNv+lgE7BMMQOTkMuws7p/tDwK9YhLXds44Ld+dBkvQ9m1Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCBrP3qYaNvWUleefFTTSsp/VTe/8kuNaHif5QRjv22mffCS8u
	mm8ZKVRVPrz3zKcn8/5CxtOyOCF4JclRhC/mj22pHpqZFblseigI0QvFJP+jK2MD7Hg=
X-Gm-Gg: ASbGncsQ8+3uD1bedmspFhJ6sdS9CnG4+MeyVpyAPO0CD9tQz8ypfBK+64xZxs259Q+
	9aFXX3mtecpegSlucwGevawOkSmvmRFp7bH3SUThV4MoP6aChvRo+dhfvBBRUmn6OzflQSQ6vDQ
	7kf0qdrr/cp6CjhtKjQbA3q312EcItsSL5ULOIFaDY0OHzhRdLehRcxVMNtw7bIHmtZ/fsKEo9L
	TbQRAVKbeQYSVf84YbZBJPGItWu9W5kd0UCEKCP+7GWu8odaIMFQPUm8eU/QgXowv95EFv/m8EB
	x7uyz+QpJ8Jth8R2p6fm6+xax4RL+0lDFrXdckahtBv2SC+3XVCNgSAjv3WhBCdkVk3Or52304B
	zfqZ2DfapAnuPTXbC6aLm27bGcknCjIbWplRNdtAtItvowoe4MBXGADtFfwgNqhjNmiqvN6x2vi
	vTlfbZKQ==
X-Google-Smtp-Source: AGHT+IF5SUMEmxJ7sHz5EU26ysWE5fSSIeUi/liwYBUEkNzqfcfYDxvn9nhf0+F8pjiFc45fRSt38g==
X-Received: by 2002:a17:907:806:b0:b3b:82ee:def9 with SMTP id a640c23a62f3a-b707083054emr117347566b.53.1761863140409;
        Thu, 30 Oct 2025 15:25:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7044d00de6sm579859366b.74.2025.10.30.15.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:25:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Julia Lawall <julia.lawall@inria.fr>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pwm: mediatek: Make use of struct_size macro
Date: Thu, 30 Oct 2025 23:25:27 +0100
Message-ID: <20251030222528.632836-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=SYIUerC/xexWng8EppMsWh0BUF/Bl5ux1CEatheccIw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpA+XYSVrbXsDagZh1G/OShMN8OLLSgCz++eV/0 4cjDcAPTWqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaQPl2AAKCRCPgPtYfRL+ TqUZB/9yusSl/guKODh4FsI0I+VSKcrmxssTgz9GdsZBh4o+ADFSw6swjRwKMmGEQovx/evZ0n2 ckY5v3yWkiu4td18CXVksMoUPZNhz/DFtmyjkx6IezcMEYhEeNv39mSbfDVy6r+YvKDZYDZF93c BtFVfvL2givWJwEOF1ZEoOPuy5Zej30p40lSSb+x+NUOy1IaQXsa2olJHZIfQe9ZoTZAsjClru6 fA89b6jO2Kw0Z9sFzSzihGGyH39655BbMp9d1BKhMArWNy8ANoWx7MvU/88ZBgIb+6ZuKNvKMlc lPEZp4uWp/Pt4LHbAgl3TnIZw+BVLw/FrcunXV613rpsopxj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_213012_080320_56724334 
X-CRM114-Status: GOOD (  12.37  )
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

struct_size provides the size of a struct with a flexible array member.
Use that instead of open-coding it (with less checks than the global
macro).

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202510301753.iqGmTwae-lkp@intel.com/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4291072a13a7..d09f2eb4fb24 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -377,7 +377,7 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	soc = of_device_get_match_data(&pdev->dev);
 
 	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
-				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
+				  struct_size(pc, clk_pwms, soc->num_pwms));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	pc = to_pwm_mediatek_chip(chip);

base-commit: 27a8bb33b660614184b9382c146afd2ebfd7d7b7
-- 
2.47.3


