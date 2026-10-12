Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E5ECA9ED0
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//6PZzEPE4dWFH43EiRfnDXZN2OFddxQZ9MFM56YAAU=; b=L9/21yHCXXN3+SauSNLsUK11ub
	mNQe+nxxfk8NFnU/qzSkMt8npQ3Q/P09qUHZ7KRgg/wuB3SK0dILGw339nsLiula6mOIqrts7Xv/W
	fY/buXbhgY4qcFDG9Y2YHrMk8UEhVsev++1ERsxnKMfnF6UF0Y91E6SFeGvCse+W7C5H8rUU6OlIU
	y+1/XR8CdDPfusQfUEYUTUWAQCF5Subihx9vhfjUt5xa6TEo/zK0WSty1JS080/msIJXo00zMg9I5
	P+CRnvQZYG6n6a/QvULMI3+RrllnX3JiwpRsjfeK39AZWREItb30wgPkvGFc1sSKgFOtCxahCrrM6
	cEggGC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFWn-0000000AVIg-0ZOA;
	Mon, 12 Oct 2026 12:53:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFWk-0000000AVI9-1lAP
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 12:53:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so14645715e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791809592; x=1792414392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//6PZzEPE4dWFH43EiRfnDXZN2OFddxQZ9MFM56YAAU=;
        b=SpNkFHSy7n59ORhl5JkRo/YcD3gH4QGtYpuQWCXVCD1BYsRZILvgvpIsVmTgs5Oqf+
         pmiDE47HtEQoxdVC8aG+5hoGQ+q7APstVOAMZeOlvmbkDTVjSjtsV3Y6P0Gqeuv9Gg1a
         qj2I7SFteA3OV5AP/JdThtXE3hzSZ8H4k9JIqHcL7J/fnnXwbUQVONdpu/jmy8r6omcv
         kRJXWPmnK70mBBtQQwXL3LPvMmdLKlFHF9iS5a2fszEypJ+Ft2CDzeMxrkPVOb2u8295
         BDDmgWVM3wX7vXb3uL1kkMA1DlBf6bk7/NaDvSLzTSbfch6DxpUg98ZzGbhyBlSIlrx0
         Eq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809592; x=1792414392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//6PZzEPE4dWFH43EiRfnDXZN2OFddxQZ9MFM56YAAU=;
        b=p6/U7DCh7HFoUTpBu4gLvAViP+nfRFPCn3VPGPefolXi3SXkaG2mPVz+/LfUO+l1oi
         BriWou7q/E8sYBddAVr5c2KEwrOZGdBDWtoKSjFo1SQtLHvRnou4Fo1ICMZ3FsUy2b/k
         f1TqFI/RmKIDwTZXvjb9zlC1Ja8AMPj9C7i35jAkVunQd30xgrCPJooeVnv7zkolsaqs
         lMPyvBhnWw0lPza6jEUMfEpYhAt37nzUlY4MRNhUv/ACBc0ZTZp/9sHjAHER5PW1KnSb
         w33TgUKqOow0C8KZC9wanNQ7LVnawXTbMZE21fgHXzxdIVIflKMJHACE/T/brXFvGcwf
         /DgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhH/kV+758kNxHWYuPQH+VYDmE8WB/gzp3Q6lD3QZnCgj1qJOzLRYcrWA0THSRuFcOlM3pBrdsnk5Gi1QUJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLTWWZ8rM2MSiOXp8jULbpTa7MVgEzhuFNIhFIRicP9sLae58W4
	81obMmzwkSsRvPz+FvMumihvp0NiZXvT7vPIaWvmQL2YL1Y5sDlPyy05
X-Gm-Gg: AYBFou2zqlfXMKeeVMDOYELQIZOoBCJl4AZ+icGVgk9sMrsTqg73JaiS9FD/9B7jj1/
	6qxj5vz6ET0TcKgmj64qDfBCS4hRGVeFf3MrbXhroJUe1yihRFGRYWLFDCfjVK8XCqQsdeaCDmu
	KBaaTLQVRYnkR1gJ87xhnVzQurYH67hFXH3R5ZBPYcazeGL/h1MA0HUJIn7UTCcPi+cH71OxqWx
	AFqhUZRHUl311elfQkDJW2w1krAnEUwMlY/0N6IQWCdoThKhDP1XqmmDSWCphN4OMJ6wED1yYg8
	7AOVUOS/BRhEWorqB2G3X7qQxT3M4UJhy8immucjUAYlcBU0998w53G0ShTPp7imYUTtckE1UOw
	U1F7V2+fstbM7L9FV0X9IQE2lJwiqqaQvPkw/tct/BDYjBdTd6SdZyZXFSBT1jps1kcue80fLsq
	IPkUt7o+204bEybFExEKUZouCdf57utVe8ulAoZSLcuXQHC3myQ+Jwq5eWj1qOA2Zrunht9saFN
	V6Ib9mVXpKTiVRBaQ8wDeFEoZq6nUYfguopNOTCMVlxhvoSLclEy1EsXxujvSNG8M+EQMc+TNUY
	mOj9bQrmo7dKNnw8wL6B4K15e2RgvbRUFnvz1l0EtDYUVHyWWI9rnWW+I22xqAnsN/cjzizJ1nB
	6I8mEHU3xTPobpznOQoljXk/Gfk5B8g==
X-Received: by 2002:a05:600c:1d0b:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a18e4ddca6mr180915645e9.35.1791809591922;
        Mon, 12 Oct 2026 05:53:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-7da7-06ec-e37a-072d.ipv6.o2.cz. [2a00:1028:c000:ddf:7da7:6ec:e37a:72d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm460701895e9.4.2026.10.12.05.53.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 05:53:11 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: mt7925: status LED of USB adapters and linux-firmware
Date: Mon, 12 Oct 2026 14:53:10 +0200
Message-ID: <20261012125310.13917-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_055314_482775_89C47CBF 
X-CRM114-Status: GOOD (  10.17  )
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

Hi,

The status LED of MT7925 USB adapters stays off on Linux. I
investigated this with a NETGEAR A9000 (0846:9072), see [1].

MediaTek's Windows driver for the A9000 (mtkwecxu.sys 5.3.0.3230)
controls the LED using UNI command 0x2a, with GPIO 8 and a TLV (tag 1)
specifying the LED state (on/off). Sending the same command from mt76
works with the firmware from the Windows driver package
(MT7925_E1_ASIC_ROM_RAM_CE_2249_CCN10_USB, 20250424), but not with
linux-firmware builds (CE_2249_CCN16, tested with 20231227 and
20260813). The latter return status 0 but do not change the LED state.
All 16 MT7925 firmware releases currently in linux-firmware are CCN16
builds.

Could you clarify:

1. Can GPIO-based LED control be enabled in the linux-firmware build
   for MT7925 USB adapters?

2. If not, what is the intended way to control these LEDs on Linux?

3. Is GPIO 8 common to all MT7925 USB adapters, or is it
   board-specific?

I have a small mt76 patch that registers the LED for MT7925 USB devices
and sends this command. I will submit it once firmware support and GPIO
selection are clarified.

[1] https://github.com/morrownr/USB-WiFi/issues/731

Thanks,
Josef

