Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BBC982D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=; b=1crENphPcfVdFvkBoft4vLUAKL
	zJaMsHacHETcm8yYNI6Y0p/0ewNfCb7jH6rzcBP+ZOl1ECNSrMseFrer7zt7k6yP67k5Z4h481KyL
	Z5WplrOfKP1R8zkDppoieoTt94IdOTUDBUkxexZ2B5O1rJvORGRbBMcM1GhRJLcldG8vgSxYsSpy3
	fQYwgSAIUqHg8PQKH/nyRKiF5+55J/kOzH1ThksI73qzpVAE4MQT9DZAcaqHzaa2EepaOx66MlTAb
	0K3nXJmW/xhhD24RHo2NEOoftnHZxgcavRXrnhiEApDzdXLglpycX06hsLxlO/9gHyskN3f4Py6MN
	HB3mEbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkI-0000000DD91-1Hof;
	Fri, 18 Sep 2026 01:50:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkH-0000000DD7Z-2cGZ
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 01:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=; b=EW/dUjY6Ooc1o/V5BegI6ax7pC
	21ZZFolVPWkv/SuQNF3OeASkBn7jlAQ2QWD8V83uozs112dRI38e1FFYHruAbL0cqcMvKPspLB9EZ
	eC3LLuWgJwRYU8OmkG7TBqRMl2SnmQkyuJu2UnUAAWDKgTYJu5Wzj6KPtBSI5DT8Iy7mGIglFinD2
	HBq824ChIVkeDjr0Mh+J6+oYuLhAtIl/6enyPBooMB7m2GOmuZ5SwT86uJHK8e04W3ZHKjA/0JEfY
	h+IJPG9RbG+S2f7aPatkDPyXd0Of9B82YFh6bXevNl3OW/Ej4FQ2hz6g0CuuTjbFNsRlGOVgzIgo4
	cpqwa20A==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7NkD-00000009UqU-0B10
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 01:50:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so88811f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696228; x=1790301028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=;
        b=VP6RW1db+8fFj7hE84jKybqmgKtXmqN52L8UKYBdv7c0X0ZevevQyCVio8uDBOihpD
         kdTxuj/YMAHVc+18b5/XJphb0zvYaEETGR6xSDUCfwauXmgvGpiM5TNZqFEQLlTBkxIV
         6Y2lGtMUG7wrHuM0wji6FdbeouzUO/lXhekqdnJ3rwJ5sNdubI1VOKy/LQ6wcOOcLkXs
         kQ0+cEkRL6/i5S7uwb2oCawadLdtixze6v70apdq3nulOUjRtqwsy24G9lzXkpnHarq7
         48BY+0Db40h3YzLWkpELyGvwGNBNgGYnZYENbsyCq01yyVDYLI7f/NKp4Cd3CWdwE1aH
         I7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696228; x=1790301028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=;
        b=0fNJKaQDdSG0h6oOwg88b/RcmKPVlJjQtwtrfbVytBsOjgUcXC4+4pUq6QZaItvCpG
         Csy9IUwdGCDTJ9IPOuSjMFWw1HJteQ2T97j33NdiuC19lZqdkDfcAAdRuFzmMrmzE7rZ
         KwmJ/uJ2ovqQquT1RWO3tmcfBT3BF88Md1sJmnbyEw9RZjz+ip5XnaAqiMY1mkXVskNa
         a99puVUmVV8WwzEqKv+CJU2UPStBURf2UzdgaWeaqNopS1m97f3kcCf1OiL676hBpHsF
         s9h4d5CJyONJeE7HYN4DMKkLWHmaH9lgXwVgiqaDdjYmERAOqW609h5Uf0FTKA2uZLQE
         L2nQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8PMsZU0HplvvYWQgkQsAb+SCF8egvFm1GUyLiY/gNpg41AxLjE9NT5gCWaFjaHAApYtyfKtOFe7aSfHrlQg==@lists.infradead.org
X-Gm-Message-State: AFuF++k8vLjoeE95CamUSSCFxFNoTCqJ/+9URYLrDoZe7iFZ3obnd3/B
	pTL3QRKkUtf+BksiQ1JcgORO0G6QYzqyurGfN8yJrXHNQGuINkyp1suocu6I1gmsa44=
X-Gm-Gg: AYBFou1/9pgi/n8yO3ZqkzUsN71MIZa0IHHKqMVUdmW7Cps/qmM4VKbnTndK86U9Hvo
	q62MV+4ZgzVv75a/TLUT0XCVtEoplOVoiVR3C9/FdJtC7zQHetgx0iMm+NrGFAg6vn7x8Yt8dt4
	yf9oZDZIXXizOeJDvEk+twfOrUz+egxEkmpdd03y1gmLDjQtOEnmyTl+J33G/VyPrjT4MT1IOcl
	0P9KIxTMpuw4ZdZ2+c6k3E37VvbSusspzgHZp9scq+4LASyyAb8//AW22MGo7x+tuET7aYSyWgU
	2qm9usPrJxzxm9l/UvYGn2B6a3yuJpUjjbE21wEWZFdCoN9EM3MwEnJJKXcmDYHKbXz7eabAh55
	CT879wR0JXPLQlOnhcUuKtpkA/N74WRfWzGanaLLiRDPlgviFdMZ6Y9PgzjTkYQi2e+TJKkGYI8
	siLla5WmbExdzutuIkvSU225hXEKsyWjjqbUWSrOcBUQdVnrU1OQ==
X-Received: by 2002:a05:6000:2689:b0:487:c45:3957 with SMTP id ffacd0b85a97d-4871e370c61mr2016513f8f.25.1789696227840;
        Thu, 17 Sep 2026 18:50:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm70569f8f.14.2026.09.17.18.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:27 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Fri, 18 Sep 2026 04:50:19 +0300
