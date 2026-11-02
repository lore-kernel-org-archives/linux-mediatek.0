Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D9607B457
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SvwKoRjN;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IyakJ+Zj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=; b=SvwKoRjNwdKoSVtEKuiAmABzDD
	5AlI462lI1FJioTq31oG6/9Bp9JkwsedOetY3/TbEFAlTtVGXkHwQ3XFdW6DtqHrfJdKYyQQW/dwo
	RQZpDA8FryQs37HzR/ld6pphLZ0HeYy/QpKD1+IpRM7zm1w13lUuQ6Xp0tMK635iay4NS9fguHHHk
	cypN+fLsvyVzabPGUodlJQVWdhYK40xWXU4yFqbEvr8DMcZJY6hfjeFifdu6ilJrC7UwWQZm+JOI9
	9n1MrYr5yC9ksYY+aWQYhpa6ahs5Runi2RDEAC60yduJpxMJFdidQO73KAkpYTODwlfCppV980EkZ
	wzRaQkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMf-0000000HDTY-3fJW;
	Mon, 02 Nov 2026 15:54:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMb-0000000HDQN-1QqS
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 15:54:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25803105e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634863; x=1794239663; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=;
        b=IyakJ+Zjmv7/k5WnV3ziNTXRrhywJusxayv+C4u4UAovG7Z8YtQpIub0L/myUu0o1O
         H4OSkuhjO8rPFWK7OnKO/1B2mpsYtRLsbA7bWeUpybdlmnbAsOpM1u0RV3rf5cheGzos
         XzqBX9bfz0UISEUkAjAux9oQgE+dr4GP06MN8q0Vv2c7x9GZ8HlQ1QRsenYNwtwlbjqG
         wDX18eotxFmyhmswrdKMXEqNqYS0+ofdaPBeRCkPtj8YnXYayvU7vU7cnLebhW+Yy3Ny
         SlAWNDWIB9JUTuKHcGugFY+1ojdtdy3gqDnVYTlhGZvY8uBRvpunqcm3xZaeN7Rcrw3q
         Yzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634863; x=1794239663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=;
        b=BrIFGR881bcVqWaRdaJOJYT4vaFUdRW6BC6Im9y1GrRSDdP8Dbf/7bBS7XJEJymwYw
         lAwSRgSIga7khqow7XbPnK5cn4JsSLd+aBXfyl5YgIgZL/kQlavqCBrRz8Y9z6ueRLCd
         3VqucjSmrR7cqmaLLfu9pE2Kk+Vihacgdb5EeeQTLv9gxWwGeJFuj20E+cbMGS4IhelV
         RCGqedxgyoGR0xQVXHodzR9sAHcmbbNI323K221mXHY5nrh1+FEGQzvJ4xVREqqDBwGy
         xq5iUnmTOg0qCtyYBub9gmmVkgZZ3dTOrKTBizpBHtJrqSPhP73SCg5Rz42vgR8XP9JG
         3RiQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6Jr18rPQdDd4kQz4Q3cAwVdPmp0WBbLuLM1pCLdoNm6Gk/6b6KEe/rWGjXp8azCmkX/jRSeJHRG5lEvkXBw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIboBK2T9cblT4NJP+ZtFDVOplQSYWuEaeiTi/IxwGchj/Fv84Z
	WlulyqgwBUR/+4E5zp5hvs8pSybaZtrhU2fBJRB8lE6ur1lkEQwRSe6b43zri5S44+s=
X-Gm-Gg: AYBFou0XSv6eT8PjOMd6mOePsW/u8SxPxxlYOxo6Z6GlgmoCPa9YMxzIAqa1qItkJOk
	2lW+5dMeOr9/oypPsQ44m/vWr/UAJvMpUdDKfMqydtHpR/VFcN/xyAEFedrBcw30fhz3THZM/dS
	TL1yiGpVOzkpTlhh0K8R4MoinSLgxIYuE05kOdWjYzpe9y74rD0uCtG3qapKmYajPhwEPdsns+G
	6q9gRKsy6f0floccicmp9p9UtHHxVLVb8NGkh5HfY4AoNpi0cR+/8AzoPYCPCDH1Q/XhGlb7Lox
	4XFjbsl/qmG7d7ByxZy9YlRCpbAA73+uXVGdVGXuLGtQve+sjk8pW4jd5prvwnCKEF0MfEJHrYt
	iEPoimELCxCAjvmbtRN70H5WyePjs7oh19nPswaEmdEaMQMUzqjJFe6ZA0EQLwIX+pWIURCwbMb
	52W2JI/b+bwvzLok6j84LljrmlMT/nGgML87JIPKro6haGsvfc4epBBx+HMIforyjByVMX8LfrB
	GvkPXM7Hjqt7z9XTXDF1gBjgXeNO9/EAKrXMP+eRizJEHb7j1mms6YXFCpPVRyYapVBRNXwiyBJ
	jYNLF1trztw60SJyoJCBCybK5TjMJNqfDq1BepSN9MLScUKQWuwF/8x9
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ac17ffb07cmr236421765e9.8.1793634862845;
        Mon, 02 Nov 2026 07:54:22 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:22 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] regulator: mt6363: Fix register access and VEMC
 voltage handling
Date: Mon, 02 Nov 2026 15:54:16 +0000
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACiy6GoC/y2Nyw6CMBBFf4XM2iYwhRb9FcNi2g5YIw/bYkwI/
 24Vlyf35pwNIgfPES7FBoFfPvp5ylCdCrA3mgYW3mUGLFFVJZYiDItQWoxJSSVF4GF9UJqD6P2
 bozDsZKOJbI0WsmMJ/Buy4todHFdzZ5u+0v8j8HPN4XTcwFBkYedx9OlSWNcbJsttg+7MGk0tG
 XMCWeqeMknCVqsaun3/AL0Vqb7NAAAA
X-Change-ID: 20261020-rgp-67-mt6363-regulator-fixes-bed357aac42c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075425_393773_6243D3A3 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Testing the MT6363 regulator driver showed:
 - the VEMC (UFS VCC) voltage reported as 1.25 V while the PMIC is
   programmed to 2.55 V
 - regmap debugfs showing each register merged with the next one

Reading the code with the datasheet showed more problems:
 - a VEMC voltage change to the misreported value is skipped while
   VEMC is enabled
 - disabling VS2 or a VBUCK rail also clears the enable bits of VS1,
   VS3 and three VSRAM rails
 - the BUCK and TMA key writes also overwrite the two registers after
   each key
 - with hardware trap 1, VEMC voltage changes are not applied and the
   voltage is misreported

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      regulator: mt6363: Use 8-bit register values
      regulator: mt6363: Fix VEMC voltage selection

 drivers/regulator/mt6363-regulator.c       | 131 +++++++++--------------------
 include/linux/regulator/mt6363-regulator.h |   1 +
 2 files changed, 39 insertions(+), 93 deletions(-)
---
base-commit: cdfbeace852d9e72b43e23572e37fab433a28764
change-id: 20261020-rgp-67-mt6363-regulator-fixes-bed357aac42c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


