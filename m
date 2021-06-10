Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67619C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDCB610C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDCB610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/4sYWqtuX7XjV5Gqq8QSDx5g+KQjHInMPEbCgUR8Nw4=; b=lcnGIXWP4Evl1J
	A2H2qTofAWRCuEepNS+6f+RmQzdCkz67PayBpQR/Mp8OQpUfZtoO2A2fmmUNDUHFNFu03JYj9K9iK
	uPvRQKvMCJsApfP+Fc1WKQjZN5evR8zG9EfeXFckk7i3bOv+KVeqNx6rdK7EAZTbPYbTsF7fIhuGc
	EFG40TEptJntAgyG2tVQ5W8dMMDkCIy8L6bdySXjikuT7iOqSF5eobNdU2xmH2FqTd18ZxizCSlIi
	KmlPAb3rDyMJw6fIUBCXxRocxqreAkZjw7BhabTKAOBe204KqKCIRjhwTTx8Rld+MaXQXv5JfWFeT
	JrDJVMCbqtZYixuO7b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrSVv-002anF-T7; Thu, 10 Jun 2021 21:46:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrSUE-002a32-9V
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 21:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=guTfU4e8GDRqzy/1ajS1PObKT8FQPjuFX79A5J7ymwU=;
 b=ZFo5h7u8phfIUMlE9u6qkSUaRZyCvtgGHpDUspcEYXul3DIaZDDtxYPe7+r58Yu65tFTCg
 YTFVNnryKy2C7QHaAmxXzmux+e3n2J9mXcvn1E6JTkbn9mr4teRglH5/X5CCW9IdTrd8uN
 IfKjKyR9PwUYpQdcuZ+zY+mG3LzNN1w=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-RP7AIyeAMG-du17aMMrTUw-1; Thu, 10 Jun 2021 17:45:09 -0400
X-MC-Unique: RP7AIyeAMG-du17aMMrTUw-1
Received: by mail-ot1-f72.google.com with SMTP id
 e28-20020a9d491c0000b02903daf90867beso659993otf.11
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 14:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=guTfU4e8GDRqzy/1ajS1PObKT8FQPjuFX79A5J7ymwU=;
 b=rr6/5Zk6G4HF2JLCKtf/X77a3e+GRvGZ443yBSIVvltR+B79TxOrAUvAo3ACulY2cB
 zgIKCnVWyLIgnGVRI13JeBuSLSCrzuSI7BTzG6w0lS/eaWGHk9HPL5ga+awC+rG7+dO9
 skKsgfHgrWCuyL+Y7uKC6NjALRxrR4DvuJ6uGs80yWNNO6WiYCR8t2Nd/QrYJo8wb9dt
 bQZj0g4qERejOURH/jXLfez5inr5kbSn5svUvI0LNjVHoRlwICZTU+V3937NnI18LTUD
 w0jHbBuELLW9mJXTpi/QdKDmc3dxZtF65tuHRwweTdon1IZ+VBooxVCmOGb7WgxeE2he
 EGEg==
X-Gm-Message-State: AOAM53305aksRsa7SdaYZj5Y3g78hzK7qqxDO3S5Z4XwZA9eLCrmkL4R
 qubAShti0sJFzLPX/V5VNR2DcGazWwdirbWdDi7EnJPiXIsYY8naenSX7EMFaIIWCZTZdXZs5Yc
 rffN6ubW1QXu7GnM8Vt8bMbfH3icgvPZe
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr386223otj.92.1623361509085;
 Thu, 10 Jun 2021 14:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjBwKjRTZldk72q+UJkwklQ0sAnXANOb5b/9su/9MNUdqJcH0ISmXgySFJudebSgHFMzWVdQ==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr386187otj.92.1623361508840;
 Thu, 10 Jun 2021 14:45:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:45:08 -0700 (PDT)
From: trix@redhat.com
To: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 0/7] check Makefile and Kconfigs for SPDX tag
Date: Thu, 10 Jun 2021 14:44:30 -0700
Message-Id: <20210610214438.3161140-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_144514_433381_348E9E77 
X-CRM114-Status: UNSURE (   6.57  )
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

From: Tom Rix <trix@redhat.com>

A followup to
https://lore.kernel.org/linux-fpga/YMD2yxtsQN16MoPA@kroah.com/
So I do not repeat this problem,  add a SPDX checker for Makefiles and
Kconfigs to checkpatch.

Then treewide fix the malformed Makefiles and Kconfigs.
Those missing tags are numerous.
Kconfig has 46
Makefile has 141

Run checkpatch generally over the dirs with Makefile or Kconfig problems
to check nothing broke in checkpatch.  Fix the few problems turned up


Tom Rix (7):
  checkpatch: check Makefiles and Kconfigs for SPDX tag
  mei: hdcp: SPDX tag should be the first line
  drivers/soc/litex: fix spelling of SPDX tag
  MIPS: Loongson64: fix spelling of SPDX tag
  iio/scmi: fix spelling of SPDX tag
  mt76: add a space between comment char and SPDX tag
  mt76: use SPDX header file comment style

 arch/mips/boot/dts/loongson/Makefile                 | 2 +-
 drivers/iio/common/scmi_sensors/Makefile             | 2 +-
 drivers/misc/mei/hdcp/Kconfig                        | 1 -
 drivers/net/wireless/mediatek/mt76/mt7615/Makefile   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/Makefile   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/Makefile   | 2 +-
 drivers/soc/litex/Kconfig                            | 2 +-
 drivers/soc/litex/Makefile                           | 2 +-
 scripts/checkpatch.pl                                | 2 +-
 11 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
