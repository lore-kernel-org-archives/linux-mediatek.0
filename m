Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B8DCA5FD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=; b=U4Aq96ggt0cDNTNqzdZKnlIQyV
	+bJ2nd/OkSstm3imdJ+4kA8PlM88GEBD44RGkMfHEb8sTykUjHk+e+7iz7yAn2COwtQHOJZHC5Wyi
	9v9+oq8y9EJdQtnxaZvs3W4tidMBYrzr5eDZTXAoz1OzE/8ibU6pM/BkBlS4M3HC0RdA8SgNRHUSt
	W+CeU+azWt6TSdf0XwIix1ymhGU7+CS/L1RUIGNpi5WyFhEQ2Cdhvi2SBet/Kx9kztPOUCkabLWgN
	7KhTmBnuKVGUcc1b1tbelOfx9VN2W+fiM6uqkIdTfEWAb6I1GOWemvRqmmpmkwKVvQwH4vXOskz+6
	lpwSliig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaP-0000000AoJn-23DF;
	Fri, 02 Oct 2026 07:21:41 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaM-0000000AoH1-1u2i
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:39 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afd5b1678so1459617f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925695; x=1791530495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=l//pQyNjcvY30pQEAZR96dxUDuTUoBi2QJko+Ddq+DvyVl/S4q2EsS6tqZeog/GeER
         t3VMb/eJ86IgH3tAYCDBLCqUXfMMUla5RkqKSmTW3xhvYtjxgEIfW3fcNQaOm5mYi/5m
         0iJXBB40yqlYTuWapL5zxVSNBhrniuSVX8ksV0WzdAIpfg2uUk5LDfHw2WKTB2cM9MtE
         6p0L7D010fcDELo433xQyUEVsi0Xwj7LYGAXf8xkqHfxSd0R8lObvqa315OOK7Fa02QT
         Q6QxwWKFdBY8fovv6IrwM5lhhz88cZoo98FTXnWaBO0hK9ealpbNoj3mXM+47oiYqKiq
         2zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925695; x=1791530495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=AbMUnmLI3PD44pQtgI4yuV5TErZE4VS/3JlBpUnXZgv96+UrIpmq7BWgNQ8HS7pfgq
         kQ+YWlUj1HwpZAsRAI0fH9tCVOrXSct8TLBTxhl1yAtbKWvSruBiKYmu7JFCULX1EsiC
         LrCSejrE8tdK73BlOSxjOy66d1DpOkOA570fLeTDqJgnX632/Ee3apqWRHvAstdrgZz5
         fnWSZN6FtdRL/3WRjeBMmgftTk/Q5J4rFHPx8AvLUfflsJiuDVlQtEz9RWzg/WKyzeTh
         jwkFlVAYb1cEnqMO3Wm2OYk4OSHTNmEfdqaviGn7+kOL5bOnN/AU5k2uI2z4xuKl0f+p
         6qLg==
X-Gm-Message-State: AFq9FYJcmPLi+rSqJtgH0r1wECGc0hThhnCUF9jVDERSrPGDWS3KP8by
	Rjj4CDwPkTBBtuebi3NuuBh4PoGARHDwDzPCWlMt1Q3peznK6KIPFc1XxR/tmg==
X-Gm-Gg: AYBFou19OBNmWQ5g2HHQw/bl3X7o0XzgdkSwKyhK92hOmRPjmnmv9/F9e+ejw2X+K8V
	VcX+rJSYnkhAiS5YPC3eI/pL653KK0d3hLAyzRjDHJebGJg7ULmEUQMpgGT4VWA8SXcbItq9lg3
	h6Rpb+VCi0hfACbac7RbkqJ8yn+biT6rYa0pLrn3WLWcR7/9M7hIsKVhSm+rtOPcDfGi+rcwlpl
	0WpE5hYdq+DWNn/BCUp5N6sXIhPkFPAtgLStATDX1k3CO5yHEtPxvpGuioVnXmP6DXYNusPgbnB
	yk9400cwDCTVHQPDoNj4lUURiWJbGpP6Wm5IRBuxfLrN3hYoqfKhotOGkO1xP7DUFlSKasGlXoz
	DTOregItzhQ1svSQAi0XumTazWmVLmskqF+Rmy3pvKEpA9kkQbEAwHzQlwm0HhLsscENOmzv7lJ
	EJG9RDpfLG1pxQfotCDNGTlaT766Ee0BTCaJVanR1wkLm95PH+w+s/M1QkGsCL/EI5FQ==
X-Received: by 2002:a5d:5f05:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b126f5423mr3564843f8f.1.1790925695200;
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Convert MediaTek GPT timers to OF probing
Date: Fri,  2 Oct 2026 09:19:25 +0200
Message-ID: <20261002072115.169250-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002138_516179_18B2EB60 
X-CRM114-Status: GOOD (  21.00  )
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

While chasing a kernel freeze on the Lenovo Tab E7 TB-7104F (mt8167), I
stumbled on the MediaTek GPT timer driver. This driver is currently early
loaded via TIMER_OF_DECLARE. I noticed that on mt8167 (and I guess mt8516
too), this driver actually fails to probe because its device tree
declaration depends on two HW clocks, CLK_TOP_CLK26M_D2 (13 MHz) and
CLK_TOP_APXGPT (bus clock). However the driver providing those clocks is
loaded later in the boot process, leading TIMER_OF_DECLARE to fail with
-EDEFER.

Patch #2 converts this driver to OF probe, fixing this initial issue.

I noticed that other devices avoid this by connecting the timer to
fixed clocks instead of referring to an actual clock. This approach
may work on mt8167 too, but I think referring to the actual clock is
cleaner.

Once the driver probed successfully I noticed that even if it was enabled
by the boot loader, the kernel would quickly turn off its bus clock as
the driver wasn't actually requesting it.

Patch #3 enables it and attaches it to the timer device. I wondered how
other platforms made it actually work, and noticed that mt6735 declares it
as a critical clock. This approach might work for mt8167 too, but same
reasoning as before applies.

After those fixes the driver probes and works correctly, but I would
occasionally notice a crash at boot inside the timer interrupt handler.
It turned out to be a side effect of the bootloader enabling the GPT
timer at boot: an interrupt may arrive and be handled while the driver is
not completely initialized.

Patch #1 fixes it by requesting the IRQ but keeping it disabled and
enabling it after the clock source initialization completes. I sorted this
patch before the others because it's actually independent of the latter
two and may fix (rare) random crashes on other devices.

Please note that all the changes apply both to GPT timers and the SYST
timers, but I have no device to test the SYST ones.

The series was tested on the Sony PlayStation Classic Mini (mt8167).

Re: patch #1, credits for issue discovery and suggested fix go to
matemiller992 on postmarketOS forums. I am submitting it upstream with
permission. Not adding Reported-by or Suggested-by tags because it was
requested not to share real name.

Unfortunately, this series did not fix the tablet randomly freezing during
boot. Any idea on how to better troubleshoot this is more than welcome!

Luca Leonardo Scorcia (3):
  clocksource/drivers/timer-mediatek: Fix random crash at boot
  clocksource/drivers/timer-mediatek: Convert to OF probing
  clocksource/drivers/timer-mediatek: Request and enable the bus clock

 drivers/clocksource/timer-mediatek.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


