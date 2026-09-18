Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5479BC982D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=; b=zYxxmsa8L9HQh4zfcrukiMqsHX
	ZK8d9FquBnGMwwUG9eAy9pR23LJMwFwMyak7j9y5c4+f+k4b0Loe/6J1yysPsKnK9HZ12UBr1i15R
	rTyNrDlf6s5wLnUGa3Ob3SiFKMwyvIGXLs8JSA96KpLr73+H74nb17gqZb5f9BQRgNyhGj1WwYoxx
	IRdsTG2aDJWrJq/Vq5cK85h0MgH4ZDe/Sq68LHhJOBXe5iITo3g1GyO+Fmexwf/49ZRlr/1utf69a
	oVhSuVy1a+mxSWEj8XuonPRfngKfSnaaS7J5iSXG3DUc9G6qa9t2xIj+lFauryE4PiDjr07wgEltp
	h45bMiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkF-0000000DD6i-0DgW;
	Fri, 18 Sep 2026 01:50:31 +0000
Received: from mail-wr2-x16.google.com ([2a00:1450:4864:30::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkD-0000000DD5e-0y91
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 01:50:30 +0000
Received: by mail-wr2-x16.google.com with SMTP id ffacd0b85a97d-4834977ae75so69863f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696227; x=1790301027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=;
        b=C/BUudhXbMElJtq8LJ1Hybqk8k+au9M0LRUIwsqftDKwk9a2nntmdPBW2ThMS/D1Vl
         DFQRAaVPKh3bXOesWN2O2I6GjCjR7+0Rgl9DlDoL6dMRpG2C+2/h/8nD5VskQuRsEDTY
         clfwy7XxhSMVdyz412LMy6f99ps04GWWQnRL4BJN/wG0Y2FZSCmUEUX/c0tkoqtldTiz
         1idVDRfte58GrA2hHm8d0rvLUalznncim3I5b+5uH6Gy4k0XTj6BIKOKylTqgzLTagQI
         5MzV2V39YWKuuzow791l0YKSN7ZuElWPAl2WxMwKPYmjB06U98JJIM89//R92V8yWjow
         RXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696227; x=1790301027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=;
        b=qsyca2Bbr0EMgafW39yE1odxsdOZDZjrwziNw1KlpJ1Jne4xkALI0aZTk4HE+0Ixvi
         WC8+dyM6S8xv5dqZc6MqRYZDQDj3/YKmbFOwz7tkKO93DD+2wlDpbSHz/4R10cOSV6so
         zXPYKLJ8BMfCWp3ORXd73dlEKHtwnFTuHY/q343u+IChCI14CssenvciGk5d69+MweLA
         Cy8FaQX4FI3FAC4xaC67MkWJU5tg/x99nu2I2uWQtFiVWVEFn8waFM5s996S5aT/XFSH
         NOYXkjyO/huP5pgHtsnUKAfO/aZKXTlxrhZwp/Uu/Pa/INamkX/8wTt6WStSYX37+knz
         slzw==
X-Forwarded-Encrypted: i=1; AKwUvByaULlI2XbScyCUw0gEzD9VUJw4dtjWcob603dbE6bPYsQ6kH9GN+fY5aLOq7ITcqi3c9apDCYsS7WQaEcQmw==@lists.infradead.org
X-Gm-Message-State: AFuF++ngYjCDzoQT5twLy0846mj9UYc/K84Ev0Adue0Ea2damcNBGhck
	R8SjAVCWQUGtrrJGGyOLcBhlQFDSTKV58zIGydkD8/xQ6AmHq3wVfbPaKIVLO9inMAg=
X-Gm-Gg: AYBFou0HLu1trPFHtVokp68PHq905hsQLakIRyhCQIBbeXg7ZxWAzBQDpp4P80uVUJk
	lUXsWhAcDRSOAjUX0Mygy5+Ix+qrmvcEyiMOwU9JXInOtr9IfSC4RJeG0fzy7XGKkUMAbK2JYjC
	KRGQfjIWf5tQXHkybNSjfM37Olj2uxoGFwQUnrJzPJkLrbX4nwIllTZkbNA/zsxljZXKG5SDn9L
	6ynWiOiBOIQgQS/+WKXvfiUcTbP3KN/m/sJni5GSpZ+0pqZ/u4jPpyiw16DvOBChQfy8aCl85LQ
	5eJZNPYXUi3S4YN3iqbvxIw4WG4tEtyvU0ZhYZfmLJ9Gmo7yZFymPO7mN+lswd8r6oHiIDzg+Gu
	16ZKy0eRi1YOandRs3wFnVru84uCspUK2+R0xduXps/6o7Yla6j/3CcRCaarkAeI6hKGGIEb8kN
	SfbQG9jE9xoX4YAIjflKWrsIm6IH5nLWstXTPzZfTONKHmVikKGCB1pvYfn/rQ
X-Received: by 2002:a05:6000:4903:b0:486:f301:11df with SMTP id ffacd0b85a97d-4871e20cffbmr1925132f8f.6.1789696226372;
        Thu, 17 Sep 2026 18:50:26 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm70569f8f.14.2026.09.17.18.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:25 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	gerg@kernel.org,
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
Subject: [PATCH net v2 0/2] net: dsa: mt7530: fix two crashes on driver unbind
Date: Fri, 18 Sep 2026 04:50:18 +0300
Message-ID: <20260918015020.2518315-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_185029_340238_001857EB 
X-CRM114-Status: GOOD (  23.12  )
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
mt7530_remove_common(), which disposes interrupt mappings the switch's own
regmap-irq chip still owns; the regmap-irq thread then faults in
handle_nested_irq() later in the same teardown. rmmod reaches both, since
mdio_module_driver() calls .remove on module exit.

Patch 1 is the regulator one. mt7530_probe() requests the core and io
supplies only for ID_MT7530 and mt7530_setup() enables them under the same
test, but mt7530_remove() disables them unconditionally, so on an MT7621 or
an MT7531 both pointers are still NULL from devm_kzalloc(). It reaches the
MDIO front end only.

Patch 2 is the interrupt one, and it reaches further.
mt7530_remove_common() disposes the per-PHY interrupt mappings by hand from
.remove, while the regmap-irq chip that owns the domain is devm-registered
and its parent interrupt is only freed once .remove has returned.
regmap_del_irq_chip() disposes the same mappings itself, in an order that
cannot race, so the driver's call adds nothing but a window. That helper is
called from both front ends, so the defect also covers the MMIO parts -
MT7988, EN7581, AN7583 and EN7528 - which have no regulators and never meet
the first defect at all.

The order is not arbitrary. On an MT7531 the regulator fault happens in the
first thing mt7530_remove() does with the switch, so execution never
reaches the interrupt defect. The second only became visible once the first
was fixed, which is also how both came to be found on one board.

Found and verified there. Without patch 1 the unbind panics in
regulator_disable(); with patch 1 alone the panic moves on to
handle_nested_irq(); with both, three unbind/bind cycles run, two back to
back and a third after a pause. In the two whose dmesg was captured, each
unbind removes the switch from the driver directory and takes lan1 to lan4
with it, each bind brings them back, and lan1 relinks at 1Gbps/full after
both binds, lan4 after the second. uptime rose from 58 to 202 seconds
across the three without resetting and pstore gained no new record. The
third cycle stayed unbound long enough to read the descriptors: no mt7530
line in /proc/interrupts and no irq/79, irq/80 or irq/81 directory, and the
next bind reuses those three numbers - regmap-irq freeing and disposing
what the driver no longer touches. The kernel under test was identified by
the sha256 of its ELF notes section, read from /sys/kernel/notes on the
running board and computed in advance from the flashed image.

What hardware could not answer here. There is no MT7530 or MT7621 part on
this bench, so the ID_MT7530 branch that patch 1 adds was checked by
reading the generated code rather than by running it, and no MMIO part was
available to exercise patch 2 on that front end either. One unrelated WARN
remains across the unbind, from sysfs_remove_link() under
dsa_user_destroy(); it is a separate DSA teardown-ordering defect and is
not addressed here.

v2:
- patch 2 changes shape. Moving dsa_unregister_switch() in front of the
  dispose, as v1 did, only covers the phylib side: the regmap-irq chip is
  devm-registered, so its parent interrupt outlives .remove and the thread
  can still dispatch on a mapping the driver has just disposed. Dropping
  the call is what closes that: regmap_del_irq_chip() walks every hwirq
  below chip->num_irqs and disposes each one that maps, which covers
  whatever the driver created - the driver's own set is the user ports
  below MT7530_NUM_PHYS, hwirq 0 to 2 on the board below - and it does so
  after freeing the parent interrupt and before removing the domain.
- patch 2 points Fixes: at commit 254f6b272e3b ("dsa: mt7530: Utilize
  REGMAP_IRQ for interrupt handling") instead of commit ba751e28d442 ("net:
  dsa: mt7530: add interrupt support"). Before the regmap-irq conversion
  the driver owned the domain and removed it by hand, where
  irq_domain_remove() disposes nothing, so the call was required there; it
  became redundant when regmap-irq took the domain over.
- patch 1: same diff; the trailers are reordered and the message now names
  devm_kzalloc() as where the NULL comes from.
- v1: https://lore.kernel.org/netdev/20260914202421.2737079-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
  net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 drivers/net/dsa/mt7530.c      |  3 ---
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.53.0


