Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5307606A324
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OV0HTrqj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1ZSkH1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=; b=OV0HTrqjG8n23IPYq2LFmThFgM
	Mfj+8Z0c+n2KGhaYv5MjN8ySNKwhtZskRTRu4HOLIkLAtC53wxPZ1BgRRkxT89UT/ifCnL453hvuF
	zw5C7u17wC2+2tZxNfDc1InNIOG21EyfWnpQhPTYOqUAzhSiAMwT4kGfHNgDI6Sb95j8kqbwLQCY3
	ukC8chfCYIzdNK39keHtIp/VDGBxLM8HdQnFxZouNYPAFkEE5/tuxPiFWRHQkafOgXM0FD258lP46
	VvaRyKoel2QmOI2JRUufPqeFmqvEYKNwehqDNeb+SSAyvJaJ5nQQkIZnYodhOTh1gVwA7iFkfjqrx
	/yNaihiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPZu-0000000DwFC-3UMZ;
	Sun, 01 Nov 2026 07:02:06 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPZs-0000000DwEU-0Eih
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Nov 2026 07:02:05 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1438d9363fbso1499665c88.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516523; x=1794121323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=W1ZSkH1o1jglCLbJ5EGnmfC1FoeAV+jiXaFA7O63kH4BAxCDT69G8Q8RBpb81cjLEv
         MiishLt362aeAeVxQ1L9ABXwkWa/1gDXIKNxIwOMUCVM+PXo7L5K/CIa4ZWPZ2AOCdPG
         nnOzd0TftZCJyn10Fhc6Hst2he01TCJJ8iGzOGjKq+2lJzLX0sy2O+P3I6QzsD0JzFgv
         7G28Lzvk8DeQPkjziaBCLUjot4sYM6VcaIBnEr+EO2QLrBHs+XMj3nxh6C8udmNBGvlD
         EM7XxcKK+bYxXNzv48Mnje2dJVtDk6dOGKPVRXWq+6eP3+IJIf+3dP1GI06d+/W4CeQC
         4o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516523; x=1794121323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=Ay1yHetFtsf29uiDRGBzo64yDdThfw4oxggQ9TybCD8ovhuV/gmJhoTt8uYkniwMDU
         lK6glqLISPRuBH4DRuDE0D2yOJduAaogQj6WH1LPRIphOHZrxKnVfS85A9+iG7DylUps
         iV4eTv50ho8P/4/Gzy0gq+rqdi2jcofpCFXziZZk13Y7kikbicHgPf9jG1VXN0b6VEyk
         LVgAe+m0dwD1ICIkMeWOKmOfRD1+UlXosLUhjpL1F1LVSj01TIbD5/ztqjMpW7+FBnHi
         BKRATjBPoI61dwZ7geXwGY4JLrrW091r1soHiCfVvwOVkIx6QaAeCBY/wy1oIWH9LN+q
         wWMg==
X-Forwarded-Encrypted: i=1; AKwUvBzBo2hs+1nD8DvqLdbQhoWCujAB7ecbzkv3fJS5BXVkpqI4zGHZHKaEbVysUl6FsO6EVGwmtV7sI9cwMwJO0g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJzZUuCdXct6NE0J/mNiFZixEYOak6WKKuNNbs3fqKn2AAEAzpE
	Qnv13n/e7yVVztvgzrQN9lO4OnE1rU9I5KZStUBx8dJcb6wu2Oz7IBQN
X-Gm-Gg: AYBFou0S0oZjiaBKyqXHcABP3HZHaRKNoww9I7/VFY3G0GQvc8VSMmi3K0fUfL0Lrdz
	KTaK4MSmkpbp0Pqx57Zc6TS44RrCpX9Tm716hkyz+be6u941dp4xZFM5qsdrUR1Bh1YGE7BVe+F
	kXeYvLgB/LgVhGq7xgSXf/dB/8lnosZOAJQ0DLjMjWfphTFbqvj+fZIh8GRMO1Nk5sBWuPzKVkW
	UnoBU0CPoMU9ZSR2W/FDUvt58xwUZr7KnLidoik3Nn4qqSuaGPvJzdzlWHX27AJP/buLiBnvzho
	pFFqQQQApu7Rwo1bKRnsN1UEgeADtOLqj4lOhcs4J8ZJqAVuhv890BXJXPJNSR76gnz/MLm0y3s
	kUmAH1Rf9sNLqKI8g+wu2MelJhV/PqpRSPVbH8ouqdA6KtGw/MFpGeDVzPLW8/ZRPNSA5KyC+Jp
	Y93ur36URcLnhCTMGyxECUe+JEzZAmrMk4BNbi+bPCg5r3VH1cWns243njrSPa9404e9bYmefax
	/e9QY+Z4ibH5p9ftM2FYpKqsddgsV7c6uqHrwWWkHWgFg5cC7aUE5GkkEBmcqre8LUxQvx3r1oE
	6BOLIwlFl7HsBlAT1x37TImdY2vEQkJie/RiPVuvy7exbx0q3+Z33g==
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr14043652c88.2.1793516522423;
        Sun, 01 Nov 2026 00:02:02 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm38735421c88.7.2026.11.01.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:02:01 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sergio.paracuellos@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  1 Nov 2026 07:01:21 +0000
Message-ID: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_000204_088697_3C6545FB 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCIe port initialization code acquires a reset control handle using
of_reset_control_get_exclusive(). However, when PHY initialization or
power-on fails, the port is removed from the PCIe port list without
releasing the acquired reset control handle.

Since the reset control cleanup iterates over the remaining ports in
the list, the removed port's reset control handle is never released.

Call reset_control_put() before removing the failed port from the list
to ensure that the reset control resource is properly released.

Fixes a resource leak on PCIe PHY initialization failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 01ead2f92e87..1dcaa2829609 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -361,6 +361,7 @@ static int mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 		err = mt7621_pcie_init_port(port);
 		if (err) {
 			dev_err(dev, "initializing port %d failed\n", slot);
+			reset_control_put(port->pcie_rst);
 			list_del(&port->list);
 		}
 	}
-- 
2.55.0


