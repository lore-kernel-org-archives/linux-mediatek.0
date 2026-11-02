Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62164606F21B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhAoyFo3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SycXKhIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=; b=LhAoyFo3LIP9fc
	Y0JiTtv9P1OFvtUAJBEEuo9VlYxwgkC7rePktmBT8n8J1wW18DbRqFDRNlezzZI+AzDC6Nxl0yB53
	PDIBmrOFpRbz+zjtr8H6+uUmJUgKjTIfskUqdckHfmFJTZwe0OrYiGkp+0eZqQR6MM/GEtYKS68m5
	HTQKK144UlTo0B23RLfUs9bCKZLe9TcGtu2DvtBQqhnfJGwH/uenQSDFKZx5+bofPxTv9Nfg31PWR
	KZLQ61+OWdt2+Ojrho6S9fr3+R7yBDMDcZwRYDCuOnacUdOT2iptJ2fO6KvhkPpe3wODYBQ4AwmPG
	XAhUnQoUVZyeqCFCqYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvuO-0000000HTHH-3bWe;
	Mon, 02 Nov 2026 17:33:24 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvuL-0000000HTFx-3xdX
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 17:33:23 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-36a1c464349so423490eec.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640801; x=1794245601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=SycXKhIYyB/2erO0uC2dfNj0ewhEF6fAFGx99ovqaSBWh84TE/4wKWmX/xB8Wot2oZ
         Zgjzenw8/jTVP0AdWT62hhIVSiJEyIMw1jaISimGnyPfcDxU6PItLkz/ujwgwypPe/QC
         h77CnkYuGUwWyz+0vkKwQrf6hClXj6mR42Rd7acNUyZ3oqg8zn8z2vuPGWGRK3oRhuFO
         ehSTElhcueKLAWroHW0b6/2cgslsVxWuoctznubBck0HEgTkKLgqOcw9ymWNkgRYfEi4
         6SgEqIgC9gVVdC5zaARAwTwWGVQVCxgbE/Ki1KHgxu1zTgyCP/qUazqBW8L7e3v4gs6H
         G3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640801; x=1794245601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=Y2cmqLEO+wP5hFmD6qz3GldWc98rs/fpmSVQ4jTaqTIhLOcGCHd1JCtt6pOXS0+Eyt
         aRyyb4RLzwW51ssBIfqDUOJUe/1e39KFgRinKc5ecLVPN65Uam8oC5THKDOHahizpYAq
         015WWJPtMSZkz4NcVXI/iCUaBmnQLwozdqAtU/QPTQ7As2RJK8e0+PXrFib8+31DmEY/
         Ymr3er9GqTIxnlBgwOGyLba466iJdzXBIiQcPBEU6jktsJ2nii79rO3WndVgF44s/J1p
         nPxC4bNdmsFkj4dSmYqbdUZ9n/Dw506aK6VpT9yxkWEiO2swFSU9lfpxXnBL5G7pVj4z
         IP4w==
X-Forwarded-Encrypted: i=1; AKwUvBxYHhQHfq7E+2JXCo0EG7qVKVKC5q4Bu3j9tXkigcC4t9dZFOMs474hOoeVcwAMqr61GaGj7hJZMwH0dAk9hw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/poWnLVgsOkqEgPeJtksRCD7v4+1KWNVcQfCKT5IqPne8/gZ2c
	TS0BKQZ5oadNfIQSl8cP3QStz/gNL68dYVCT07gSr02fJH9cEqFJfPlS
X-Gm-Gg: AYBFou3puWshMS0eIVdljB+as/ho2fZJWQGBFtnccl6C9VIlGFTAFoCiwKx8cavWI3K
	Lbn7tQx2C7LPb6hAOEPFIsj7Ct/inFZm6HI7Hd713AE30ohIFiaOuNpHe+5wzKnx2kCEE1vyQQk
	1DSxjDFkurxU3qgGr3KSCXYGSXVVzFturFVEIj0LZL80xTmHDtVNT7xw0tRG1WLuXl7wOZSkbsf
	5fek4qOcFF3SVMknnJ8bZEE45A7oXxcg9Yl66bXL41b2gipm8pHk3VjoTIUjTN5ZNPsVMdSlXIi
	T/pqHSzU3AgWWHVcz9tLT+y6bhtTnYXya5mC1ieYd9ipCcqOLHlslM7dnEiQBFj4ljztl3h+W+W
	yzYLCeaR2VyL0gZJrq860XRapUom5maW9HIGBKebafCfxi9QlVQdt2ZAp+AIFWa1GFKXNtg3lkJ
	AIJUII2eE6sM67uFhY9+h7aE+4zbFB2JZlYafAqLkJQM2SAoqW2bGxJ7PCabVS90+mkuxNc90fP
	zkUHVFB08DZNhz5XultShSA0dzcROtDv/2aj+hRgukJAJ1Fwcf8Kn/BpAI6UA2AMTKEDpIdw4Yq
	kqsMGm4yCm8pLw+jeBwAoBZvfpRN0YmavPuueyiFBVkPC62BXAZm18G2ArdmxtuUXg==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a4235ceddmr21835977eec.2.1793640800547;
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm33875716eec.5.2026.11.02.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Tue,  3 Nov 2026 02:33:03 +0900
Message-ID: <20261102173303.3464879-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102164345.523122-1-amergnat@baylibre.com>
References: <20261102164345.523122-1-amergnat@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093321_975535_5DA3EE90 
X-CRM114-Status: GOOD (  19.86  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandre,

On Mon, Nov 02, 2026 at 04:43:45PM +0000, Alexandre Mergnat wrote:
> It fixes the range lookup of the getter and selects the trap 0 or trap 1
> registers at probe. Could you check it against the VEMC failures of your
> model? If it covers them, it may save you some work on your own fix. I
> have nothing for the overcurrent handling, so that part is all yours.

It covers them, thanks. Six of the nine failures in my cover letter
were about VEMC. As the model stood, three VEMC checks still failed on
your series, only because they change TOP_TRAP after probe. I changed
the model to probe once per trap value and to take the trap 1 trim from
0x1b1c, and then:

 - With VOSEL 6 and VOCAL 5, the unpatched driver reads 1.25 V, as you
   saw on hardware, and your series reads 2.55 V.
 - With trap 0 and with trap 1, all 176 VEMC selectors read back as
   they were set. Only the fields of that trap and the TMA key change,
   and the key is closed afterwards.
 - Trap 2 fails the probe, as your changelog says.
 - ASan reports nothing. With GCC 14 on arm64, each patch builds with
   W=1 on v7.2.12, where this file is the same as in for-next.

This is a model, so it is not a Tested-by. It takes 0x1b1c from your
patch, so it says nothing about that address. The MediaTek header and
driver I have don't define it. My own VEMC fix guessed bits [7:4] of
0x1b1b for that field, so I will drop it.

I will post the overcurrent fixes once I have tested them on my board.

Thanks also for testing 2/2 on hardware. That shows more than my model
could.

Mark, please take Alexandre's regmap patch instead of my 1/2. It is the
same change, it gets the BUCK_TOP key order right, and Alexandre can
run this driver and has the datasheet. My board is still locked and I
have no datasheet.

My 2/2 is not covered by Alexandre's series and is still needed, and
it now has Alexandre's Tested-by. It does not depend on either regmap
patch. It applies to regulator for-next on its own or on top of that
series, and both orders give the same file. I can resend it alone if
that is easier.

Claude, the AI assistant from my cover letter, ran these checks and
drafted this mail. I read both before sending.

