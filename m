Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0F606A31B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3YPV3Vm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQI62HWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=; b=e3YPV3VmsAZGFJ
	Dmdl+xeYxSBi5VsA1SpGJ30xGQ9Z5xXgQOSBYYQPULv0hkhaxnQOZF20hvC/3WW9zS8XILpiiEuLp
	KB2V5DLBvIS4pwhdEUnTO6679FTzCW7aJwl2XS+8J4y6EsVLabkqR+/9sz2TxrLdRw8+IgzPDj0a1
	lk1uWKWiqelMfeGWE5Rjw5qDN7rmgS8CECLHHxNebfN2ux3cJtpAcSg/05od185xHn+1zIa/iFQc6
	J4q/3ytBfjKK/aAAgSFdA1Ov+WG1T9fMgqZwmsA/23yuqz+/c7TR4IICCU8wu0sopMvlb6P0WM3uW
	DhkZ4U4M8vSNHdq3oGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5t8-0000000AnGa-03Tr;
	Thu, 05 Nov 2026 22:24:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5sy-0000000AnFS-2qCj
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 22:24:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so2141884a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917483; x=1794522283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=FQI62HWkW/s4QuH8OmT8SwJ6uey6R+g7Yxr5qpchUR7sp4uxCZEi05Pkbv6pXVpFCe
         pHp6C1XOBbCm04zcEgiKD/IclsX94wPWIk8S/OmLpVwYh2xSmtV09FJ3H23EyyhqJZcD
         glxY4ZFvhPionzqFfuTvrejqOsfZ36wKzEpNkP8gNHQtIqCJNVUihuDuDbfIx8N/yAfb
         Rwogwu1egFFGLRudMU/p9p433TexrF3km41bVJwyGTN4enAmK/0vgCrXOXVztOnD9EO1
         zCCP/WZe7hs7S97qZGlHIuAN1L2ChlsGPwky/bWv64Evq3ZekPpnVzI0/2K3+9r/cvGd
         Xtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917483; x=1794522283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=QAoC5adP4LfLWS5Ns9230XF7jhQ4h4HdJk7rTIqkH2i0igR0h3U4GKw86Brlgm67Qk
         dvk6nPmQ5Ikx+eMRapeTRR86olz2wLN0qPbi5vjYTSeQQ3g+t19ydFMmdsgpVy/pgUXT
         +O29T34udI5MIT00S/g9ZFt/nQrrZ5axyRzwOQiI15Yhr67j62D9ptwzH2a67TVwozqM
         IrKyBfa6kJQwloj0kTA2EhweLPu1IBwnjZPvRjJno9ChJydZ01AS4DL+gq9308btss3P
         9G04LZw5iQT5Zw1EMt1dMh74xtzN8e9IivPNpQNp7w8XORx1R4hXQw9BtDE0QwkDMSMh
         xFCA==
X-Forwarded-Encrypted: i=1; AKwUvBxnmsfd7+kF9+kr2Q/JTzda097VSYxiO/aZ5+1uMKlEynDUXbWB9x8NHke+Gz/KLf7Z+QA/6jF9INE63W0SGw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/h+yJm5R/2fdFtSgm5fEOesoUGNlBFepqZYqZU6AbCuZ8erh3O
	ZJTXMjuznZ1RL2a2L5jT3PGzwWqzDgSdLbAcoSkPIoErbEykFNU1zgQE
X-Gm-Gg: AYBFou3YtQpVtbkVeypIllUg+ge7qJ/gVhAxaSXx7vvYhUKynhW+EAbJ5ZaC0pWvUqF
	Ls1VG/lAylciCCs+0j0f1IAwsTVFiuIThkvk/vf2uBZc8Gvo/AmePBcaSk+d2/SxtTlLWvCFr4C
	iLp4eJsj8cZoP8omipTsCJRDAbbPMMmKSgmqqcnidjvRX0prNf8xnk7yvBjcgYWm3Q8hrTvanvo
	JM+CtlzyeWRhef7o4621Y7dYQF7Ud5A2v6MEJV6KMiF61HmVe7QAgLLztqp+Wx2WUfOKd1wEJSz
	IQa8J/UAWzQg6LmxF19eYKf96k8zqHn2jSMYJvWbeXSBhDXMk0Uz4vbpT1I0eeWi3q5pIH0ZTgd
	JRVfKZOEYnYivLITeuLG+mq47N8inS+4TCYLsDBFVOQUw/pl+RMzMy5kL9bsXKib/IzESLza23w
	G83N1y1svb+CnPvbkMUD58lSpjw864DUUunt7X/LrPYN6xhdvUoFgbNGKp3WFpMGGRBqhfaYZ9Q
	8/4tXp3AdGXXSsF/9UABL0NYeHMxx1PJIzECioLH8BrBZYmA2XOrQNlyXP7qRFZCqpTvNu+rS9o
	xKTjufbAhd0IfMJSN8Mu8g8kMkRfwKnsW0qINqnKSBKFwK0Hpw==
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr411756a12.12.1793917482391;
        Thu, 05 Nov 2026 14:24:42 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac57b9csm2103697a12.15.2026.11.05.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:41 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 01:24:34 +0300
Message-ID: <20261105222435.571449-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_142445_392581_F585ACC5 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Roman,

Thanks for looking.

On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> Does mt6895 actually share the same reset layout as mt6589? Given the
> generation leap between these, the former is very unlikely to use
> the same resets.

The vendor kernel for this SoC binds the watchdog with the same
compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
same address, and its register definitions are identical to mtk_wdt.c.

The TOPRGU reset layout is the one thing I can't confirm, as I found no
reset table for MT6895 there. This series does not use it: the DT has
no #reset-cells and no consumers. If reset lines are needed later, I
will add a dedicated mt6895_data to the driver.

I also tested the watchdog on the device: while userspace keeps
kicking it, the system stays up, and once the kicks stop the watchdog
resets the board after the timeout.

Best regards,
Alexander

