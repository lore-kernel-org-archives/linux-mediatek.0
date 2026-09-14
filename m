Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A5C88E6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=; b=1pLzMVhsaoUbDBszdEjHS0mmfX
	ym0urFrpRyMv97rC2F+lHvxSfhbAi+vGqFyidru7fBetLM1tQjmGnRCI83cn9XpKG/kQsXLf32Wxr
	XWNpu/qZ9qOqe8Yxbv7ITLJK/1xSeemRoBMP/i9BUlaMs7qV1yCVw7as73YqqOXcADVU03jPEcdUW
	Qu+Epee3IGM3guPw7TFgjnpXmiYugPxCdI4mJ6fgXhFSbfqeLgRVOSiKGCX5z5ta9pUfHva6mEHgb
	GRQsD+xmYIYNwasR+dLCQhhK5jiCgNdxLBSql1zUHEsx0+GB7J/2RWeye+MjD5E1tX0tUqlnhnfZ1
	lrg60HLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE9-00000004aDE-2EdY;
	Mon, 14 Sep 2026 20:24:33 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE6-00000004aAw-3J8h
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 20:24:32 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so3530396f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417468; x=1790022268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=a70eft1l+wQbBbUGTcpj3IAfgARorgvqGRlO1Bw17uV8qYkCLxWezahMQDvJeXbtKc
         Qow5T2+6rITod6tTM4yjlNRkB4qNXsXVO9W6WILXJE7wDPH6uSkMKGhokfvq9x+Mk0sS
         zQM+qGOi51gtcR5w7EwD5UcYtJK938SR4a5pmu6whBn/eE/UKRzK07672jDtHQeYngt4
         EXOZdNwkns87rhRC79Yc7KqRQRuPeIXnvfAbgE+ktFkTBQVLfDjClKqL3up1ywRAgyYG
         ltcoi8eHAErgj/u7cnZ/xN0BkxV7CO4Gbv7JNP6nrFucsprQtXTZa6+sLVnp0nWpYnfJ
         fwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417468; x=1790022268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=tU7Z+XaOHh9cnAde27BicBLMSgoDDA49Uh/RjEJgB/BSBDE1Gfgogityj3FMMEfvN/
         GsinFlZ3r8abL4sy9yr38DM04q1Akr+VwpWsLopq55NNgkwcDJQ7oi+mQK+LUYG09c7g
         bVPFrr7hUiomx3r+LUs+Seg2ZwuSQl5aDalgH7Um9VsbsNV7AEyI+rBgGk76yrwtQZf7
         fFq1IfxjrsWIHXCq+nj6BEyfkCQBYyocZDwOugq94J4dXEZ63UgBJRrlQ6w+JNEpjkZm
         1B/xK1lvPTmfe7oKISLCypBn2i5uVwWOs8fAjpbB8Cy3+6Wm0dEgkQ07lai8f8ObDehh
         SlIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCrA/E+RveNTp9yreLUMSxmz92yyy3jYRD1ZSXjzOMU/Pah6TG5ycvjNmZIklc5brph5y4QKv2fhvndFxITQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lXT1IjjP4iCGIeyVIifOP7lRi4ojnzxNknxONt6nY+6iRW8t+y
	/HB2qnd24FEGocj//LlB/eL4OMChoXrAQCBAc6rW71yNyGeWCnWmZw+aryXSj0bMCxE=
X-Gm-Gg: AYBFou2sCLzUnFMhqBHlQ2u+SnKUuBuyMfZnIxJKYE3X65If/eJIBoe8m/ZXuew/hC+
	sbVxTHQzYn/C8mGuPH1KVZqE7k34gcmlxK9mJbCVcr4fhiag35Pa0kC/nrBYbe5kZBpErqA/LTp
	NmVCx0MxwSsuYJ65a08h/v+dwABeam72u180OKnEQw3Rf63vYLXcFJPXTslTA9hePMTYMrKEY6o
	tjyjro5WGX0AZ+Gdn8DEM9hv/2UQ6/PEG8jyEjuTr4tuqi62OKH26LwolwoUd+I339StHar+ysT
	m3EW5z/1belT9rZnqXeFUEtjS1OddDieHZzc3NUjeSKI3EBD5FNb63LwUxxB1cEE/zdjD5ncc3Y
	3NUQmYSZ2VXaaApZg0INffHRlpNl6rsxZRKcRChTTLPbl1Zz+UnP2vYGqE0iMQ7beJ6N6TTScj3
	1EsvV304LHzC4rl1xMprn1ccq4gwKvrix+8dm92ep0xq04dq1L8A==
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr5519268f8f.18.1789417468530;
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Mon, 14 Sep 2026 23:24:20 +0300
Message-ID: <20260914202421.2737079-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914202421.2737079-1-f@lex.la>
References: <20260914202421.2737079-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_132430_853967_9970A22B 
X-CRM114-Status: GOOD (  23.03  )
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
are NULL, so rmmod or a sysfs unbind calls regulator_disable() on NULL.

