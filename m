Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C9FC624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=; b=kle4GV4jdKjs4pzXsNyCADmDR7
	7+8qebTso28O+ATyrBZ9ZKKcBmxluS/g1AIRnUnCCbAwzcx4iaPME/KIu4naISGQZ6E+6azAu1XfU
	znihnpLpQR81rrIsgZoubrw5SZVQP/gNOFwegCDeE+bxHoSzV2bCw0VeCw6oq5a3f/CN+spV2mwQZ
	MoKONs98QIbLC9IzvKpRGsTLpaXPFYVlm4S+8DJulPp7ivBPhoxeF0sP7ny+v3efm8RYXq18ixIpr
	QchsqMP67U8g3QgZrzUMBGzzoE2Jwx/bkvDw8rfvkYvYLPTUQLOvpW3gpcBrp7DDqkTbDDt4MRtlv
	anD5+JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WCb-00000002a7y-0idr;
	Fri, 04 Sep 2026 15:51:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WCZ-00000002a77-2G6j
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 15:51:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc149372c14so660464a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788537098; x=1789141898; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=HcfxoytA1yNP6zg62urS431Tr6TEfefli7XB27dsWrfgAGVYLliy+9QiRqORsb8eSi
         ca4OyjsglkbZPaSBMgEGEEw8O+rgdaY0cy6vt84lgQbWu+4lsy+L6H+BRLk67troIWkr
         M67F8n80e+eisNY2WpSjXfxxAkKMJT2v0nVRq2/tpNbSYz3BWZkKYP+234E0zPCXonAE
         vTHGFXANq6yHxlr8Gi5o2TRSDLlgZ3Cu7nwHZcMEVO20eW7pkgbaEWl8WmWkFA4YKwQA
         QgbibRjjTPxXeLjRXEaoMmpV1TEAXbQjF62lseax8UFWzUFP6gY8VUgy/g8/2AWe75a9
         891w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537098; x=1789141898;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=q035W55L612oozxRBHfHHJ79aeqv/y1LNRXjmlcGFF7ck1MW7n6SuQJXYsATWLsOa0
         r2Co6D3hW/+ZjrTF8hFDaH0HANCY4fI14zF/Dsr6BQJ5ReWNr5PcvfNPtwziHNbq8UZ4
         Pbfkp7P0Cd9op024+ZeSkdGgZ9jthal0d/Df/j71RCLCU4E5myUsMrSYduCOXaU3IVbB
         hW0U6kv/unOff9bkDgzZQfDncJLW5L4hvTyfkYV2Uk4+S3FUENjjtee9YI+v0XFMJHbG
         3ptg+QojKh3SuN7Rh0f8b8z/WomfQ9EeHezl/thrWfuwvZsb90zTjAgB5sPnw8RzDcYA
         Uvdw==
X-Forwarded-Encrypted: i=1; AKwUvBy3hXQgB2hX9k+OzUwdxAeFQLYnssaxQmEFH+fxnXELy7iJp15PpqqoGo45gnBbDJfzMHNCv3zBzoxxBIhdig==@lists.infradead.org
X-Gm-Message-State: AFuF++lRcfkyC9yFVl5B7CMmjWgy5tTD/erPR0V4OqdPuT5mXwOcv5et
	UcCeZnTk1eHr0KICpyw7jGwW0jDTN/go35+vfmLZH+OxqleIBXrH9nd4
X-Gm-Gg: AYBFou0QNuAErZbdf1JJEl3irXsYF6VZoLgwEFtTRxGrZ81TE+UR1FBhFu3IqT2dRqH
	TG1SizrWl2514Q7dko5f0SP8osumuyFP314FEyI7Rb3JQrXa75iVgabFgzXc+ujJBhm4tJyOB4M
	oMetXrdHP8F5yJ65ZY5RpBluqcwrTqMZNHpI3EWmzQYN0dNIXtMMSkbTUK12gR/iVMVTnQCuLMG
	6QbMQW4dSBwl4voj7ilttdC/aygxC+HarEvtFqCE1tG+KcMjVfM012y9Eb5mjyLPhicwef6Vpuu
	0Z9Ebq2fRRGs4oGkLOHI+wDsEH+htpRUMFL+HwOSWV8KG3GpIH1CJdZKVRyXBWjK0uZVrpEwDA5
	0wkMgcE1IxAVwkuXtUDrYT0Rn5yaHjtd5+2+LQMlNDH9xrRUgw10XxpPme0A1rOntml2sBnhIan
	GqMSyYwvELDO9ClTO52SalDqS/8ujhd+BstF7ingQGPGaqL/ueMRfi20Q0d/Ve0lbY4ol5hO106
	HNDsp+YeqSaKiR4HqlKHD+KgaLok76NsVx2DXlTl2VcH97E+EcqjEtS
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr11311044a91.24.1788537097799;
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm11390320a91.1.2026.09.04.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 04 Sep 2026 23:51:29 +0800
Subject: [PATCH] spi: mtk-nor: fix runtime PM usage count leak in probe
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mtk-nor-v1-1-cefdca098f83@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubY6pDVeRS6YMw4ZbSMl7264/
 NX/+y7w5Jg8VMkFjg72vNqILE1Aj60dSHAfDTnmEkssxBJmYVcnENGYUndKSQOx3hwZPr+nuvn
 t924iHd453PcDww0MN2sAAAA=
X-Change-ID: 20260904-mtk-nor-000ff9cb886f
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537093; l=1008;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=fC8E2y6Z5Q/OrCnge+02KY1tB0zJIUqzvl0v1HTFuJY=;
 b=Hjljg0NeZLG5gJIKscFNfsTfPBNzmXNZzZZdjt+VFCksVrkMrlsQ8WNQBjn0I6eayViNdBFXR
 nC28js6qxURAaeHZi6f0vbvRDNT3CXLfJnL8bkidZcn+YRJwCce1Rff
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085139_587512_3407F23B 
X-CRM114-Status: UNSURE (   9.35  )
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

mtk_nor_probe() takes a runtime PM reference with
pm_runtime_get_noresume() before registering the controller, but the
error path never drops it.

Balance the get with pm_runtime_put_noidle() in the error path.

Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 63f5139176c8..6b6e55d68048 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -929,6 +929,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	return 0;
 
 err_probe:
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260904-mtk-nor-000ff9cb886f

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


