Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5CZuOCvf3xX4eWqYf0AKd3bu8j7/y4TTCc7Lt6IemEY=; b=ssgnPgVdHrliy/
	H19VFWi25ZVCfuRZEQYOP0HFYL2x6sYGmbX3YWyDYddMU9zCyvkol4nDLp5GynEFD5InC0SSbN7PV
	oeksWdwjLdJM7diETMzKAuRJb9Jmvg/k77nH2M4EI1devn6VbTgR2sFXxRlKhz5xvQeFdFND1CNis
	mdfyULjMc8vPnTGsnnPN+YLJhMmjc6JAwdtsQo3Kb1g0xbaijralVn2gHK4V7BNPchDhmMhGtOPTo
	UguuPxxYvrs4d/QVSzZsJDzu/HScGmBpQnfj45yaFLwjKglbVuopkUVUNxIGF6VGg2bSXlp1FPdjA
	WdnMym/IGeDqGBViQU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC2w0-004ADr-Bj; Mon, 24 Jan 2022 17:15:16 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC2vx-004AC5-1r
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 17:15:14 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4JjGnr0BSJz9w6RF
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGwoevqpEDPy for <linux-mediatek@lists.infradead.org>;
 Mon, 24 Jan 2022 11:15:11 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4JjGnq5K3Dz9w6RH
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 11:15:10 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4JjGnq5K3Dz9w6RH
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4JjGnq5K3Dz9w6RH
Received: by mail-pl1-f200.google.com with SMTP id
 p17-20020a170903249100b0014af06caa65so3656504plw.6
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=390Z369C1NgAVDfHVFd06GPqJvUJJ6Covz6dC4YZpPs=;
 b=bImcnXy8fZy7F4dnGzUsw02MV9/8DVIGzU96NqOUAJi+y0l/xzshbFH+OUYSHiuoWM
 b9TwMoxjDBZjPQkqJ8p0HknNru4OYBFFbF7CmZ4ZRKIzBkSlX40S1pG7eEMu2lcBJF01
 b+/yhpSulOi4tu6iTtBtXdWdnHCpCWziYn876IfwP2dGmmKLI2ANAdUeVC7SIQRk4zO9
 9MZ5jaWkVw/OuhErY6Pve9OTyAufrUuaOC/89woviuBHLIkM6P4BLOaxrIvY+3rWWS1B
 GPdm5BRDlQnlelJ6RAIEDHiP+bweofWbwrFc0cFBAspGEf8dE0nfzw6kdKCpYRlF44AA
 I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=390Z369C1NgAVDfHVFd06GPqJvUJJ6Covz6dC4YZpPs=;
 b=dAZzowsVdHESumGun9XPe/KDBsIfhNymctH8Nn/jqyEtBHp7/kiQJDnfP8mIJS6YtO
 CpKqTqnpS2h86ZOi6xOC8/Bs2fibYEN0kALveVMgw5lw0zewdG3IRWAW+7CxIiFWvkls
 ApQW1O6rFR25rutasQKkoZRc9GcCrSTpBkOSigJUGyyB2XsjUqH3yNTXJu47ageeP+dB
 JCfLjjqEhzDFdFpJMa1W1AMMWwwQR4L1e85wF10IIYN8og67h+ilnluwBLwhYlRX0OBH
 /JF+9AtgvTFmpmknmkOYc5Xoj9qW/0K5qQBDhaaD2ocyWagtFFyEaPkUm+jZwhcJTG4x
 cLGQ==
X-Gm-Message-State: AOAM532daXUssY3X5P8GxNRjwWR4PQm0QLRDod5ppBrSM3nwgvLcc6j/
 K71ekN6apNEnmOi+0XfyoLj1fuAWaE54ivD0GGpXtC/bMb0+ZhCi5VdjJL7yZ7bcq8+JJUTN2uv
 sxM68RhTdnG/UhUKI889LsCpa3Kaev8qjs4HO
X-Received: by 2002:a62:e210:0:b0:4c9:1cff:15cc with SMTP id
 a16-20020a62e210000000b004c91cff15ccmr2439272pfi.55.1643044509976; 
 Mon, 24 Jan 2022 09:15:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx84cDfl3K1Yzlm2R96/QreAAV4PPWN7pVVziLRsV/a1l3TVNWg71tyUX9SHuxKcq+2egH2Mw==
X-Received: by 2002:a62:e210:0:b0:4c9:1cff:15cc with SMTP id
 a16-20020a62e210000000b004c91cff15ccmr2439258pfi.55.1643044509740; 
 Mon, 24 Jan 2022 09:15:09 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
 by smtp.gmail.com with ESMTPSA id 197sm462785pfz.152.2022.01.24.09.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:15:09 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: media: mtk-vcodec: Fix a NULL pointer
 dereference in mtk_vcodec_fw_vpu_init()
Date: Tue, 25 Jan 2022 01:15:03 +0800
Message-Id: <20220124171503.61098-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_091513_207048_1D9D4A66 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_vcodec_fw_vpu_init(), devm_kzalloc() is assigned to fw and there is
a dereference of it right after that, which could lead to NULL pointer
dereference on failure of devm_kzalloc().

Fix this bug by adding a NULL check of fw.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
index cd27f637dbe7..33ae88a9f9da 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
@@ -102,6 +102,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
 	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
 	fw->type = VPU;
 	fw->ops = &mtk_vcodec_vpu_msg;
 	fw->pdev = fw_pdev;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
