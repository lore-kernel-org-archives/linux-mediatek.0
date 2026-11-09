Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EC8606A326
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 04:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SL+CdrbC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiIbbLf4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=; b=SL+CdrbC+xILGXr4NL6g57y4AA
	yFE9+d7xymMsFljeOKakARdBcST7zHmNiGgsR5oVWGv6DtWq7NQncSSxKT0Ag2QLXKFnbiz4S+2qk
	lXFR58ctOPrf51Rq1w7plkgD5BdFA6MHq9h8sz867zupAprkVoKHWUW0w8j1r/aZxuPe9nCbQbfRr
	mSu4Amg+U40PevVWYIAtqGCD5d4rHmChdaM3MUCN/AcLOyWFitYtXHDjrg4iqjkwv4r0b8QvwbfI1
	bcrjrP1fdK4VD4O06KtvC9ouz4nTACeaF+HyWqMpymDSmgVbSWpU4B2BJxC9tfrz/OrT+OfwzIzty
	OzAf50Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDE-0000000HKrg-34pw;
	Mon, 09 Nov 2026 04:42:32 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDB-0000000HKqO-3aCF
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:31 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so860886eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199349; x=1794804149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=tiIbbLf4lMu8A7kpIViP0ULaNLWu3NAqDel/UKN5XrYbXJ5oMkzyg71dfs4JrWEgRa
         UmqP7/x8MMcDrEgRiHfaocy3KfnEq+t/Qu7InmlrFoUB+DPRaC6xal+689/yphgllJdF
         CQcQF8LgairFZOuntIprKIJjzbu+EVOmZZcQAG4pQhY4HRgoPk4CwTizNBAoJ5zHIRs3
         /ZIL45Gld3pnPsjKeQXntH594XUCoVUN86kqMfSyhJSYEf9ys+J3eybObAhqIm1XE30E
         hWsKVic1+c1gZ16XMENpBDY38VmcCcwJp3s7SKltVRwQciApReNoXcv737OJFTvhiWAJ
         k49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199349; x=1794804149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=Gm2HZIJEmW2mcygZ942XgUBc+sEi8hI6MazNjQlRjcM/ZUzGybnD4mbwVy076Z5EwA
         XEWCBwA3BMfli22cmo1ZbhXEz1z/CpAMx+n6ntwsR4eAkFO2LpSBZt5Zrw7B+9hVWfzN
         hShQjeJCnwFBPrMcw/t63OoQ1/T9HuNPoKyfQ1jagnZGPLWCUw9BPJ7YpcDS50tJa8jD
         MkyhD9GkMu6x+Fo0OQrPXXLAY5zlxAm5z3i9AK+mp+g4zZkToEU0jBcW/m8azw5BTDIk
         YL10ri3UA/PeDmjQUaewvrBKVrxlH28y4ST7uV2vDdHIz3LtLWcsXQ3a7vzm3XOYYNuN
         zcUA==
X-Forwarded-Encrypted: i=1; AL+hErE8N+bFobwFfqUNEroXJoV1TXD4jLKWZJ+pDZZa3flqR4/YAV/63pzIaioi9PYOiB4LdQnDBZLTuYbj6x7VNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+TqHfsq7Dj4GHlWVqkZK62aNWelvs9BO+XMI9b8mdKUv8Yd2y5
	mr+fy/oZao0u2z3+E0YwSO+ZczfvNCVZSl18OIlxQw6GTF9VBpara13e
X-Gm-Gg: AYBFou1klfOfmkc6f4ALbZezv5NOTyBZQY03ZPOVGA/GtxL3Q2pF08pzPHGTiq+VZIv
	R5galJ19JtxGggB3vcKijqdIMq5Q5ATIHfx8yx/j1Vxar/FjDyiI0ciUmpGaHUAUBz3PH5RG4ky
	tleUIJj+5X4A604PiyIgrfhDUhOI97K4Qua9+1EVHTEY657C8q6+n3A1Dzx3oJGWZRg4uBZ5ro9
	dH0mv9abTC3d9tWWi1u6jyfRKZrIUCC5QdlMIXFt5hwsx8YG4UJRHEz1soPTE4kyn8njM9F3VT/
	FrygUKYvsqjqhM4PzybPQiY8XW6ufbcUT3fAEEMseqbDgXutaVxiz/wRGoosdZAvSFxBRqk/SiE
	1UF1+4ngYrtkN+XoW1j1UiO000nDPJ6HwXT1Y/KpdtR7yH/+8IB0vJ9H8Ka7qGHjfWq6TrdRWTG
	dRHneLNQWU1c1pvxG1NFYmOOv7Gw2hDIGxYm202vyakRSr0Eddx3hu8dACMrFD3gaadcFskCouz
	DCSHyFsdfoKGm2PRwtClD8GaTHDexb56Li7jf75LoxqMtYgnwINAqHnqnc6yWK0Gqu50hePxmGa
	o41zckaNV+IrnJwkedPv9/UcpBC7VECz8AX4cB5O7BUybWIq2p3ZXfGvWplqkUVaMv4Myw==
X-Received: by 2002:a05:7300:c8c6:b0:369:f420:8679 with SMTP id 5a478bee46e88-37257d9496emr5721564eec.38.1794199348727;
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Mon,  9 Nov 2026 13:42:09 +0900
Message-ID: <20261109044212.1157357-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204229_896811_A349FDC9 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect work for devm
cancellation before devm_power_supply_register(). devres unwinds in
reverse, so on unbind the power supply is freed before the work is
cancelled, and the work's power_supply_changed() then dereferences the
freed supply. Each patch moves the devm work-cancel registration to after
devm_power_supply_register() so teardown drains the work first. No
functional change.

v2 (thanks Sebastian Reichel):
 - trim the commit messages down to the bug and the fix
 - drop the inline comments
 - no code change vs v1 other than that comment removal

Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before unregistering the supply
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before unregistering
    the supply

 drivers/power/supply/axp20x_usb_power.c      | 10 +++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        |  7 ++++---
 3 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.43.0