Fixes: ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Assisted-by: LLM
---
Found by accident on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) while
looking for a way to tear a DSA port down at runtime:

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 0000000000000078
  pc : regulator_disable+0x14/0x48
  lr : mt7530_remove+0x1c/0x80
  x0 : 0000000000000000
  Call trace:
   regulator_disable+0x14/0x48 (P)
   mt7530_remove+0x1c/0x80
   mdio_remove+0x20/0x40
   device_release_driver_internal+0x1cc/0x220
   unbind_store+0xac/0xb0
  Kernel panic - not syncing: Oops: Fatal exception

The oops itself is a process-context oops that kills the writing task. It
became a panic and a reboot because OpenWrt's generic kernel config sets
CONFIG_PANIC_ON_OOPS=y and this target does not override it, not because of
anything local to this bench. With CONFIG_REGULATOR=n the stub
regulator_disable() returns 0 and nothing is dereferenced at all -
NET_DSA_MT7530 neither selects nor depends on REGULATOR - so the severity is
config-dependent, and the commit message states the mechanism rather than an
outcome.

x0 is the regulator pointer and regulator_disable() reads regulator->rdev
straight away, so the NULL comes from the field never being assigned rather
than from an error pointer: with CONFIG_REGULATOR=y devm_regulator_get()
hands back a valid pointer or an ERR_PTR, and on anything but ID_MT7530 it
is never called at all.

The same shape applies to MT7621, which mt7530_of_match also binds. The MMIO
driver is unaffected: it makes no regulator calls at all, though it does still
carry the include.

The id test is used rather than a NULL check because the driver already
says "these supplies belong to ID_MT7530" that way in the other two
places it matters: the devm_regulator_get() pair in mt7530_probe() and the
regulator_set_voltage()/regulator_enable() pair in mt7530_setup(). A NULL
check would be a third spelling of the same condition.

Tested on the board above. Without the patch the unbind panics as shown; both
pointers come out of kzalloc and are never assigned on an MT7531, so the fault
is structural rather than timing-dependent. With this patch plus the unrelated
teardown fix described below, the same unbind runs to completion: mdio-bus:1f
leaves /sys/bus/mdio_bus/drivers/mt7530-mdio/, lan1-lan4 disappear, the kernel
prints "DSA: tree 0 torn down", and uptime does not reset. The kernel under
test was identified by the sha256 of its ELF notes section, read from
/sys/kernel/notes on the running board and computed in advance from the image
that was flashed.

dmesg is not silent across that unbind. It gains one WARN - a single cut
here/WARNING/end trace block - from sysfs_remove_link() under
dsa_user_destroy() reaching an already-removed netdev directory: "kernfs: can
not remove 'phydev', no directory". That is a DSA teardown-ordering defect
rather than a regulator one, and in this run it fired on the first unbind
after boot. dmesg is where it shows: pstore gained no new record across the
run, but pstore records only oopses and panics and could not have caught a
WARN.

That run needed one unrelated fix on top, deliberately kept out of this patch:
mt7530_remove_common() frees the MDIO IRQs before dsa_unregister_switch()
hands them back, and the board dies in handle_nested_irq() a few hundred
milliseconds later. With this patch alone, the panic moves from
regulator_disable+0x14 to that second defect, and mt7530_remove is reached at
+0x24/0x90 rather than +0x1c/0x80 - which is the point: the NULL dereference
is gone and execution now gets past it. That second defect is being handled
separately.

Not tested: the ID_MT7530 branch, which must still disable both rails. There
is no MT7530 or MT7621 hardware here, so the disassembly stands in for it -
before the change mt7530_remove() falls from the priv NULL check straight into
ldr x0, [x19, #40] / bl regulator_disable; after it, ldr w0, [x19, #72]
(priv->id) / cbz w0 gates both calls, and ID_MT7530 is 0. Built with W=1, no
warnings; checkpatch --strict clean.

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


