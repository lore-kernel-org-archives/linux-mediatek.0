Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6280C88E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szNLjYOWpVIGeVzTm6wu2jNgdA0Q8lKnYCuvZd0lPlE=; b=RAexgaHauFrfGs1qSiB2P0Nn7p
	TcSqPQBWaIOzmAPFkav08CFZC3rzg81B4aAHYWAdE3ZmSaGaU9qcb+wgbBuzXrWG4M4fibUTSRBCL
	erSoJM9XwdSA/+zzqkUR3FMh4vIYKOecf/MMKJRaLSizTRFGXWz/iFhRm9ov9XgQmp5Ay33eCYfTd
	Gt4M4zgCTVECiYovfRHmfnjIT1+3+Pd8Rd83rJgLtrzRZ/Hj+a69G/e4qCylw123QAJ6/tJJavzlS
	zjdwPtSQQlfC/Ue62Z2XlXSnPruREKyReu2bi7MDNInQQWCQeFLOP1ChjqOD81qny/gVa2k9eSNhU
	VDF8na1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEA-00000004aDw-3zrG;
	Mon, 14 Sep 2026 20:24:34 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE8-00000004aBK-0QyQ
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 20:24:33 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633cd80so1083910f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417470; x=1790022270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szNLjYOWpVIGeVzTm6wu2jNgdA0Q8lKnYCuvZd0lPlE=;
        b=QvAU9IHcu8XfSOT47V7JLW6ORwiViKdwIjOpuLwWJDKGt/tkQmBwyyEGOlQ04Nnh4I
         Bbfs1Yc0iGqp2cRzdyb8ArWKPGKSWv8QtvN3bjALQ9ae33Vd+zDMroszv3WGt3bSMt7L
         2i74ft++hPGhvDAzxUbFrOsYzVFf5deSjnmRiAG2CeRHSyG+4QZ4YtCGs4ym3FxL0+57
         MnYd/OwvWqNVMx8PhB4O1s7bo8RQwhmXjOIW/sNbyS5OTPCAhlGd0HlN9JOUYNmRnkyZ
         8v5vjRCksXRS3ZgoWsMi//TWL8YAwtyU2qscVC+miboEpEyCNS4E3tQHo2uh7Ggdgq1F
         DdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417470; x=1790022270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szNLjYOWpVIGeVzTm6wu2jNgdA0Q8lKnYCuvZd0lPlE=;
        b=kRv9ZX4ZOUecXohpsDcVu0CXukhaATT/r+PIcl48UtXkB242ZGDZajpBTpLiCAFC/x
         cMnECvZKGBnxQ3MD9BvPJh38KNgIvYSvD8tLFUVRQadvna6FtvAVyokOlWWnpiYw4gQ6
         95BDF60Fz0Ggt4XTLmm8yWIAZ3n3xO1Yj9ClmalJpA/meelcI9OaJOCm+MuDmFiFRflx
         0Vyc0LimQjdv5ozD8CcHJCAM83SFyUwQNUI8HjRBc1wutPyj/enb2UbskmsfK8bKf/Tw
         yIe1XM4mvpxGYBexILnnnVylxIeAmImTyUWYFEuXOO34T6SgpEF/qXyH5T9ptMbojq+Q
         v3nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcOwTxCmYifsg9KXRGX2sYLG7F+lca/uTZz2Y3zANKic2GEl1RAK9urKZGJiXzWI8OMWxL0eUbVK24+je/+w==@lists.infradead.org
X-Gm-Message-State: AFuF++lbQbrCWlezi2+8pysp4BJk7Snf8GtclNi9+0u+j+XciapGsSKD
	R2DPJEVxT+wDhPFKGFPurfoYwQzi0M6espuPEgsfDjnbLASgwo+ALKKJCEi7l6MLdu8=
X-Gm-Gg: AYBFou2z2UUqsXGzJg06Wgm9zZ8cPYQrfPdAog82f3v+HixLUMrIhRgNoQWEevDp3qT
	seoZXGpO7gRJeIuzxsvHuHR9d2OPc4SVzFxEyHeJlp2Xbb50kdMZhZeELHr8dnFSLPWGPOrF8oQ
	5LYi6trLBIK3LLXCjS8XL2rGHiI9YQ7x2RON/bOTHwH4o5ikFee+TK80TQw22Kywvg4Li+7dz/X
	e+k5DAgqHe07W3kUCRjPgtrw4rK+lebLB2spDSbSrIG7RmgjeiyHP3EUtLmSRkYHkqaPow6RnyN
	0+UREcmzY9Jts3NBHd9NfFufE28sW4zIJtnLYWkzk+53YuVcnX65GWuw/zwqctQ6Jf8TFsuG9lq
	qzZ+ANGvDBLM/Ov6c4rn8fSkUv5bqIX5en1LPfMb9b9agR2bWOGOmKa1AM0nP3DiKxiXGpJ4r6P
	t1OtNg34C1HdWg910Okwk5ApHG7NYfy2faO3hnqxeE3x3Q7E19TA==
