Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D377AC36014
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=; b=hwHMbI37Y34oUHvxoemys4gtL0
	h9SWagFvWF/IIR5a3Bvomsc9JFC1NgGKruKj3IWIB0h2Mm9PdeyKrvooi68yx0Uyn08kGNDTPDvU0
	U2PTI8OAJ4Rl6FCXGouHEpbYsg3QYM6zuRP3HUhg0bHNUX7ytvk3yXq4OFLzUs/r8jw5u9H+THI1r
	AbUy93dxwYHhEAolhOtpLdtyEtjuIyotFh+8/7LukTrND3sfP50Xer+6mHKBxXU1ZX37qseq1GNx0
	f622v3MleGYtwMXHWNlcZKyvrzgBZFyGtkVKqRWe+/v37nphxeV9PNSYEVNgK75g/4yjd8+sPqLIU
	LeePLfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZAG-00000002fsW-3Okv;
	Tue, 01 Apr 2025 10:48:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYrz-00000002d7E-3d80
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 10:29:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso24556185e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Apr 2025 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743503362; x=1744108162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=;
        b=PhHM/5BFJgyxs6577ojBnMkuqKfN5LBdTPisGrp4pOAFUXlLsG7uRT8hYD2XWm6xkR
         cnw5v0oXOtO7moYEhS1ueOZSyxEjirAEWcBozOW5M4M10NU3MXhy5rRzNq1t4URuPZDY
         Cj7V9qtxJ4pP7+C7MYu8t5rk0R5DXXPrsrcuISGZ9iHxUjx0g4e4VgzMhi+T1OfqMXTK
         K7YXaJZ9tdh/cWgtjF2djMPrMvcfPntsU0LjnF/7FaRDhZBEScRWJ7jMpgabq4C5kwxF
         H0xuEzCchep35mDGJunxdxFBRRaLlCExUqGNE3eV/jd6ETyZQfZSV+uiOItS7IK7HDJ6
         9+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503362; x=1744108162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=;
        b=Cq250txY5YfOvfESHHpZyRNH7lU8yGuqs/BmpNwLA3BhWrwRMvVwKFvikbllpUu2Lw
         ROofATBuTkHcDORF/M7hdxWH3EiHVOqYQEC1wdo29/7vPRODSwPPQU0M9ROxWE++fzBk
         Z4m94fXXJrhEMcvzm4nrNOZRlg7WSOmDfF4YZapTYqSqX3cfX9qhUMktdJkgahK4atuP
         f1fqt0mc8slA4doaV+7LSxPIZJZJIFRHxUxXBVz+dX9Y1yCvDl6k9v4rvKn7jvqh7FBg
         k7YEmk5pEedJVmfHfAIsnIqY1D7Xa8Goy3Wt+KJBKW0BEbQsNyladiOf14hU/No/PloT
         Xv5A==
X-Forwarded-Encrypted: i=1; AJvYcCUjvLKwj77ro+nq+YG/MIt92i+rxXds4aH973XBwrOl8VPX6PiSWqJmAKhE6zB4U9juxRxvGLlxyR/u/GUcPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJ+cTGPbcMQQw02A1dsdIq+QJeMKKU9krVZEN+k5Mcyyd6Z0z
	sh9r0cHFMKJumkepq70CVDckbT7KkCTuJKJkqNbjvpXBPduOnsxHSAqlZeELP/8=
X-Gm-Gg: ASbGnct9eyJqVlt8VVOj8j1rMmhGzYLE9dJ9VQn3j9gmFe9yXBUFntezB54IEqlUQr6
	3VN0EeIg663xewC7oYfm6530bv77Zctbi5MQUSyQzLAZeNyjkbC+zIOVCBwEToK2BzIREfETGAe
	IM59FKFhGo7gyN9en7uhKcGyhjDHd9RaUEzltnoNmsociQ9yKc941m8S4++DUYRBcTiraH2BFyv
	BFLmOoysaDIsQXl5oqxC7SBWocPI5yzeZVLvIXJeflCyNuIp30UucFy5rx+QKnc1hKajYQOkei7
	IGbAgp7tfNtIyUYs8W+fYKJ4AIjul0hXRRGtrjeZbdbZo92m/8o0DeMMQdHjmfNmAx85MOJ3vww
	LVZSrYIGJEOg=
X-Google-Smtp-Source: AGHT+IGN/8xtmvsR7BrUAKwR9bwciAz3ATDbeXewiQ0x0Dm4mfRj6ANi/gUvbdb/jQ4tFiVRD9OXlA==
X-Received: by 2002:a05:600c:470f:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43db628b92fmr101141745e9.20.1743503361776;
        Tue, 01 Apr 2025 03:29:21 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e097sm13519539f8f.80.2025.04.01.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:29:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Patrick Havelange <patrick.havelange@essensium.com>,
	John Crispin <john@phrozen.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 0/3] pwm: Fix division by 0 issues
Date: Tue,  1 Apr 2025 12:28:58 +0200
Message-ID: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=k35u2EHomx5KhPtDUzNnrpfLz4tm2XgwgswH3kk6XHQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvTX+19/r5C6V2VsrFdyu6nCI97D7WLUi7BiU3a9cP9PY sm++1I6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIrlb2f2YFmhpltmbrfn6N qvb/tTlRo4737k99bQf1P8u8V7J9kehXm7L/umDdQ43AMIlGE73uss372p/+/3xYVyiw+C/b2di UqqTOArf7XkH1HxT67VtPLitWu7XZ/6/x1d3Pt7fU8uaxFfz+/X41e3a2TumEQxEnfkyWW74vVf ymQcjsmfrquh4FkhUpr26rVfo3PNKYnzO1vaFxC4ebwe3i1cypO65c5b712+Z3ZvjDhsePVU/Ft P/Z87Rkw6RDpqetCkv7wwINGfrScwJ3nusvV/0ZrayjyV9lt2baZNPtzhcU/4rPMn85v372apnH x9Yej2FTTXhz2ag/8dylgM+51d2dH488YnT/s/W/W40tAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_032924_175972_E1DCCEA6 
X-CRM114-Status: GOOD (  10.16  )
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

Hello,

triggered by Josh Poimboeuf's patch to fix a warning by objtool due to a
division by zero in the pwm-mediatek driver, I reviewed all pwm drivers
for similar issues.

Josh's patch is resent here, the two additional patches are new. objtool
didn't warn about these even though these are quite similar divisions by
zero. I didn't debug why these were not catched by clang/objtool.

I haven't made up my mind yet if I'll send them for inclusion in
6.15 given that they are new and only build-tested so far. Also the
commits that introduced these problems are already old (v4.12-rc1,
v4.4-rc1 and v5.3-rc1 respectively) and there is no indication this
problem triggers on real hardware.

I'll put them in my for-next branch anyhow for wider exposure. I happily
accept test reports to (hopefully) increase my confidence in these
patches.

Best regards
Uwe

Josh Poimboeuf (1):
  pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()

Uwe Kleine-König (2):
  pwm: rcar: Improve register calculation
  pwm: fsl-ftm: Handle clk_get_rate() returning 0

 drivers/pwm/pwm-fsl-ftm.c  |  6 ++++++
 drivers/pwm/pwm-mediatek.c |  8 ++++++--
 drivers/pwm/pwm-rcar.c     | 23 ++++++++++++-----------
 3 files changed, 24 insertions(+), 13 deletions(-)


base-commit: 6df320abbb40654085d7258de33d78481e93ac8d
-- 
2.47.2

