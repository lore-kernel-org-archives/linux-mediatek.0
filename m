Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C977BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:32:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991856103C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 991856103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z5SDRIwsakjXZ/7TXOu8qR3AOMDezHso7cwaYqXLwOI=; b=I9JcSrNvhULKpp
	saJpMWEKDt6iC5nJ7LtyfGgormtDgcKpsD49lX/GGyvfM/QuF6rL5VTbBnfZ9j42SJh++TMqWgT1B
	scWDqs4Qgnc/dE/mqWOE/3uouMEG98Xr7HkTdSgCCvy2RswA2Xi1zVBu+fqFVTsK4MHPU9XGmoFKx
	gwYgor1fvB7YZV/LcXUdKrrDIHDVwfZnUGRuFqREMh7P7yYQfsB7he/nps+F2xiqxZ2zZKyQIFdxI
	OmzdzpGWrHR47gI28AJ1cA7V37dbfAhlYwiMdq/tZ1qWQ1fYlUmEP4+KSsA9pSht20FXMEWG57i3J
	hceptk2/FUHTQKSc1aTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhAV-004iqR-EY; Wed, 27 Oct 2021 11:32:31 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhAE-004ikO-LI; Wed, 27 Oct 2021 11:32:15 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 x135-20020a4a418d000000b002b961605657so126616ooa.10; 
 Wed, 27 Oct 2021 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PLuqEnTXe47rulVjhxN/gWoxn9OAXwjIoRJGGQuOV8g=;
 b=h8Z8RlLV8LM+pMediEGJWDOLVHznhnkpCSQuXO1FYmE45rAzSX/f863SQmiaeghzNa
 WhWV43HA6pPEupSoPRBFj9ifCmdlhY/P3Cc2D4ZyX3sOI/ZFFGJBlLAv71K/Tj1KD0Xz
 8pVVqz5qi8ZIiRTsoL4dr3uAN/lveNATuxj0d0Xn/cSS+HxMjRbeImLDEyjdkstOIKtV
 wZXuxmD++hsxEVivGZyst6WtMSs8bsMjEu6nX/h8FE1VrtcjuTcqS9nKPhfkxT/LUb7o
 ZcjL+UkELp0YyOa4FnseLXRCr7IKhTz1rA571q8XfyUGHcXx/780tH2R5AWiFliCKW3L
 NlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PLuqEnTXe47rulVjhxN/gWoxn9OAXwjIoRJGGQuOV8g=;
 b=vIMOb4UeS+ULRNVbT+3hhuV90pc554lX7i42yturdd4Ul3/MsQnAYGLlB15fbg0vzo
 PNF+nf4x5xgyOLay5qMqJ7Yw3KOZaQCQcecTNTWRnSuYVrE4AGhu7KWr0l2wK327F9oX
 mEzr1vP4nYDqczbSmoPuDak6P1VYjJ/DLEDgTHvW4oBtKiPGVtugvOMzcMXwgXCydmxy
 nX48gkaoWKfhdhXJKX6FcrxVWAOFhTp8/XdLfflWbcjBT1y5Nr8JZzoiYTqLKGbOf9SP
 7pI/fK5WToyNSq+6duuMXiyGy3uy4snA0AIjvOYiGqUYeGA6PsWGJxzyfyON2IL+OjDJ
 L/qQ==
X-Gm-Message-State: AOAM5305EZrxfCSZ274CXiZIullEmCriARaLdQTByr7nAEGj8UL2vqYF
 WuejPQOHCjFCzDFbw7ZOsp0=
X-Google-Smtp-Source: ABdhPJyYBY1m3ap3FTqF0Co+JOPNyvzi6NT3ywXO6Cyx7Bb7muZ84qjTwTFjt/pXvvyQN/ioacabnw==
X-Received: by 2002:a4a:e848:: with SMTP id j8mr3587427ooj.61.1635334331976;
 Wed, 27 Oct 2021 04:32:11 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.170])
 by smtp.gmail.com with ESMTPSA id e23sm5430106oih.40.2021.10.27.04.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 04:32:11 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: sergio.paracuellos@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, bhelgaas@google.com, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com
Subject: [PATCH 0/2] drivers/mt7621: Fix build error ERROR: modpost:
Date: Wed, 27 Oct 2021 19:31:38 +0800
Message-Id: <cover.1635333327.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_043214_721100_A324417F 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
the MT7621 PCIe host controller driver is built as a module but no MODULE_*() attributes
were specified, causing a build error due to missing license information. At the same time,
modpost complains once these drivers become modules.

ERROR: modpost: missing MODULE_LICENSE() in drivers/pci/controller/pcie-mt7621.o
ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!

Let's just fix them.

Yanteng Si (2):
  PCI: mt7621: Add MODULE_* macros to MT7621 PCIe host controller driver
  PCI: mt7621: Export mips_cm/cpc/gcr_* to modules

 arch/mips/kernel/mips-cm.c           | 5 +++++
 arch/mips/kernel/mips-cpc.c          | 1 +
 drivers/pci/controller/pcie-mt7621.c | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