Message-ID: <20260918015020.2518315-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015020.2518315-1-f@lex.la>
References: <20260918015020.2518315-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025029_343533_3AB1B0A2 
X-CRM114-Status: GOOD (  25.20  )
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

The core and io supplies are only requested for ID_MT7530: both the
devm_regulator_get() in probe and the regulator_enable() in
mt7530_setup() are guarded by the switch id, but mt7530_remove()
disables them unconditionally. On an MT7621 or an MT7531 both pointers
are still NULL from devm_kzalloc(), so rmmod or a sysfs unbind calls
regulator_disable() on NULL.

Fixes: ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Found by accident on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) while
looking for a way to tear a DSA port down at runtime:

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 0000000000000078
  pc : regulator_disable+0x14/0x48
  lr : mt7530_remove+0x1c/0x80
  ...
  x0 : 0000000000000000
  Call trace:
   regulator_disable+0x14/0x48 (P)
   mt7530_remove+0x1c/0x80
   mdio_remove+0x20/0x40
   device_remove+0x68/0x80
   device_release_driver_internal+0x1cc/0x220
   device_driver_detach+0x14/0x20
   unbind_store+0xac/0xb0
   ...
  Kernel panic - not syncing: Oops: Fatal exception

The oops itself is a process-context oops that kills the writing task. It
became a panic and a reboot because OpenWrt's generic kernel config sets
CONFIG_PANIC_ON_OOPS=y and this target does not override it, not because of
anything local to this bench. With CONFIG_REGULATOR=n the stub
regulator_disable() returns 0 and nothing is dereferenced at all -
NET_DSA_MT7530 neither selects nor depends on REGULATOR - so the severity
is config-dependent, and the commit message states the mechanism rather
than an outcome.

x0 is the regulator pointer and regulator_disable() reads regulator->rdev
straight away, so the NULL comes from the field never being assigned rather
than from an error pointer: with CONFIG_REGULATOR=y devm_regulator_get()
hands back a valid pointer or an ERR_PTR, and on anything but ID_MT7530 it
is never called at all.

The same shape applies to MT7621, which mt7530_of_match also binds. The
MMIO driver is unaffected: it makes no regulator calls at all, though it
does still carry the include.

The id test is used rather than a NULL check because the driver already
says "these supplies belong to ID_MT7530" that way in the other two places
it matters: the devm_regulator_get() pair in mt7530_probe() and the
regulator_set_voltage()/regulator_enable() pair in mt7530_setup(). A NULL
check would be a third spelling of the same condition.

Tested on the board above. Without the patch the unbind panics as shown;
both pointers come out of devm_kzalloc() and are never assigned on an
MT7531, so the fault is structural rather than timing-dependent. With this
patch plus patch 2, the same unbind runs to completion: mdio-bus:1f leaves
/sys/bus/mdio_bus/drivers/mt7530-mdio/, lan1-lan4 disappear, the kernel
prints "DSA: tree 0 torn down", and uptime does not reset. The kernel under
test was identified by the sha256 of its ELF notes section, read from
/sys/kernel/notes on the running board and computed in advance from the
image that was flashed.

dmesg is not silent across that unbind. It gains one WARN - a single cut
here/WARNING/end trace block - from sysfs_remove_link() under
dsa_user_destroy() reaching an already-removed netdev directory: "kernfs:
can not remove 'phydev', no directory". That is a DSA teardown-ordering
defect rather than a regulator one, and in this run it fired on the first
unbind after boot. dmesg is where it shows: pstore gained no new record
across the run, but pstore records only oopses and panics and could not
have caught a WARN.

That run needs patch 2 on top, a different defect in the same teardown:
mt7530_remove_common() disposes the per-PHY interrupt mappings from .remove
while the regmap-irq chip that owns the domain is still live, and the board
dies in handle_nested_irq() later in the same teardown. With this patch
alone, the panic moves from regulator_disable+0x14 to that second defect,
and mt7530_remove is reached at +0x24/0x90 rather than +0x1c/0x80 - which
is the point: the NULL dereference is gone and execution now gets past it.

The disable stays where it is, ahead of mt7530_remove_common() and so ahead
of the register writes dsa_unregister_switch() makes on the way down. On a
real MT7530 that is teardown talking to a switch whose rails are already
off, which is a separate and pre-existing ordering question, not addressed
here; moving it would change when the supplies drop, which is more than a
NULL-pointer fix should do.

Not tested: the ID_MT7530 branch, which must still disable both rails.
There is no MT7530 or MT7621 hardware here, so the disassembly stands in
for it - before the change mt7530_remove() falls from the priv NULL check
straight into ldr x0, [x19, #40] / bl regulator_disable; after it, ldr w0,
[x19, #72] (priv->id) / cbz w0 gates both calls, and ID_MT7530 is 0. Built
with W=1, no warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 784dd58a7158..de42f70afcfa 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -227,15 +227,17 @@ mt7530_remove(struct mdio_device *mdiodev)
 	if (!priv)
 		return;
 
-	ret = regulator_disable(priv->core_pwr);
-	if (ret < 0)
-		dev_err(priv->dev,
-			"Failed to disable core power: %d\n", ret);
+	if (priv->id == ID_MT7530) {
+		ret = regulator_disable(priv->core_pwr);
+		if (ret < 0)
+			dev_err(priv->dev,
+				"Failed to disable core power: %d\n", ret);
 
-	ret = regulator_disable(priv->io_pwr);
-	if (ret < 0)
-		dev_err(priv->dev, "Failed to disable io pwr: %d\n",
-			ret);
+		ret = regulator_disable(priv->io_pwr);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
+				ret);
+	}
 
 	mt7530_remove_common(priv);
 
-- 
2.53.0


