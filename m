Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC934C624D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ama4vcz/XSYo4+pHJyqT2hFXL9IvS3KsjPeWoufTaYE=; b=1jmnFeRjx5BLv86BVwEvwNccLp
	D21BXsJPe5EalOPJxfEAKPuy4uGB2BWcHfrgRhZ2GE5abFMQZoPxLyzmg/KtIM1AiDuCpWVvrfn9H
	dTnLQc5ahf7xWmYDGJGVVDl+8MDKScQ4SGu1yLb21oNnK4JTDMP+xu3EW6SfmYJKnEFXOiqPSKFvD
	9GdfALF5Enz2j2fy7n6eiL1eL6Jam4uE2CD5bO2KmqqQiuXBgYgANVGd217Lc4TbW96htpMe2q+HQ
	NMzygCraVJCElnisuYyYqSTt0YcUGwUhG+Ps8B5lY9xotlA7SK04fiOakUaDGlxcZa5/1qad9exwr
	CFps9vJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQQ-0000000CfQk-3zjx;
	Tue, 01 Sep 2026 16:33:30 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQN-0000000CfPi-3uto
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 16:33:29 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so21301fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280406; x=1788885206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ama4vcz/XSYo4+pHJyqT2hFXL9IvS3KsjPeWoufTaYE=;
        b=Gzv6QUED+lMdLGS/gilH2IpuvFfrvvHvlPi/3V50ryZZLkcI8j+kqLa9jVpc0wM8Ty
         rAnDViik9wgox2JVq24Ko7+KTG9Af5BEw812ANtZ7qDCtJDt98wUDJ8xwF0PVOkN+rdr
         ibs3+JYnsgKXfl5Wsar42eEki2vN5se7iRj7Yg7X455jTFYERhrceiC2KXm7QAA23UC5
         3ea2GFCp4QRLOIEoLd0TbqxtF85HBQTMX7QqCZu4DBO/rdzMViAFQekL23gIc6bhSSiu
         V+S9lKTWBgCgpR+YyCzXvv90atulM3hudIrqoYF2oAJDDijoGJtSaIN7qmRilNkjJZfM
         QrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280406; x=1788885206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ama4vcz/XSYo4+pHJyqT2hFXL9IvS3KsjPeWoufTaYE=;
        b=CNDoJsOrEaKk02gr8AM6KLGiTHXqEFKUgMJb+sjNc2eZVncz/QSMSwRzJcA1bNmtrP
         mlqX/72DJyCCl4Cohfx/2HU+GDflvMhq+yWJB++Rwey96wR5iBSxmVU+EJybXcD28BuE
         ckyJLiI0HjiFB3xPIcFo1srHfpT8dN1B5C62V/IcGy3n1tfMG/I+m8SXnw6VVz7bTiiF
         RolbmMm1oc07k/whLsk7zNOknKPwNRR0PQRIIvdaUJwiCA0Q37G1NIq1+IJgaTu7Ermv
         fcoL5MMH5Hh61bvgACSwFlvrwhi7MeSA7J6uQIUYq+eHtqiWhWbz1QKRv3deXK//Oyf3
         S4BA==
X-Forwarded-Encrypted: i=1; AKwUvBx5bHxlE2Z6V+aNeHsii5qYSZLsXhglFqcvld4/gMo7yXydZ+/+Rvm8+hkJ+4kMVLIgdh48TshwWwqI2eGPoA==@lists.infradead.org
X-Gm-Message-State: AFuF++mpz7D71wWDX7OS64QWglbC9iTfzTKiZTCrBdXt4BHSJJ/32+R6
	G8gFyU0+pTZkJCMmKpOTeLD5Lh4nHGiON5T+HY0bx1FId2xUSvrTNvM=
X-Gm-Gg: AYBFou3sIJutBmdUnvJx0B9XNdq8xhyg1XfAIC9zoas06VHG3kPOvN6dRAizY5PWrk1
	xkgiqSUsp9hcRW/+lqmre801zIsRfYRfakcjCrJOTgfwwVe8e7RimeYWY3uA/zdDnB6FaNYMEsz
	WjGe9/R1A/VRsZWPnHpa+z8vlMfqekEEEOvyv9CpjJAtLp52ITwOoIkXoKHwjKqiKfUgCjwxm2t
	Ta4tq84aGxVS5Ko11H79GaN/9HeTIauP/VlLtI+a12jozA6KXWRt7R/WqKvXv6e/IACE1/56kB8
	QeNj/FeBnDYlkJn6JmNIJuLIzR8wFsGBdD1A5i1dR6034NYQgH0fBuLhskUZC0kVQq/259o08NN
	E6vLrg7XVMri+LnA/Ak1X4ctLWIGTkXqcJxKYXGGP75L72FLAZN55CE0qdgqK/QFC+SR/ubRoDt
	8jTs9FMrsywV1LEcCAY9x8D/W5u3yWOzYNl1qLp+95UI8WHftximMdYKn11NUrdyo=
X-Received: by 2002:a05:651c:31d7:b0:39b:128e:ae68 with SMTP id 38308e7fff4ca-3a30175c52amr67573001fa.0.1788280405342;
        Tue, 01 Sep 2026 09:33:25 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8ed967sm678251fa.7.2026.09.01.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:33:24 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v3 0/2] net: airoha: fix silent RX loss on the shared CPU ring
Date: Tue,  1 Sep 2026 19:32:52 +0100
Message-ID: <cover.1788286284.git.sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093327_995453_D8196662 
X-CRM114-Status: GOOD (  11.61  )
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

v3: dropped the RX ring stall recovery (v2 2/3) as asked [1]. At 128 the
stall does not occur - 500 forced PPPoE reconnects over 20 h with the
detector compiled in and armed, zero triggers - and it did not fix the
bug on its own anyway. I will resend it if the stall turns up at the
larger ring.

2/2 keeps its code and its Acked-by; the commit message changed. It now
cites the register capture taken with no recovery in the tree instead of
numbers from builds carrying it, states that 1/2 does not cover this
failure, and quantifies what the bigger rings cost in memory.

v2 [2] answered the v1 review: DONE-bit overwrite hypothesis disproven,
QDMA_DESC_DROP_MASK never set, RX_DSCP_NUM default raised to the vendor
SDK's 32.

Still open for the airoha folks: in 2/2 hw set DONE on descriptor 15
while 0-14 were untouched and the driver's consumer sat at 0. Is
out-of-order completion within an RX ring expected, or is the driver
violating a constraint on RX_CPU_IDX by leaving one descriptor unposted?
Growing the ring avoids the symptom; the rule behind it is still unknown.

Tested on Nokia XG-040G-MF (AN7583) on a live PPPoE line. These two
patches without the recovery are what ran longest here: 508 forced
reconnects over 20 h 32 min, zero rx_dropped/rx_errors across 39158
samples.

[1] https://lore.kernel.org/netdev/apaA5jDYH71F0JaS@lore-desk/
[2] https://lore.kernel.org/netdev/20260831234701.206021-1-sochnev.v.74@gmail.com/

Vitaliy Sochnev (2):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: grow the small RX rings

 drivers/net/ethernet/airoha/airoha_eth.c  | 16 +++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h  |  3 ++-
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.55.0


