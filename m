Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F92AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A7B61056
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28A7B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kHbK17qAMl6FwzfTvLnnb+LKV4mLXtKAlaLx2BrowFs=; b=h7wIuEO6ljwWSc
	08/FgLMieNJruzE8rMhln8nrEftD393XrPzHQIcplPPlHNo76GqAmm9mHTkhKmnwQ0kdmc1+9FblO
	3s3VFVD7tFWV3YofZFItcITgPxeo4iaeWSfkDC5pTIxDb54U9KcYKsUEuAimieqv31xwz+ZB68Ejs
	NTrQeZ3E7TUB18o83+UIsPCkIQJn12k42W3Cw3udGtED38yMFoA/ESXLowcxU8y0Wh4Gc+P91jCA6
	lUQOJHS+9CMSZCv3DRVyu3UVhSYmFh72sINsw/qvPqdiRTVlRXoAFRaJvFUSr7q3Zv6nhDvdX88dB
	1eweUAqSJ1HloJ9dIo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwfd-006o57-21; Thu, 28 Oct 2021 04:05:41 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwfQ-006o1i-9V; Thu, 28 Oct 2021 04:05:29 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 o10-20020a9d718a000000b00554a0fe7ba0so935991otj.11; 
 Wed, 27 Oct 2021 21:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAFmGbzliFdK9YUpB9Pr3vqgYOv/hA15ip0ARBAHB14=;
 b=C35/2Awskpi7sNIUy/6w5UofmU1anZCwUM80cB/vCG2/CefovGQ81gUT5vvZIyDwQ9
 7xPfVeN1qtXyaLFSWnOO07fQpkIVjXDcQ++qr5HZuEcOhxPFKAcIM2LosLW8suU1RioL
 jekV9t5MxCv2imE6VA/bSzlZ8JgY8T3LrpDc+o1ntSTNG1OHFJUw2rZziJCLaH8rUAYC
 sGJ/RYuMDmYdAmKkovwp9N0mSAEE8UABBpO9WYb5TG23mfO8aG9Qe5lVur98yK6clk8V
 W/lRi4ViEwlmbMurcCZii2sDailHkp8rhSpN+4ghEn8bAXqtslxbwpeTxup7TIQH7tRs
 Ozpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAFmGbzliFdK9YUpB9Pr3vqgYOv/hA15ip0ARBAHB14=;
 b=f72hG4NqIe1eXMR+2F0T7S0SSUeisZPj3Rs830w+Gs7WAsFAvNmYL4LlINgEfUNOzx
 oIVO/lpIeAxWentBlS/+xHHgkOrMNxorPvOryKYPAuvOdxvoyTlE/aAR538hwCuVeU6V
 qgqJEloMLMR3VQdhPWsnaZf8IHefuZ0ihQp5aeeyB9fyEgIKKuegEGdcuuX/iXVQHdg/
 zglK47hs4/SslaAzcvkgs6LKC7dbkbj64mMG6DM0prTW4AIgVaelIhCdW5a2t/nOfGvg
 SRMfGGU7h5rNgaLZ9iChmo7jJbWX5BBklIGBgl4cl3uD2PrOcF/i/zfBbt3IUKiBY5F1
 hd9g==
X-Gm-Message-State: AOAM533LopjfRlrO1XgMK0U3k9k7/GGNBw4IDVQce2c8L+pBoC1msz0I
 FYBOQ/W9+wA3h2Qqzsz3iL4=
X-Google-Smtp-Source: ABdhPJx4B5/4gp731H1f4QXFtngh+vXOd8jkpnUjaTWTt4quVnYpOJCHW3DbJdeqr7RLQ9eYEXjimw==
X-Received: by 2002:a05:6830:1e95:: with SMTP id
 n21mr1482616otr.141.1635393924615; 
 Wed, 27 Oct 2021 21:05:24 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
 by smtp.gmail.com with ESMTPSA id v13sm720310otn.41.2021.10.27.21.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 21:05:24 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: tsbogend@alpha.franken.de, sergio.paracuellos@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Cc: Yanteng Si <siyanteng@loongson.cn>, sfr@canb.auug.org.au,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com, linux-next@vger.kernel.org
Subject: [PATCH v2 0/3] MIPS: Fix build error ERROR: modpost:
Date: Thu, 28 Oct 2021 12:04:51 +0800
Message-Id: <cover.1635390750.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_210528_382117_A28F905D 
X-CRM114-Status: UNSURE (   8.96  )
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

v2:

* Pick Sevrgio's Acked-by tag to Patch 1/3;
* Rewrite prefix;
* Use EXPORT_SYMBOL_GPL();
* Add haojun's patch into my thread and rewrite commit message.(Patch 3/3)

note: These errors are generated in the *linux-next.git*.

https://lore.kernel.org/linux-mips/cover.1635333327.git.siyanteng@loongson.cn/T/#t

v1:

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

Wang Haojun (1):
  MIPS: Export board_be_handler to modules

Yanteng Si (2):
  MIPS: mt7621: Add MODULE_* macros to MT7621 PCIe host controller
    driver
  MIPS: Export mips_cm/cpc/gcr_* to modules

 arch/mips/kernel/mips-cm.c           | 5 +++++
 arch/mips/kernel/mips-cpc.c          | 1 +
 arch/mips/kernel/traps.c             | 1 +
 drivers/pci/controller/pcie-mt7621.c | 2 ++
 4 files changed, 9 insertions(+)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
