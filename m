Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F60CD80BC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HgMFBZpZg4YAWv9hA928Akj5lifcYMHNCkpezYqKcvk=; b=RhDp0rNd4Aypv96ZbKP6dNWMH6
	EzKhjJuVvdKzFQsYpiUfnZHQEgihJW5ajeO99hoYmuWJxEKPXO5diN39ynYJebGfu2vxNH6exXHbF
	uuscoXLNXq2vT7lzpKDnSUB1DjXw9G/JWElrqSSGcpso+c2CG1ywYIxgNcySanhxWTm/IqkqFFsD+
	BVHIHim0Pbm3iRC1tnJxdNx05wDLHbxZUKAs5tPqZnWBMvGdunB6OgT8lDOBpeQxvPgiQBxH6UIaG
	JHRONBm+mEvLQXwbaPCFJaNG6H/5xk9njTRsc+sWpcbcom2afijBK+wXlQbBtV/D/1NiupX4M0jke
	l4I8oHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBiH-00DJqK-2n;
	Tue, 10 Oct 2023 12:19:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBiE-00DJoO-0I;
	Tue, 10 Oct 2023 12:19:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06E3366072E7;
	Tue, 10 Oct 2023 13:19:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696940384;
	bh=YFh6qAUpCGl4Tk3sMb7K34FQqqhAH7T1fXGALRzD3k0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZtH63OGKpty6eflEjW+Hc+DyiqtTtvDe+vaHEwIHH9UvKBXF2u9qRo1u7LVGPvm+4
	 okBCkmXNPGkAylmlpTOjydnze7Cmncqoo6unKdlJk70vJt9BTiKP9weIGJagqXlBBU
	 7QQjO5KhICVGQkRls9zJ/cx8pTmibuDPCm+GoQ7zBZ0NnnXNpa5SHocOnDMQSOxO3B
	 x5kW8VF+I0jJxII5gEC2UqLHMHerhzI8RkGxsbb8+sagZwHgfdJMuuzhpSOoVSJtpL
	 pSMavBFtR23l6Mxk5EyOfVT4JtAzCRQxg7aR/+eFEdTVRPsnuZ8+V40oKjF83C/irp
	 CC/I9CVrEZhsQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ruanjinjie@huawei.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] iio: adc: mt6577_auxadc: Fix kernel panic on suspend
Date: Tue, 10 Oct 2023 14:19:40 +0200
Message-ID: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_051946_254213_A5ABD75B 
X-CRM114-Status: UNSURE (   9.84  )
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

Commit a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
simplified the driver with devm hooks, but wrongly states that the
platform_set_drvdata(), platform_get_drvdata() are unused after the
simplification: the driver data is infact used in .suspend() and
.resume() PM callbacks, currently producing a kernel panic.

Reintroduce the call to platform_set_drvdata() in the probe function

Fixes: a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6577_auxadc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 370b84c2d0ba..3343b54e8e44 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -293,6 +293,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      MT6577_AUXADC_PDN_EN, 0);
 	mdelay(MT6577_AUXADC_POWER_READY_MS);
+	platform_set_drvdata(pdev, indio_dev);
 
 	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
 	if (ret)
-- 
2.42.0


