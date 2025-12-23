Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36892E6F07F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JINWkNlBVA42ytHcLJmSVLg9d+5qzFZVzAsHJd+b/AE=; b=ezhCnyUDUlrahS
	7igsfetDNxfQYe560/z4yAWxGXk3xGPYYzBEASN0pNSIhbPF4lTgjulplibtxkFRG2z+zQ2pPIGj7
	Zf6EgpoYB+H/0oRAWM1z/u8Q8vItHdip4aEjVAx6p0YH5C+Q5/fwqHek53mja/AFH8qcdxhF1EygO
	P8n4pYjRovo6MXpS1eicb11uFInL8JZU2RaqNE4F8a/ARjlawXjWBNyncwxqhpC9h8L3ktPOKNKgm
	dCXEcd7oS1+v2Rfv5j5dq3xPlcWktnK+LMA2P0M2m5c50nZ9xLvx4kVN9W4uvm/RWBL5tTOhxLR3R
	KmM5bsBawkqnXB1t3Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzHD-0000000Eqg5-43nC;
	Tue, 23 Dec 2025 10:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGh-0000000EqAy-0pBW;
	Tue, 23 Dec 2025 10:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 117ED42DFA;
	Tue, 23 Dec 2025 10:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDB3C19423;
	Tue, 23 Dec 2025 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766484322;
	bh=/zYcG2xYSdYnuLSHKUx/IzmXhDPgwtNTHCfAvrduQQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKLFqC2Uk/cCGXFRXMAn2Gzcw2zEpSryMzNseG+JvPxBF8EekqKOGdnG/KNk/s8/v
	 HV4Y4xH1RZuMNpSqWtzbp5D1p4NZ3HMtz8kl1dGnfqkMmzAsxo8bNnfTs3Q4Kb3YuQ
	 0fo0oiZxQGYse9MTDFSVEw6mrVUJg9J3MHYV2vOZ1Q+Ec7ixU5NGk4aJXwHAUsfOIS
	 6z3ba3eJ5QoEmSPBLC9MnCHHm1EJ1Rj1v2tAGt/WCVSykxcD2rZRCXTdxbVOXzFVSt
	 386BYtxKRVwG68h186xPxLf218r6+T+4G6tdkVYnTSXb9FG9Gdm4/N74J80viarGH5
	 jxpDYjn7Vwgdg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
Date: Tue, 23 Dec 2025 05:05:07 -0500
Message-ID: <20251223100518.2383364-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223100518.2383364-1-sashal@kernel.org>
References: <20251223100518.2383364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020527_502966_DA9BC7A3 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fei Shao <fshao@chromium.org>

[ Upstream commit 8c04b77f87e6e321ae6acd28ce1de5553916153f ]

This driver is migrated to use threaded IRQ since commit 5972eb05ca32
("spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer"), and
we almost always want to disable the interrupt line to avoid excess
interrupts while the threaded handler is processing SPI transfer.
Use IRQF_ONESHOT for that purpose.

In practice, we see MediaTek devices show SPI transfer timeout errors
when communicating with ChromeOS EC in certain scenarios, and with
IRQF_ONESHOT, the issue goes away.

Signed-off-by: Fei Shao <fshao@chromium.org>
Link: https://patch.msgid.link/20251217101131.1975131-1-fshao@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** 1 line
- **Files touched:** 1 file
- **Complexity:** Trivially low - just a flag change
- **Risk:** Very low

The fix is:
- **Obviously correct**: IRQF_ONESHOT is the documented standard for
  threaded interrupts
- **Small and contained**: One flag change
- **Fixes a real bug**: Transfer timeout errors on real hardware

Looking at the interrupt handler code:
- `mtk_spi_interrupt` returns `IRQ_WAKE_THREAD` for non-SPIMEM transfers
- Without IRQF_ONESHOT, the IRQ line stays enabled, allowing repeated
  interrupts while the thread processes
- This causes race conditions on `mdata->state` and transfer handling,
  leading to timeouts

### 5. USER IMPACT

- **Who is affected:** Users of MediaTek SPI devices, particularly
  ChromeOS users with embedded controllers
- **Severity:** Medium-High - SPI transfer timeouts can cause
  significant functionality issues
- **Real-world impact:** Confirmed on MediaTek devices communicating
  with ChromeOS EC

### 6. DEPENDENCY CHECK

The prerequisite commit `5972eb05ca32` ("spi: spi-mt65xx: Use threaded
interrupt for non-SPIMEM transfer") was first included in **v6.12-rc1**.
This means:
- This fix is only applicable to 6.12.y stable trees and newer
- Older stable trees (6.6.y, 6.1.y, 5.15.y) don't have the threaded IRQ
  code, so this fix doesn't apply

### 7. SUMMARY

| Criterion | Assessment |
|-----------|------------|
| Fixes real bug | ✅ Yes - SPI transfer timeouts |
| Obviously correct | ✅ Yes - standard pattern |
| Small and contained | ✅ Yes - 1 line change |
| Tested | ✅ Yes - real hardware testing |
| Risk | ✅ Very low |
| Dependencies | ✅ Clear - requires 5972eb05ca32 (v6.12+) |

### Conclusion

This commit is an excellent candidate for stable backporting:

1. **Fixes a real, user-visible bug**: SPI transfer timeouts on MediaTek
   hardware
2. **Minimal change**: Single flag addition, no logic changes
3. **Obviously correct**: IRQF_ONESHOT is the proper pattern for
   threaded IRQs with hardirq handlers that return IRQ_WAKE_THREAD
4. **Low risk**: Well-understood kernel mechanism with no side effects
5. **Tested**: Confirmed to resolve the issue on real ChromeOS EC
   hardware

The only consideration is that this fix only applies to stable trees
with kernel 6.12 or later (which contain the prerequisite threaded IRQ
commit). For those trees, this is a straightforward, low-risk fix that
resolves real hardware issues.

**YES**

 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 4b40985af1ea..90e5813cfdc3 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1320,7 +1320,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, irq, mtk_spi_interrupt,
 					mtk_spi_interrupt_thread,
-					IRQF_TRIGGER_NONE, dev_name(dev), host);
+					IRQF_ONESHOT, dev_name(dev), host);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register irq\n");
 
-- 
2.51.0


