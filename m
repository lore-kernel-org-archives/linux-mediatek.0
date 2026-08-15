Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE9C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXrlacljC9jA0dJpbVEtwiza65imm1+twTjzq4FOwK8=; b=N5RdyHHKfLP+dskcnZYXyz5DmE
	d9dUCTFCeVg79UdjJVX0s3qd9TsH/TrsAq/q/Xql68ychSbGW+N7sr5JPnr6QDFrV3LRPnuLQ9Hs2
	sv8bzBdjIazEVyPZsyB1tIUTNxz90ENn2kcZu19MhB+9bv7XlLftfKE7cLCB3ufrAsvWftXfMikKf
	+VdH6SprbMktZFx97ZsiU9NUXfZPZGaj6jeFYQWION1aryfZcUG9Jidjkoyj5n00v2zrfFJjcSVaV
	eZZz9x7Pc3Ls+TBBm0xdQGv5NFdH3x9cE0eic27NrJbJBBY8JnKqwWJd0y/KlSDLnRpApJcPL361w
	TFNEoSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0D-00000003nUC-4580;
	Sat, 15 Aug 2026 11:56:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0A-00000003nTi-3Q7T
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:56:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1223867f8f.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786794997; x=1787399797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXrlacljC9jA0dJpbVEtwiza65imm1+twTjzq4FOwK8=;
        b=lG7m93egfTvf58gQxqTSdPaPiQJltYbpKnK+ET9+ncIS22Hy6pnsAz4L1eml42WL8B
         lz11JBb8iHWoELKwiS9dhu624rJ5cKSB1Pf7VBoWQaY64Bg77rTbDmWWReHjk7Q0aOHL
         uwkSHyNITIqr/Pf5PqGYZaRut6Hqn9TDu78Lxx/A+66HSwjHPZzp2MbpbTne0lpDNEYw
         zYAB95gobuhMmyZIYlThVsbDntvb5BPoTWT87ewC1YLcBQXHle+ftJWLvQ+zE9zIMWph
         sDubI8OcfT82wcYhuJVDZc8jTXUp+I4gXzB4QZrTNIj3h2vYXdGlDbVCrywQM1+5oM8T
         Pp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786794997; x=1787399797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXrlacljC9jA0dJpbVEtwiza65imm1+twTjzq4FOwK8=;
        b=BDwbeepxrMouh0sqjwKvDRgt3sZ5MiipLtaTiS4EAFmB50/gPriKBZlXb+efkUoxB4
         0noLXCy5001/V9C5zOx0EqQ6x4rEN99fUEqsBj+EDT/WngeWyWk5SbqwKuNCjYTVI9H1
         wMEWMS1mGxWJ/kbhYvAiHbck3SRJG0sqBGnygxUdXOFoazq7GAUvya+yYd+nQWUHH02b
         nO7QiQr7XTHIciuo48JbKwDC+gObRmxkKXSFdEgtXOargbaPPZr5Pzm5A8IdPl0rO4a4
         783wk5ofO/XmuGmCv6BObpL21PL8QjS0Ex1ud6x5Q8M2Za1IDBhREjSvROoOIC8B6mO7
         5rlQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8gSQMG58IdCzk8I4wZdnAuWPE+Xlyq3X8cs+ySkW+CA6ySCcv04g+8wrZgIIiDpaAAQHoywwUMEQ7zdWaBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwBZa3DN6ZXZLnN3LiLY9Nbvj8HGiG19v9/mDKjEZErJEhNg8P
	KQVTYz7GUlaNNMHlwrU6HSSSwnUgJm4DaSJEVQ0GialoY83g0PTaGIIMjkL0XIPw
X-Gm-Gg: AR+sD11z5D1IexmNS0bVwfCLyNNWM7eI2AMAJDtXIdwXfJ9gRLe2W6tcIBnaRLUsBg3
	K82NruBeIS6W3+yPMIpnKTblOy3uN93qPgWjMMe05qkAK3awgqNDZA34eh5ghsFUShjSvLPIdiE
	c+L3cHKPxeQkTmXjY2iSNn67q4cuPiw+rDVQ3BU01y05wDZ/uZ3ao9Vp935Dd+Ht7+oThqbzoRn
	4FNeT+8VHYETPMnZ7AhT+TnpvJ+K9GjZRbDkjunMaWqlmPC4YC4wmd6O7yW9iifKJ3kCJXa3fXu
	RDVM57LSblwkMASSakl6N4Q/GG+1HFUCcU7OxVKWvmfN1Bue9zZgV212xOrEGKuwY9cNkrq4GWp
	0vbYzIKhdgCp0ukDSJsjiqLN7yUH6ZxXgBhrADOoYMt+RlkhBuIMRIri/E6UwM6m21/7tTnZsNP
	wKr7Ok8u4lesZjVbrfLJoQuXKgpLw+/FyiCf1iWuR8t1T4Dme78U64XK6vvb1hZQgd468dJkRSt
	IQO69uG7eGl
X-Received: by 2002:a05:6000:29cf:b0:481:5f33:c2fc with SMTP id ffacd0b85a97d-4816078c9ffmr13200821f8f.29.1786794996637;
        Sat, 15 Aug 2026 04:56:36 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c129dsm16085455f8f.26.2026.08.15.04.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:56:35 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: [PATCH v2 0/2] Bluetooth: btmtk: fix subsystem reset error reporting
Date: Sat, 15 Aug 2026 14:56:22 +0300
Message-ID: <20260815115624.8309-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_045638_892923_C2A53067 
X-CRM114-Status: GOOD (  10.32  )
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

Two bugs in btmtk_usb_subsys_reset() that make it report success to its
caller when the subsystem reset has actually failed.

Patch 1 covers the case where the post-reset chip id reads back as zero:
the function logs "subsys reset fail." and then returns 0.

Patch 2 restores propagation of the MTK_BT_RST_DONE poll timeout, which
has been silently overwritten since commit 3dcb122b3064 ("Bluetooth:
btusb: mediatek: return error for failed reg access") started assigning
err at the chip id read.

Found while investigating an MT7902 [13d3:3579] whose controller stops
responding and never returns to the USB bus. On that device the failing
path can be reached on demand by requesting a coredump, since btmtk asks
for a reset once the dump completes:

  # echo 1 > /sys/class/bluetooth/hci0/device/coredump

The captured firmware coredump shows the controller asserting inside its
ROM rather than in the downloadable blob, which is consistent with the
failure surviving a firmware update:

  <ASSERT> system/rom/transport/tra_usb3.c #764 - BTSYS, id=0x4 idle

Both patches only correct the error reporting; neither changes the
recovery behaviour or makes that controller recoverable. They are a
prerequisite for anything that wants to react to a failed reset, since
today the failure is not visible to the caller.

Compile tested on x86_64 (W=1, no new warnings); checkpatch --strict clean.

Changes in v2:
- 1/2: shorten the subject so the CI gitlint check passes (was 81 > 80).
- 1/2: document how the failing path can be reached on demand.
- No functional change; the diff is identical to v1.

v1: https://lore.kernel.org/linux-bluetooth/20260815110119.11301-1-ismailtarim7@gmail.com/

Ismail Tarim (2):
  Bluetooth: btmtk: Do not report success when subsys reset fails
  Bluetooth: btmtk: Do not discard the subsystem reset timeout

 drivers/bluetooth/btmtk.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: 15ef2f78c49d20d53ec7c0f1c9b40b02e089f2d6
-- 
2.55.0


