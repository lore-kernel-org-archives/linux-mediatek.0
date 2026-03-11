Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263EBFD064F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MochbUCbZ+H/kxuMI2SH03ESgJqy+nQAwtcP82AWQU=; b=oKJwzeOBrf9k21Kti0AOLsy9gD
	PnphHAUl15jseCGNsBK1lLbkV3CmkkBNQfPQBtUky8TC2bdIPssQQvgxcPtUfGAqA1YWO8uNQ5hZe
	FDX0zRRMXZR+lvDM39rLEntaJ+XT5WGWD+6gepop1duBR09dbBHT+xU9JnXteKqJLFdqRxhQXrslr
	RGOoAr2UokBAF3XsSPLAm89dNBkikUrSvIbxCWK8yhN//O0gt/4cR91BX/hlwwBKE08dYKK4Fij35
	KE8mSMEJFf5bX+Z2jJxXQ3c5Sw3lAlgQ4kmkewLzEJO2rxLRu/Ep/gb9WBQ70rccrvGqKkY/+r20N
	bb4o5iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENM-0000000B5TU-3Kja;
	Wed, 11 Mar 2026 07:53:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENM-0000000B5Si-0Q3o
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4MochbUCbZ+H/kxuMI2SH03ESgJqy+nQAwtcP82AWQU=; b=Rtya/natHEAvYE+jr4N1HPpjnL
	VYmo8TX7PLH4ToFXeRnxeyKxPvtQcLphZmdORqfYvzCCOXLSO9RqgTePFIeGqadAKLyfAqqbm7IpO
	YsoDxS1OGvEIFWSkGLsnMnZ+rfa2cqfjrWUfOVG4SFzsDQmRqRIIPYViiCeSLxaeH+u00LyaSytnV
	2ME/9dOC4ihpIOFe4eBDBCnhjMQP5/pRtmqwPsXazMGKbhmbx69QLa0DGoN3U2Yw9J6+fFZxpVqwE
	hjh1knYk6ZRoeAo2j12XjcmkIZpZM5CSc326yyokcP+NAxEgyd0wNSjiw/6eWa/kNSgMfeVmoSlMw
	DdRQ755A==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENH-0000000GJ3W-3mCY
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:53:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so7764832a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215578; x=1773820378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MochbUCbZ+H/kxuMI2SH03ESgJqy+nQAwtcP82AWQU=;
        b=JfYqlpBIDlNhVQYOiUBSdoPBf3TxbL3g7uJ6etdbl0AQUXmbp8AsZuhtjYGxmR5byZ
         OirjFLvUeEkHtLTWFJwWLtf/WedFK3Wk9Dsu08ZbNsaoL+cX5meTadp+87yKtxRY4dk1
         MYtSX+Xe+qArRy5dwPJ/YUFmYmY1/VLnovH18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215578; x=1773820378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MochbUCbZ+H/kxuMI2SH03ESgJqy+nQAwtcP82AWQU=;
        b=iZw6nbQOuVke5RU6PF93AeQHwnzByXkt08L5tQ18wYx6GHYk+oy8zhxwow7+R8Owzm
         O3vmccSWpQn+x0eGv/wTXBOgLORBC5irTdjmbVVQvW8ACFjnrXCAl47PIQElf0oqAuRI
         jz7UucVS07xYR1e79lCyZrh0GqLQ4pjrbMkVey4qgES3Q4ZsLpU6HH8m2KqdTbsgIkDs
         TGNeyl+kQvc9TCD9Oc/FLo+3D3AypmnX1dvKKxCPhZyS8LsyGi0EC8x8bRe/J4L6HbOP
         a5ElLVrS43b/ioTQdkUxD55UWYa7Vqxn8DcK1YrmoRVRzZ0HS1qF8X08STdU6mUqfctg
         fOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWi9CC5PatY0vR+l3eoV+TFZz/yEd33DyodNymvAX4CkPW0p0+gJx0WtazXA3Ii0DCVHFOq3yn6sG1kO5v5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR6pxY0WPNkcOVQEogEgkKIceXoOq5DafyOa+1sJWK/yQc2mYW
	psq256G6aewGQZOMVCqSKs9YbAno1YCRwNx02e0wRoOoeH2pyoohAKoqnlmwfmiYcg==
X-Gm-Gg: ATEYQzxUFLzRCgx7I8Tgs1lmOn21uRkopN7zlwR+ZZZmg+YQpkGRJRhMWLVlUI1prw1
	4O38ZqAAV7WErZChIE8AzA2pF9K+RM1wgpASenepX0NfLGyG4Z0p/HetCRzhnpo1pphKGrVhppN
	7TE84BP8GX84Vu98jxA0GoY0KufydqL/TqGiOPYkfviLpPp1cN0wISdUlpZjNUuF0YjQpL7Vztp
	+xjfy/OtwFDvYO5JBBVmBjXAS5qpeZpejdvO3M4ojUwnC/icGhD7BLSVHo0cbINsBz4HT8R+MUK
	qvffgPs3cAPIMzYKCYnqM4FKdUGlh8Js/H4UPktTZJLFtQy0rYjH9KiLl0CG2APmHKrrGD98hwf
	rHidtQjGF6l87fXapy547RsQAfg35NBZKu71VUowyM6uiPmtXEa/PTp3wDCC4vdFVG9n/I2uA06
	TCb9dIVnffMBW5IbimYC1Q3Ke8yVzFBhOpIsdYBzhenfbcPQDG0/WD6DbeDXPuvRo3kSCfw3JEa
	MfPMdD6
X-Received: by 2002:a17:90b:3dc7:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35a0132b646mr1645675a91.25.1773215577983;
        Wed, 11 Mar 2026 00:52:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 6/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Wed, 11 Mar 2026 15:52:21 +0800
Message-ID: <20260311075223.3303497-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075300_015044_9496A29F 
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

If further setup fails after the device is powered on and link training
succeeds, we want to place the device back in a quiescence state to
avoid unintended activity and save power. This also helps with power
state tracking and balancing once pwrctrl API is integrated.

Power down the device in the error paths of mtk_pcie_startup_port() and
mtk_pcie_probe().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Adapted to mtk_pcie_devices_power_down() name change
Changes since v3:
- Adapted to movement of existing setup code
  - Cleanup in mtk_pcie_setup() moved to mtk_pcie_probe()
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 526db8815401..208866d33c77 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -556,10 +556,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		dev_err(pcie->dev,
 			"PCIe link down, current LTSSM state: %s (%#x)\n",
 			ltssm_state, val);
-		return err;
+		goto err_power_down_device;
 	}
 
 	return 0;
+
+err_power_down_device:
+	mtk_pcie_devices_power_down(pcie);
+	return err;
 }
 
 #define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
@@ -1219,6 +1223,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_power_down_pcie:
+	mtk_pcie_devices_power_down(pcie);
 	mtk_pcie_power_down(pcie);
 err_tear_down_irq:
 	mtk_pcie_irq_teardown(pcie);
-- 
2.53.0.473.g4a7958ca14-goog


