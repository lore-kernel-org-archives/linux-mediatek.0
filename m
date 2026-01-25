Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFFD7237B
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=; b=3Kf1csmD4l1Q9gKdU2zrY7GNTM
	4D8wgsTk1EUrLci+37ZZwPIdV3Hjrv8Ar7IcTACy3+iqgtw0bu3ux+FWxjBT4guakVfARFqnvfmGX
	bJq5iAkhiN9hR2ab48JZ2vkm//ppn/FzMbEz7y61WPf7d8DjlJhFky/HBpY+gIvRTeMTUsBPd9Ozb
	lcI0iIhZhqsiGw+TNtz+Cnx6BMNM5/JCq15AkwR/FD4D/PB4eHLvVjWuijtTRwe5PksMT/qQfkvSp
	87UInFVWQWooW5MGSB3AT2ALXmu7Dkdz+A6PMM/9rErxAp7ycpxzaIEOBv2aT2IL6wCjorSRqrlM0
	4JaEVUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HQ-0000000BYJq-2P6T;
	Sun, 25 Jan 2026 22:08:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HN-0000000BYIp-3wgQ
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:08:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82311f4070cso1601603b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378900; x=1769983700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=;
        b=i8LzdEmSbn2Ipo5eEvhiEPNUWmT06G5oGfd3QUZDixW/ZeUKm+CJwrkhEfkQlKMo5G
         kwKNTYqcUEFIQVdsl/S4PlD93+Bo1HUtuzaNT3hkI944M79Tpc67TxfNoBF+O8GNTHR4
         +hFTdg/Grr/xazYTJzC1gUKsSR8qBFtGuyqjCE8x9bpYgQ+JrbjwWxLOSzwQYxXnok8E
         VG+whpQwCq2vXg0gBLdgwT7JeJYEXbtaaXOoR3zDgT1H0JEoAMXk8t928bvipv00+bxK
         g9tll3mTQDBF023k/nLVtPm6O8B1z14k5F7h2jr/gm/HfRSRt2FkdttsgiUAsn5MOya4
         CBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378900; x=1769983700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=;
        b=o6xEh4yesOLWM/H2Key2cfZGLTCa+3Lfb31yOMr3vGvJeBCVnvosmkhAX42p+z6cyc
         X+nqJOn+uwgHlaueVWjls3ZY5ZFrjKUZMEpAZqvf99lVIXkSDmGK592nzWqjEhrDksF7
         AmvD2gO/jteRWG8Jl7pYYR9TgA2q69gQc/9QdibbbixcY3cxwXDcj1PVYlrpJln4ru+E
         NWPv46LP8LI/GoaUlOyXanhO28oOORj27KTHZInlTBhaI0MuRjoNGIjwb5sd9YpVMlLE
         ZozzayD520NIk+xW/q1rqrxDKg5+pXctNwLDPFj610icZfuUUcCb3NKN4QkkPEyXAl8s
         Idrw==
X-Forwarded-Encrypted: i=1; AJvYcCU2WcqaN0p6HpiKrQ+TqyUUN+4EhMR7gCrx4Pu/+ZGQl/frWAbR2mgumJVKuCRy2mfFd7YdjcrVcLQ4P04Zdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywMpq6DTe9hH6VQHLklUdb1XflzhuOzaP2EpWqJGvJL15c4K+M
	U8gb2vMOpH+DiC8zsVwO6dZP3Hfc9PutXU8cbX3XrSatfYQmGN9gRuBQ
X-Gm-Gg: AZuq6aI3QPu+RV5UsJ+bi1bXBXxQuQgsBlPDfTw79Fow7zDDru0C2RUdZyv9CGYD+vV
	+CvUPh6xPV9sbkS+P89W7bSOsuMa122kyz0ubprlGtPAugKwU8ktRbzDmk6olVp0IOTxaEdajKm
	gnyYggm9VRJ18exL/WCYsmtSYai9//Tdd4K2ijvw/qp9fQgV2K2ueyqKeO/WN7fFK2WSUtAGRjY
	h6jvTyaFmiy2BW4XvhKmzWRVIRoHxHA7boRXLiszlqxhRkbCJAwMjCTve2atv1KN9B6Ca7izOsY
	PcdEZ+nTRq+M18XlB7F1j3RnH2EJ2ucUUDLc22CbSAkyEkHcZqdaBs+OanFEJLvCzI+gTc7pDb8
	aiJIknZUbtC2t/0hP+aNZ1y3zask349ttxHbNBA3IEC2pYYBavnavRC76XKvNau2ogFZSeVJJFw
	rqMWGXmB5liHGWBQdBkR6m+1yJbuqSkH+fFdaLwEcscBDluqCLSrtgPbPcTwXW
X-Received: by 2002:a05:6a00:2e10:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-82341275fa8mr2266896b3a.21.1769378900326;
        Sun, 25 Jan 2026 14:08:20 -0800 (PST)
Received: from d.home.mmyangfl.tk ([45.32.227.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e60fsm7651286b3a.48.2026.01.25.14.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:08:19 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: airoha: Use u64_stats_t with u64_stats_sync properly
Date: Mon, 26 Jan 2026 06:07:48 +0800
Message-ID: <20260125220753.3984326-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140821_979759_6D30F677 
X-CRM114-Status: UNSURE (   6.21  )
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

v1: https://lore.kernel.org/r/20260122185255.2761568-1-mmyangfl@gmail.com
  - fix u64_stats_add()

David Yang (2):
  u64_stats: Allow u64_stats_add() to accept s64
  net: airoha: Use u64_stats_t with u64_stats_sync properly

 drivers/net/ethernet/airoha/airoha_eth.c | 153 +++++++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h |  34 ++---
 include/linux/u64_stats_sync.h           |   4 +-
 3 files changed, 104 insertions(+), 87 deletions(-)

-- 
2.51.0


