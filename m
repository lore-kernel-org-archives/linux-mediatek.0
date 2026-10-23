Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CE606A31B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 01:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Imdnd7+l;
	dkim=pass (2048-bit key, unprotected) header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=uRf4P+mh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=; b=Imdnd7+lWjhdpw4EBrlPt06ob3
	cPIT0NdhjxV2QnmLam1uDP/AtfLgphZI8XTEZqS4zLUpuMWL0ULCOb3pRna/I2rGCEZ9OvMeWiZyo
	n5Yi5rVIlKjz+0rhkZACDrZF747LL4HrXlL4XyOcRqsA1UmlRLPH6dQs9WqNznvf++t6Fmqxtu+oM
	/YsDHGAEK9uTJ/blYFMrGjJT1zm7UZ9YW8IpBHtIqcOcC75TW6LSwOxF6LvGsBrTZUtjkyHnMOocN
	YXoJ14m0D+wwSp61awWUw35mA0A7Tz4jYQhlpVeYO21JDl3zjoAszbv2a18WoojQE9ueWlpB2tVzc
	K8b+lhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK42L-0000000FGVD-2AwQ;
	Fri, 23 Oct 2026 01:25:37 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK42H-0000000FGUC-1GOG
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 01:25:34 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1931ff67a29so953509c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=goodkind.io; s=google; t=1792718732; x=1793323532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=;
        b=uRf4P+mhRQlyycAzjGAQuFRFJfkkmc1KIMgEzFiIC2KNtIAeP+XglBOH9mJhHPFQe4
         eYBQ2SUEc2UT7njk4U9oHwOl8P5NVXob5+6Gu+QJ2c4P4zJDYNdO6RezGBF1WQHN9iGH
         zJGsllcH3FOoOGW3SIKGcPIRTq6KkJBkUblYCCavlA+4/JBJ9sh7OIX9FvxopDOm36Mj
         BcU8xs4stwfIUQeMvj3sUXci4LNKWqFW6rbIPsr2mXrFDj4d/FJaM1WAcSwBmgpAXVzT
         I3QkIhK4xkRMT9bQSUC7Gbri0Ueoz4B38M2BUHO6OhubOagQX6uE13eB7EhJkPxbGM98
         8jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792718732; x=1793323532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=;
        b=rLOGdJtY09wLy59XZOf33uxR9nxxI8u4N6n+1+8F3kpy7+yJDbgz2Mlvjq/ohYFffA
         wRfBMK/Yz6NlljVIvB6zV+QcJPHUzJuMw0apYf8FuKRlZe1X7vvpqTjXst8CdFnjhgdD
         bmI81VEBM0IeUZgzldaMkZQ+Pg6qxmr3+RWQ4KIcqrHlNV+udiXqQsGAcNsghBYq9LTj
         S0eWFWiaXhXHhoBfvVAuyagF6ZY5/bwA6imUw1I6XIExaCbYslIB0YKUgK8XdOr67EuJ
         ggA7leSIeRYgCoqBbUl7GPdMD9q3ZHxS6SF+My2D33o5/ME0ZpHVkCSZlWavzwOUm0Da
         B31A==
X-Forwarded-Encrypted: i=1; AKwUvBxFFi6SgPclZrR1S1RWhzidmbJzi9mUyN4IXaoG/gYrLNI2rQdpJJrNBde8IdxJCJsM8wCBLT2iCbdCImV1sA==@lists.infradead.org
X-Gm-Message-State: AFq9FYINdfbXzQLorxBAUjey4dcqdVV6OVrEOdl50s00BQeew5O1EUoj
	ns5hW73hiQ7nfjeg6mZVVL0V31oNlsXbDwkzBFNSGYNL9MqFQ+5svRZ495XaE9UU74M=
