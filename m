Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A846606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNQZ3NE9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDra+IHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=; b=cNQZ3NE9I4q4bFEMLq6cbWYStm
	Ag6WSBjrY68A09UErgv2KF6F3ALnWBkp26aU1mEQbSno4FiNhlZX5DcqvAqI9GP2yjX+PSwvLcIGw
	yj1s/667+h58sVAzGbgOmf6vQDNMQjiVPK6cm3cH+wxqKSNCbcQ5Ep5e3o7jtl31In7rKXanXhpzO
	z9LtgPyddriH+GDxLEFzaYndaht4EGIni3tTHwSZKxhdliY5DGXtt6PkBKzIboW8mNTu8oQwc1iVM
	Z21BSWeAk1emkvz4lHnK6Wr0kudrOiTX0pjOSxuHH6LEgAnN4+xfwc6LcAGNDjMVK1U6QzqelnDMD
	Tu9lTKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlhQ-0000000Emhz-10d8;
	Fri, 27 Nov 2026 02:28:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlhN-0000000Emh2-3us9
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 02:28:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f02f04a426so60896155ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746509; x=1796351309; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=sDra+IHpyYpSDGnV6Mooszt//i8SnhvOHw6M8AHlGEHZd+1aqWpDSk1oqh96uNbNCx
         LC3QrBLwbt2uxKqubYdPXjuvPu5bmNZVCKxiwOSm5CV3QJa9Hdhy88I6MPn7er74N0w3
         qL5dLFg8yTXkKM41isX5IjpeNUwWXTQhOmA7XU1glCZJgv22wh94i+xeb41qSsTMuWdl
         P+7qZLSrHQM9GUHg2TzsvuZzMBo3MPsZULdUEJdLvmKZ4l0n9fynmJSqUiTImJ0jDy8s
         FHMaiDG8DapAx+MnbgXdr/fYIg8C5XWodQOjvbGCRtJI79aors5kQ42Adexgt8yZsfXt
         oi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746509; x=1796351309;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=t6OcMRP6PC24vqbQle/9KlRwS1ZUVzq4+zxuZ6UI6p7sVlVg33o6vF7kBqA9B2s88t
         ZEJoeOwwE5Jb7SxLc7HaIZJiNd9+IFfWHzFHD4BxFuA4RwPVLrF/EMMT6ziUiER1dRrs
         JurF2XpB4ixxlTq2Rh3r+8M1Cy+lVV4qEA6Nnp1rumGWsXXpiMZYkdyFC3aMu79Yk4AO
         XQGZFF89wRfh/dCfbbRlp8Nhr4Fb67EyLPSBXIepI2HAh5Dqt5dHdFP/nlV8CWWDcnGn
         3Z5xGEqRLCslz2EgAKkV2dmKhzoJw8F4URkDvy5AAgrRPRzDAhjskJY6LKfF3kDAbwbr
         O8ZA==
X-Forwarded-Encrypted: i=1; AL+hErGMHCKi0kVxhyfhrVZnzDOgvt9BA2l4t9wffK6gsskgYQGU9Ir/45JwjsWlH21mOoaVzNf23/e1Vc3tu09ToA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/x8o/rm8fME/F0SOTRyUmSNoHQnTMKwFXDDGljhXterGysUlUp
	dY+LYKPlKlK+FGs5XEgd3GdE4UeT2dmJgvEZ4mCq5rQ1fsApOusHtKiv
X-Gm-Gg: AZFdTZfoX4a0sChiMIy6D3gquMbgMihSvAUDDU7IiZEY22Ew0mpWXQ0LvkeBAT8gDXN
	uWFL+FSYNvXg5ksMtKZf9hl3TW0e2wSBPYBX5T+naPZHBLYH8M1xEbd5xtuvfKLfQ/870VoIv6G
	ioug0s4cMnhoSvIIO2kj//ZMWvQsMs6pN9waaoUPu+XofnqiVFryWikCulGqpxOm2OBMw//iULn
	38cKCXITdUOP5up6EKcpvQKOIORUIfa2jTr+Tfl9QiXNXn3WfW6WdkTo13oVFmHdh5NI4fWs0Dp
	ZlJqnNcZtVY6IUcA1XeDFj1Z789Y+CYFpb7lS+RMB3ZpsNddXhnHGDi44CucLVnud8YlG81/UaN
	rWEVtfGj7p4QX1LfY2MAQS7U1f/2d0/aTeHyO6s03NHTxLvVoPjKqtW+ur3g2II0++Qnz0dpbqe
	YPPGKINKK2IrSzQ/ATC1m9ljqQWZG5GPJJ3tHyC+oNxA1ABwa0u7FhNJ97j+bNGbY+onWoLG8Du
	/zi0ZZhuKG/860OdW6XhIsrs+G4lrm+0S/pUIGbHKm6zAZeu+Gyh0xe3fW94mvB3r3CKE/mnbYe
	vQQpjLUUZDstG/RR4AQS6vGn1bXtTGhBTwDHD5k9JHPEhQ4BsKj9VkbioOwY9Y3qF6S67yPcPT4
	=
X-Received: by 2002:a17:902:ea01:b0:2e9:8ef0:cf6c with SMTP id d9443c01a7336-2f03f1ed55dmr230265165ad.26.1795746508987;
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm111030145ad.7.2026.11.26.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: mt6359: fix MT6358 VBAT impedance
 resistance ratio
In-Reply-To: <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-4-iasnezhkov@gmail.com> <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:28:24 +0800
Message-ID: <179574650424.5055.6452827952792020438@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182829_974671_19A62283 
X-CRM114-Status: UNSURE (   6.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Thanks for checking on MT6358. On our MT6366 board with the vendor
mt635x_auxadc driver, IMP reads the same raw value as BATADC (26737) and
converts at 3/1, so the divider itself is 3/1 — but comparing mainline
mt6359-auxadc.c against vendor mt635x_auxadc.c shows two differences that
likely explain the timeout you saw:

1. mt6359_auxadc_probe() unconditionally calls mt6359_auxadc_reset()
   (pulsing PMIC_HK_TOP_RST_CON0 0x0f90 with 0x9), whereas the vendor
   driver does not reset AUXADC at probe and relies on bootloader setup.
2. After pulsing HK_TOP_RST_CON0 (0x9 -> 0), the vendor reset table
   (mt6358_rst_setting) also sets AUXADC_RQST0 |= 0x80 and
   AUXADC_RQST1 |= 0x40, which mainline mt6359_auxadc_reset() omits; the
   reset may also clear bootloader-initialized IMP0/IMP1 configuration
   bits while mt6358_start_imp_conv() only sets DCM_CON (0x1260 |= 0x3)
   and IMP1 (0x120a |= BIT(15)).

Since I do not have a mainline MT6358 regmap dump before/after that reset
to verify the root cause directly, I will drop patch 3/3 from v3 and send
only the Tested-by/Reviewed-by RQST0 fix.

Best regards,
Ilia

