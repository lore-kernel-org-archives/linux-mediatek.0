Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E5606EE88
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OcATPMYy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwSzU3HM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=; b=OcATPMYy/sqGYo4k0jpRQPlgjy
	yApzhVgQARwXmueEB96Hs9IYxOq3mS6Hpz05DH11kF7BAmDtLs0bJS86i9rhzszBlYHSjxpTz/DjO
	jUIQxNeBKhE/W6co4nQ27gHWP1kS6Kyu70fJPT5F70N9sDC/SBzr8Mw4MHCOveY3XahL+2ybS+8en
	dXu6AEmB+8GyFZWY8urICKg4b5N5d0Do2ujLPm5okXoH/z5qOzg3iINms4bZ08Ovhdkyd5ejfvNHU
	nupSo0tbvQXSnt2Svf1qx56fz2saIWcqBJaDGSnFx/mQRM7WnlN8YkO230OWG0lkw0YHghXMFokhu
	L0SPC+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gR-0000000AgEL-0kYe;
	Thu, 05 Nov 2026 21:07:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gK-0000000AgAR-3G1O
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2279712a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912852; x=1794517652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=xwSzU3HMS38W7bj18Yn63BGQkzbuSeMZBTIx3yymZXAyc7HZnUYNBLy5V91hqVXm45
         0PidIh0W7w7fn/n5evSaQPi8OnTzz3llX3tAdW1E3LTffy7kjd6dCn5jbZ0GZ9u63qjL
         BhF7y5PEhyKMZi95gRPYnWCLqGQzroQ3k+uRYXrh4bS7ywiSJrogGdYRHYIM35P0dcUG
         Yr0iLsmZniJCuf90QYkLuk89f2IP9wXr0j+JW7tgumOaZki5KyBv6gVF+lhfmjoaa6Lu
         2GYHrjlYeiRoLO32KuxCJ3MCY7KW130lJwsy4sUZOb5DwBPaInFQrl4LWTuuN0wWVEla
         49ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912852; x=1794517652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=2BhVUpAChnnacvVx/VTzB0/DWu1fIDemb6Oe4UD/+stjRZ1+X5Yyam5kG704MyGU1s
         /dfSOHanXf7SEhDwJU7T+ze44OrQtJ7ohNAAhFhQRt6qd7I6kcHeHormnY38XQuQ7V4w
         vM5qwPS0L4GVOkGGOYXCGymJcn2cPMs495G1DIBVQ7kJlcFvlpR+Wr2kwnI/1i61PjCV
         99bb5ddOZUs85stb6O2MjAIAHVyvmzqP5/zKQPg5zmzEXAegi7xMmAstMgVWQ4rvWrC/
         J6bjzP69uXiig2IwQa6UEFmyam5FhMfwT8RiVHscKQ7a+7qWiM0LrAlkcIH38h1g/IJs
         WnmA==
X-Forwarded-Encrypted: i=1; AKwUvBxEvCU7sQQ/ScGkgfDhJs8GxTiyrp5SS9YUG6brNtXjBJz4QuhWBaMGrUyNmdDiRCbTQdwPXU9+Dgs7kNbgkA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+9h4IBZmnKqJNgr9Sua1sGWuz8ZChR+VwQCReXnzLUmrRL3Hd0
	JLPYcMfUd1ZBx8KQUh9VkUDsMWLpsq+pZ9+tSopFDIfhDn0+Ou3nzXqwBFE5rlunF4rCl40i
X-Gm-Gg: AYBFou1ziLuc+SO/x+FttfpIKafNVdHdiuegF3e+z/ENbs0k8EYMts1BOwXJSrS/tpn
	wVGCBy139A9XhNOd3gGsoHPZaDqLAF803nEQrjeWrwEnqBfZ02ua21lBxNf4U+NwTHqqcA9UjOb
	OrIlFrnxl7PnCUCoasceFecj2NR+uxCK7jZPBluWvHFwJ3afQNZQYWw+XtQWXpodFVcKO9MmmDU
	4q/IJhamoiLPyhFwUsSAAY1gREVZZmIHMam47D2l5ThYLQrM/lME1J+9B9FxVs45jrWc+YzUFu1
	e/KpncmZQvFufn6SZUjrTuHP0Ic+JVHFQW74KkvEoO+s2Q6Z894QP0DL4MPE5BewowQ/KocFwuK
	Cmn/HhAlfoNKT8e0ClbYB/KNwo2w2ZnfmVGm5Bb8KLFW0NWGef9UFAExCHlt98JTQXVhxHkI3m9
	4aithgwgH+d3XzdfSD/KxCdZEYHgZj6fC0WlIjnXv7ExO7Hb8XGVOXK8UkW+fxOAVWRkvxRGqQi
	UpuWjpKc6+HnruPxKHc56Zo7DU5lENdjnDXxu9kxJlfC/xBY8lJyRcataAis3pkQB44JYxTMNXC
	8o1ew5hjtBgSP19NUHY/vJlhCszi+BH9lKpx2tqmtRg6kCjYmA==
X-Received: by 2002:a05:6402:13c2:b0:6b4:c971:589d with SMTP id 4fb4d7f45d1cf-6b59780391cmr343744a12.13.1793912852256;
        Thu, 05 Nov 2026 13:07:32 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:31 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Date: Fri,  6 Nov 2026 00:05:58 +0300
Message-ID: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130736_827057_D876C296 
X-CRM114-Status: GOOD (  18.35  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for the MediaTek MT6895 (Dimensity
8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console.

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The ramoops driver probes, and the console log survives a watchdog
   reset. The last 30 lines were clean in the final run.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

dt_binding_check, dtbs_check report no issues. checkpatch reports only
the "does MAINTAINERS need updating?" warning for the new files,
which are already covered by the existing F: pattern.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261102.

Alexander Letuchiy (5):
  dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
  dt-bindings: serial: mediatek,uart: Add compatible for MT6895
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
  arm64: dts: mediatek: Add MT6895 SoC
  arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  |  46 +++++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi      | 166 ++++++++++++++++++
 6 files changed, 219 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

-- 
2.56.0


