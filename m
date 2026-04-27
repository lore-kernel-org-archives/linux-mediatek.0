Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37265FF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=; b=2bjjYISNDN4cKZJ23ZoFzf3Uih
	qou/ypRQXKLsxoRbcqaNt6TPKQhRfdBvmjBQvPei9eIT1VDNDOk9/5sElUnfYHJntyOm8VtqxzVYc
	Vuwa7BlIMVIDqQDvXANK9nnOZuCtVdTBo2SFssc9lRDPIeGXHlpGfKsS+xMC6BhP/LXZOlgSnha69
	rnocHkEvWZ0nVLqKb3K2nuXGzqFo8s6gnDtt2wLD+ZvogLPuzrRCXREOq/CYm3Hd8RH/9vM8B89eF
	kgCg7uokVEothwT6crK/0ri9uuWokS9gm7TOyQBt/J3P+VLYaNKsPR9yuhNtd+xQ92v96XrIhDg9O
	MNdfM5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtu-0000000G70g-0dy1;
	Mon, 27 Apr 2026 03:44:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtr-0000000G6zV-1lK5
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b2429f98d0so56003225ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261486; x=1777866286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=C5jWIzB4a4Hac985RQUP3GExZ1RkB1WX27umfK8PVvus6UWw4441O8p+sODsqS0FJu
         7J/UjOKOrajMPhogXa06lcMTbLyaPT6dwsGLC6Wkav4BJDwIO/BdaekHOl5De10AsbjT
         LCn9mF2snXgGDXG2jq7LxeR6AbaVykTFNePqcnZUS/K0UdO6qr6O2uAdazeIUxAeLIRe
         FnUMe+xwKag8H+ieUOIgpv0BwiRMGGA6h84t4zEOWlrGmBBT5ZeMOCdzAuIrK3lsoThl
         3vnA8uVPSVdou6smfxBlrQL4IjDLfNo+GIaCEU5r5ozkiwRiCVAasY49pdr9REKfKuQJ
         WTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261486; x=1777866286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=USFAvyB2LZ8z1Nz5dWMeYNpt1ts3aAsuzeROByg3y/tH7ZrPr7xcUIXqzTjmPmGVAT
         id+jbtYWpTRMHFz3MmpyB1r7ZBBWEydZqZDzy69aeTCXudalEkJ1olj+xXejgvf1kkZM
         x+9+jsCP9VplEw5QL6ihmiWK63ehU/cctbKWRA0n6TkhccYBZ3iwttMZyR1m1pKcg5gl
         xRdkobP3wRzvsCnZtfP68BPU3v0XDBujZ5b3A9SDSj5koXrgtHzX23ewzC2nrQxP29+H
         yPpj10Yg5fJzUgKvNLcS4cBE/c6zOxBh+oNx65tRHm8xZe5P7PtX6xXFd08QLutGvMjh
         aryg==
X-Forwarded-Encrypted: i=1; AFNElJ9WtVKD4Cs9XSNhbsMM5/9HdWBWL6Ky4Z51ZiWgOcna8cTIy50EK2++FT14PYfbk2HTkiWzFgwoRXSLi6yj/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYp5jn2xQNsw7BZBf9GfAoxcuRe/l/kWv4IQQAWkRmHXCb6Egp
	jKK74O7KYvVfcIvXAc0O2SFvXfSno1HI9lpIJw6L4fUxZAchqk4IwZZ4
X-Gm-Gg: AeBDiesa78d1ErYuFrenwZyRrQcMBC3QlD2F2Cob7eBH4ETqwj6UhaTRxR5AOdZSKL6
	Kz1JBw0Bm6VEIBzJD7TzIswIfkuNAuIq4H7DUlv8E5QY0NF7ckuLhKBQIHaYjeq0HTTPXanWbbw
	qB3JDkh/2NBEjBcvFUtSsQKFJJ/Hpf513Ww7L6F8M5Q51qysdHxbWSBDSY7hjqEy41KdK4W5HRV
	x6cMJkLZBDZx1bosFEOcUpeMbR4aG7oyrrDx8rMa7WKzJGoCky5YhTeGiNLDMBKggfTgt7J63D1
	qe6SpWJRAAMCr3tzBzKHwcHtpYH0vbh5K1leKkelxM9Mst4Ix7ZSDA9+MsSSht5n9Eb6t8gUcMl
	OJ2elIi5jIaeSurkYwcnfvd4AkR2SV0/+p2nENTRsGECZkGHVHIrl0KqI1O0v3dJf/6OxLzhuhV
	CMmDcs/tYJyagHlHMIfJrNhi5fMQ5+n6axftOfhjIpcG/4EIpeZSoAg7SCRqaBd1gHdAGfWKvX5
	/OYUsZePez2pHMliqr3wx4zCg==
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr422778205ad.13.1777261485859;
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 0/3] wifi: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:24 -0700
Message-ID: <20260427034427.881389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204447_461890_A213C8E1 
X-CRM114-Status: UNSURE (   6.51  )
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

mediatek,mtd-eeprom predates nvmem which is used everywhere to grab
eeprom and mac-address data from MTD devices.

Transition the one place to nvmem and remove the binding to discourage
use.

Rosen Penev (3):
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
  dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
  wifi: mt76: remove mt76_get_of_data_from_mtd

 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 +---
 .../ralink/gardena_smart_gateway_mt7688.dts   | 17 +++-
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 5 files changed, 17 insertions(+), 111 deletions(-)

--
2.54.0


