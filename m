Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB6C88E73
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q25WzWwVYwq5QcrvqlyZdjNZKxAtYxiiLN2181JL96k=; b=UB2eAAKf+/ExvF2YQDY22A756W
	42oxssLdt9GJo06MD4g/3+RyA05/YJoAbva53TwJWvFC15/YzePem6yINAWZPkFa/9Mci5XFrsm6K
	Qc0oE1ovtTHKjWUQ3f9cOJvr4iriHWcnxY0zsAqfZzKPeLYMoHmkqu4HrdKWy1vYMn5BsYs1TVUZ+
	YlF8bQQndmG2XEurKetbu9OvQdmA96DLVCRCcimb2jzDlPbnuBqv4VZ0+AzCQr7tK33d6PO98TGQM
	FUE4l6Mg//8JEB5Z05muz08HM35PivWdBKyRifNBsmXBwkHdqFsoqwi6QpfmKzpZGD5VrjuRGTf1j
	h2jdtPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE8-00000004aCl-218P;
	Mon, 14 Sep 2026 20:24:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE6-00000004aAY-3CX2
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 20:24:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-485850cbac3so2125804f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417467; x=1790022267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q25WzWwVYwq5QcrvqlyZdjNZKxAtYxiiLN2181JL96k=;
        b=DwF0f5UMoI75wjM0I33OTpM6sBfc68X4Cgj5ully4CMYS6mujGaqIHG5gASRNj3wY0
         WtWYMhC/MirhPxZ4Ck7xRRlqwNW2z0fx7G6ERn4pqVQZK7DzdoO26ZCoCm2CwoW+6I09
         1zsS0lb70lXronsqKy3xKma6Xc4FOMpArXStKmqwiXT04czEbzBVIgEb8AcVLiIEJB/T
         4v46Rahnu2HNzsiNiEVGBVuKc2bQAVQVU6wZ/tl7BUmCgZMhYAf+FPvdgkDkAvvyQkd8
         QSM5QmEtphHJ7eBH4/0fGeIppjR8hbSJ6S6wSZBK/+ymHyB4C9V5AcunXI7I/Dz67pkl
         dJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417467; x=1790022267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q25WzWwVYwq5QcrvqlyZdjNZKxAtYxiiLN2181JL96k=;
        b=qSfKXFwKNmrZ1aWBM3zGHxAG537xTxh/6zAPvP9yKEYJ3JKwtgyQtCgbNr41hkcF2N
         tgIbzohXwNz9sWAbpkdgxXpBbId+XyYwJsokQJCJJVUxKa2vxr/ojcI43J9kM54JfQKt
         hGVJ8pTlpFCfpWEbI63Vc2fme4yMpvZPQ3dzUgGWHhUUHopv7CGYfFMTuWGbzKjnB0ZC
         LcUTVBal06y0GClFcAXhQykTdxS4Rvnz5BXX2xWSufk28TbNrVXg1pU6KryU8qBRoCqk
         3/qbZqqXwEUiFMQYwbJUsqgJR+/PQXY+Owo6HFN9TGeJ/qDZ7lh0DLHCiaMyQsQ9CSzq
         T9dg==
X-Forwarded-Encrypted: i=1; AKwUvBynE0iSw03uTfn6VPl/VRHTWGbu8EGGy9yar3HCitDakEkAG1o7ZmWDL4ng7PYBd24HqGyOFkXBuBF299GfTg==@lists.infradead.org
X-Gm-Message-State: AFuF++mb2PwENCK82eS65opA8RPN672lYnSamcFf6aEig/Rzk9qQj6pe
	52rp9a86yBXgUrEfSt02gJQGrv4V7x2FAg+qQbZp2NSPwwYlt6cGD2O8Me6QZzmk1Bg=