X-Gm-Gg: AYBFou1C7vX04Qf+apeXEdqGVPg/m5OdNQwtf1aJ/aQrO4buUBfXIo68dT9IOPo/P8A
	kpHfUx9C3+VputKqHOFzt+tPBRUzYfQh5bPc7QaDDC31zFXtMi/wpDP+xsD9a+YYlPE0L69E2oY
	aw44sqYjIn+/IbN14WmgxB2aDXBH9uLibz0btfB0eo9BOvRe/faTCRkkHF3OKODYxCM6eoJ0XlB
	q9pC1QUGPgVLyJ+JkQRbvHZd8p+Tbn7BkVhWc2f5xYYDPlWufGrNkvQQtsQr+RzXL9xpfUQ9qre
	CTGJVYAn+U0iD60C4UZFEznZcAjR0ZxlvlIHH6GXhr6Uo4Y6dtX75lb7C04wno3rFSFnWcXo43c
	s091lUlnmcgqVC+OwC+BYPLzL+reGQDy16eZrgostY7ubRX1+CBz92gY4KF4ZlrR/6DuxG0b6Ee
	ZaM3+qFMs4gkJTspjXKCCK0JlXRFIStooeWYw1hGOOKB+SwDTC7gBjJ4rQ+4luOWNiQzqYNc1wh
	+d4g7Y6RQbj0J9++ZJSPxxNJMHoAXPJg94ynTW6LLSXxg1/S4EjShMkN85JyrIjFAJHIvc=
X-Received: by 2002:a05:701b:42cc:20b0:176:d885:4e94 with SMTP id a92af1059eb24-1959f9df88bmr1360589c88.26.1792718731771;
        Thu, 22 Oct 2026 18:25:31 -0700 (PDT)
Received: from localhost ([2001:5a8:4296:4f00:7134:385:b14:41ff])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-369d9d89b1fsm1703137eec.11.2026.10.22.18.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:25:31 -0700 (PDT)
From: Alexander Goodkind <alex@goodkind.io>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alexander Goodkind <alex@goodkind.io>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tarick Bedeir <tarick@bedeir.com>
Subject: [PATCH net] net: ethernet: mediatek: preserve sibling PPE bindings
Date: Thu, 22 Oct 2026 18:25:29 -0700
Message-ID: <20261023012529.5994-1-alex@goodkind.io>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_182533_354146_E3ACDBF2 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__mtk_ppe_check_skb() clears entry->hash for flows bound to other
hardware slots in the same software hash bucket. This makes
mtk_flow_offload_stats() skip their hardware counter updates.

In the regular flow branch, clear entry->hash only when it matches
the slot being checked.

Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Link: https://github.com/openwrt/openwrt/pull/26107
Assisted-by: LLM
Signed-off-by: Alexander Goodkind <alex@goodkind.io>
---
The MediaTek Ethernet driver stores forwarding rules for active
connections in hardware slots. For a bound flow entry, entry->hash
stores the hardware slot index. Flow entries for different hardware
slots can share the same software hash bucket.

OpenWrt's driver maintains cumulative packet and byte totals. During
each statistics update, mtk_flow_offload_stats() subtracts the previous
reading from the current total to calculate newly transferred traffic.

Losing a hardware slot association lowers the current total used in
that calculation and causes unsigned underflow. Conversion to 32 bits
produces a false increase of about 4 GiB. Subsequent calls to
mtk_foe_entry_get_stats() return only the unchanged prev_packets and
prev_bytes values, and mtk_flow_offload_stats() subtracts identical
readings and reports zero increments while traffic continues.

Two UDP trials reproduced this failure on a GL-MT3000 with MT7981
running OpenWrt 25.12.5 and Linux 6.12.94.

ARM64 allmodconfig and allyesconfig builds passed on net ffdf678dd166
with GCC 14.2.0, W=1 and CONFIG_WERROR=n. Patched builds did not add
warnings. Existing -Woverride-init warnings fail the unmodified build
with CONFIG_WERROR=y.

Codex assisted with investigating the counters and preparing the patch.

 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -764,7 +764,7 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 		}
 
 		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe)) {
-			if (entry->hash != 0xffff)
+			if (entry->hash == hash)
 				entry->hash = 0xffff;
 			continue;
 		}

base-commit: ffdf678dd16610e3f006dac904bd37c09684673c

