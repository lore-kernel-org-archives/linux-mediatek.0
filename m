Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54544CD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XuGkJpO8zbwPjFwZbzuJaMrl051lxnUzmCTtle9Ojzg=; b=2YFbfnnHGRN1zCZ83isGh/rJHO
	/faU2Mm80BDFvjUyrQ9JA/o+NQUvG6h4vsokwv297GNclo3udF/ndnWy5/KUCQg7Ht9K+B7FI0x7K
	dpojypshgz7gsY94bt7XstTeWhr9vmSGq228Qqve9KvJBuVMz9HjGgz6sg1wwJUF/VOxuDv4e8A7r
	7xxud7Z286s+4mxd0i8+wAOUONCv8vShSyQXYMYHk9oTghU4S3QNRy8mHkbMckAQq9wfVseSh9svL
	XmhCqiiMPTfcR5qYmeiO2krgpqbg4Aol//tt9QqDV52pqnbN0omPV6WhcwuxZuJimP4huTnIxSmCm
	1NRocA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkRB-0000000GRZe-0PnT;
	Tue, 12 May 2026 10:34:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkR8-0000000GRYH-2iMS
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 10:34:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bab82d75fdso29143865ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778582041; x=1779186841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuGkJpO8zbwPjFwZbzuJaMrl051lxnUzmCTtle9Ojzg=;
        b=NdkQSoGd78ctwNprKeR9hCT19LNdn2AafAUlzncsxomjusSrOBWWZ/gxKU0O/rujOp
         37FMtENg9Ympg708SjhfQ24+XOkyerRFhDNFfogwRV0l+m9jjJEiScwdMscL5DagoaZ2
         fXFujfpZIT/5CvCdjxjwysazFY+d/WhEI/CSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778582041; x=1779186841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuGkJpO8zbwPjFwZbzuJaMrl051lxnUzmCTtle9Ojzg=;
        b=Gi63/osho6eklAkgDoWoM55taXYYZFFwqOb1CSSc/2dCg2lyQ+QoibgufgKg0dpYOn
         mktrEzBwsZzMvhgwaf0mBV+bmeoBEkjHVY3OBVwEi+4MwRPWqNsf8iu58I0sVudTIhtR
         Gs/ArcRwsijcj7zEYWz2rJ29UINZ/TcBSh37d3p1VtahE09iE+zGr3HvGChF2vAF+u76
         /ZvFIA7bxAcwcEHFkfVm3IAHRl3AZRpVWapcNyBVI/0VhQ0DdDEvkpAZnJiy6DtRdq+C
         fFYgUnzYR05CvQJQN+DUO24wM/j6Ag81Sd99tAOvOTqFexMfcoIAMHGAubzy5KqNjNBL
         mMHA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ub+HaKC8aUdNd0w5V+Yh4DeA4Ebrq3AOGmrwN/yAYT/t8dT7j/kQJoeYghjp5sqh5exwZomyYdYGMIsJFqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SLj7/sN0orbsTR4VyoKC2ruUj+JOFnBh2HinWfq0rx9Ja4cR
	UZL695ExKgLDL2err7CSSjyyB/FI18A1kfwSlLFhZWQL+OAf6DFOoDawlSFfkzjMCA==
X-Gm-Gg: Acq92OF4xcJb+0IbEC0avQHrJkSJ9jGdNjjQnODFpwto1UdyPNeEku6DlzkBSaifJpn
	r85Av7VOBRGqqAw3tsQVjBXJhlLhirggpIt9W6jJSjp0ZjdYoc6ebY1rt6SjfcaytLmwxJaCFSJ
	t0p6fFuNywio1ciHavnuPAODod+htoBeujYVVSc+oyU+ZfREnSfH6jlq5sLAR1G4826tm8rZ3j6
	TAIiC5sNBEQrN9VXh1zPCow8AbYapvmtWB30rUqx9chmkxSTtmUrZgDtlNvMrd1sUfb4jOcftbG
	S8QkMCl0OG9t8L+HMbHo5MUOxCx6mkwzIHcrHgrPytXONvAdjabM0rht60CuH1SSwLj8kn/U+rI
	ZUQ56vUS07v9QyHIuRMAQ7JpoMN9Z32KGyWWZq2DYi2aDr1CfFACBk2/zNCkr5pF/onaDptKB+C
	YlcoB6bKkIGhQobTm4jwfUgSgVTOuerkpDfbdJNEz1qxKrs5MPiBBBKZyC3Zzk1ryAt0Xu/Bka5
	Vp2EcCjHrTeLZe9TDM/pjwP43HPYQ==
X-Received: by 2002:a17:902:f650:b0:2bd:1905:e8b7 with SMTP id d9443c01a7336-2bd1905e9ccmr1997075ad.13.1778582041152;
        Tue, 12 May 2026 03:34:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm141597605ad.74.2026.05.12.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:34:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] PCI: mediatek-gen3: fix incorrectly skipped pwrctrl error message
Date: Tue, 12 May 2026 18:33:45 +0800
Message-ID: <20260512103347.1751080-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_033402_713888_5EDD2EE9 
X-CRM114-Status: GOOD (  13.39  )
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

When pwrctrl integration was added, the error message for when
pci_pwrctrl_create_devices() fails was incorrectly put after the error
goto statement, causing it to be skipped.

Move the goto statement after the dev_err_probe() call so that the
error message actually gets printed (or saved if probe is deferred).

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/adjNaKB5KGpl6qIp@stanley.mountain/
Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 6f0ae946d501..ef64778bbf8b 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1221,8 +1221,8 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 	err = pci_pwrctrl_create_devices(pcie->dev);
 	if (err) {
-		goto err_tear_down_irq;
 		dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+		goto err_tear_down_irq;
 	}
 
 	err = mtk_pcie_setup(pcie);
-- 
2.54.0.563.g4f69b47b94-goog