X-Received: by 2002:a05:6000:4282:b0:485:95b7:fe8 with SMTP id ffacd0b85a97d-48702b1665bmr5620151f8f.25.1789417469778;
        Mon, 14 Sep 2026 13:24:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:29 -0700 (PDT)
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
Subject: [PATCH net 2/2] net: dsa: mt7530: unregister the switch before freeing its MDIO IRQs
Date: Mon, 14 Sep 2026 23:24:21 +0300
Message-ID: <20260914202421.2737079-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914202421.2737079-1-f@lex.la>
References: <20260914202421.2737079-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_132432_170248_C4A27047 
X-CRM114-Status: GOOD (  18.87  )
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

mt7530_remove_common() disposes the per-PHY interrupt mappings first and
unregisters the switch second, but phylib only frees those interrupts
inside dsa_unregister_switch(). Unbinding the driver therefore frees
descriptors that are still in use, and the switch's own regmap-irq thread
takes a nested interrupt on one that is already gone.

Fixes: ba751e28d442 ("net: dsa: mt7530: add interrupt support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Assisted-by: LLM
---
Found on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) directly behind the
regulator fix in patch 1: with that one applied the unbind stops faulting in
mt7530_remove() and reaches the teardown, where the kernel says what is wrong
in words before it dies.

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  remove_proc_entry: removing non-empty directory 'irq/81', leaking at least
    'mt7530-0:02'
  WARNING: CPU: 0 PID: 4629 at remove_proc_entry+0x1d0/0x1f0
  ...
   mt7530_remove_common+0x1c/0x30
   mt7530_remove+0x24/0x90
   mdio_remove+0x20/0x40
   unbind_store+0xac/0xb0

  Unable to handle kernel read from unreadable memory at virtual address
    00000000000000ac
  pc : handle_nested_irq+0x28/0x168
  Kernel panic - not syncing: Oops: Fatal exception

The WARN comes from unregister_irq_proc() under irq_free_descs(), fired for a
mapping that a PHY still holds. The captured record shows one, for
mt7530-0:02, and already carries the W taint bit, so at least one earlier WARN
fell outside the ramoops window. 294 ms later the switch's own regmap-irq
thread - PID 627, Comm irq/53-mt7530 - takes a nested interrupt for a mapping
that is already gone: irq_find_mapping() returns 0, irq_to_desc() returns NULL
and handle_nested_irq() locks desc->lock without checking, which is the read
at +0xac in the trace. Both timestamps are from the same ramoops record.

Reach is wider than the board that found it. mt7530_remove_common() is called
from both front ends - mt7530-mdio.c and mt7530-mmio.c - so it covers the MMIO
parts as well, which have no regulators at all and never meet the defect patch
1 fixes.

What decides whether a given switch is hit is not the irq_domain but whether
the PHY interrupts are mapped on it. Either mt7530_setup_mdio_irq() created
those mappings, which it only does when the devicetree has no mdio node under
the switch, or OF created them from per-PHY interrupts properties when it has
one. A switch with an irq_domain and neither is left alone: irq_find_mapping()
returns 0 for every port and irq_dispose_mapping(0) returns at once. The
teardown is guarded on the domain alone, so it walks that loop either way.

Tested on the board above, with both patches applied. Two unbind/bind cycles
back to back: each unbind removed mdio-bus:1f from the driver directory and
took lan1-lan4 with it, each bind brought them back, and the two cabled ports
relinked at 1Gbps/full. uptime went from 167 to 183 across both cycles without
resetting, and
pstore gained no new record. dmesg carries one unrelated WARN, from
sysfs_remove_link() under dsa_user_destroy() - a separate DSA
teardown-ordering defect, handled on its own - and it fired once, on the first
unbind, not on the second.

Not tested: any MMIO part - there is no MT7988, EN7581, AN7583 or EN7528
hardware here. The object file was checked instead:
after the change mt7530_remove_common() calls dsa_unregister_switch() first
and only then tests priv->irq_domain and calls mt7530_free_mdio_irq().
Built with W=1, no warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3e61eb3c2b1e..90fd04665ebf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3593,11 +3593,11 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
 void
 mt7530_remove_common(struct mt7530_priv *priv)
 {
+	dsa_unregister_switch(priv->ds);
+
 	if (priv->irq_domain)
 		mt7530_free_mdio_irq(priv);
 
-	dsa_unregister_switch(priv->ds);
-
 	mutex_destroy(&priv->reg_mutex);
 }
 EXPORT_SYMBOL_GPL(mt7530_remove_common);
-- 
2.53.0