X-Gm-Gg: AYBFou0mVoDybkkxHRHCRmfUh1RlugIiqDz7FN5WjLwpKVZOeRgWkwxi6ZckjHhHlR5
	OnIDEBTlerQR2xRxmQiE5eO5CAvD9GmDgCaFi2+I0/qIFt6q21+Qgv52FfAY8dIItSBxNJVcq6b
	XP1jnF1DF1X9f21FF0SE3cX1wug5G3480X/pj3sWQwsD8TvlD/yA1skYyY9tsw3cQqxAu7OI44S
	97+eQhQYHBmN/NbLR9dUwOFu6YW3RT3oTo9rk6xkYiq9pHELKmTanuplZzzUC0Jb2ZzuB8TijRz
	BU8FzlkakZVBYNtvbCcTRrC71jJzYIFjWOeyGT2WNU3uGGCw2dQZDQri6GiQN0oP90OA7WDFHTm
	4XsvjdRtWVBKPG3CzQmpcZGUBBuF55kwxWejdkarVwVB2CrFI2yZQLsPqzCd+nUJeUdWPgCGf4b
	yYJtS50s7WfXyUdj3Of/GG8SK751PnEG9/WBi0mk4JShxqAZGevh8=
X-Received: by 2002:a05:6000:4020:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48706f21bdbmr155435f8f.25.1789417467205;
        Mon, 14 Sep 2026 13:24:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:26 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 0/2] net: dsa: mt7530: fix two crashes on driver unbind
Date: Mon, 14 Sep 2026 23:24:19 +0300
Message-ID: <20260914202421.2737079-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_132430_829232_D5C9121C 
X-CRM114-Status: GOOD (  17.33  )
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

Unbinding the MT7530 driver from an MT7531 dereferences NULL in
regulator_disable(). On a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44):

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind

oopses there, and the build it was found on sets CONFIG_PANIC_ON_OOPS, so
the board goes down with it. Fix that and the same command gets as far as
mt7530_remove_common(), which disposes interrupt descriptors a PHY still
holds; the switch's own regmap-irq thread then faults in handle_nested_irq()
a fraction of a second later. rmmod reaches both, since mdio_module_driver()
calls .remove on module exit.

Patch 1 is the regulator one. mt7530_probe() requests the core and io
supplies only for ID_MT7530 and mt7530_setup() enables them under the same
test, but mt7530_remove() disables them unconditionally, so on an MT7621 or
an MT7531 both pointers are still NULL from kzalloc. It reaches the MDIO
front end only.

Patch 2 is the interrupt one, and it reaches further. mt7530_remove_common()
disposes the per-PHY interrupt mappings while phylib still has handlers
installed on them; phylib only frees those in phy_disconnect(), which
dsa_unregister_switch() reaches. That helper is called from both front ends,
so it also covers the MMIO parts - MT7988, EN7581, AN7583 and EN7528 - which
have no regulators and never meet the first defect at all.

The order is not arbitrary. On an MT7531 the regulator fault happens in the
first thing mt7530_remove() does with the switch, so execution never reaches
the interrupt defect. The second only became visible once the first was
fixed, which is also how both came to be found on one board.

Found and verified there. Without patch 1 the unbind panics in
regulator_disable(); with patch 1 alone the panic moves on to
handle_nested_irq(); with both, two unbind/bind cycles run back to back -
each unbind removes the switch from the driver directory and takes lan1-lan4
with it, each bind brings them back and the two cabled ports relink at
1Gbps/full, uptime does not reset and pstore gains no new record. The kernel
under test was identified by the
sha256 of its ELF notes section, read from /sys/kernel/notes on the running
board and computed in advance from the flashed image.

What hardware could not answer here. There is no MT7530 or MT7621 part on
this bench, so the ID_MT7530 branch that patch 1 adds was checked by reading
the generated code rather than by running it, and no MMIO part was available
to exercise patch 2 on that front end either. One unrelated WARN remains
across the unbind, from sysfs_remove_link() under dsa_user_destroy(); it is a
separate DSA teardown-ordering defect and is not addressed here.

Aleksei Sviridkin (2):
  net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
  net: dsa: mt7530: unregister the switch before freeing its MDIO IRQs

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 drivers/net/dsa/mt7530.c      |  4 ++--
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.53.0


