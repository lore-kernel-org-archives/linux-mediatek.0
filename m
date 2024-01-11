Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946ABC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XG+5LYoTfM19+HCSh2Sxdy2rjn8YuyVWQvJzeP4kCnM=; b=MpTOpAPY9v2uTck4Ny0WuczZZC
	GZDlwqg51TrOkM9O81EvEyVW6cL/poOtnIh+gSfKUlybk37/EcRlikImFESL16VOsDBGdixpVK6vr
	hWTN/gyts+HNgVYPmxnTwxIUntlh703wN6e9KWk12qGjE/O/NshNULpSFyDd63ho7qRK7W3zuQT45
	V7v65fnBC5YdBhXkUCTgYlm22Jw0sH8Vgfy+HoCrVzOCPy6/+H9AVcXwZk6UwIoS3n5eKmzWOH/Jx
	5HGLI/Wc3Gzwk3w0q20bx8deZviXsWZdv+XeMRfBNH6ZZnMteuM7bZWTpjxaFtSwdr2JUpr9wRfDB
	ie2LA77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqPA-00GW3n-0a;
	Thu, 11 Jan 2024 08:27:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqP7-00GW1q-0u
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 08:27:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40d60c49ee7so57022625e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 00:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704961627; x=1705566427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XG+5LYoTfM19+HCSh2Sxdy2rjn8YuyVWQvJzeP4kCnM=;
        b=JhHe0FLAegKh5WukoZWbQjBPuRloQAzCyfZKCZ1aBXK3nWQKBN5Q13l/E+dgRSIVro
         BJRf5fH1+IXgFHGD+YtbNllSIqDw9aEyL/RmSmcIOj4FMO578DVvhTO8BrXHgPnIMcP+
         aEtxiEcs+YqiCAJl+CnlJlQb6GdiXri9Dz/stuKtpK7tL1XX83FXi25z73BXc1TILh0U
         7mjEin+3DLNPR/xqeASGq+uMVJSZvhXjs7toVQIvPsJoUqxgoq5nZViRr3BV1LaerHGF
         3EQI21nn0UH1cf2rhPcRyeHMNLSqtZKIq8bQdCdmBRpitla3YMGlZ5y7h3hG6os+N43D
         s+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704961627; x=1705566427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG+5LYoTfM19+HCSh2Sxdy2rjn8YuyVWQvJzeP4kCnM=;
        b=xK9kOlyPN21pSa+ffJaPJqUs/QbTIGXF84Jq9c7Wpw2lYIk/U4JSzxMbcu6Lxx7zPF
         WsxuZjpyr1lJwQytMINxRummYTovEaTYpOXGHG5zDe69B/w+sHzd+zborjSdSG9Ucxi8
         OX5s92lW9P5aWRytfB5L+5lRc1aGO8QrzKHuYlqB/V6EEcVMIvcjvvDJV7lGFHUimTiW
         8NZ5xrxWvSSKfGa//YcoKRfHdncpqiQIkuxG0HiaVSQQLMeYIRhzsW0cLJSbONxvAB0h
         dNFtv9oyolMFBTDfBmeaEFjz9ML0bH5bSMXzTf+jWsHcT8Y8NGCJ7GvZtVdqQ42NNcGc
         br0g==
X-Gm-Message-State: AOJu0YwMrK9jgk8WA//CmVSi1DZpstsFs1grBhbA7Uyz5j+yDk06G7O3
	1osW3Khm0cFcx61ArXBcWrY=
X-Google-Smtp-Source: AGHT+IGoHE88PnZkOefJgr4PQyBMdDPvYPBdgLpyCha13BLRcXAiFUo/jkisxliGZgfOAaqZetm8Ww==
X-Received: by 2002:a05:600c:2d51:b0:40e:4861:b3f6 with SMTP id a17-20020a05600c2d5100b0040e4861b3f6mr170775wmg.48.1704961627170;
        Thu, 11 Jan 2024 00:27:07 -0800 (PST)
Received: from localhost.localdomain (141.red-88-10-53.dynamicip.rima-tde.net. [88.10.53.141])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b0040e4ca7fcb4sm967868wms.37.2024.01.11.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 00:27:06 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
Date: Thu, 11 Jan 2024 09:27:04 +0100
Message-Id: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_002709_335875_6F8DF04B 
X-CRM114-Status: GOOD (  12.07  )
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

The following warning appears when driver is compiled with W=1.

CC      drivers/pci/controller/pcie-mt7621.o
drivers/pci/controller/pcie-mt7621.c: In function ‘mt7621_pcie_probe’:
drivers/pci/controller/pcie-mt7621.c:228:49: error: ‘snprintf’ output may
be truncated before the last format character [-Werror=format-truncation=]
228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
    |                                                 ^
drivers/pci/controller/pcie-mt7621.c:228:9: note: ‘snprintf’ output between
10 and 11 bytes into a destination of size 10
228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
    |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clean this up increasing destination buffer one byte.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/linux-pci/20240110212302.GA2123146@bhelgaas/T/#t
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pci/controller/pcie-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 79e225edb42a..d97b956e6e57 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
 	struct mt7621_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	char name[10];
+	char name[11];
 	int err;
 
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
-- 
2.25.1


