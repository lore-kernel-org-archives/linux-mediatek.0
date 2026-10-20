Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB9606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 01:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8zcR5W8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnwfKndn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=; b=X8zcR5W8xk7doD675PbYraJ8HF
	v9UDeK1JY4UgeDsvaJnI+9OE5ZyaYd8gsZN4jdRi4MW4D6o+Gp9c6sUdRFnvay+zW0m9GOM25UNqe
	IZApJFeRns+7w00CxPmdDi0biGMZjHm3GF9jvJ9siBIhTZNHEU8OeYism/4vcZCoRLgtYlfhhefbm
	JdQ0j74l62YNY/GdHQjQ+77AZUiehVJyIxUXCb92SVFGYzpUEvk5CFkLDXMcYk0BbF2ENVYEOULmP
	u+4Y5fLtX9sJBoVRmJuW1c97g9aiEKmRwQRM98rEkQnXFIS4SVJXCd9KwXZphwcu+4GOimv7Xl8Z1
	R46D/HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxN-00000008eU7-3ZS4;
	Tue, 20 Oct 2026 01:48:01 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxK-00000008eT0-1bWA
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 01:48:00 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35b2c599f43so6093674eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 18:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460877; x=1793065677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=fnwfKndn+/G3gwvE9Ifqnn7DupT1UV1pK5cq/auHtxX4QNYcUV01jKVXNMf48lA7ez
         L+C/0ecN/E+9oTcgnU22IGfEpGso4SnwpnIIC+hMlgSHruckpeWQKopYwLEXYrCCTbKM
         6p/eQs6ofOPfFppMFxb5NORasZIcCdbujNAPFoS8yHZSLd9pm/6KQkuE58a3RU9i28Ik
         4srTSSx0U6Yz5BNjHVZfdiYcukVMaUS+Tt1L9LdmD8XEQnORlQyY8izxFWHYISNnhzKT
         fCxycfAw++wPjWXy6BbJzdmn/+kNJKcrljQTC3n/P9yZVeRWNhRQJFU4yOCg2n51HX3t
         zXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460877; x=1793065677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=HgdSu9xK4NFiaOjR7Voph5Sfr2zSi+eohmagwXwt5HEgR51Bz3XqD4uW8+cZ+jEP6q
         XOffgQOwXSCoHPBgdZwi9MbaP3ZT3wTDSD0yS3PTtTgYytgizktytoPYdu5N9KS+bWQ/
         sG4m7gcx4eeNDYsYcMAyDwPtdyJMDpKA3hSu4ZMv0oCwHlRFPMo9Tz3pvDrVoIR+Pqji
         l99isrx8kBwfCmguo1uySgvRbWZfdA+OVZp1jQNKefyC1YnZLBMbtc786NPXsSTO/fnd
         2XmyVPfd0fZJ1f5kHPGg3HUVETtxTBMgaKhOuwxR9h/+BR4bdy5U/fsQe/Cgv8hA4Lw3
         Q0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBys/iSfMSptx9kCjDtBUmioxahJX/vb9kDxEj/IWPP7q1whX8RC/KwsGUuUst0E9lZG567TZLRWn/M58/l7vA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKRxZ0drK07clHOl4OIpiZKcc2WwiotSquYAWu9xQ5LY/y7SrlE
	6oWQ8x79yabPfWYt3neWSbs1mgPyWpz9ZXu0+QZMvkGPxEW5rrN4AGCh
X-Gm-Gg: AYBFou3TajId5Fw8RFqKU8Nw3og6FSRvZAHG3HhMWVj+NvhhIGmM4s9ZB4M2Q5Uvjof
	1KjQmUn1/P4OCk1hY7VBAJOjXiihfj+sMhJJUxKSdbCmMXDZ/Qpxm0q0mzpWRivi798O9TMCNgo
	QgnYFWc1bnRN55YRGXaQ4psfo0k8A4q05dssINgDgk5FC8z9/oD4fVGEOJNj3+MqLN/PlVp8kex
	4GW6wE0XgsQuPn2qIs4ojWjWS5HD1GpogoTNvuSWRSsnc7mjO2Z0Lx47hVYZ/MEvdhCwjJDQ1Op
	YzI0A3zx9JTzpJ+6MiQf1yDr5HRmjfn47oq97CbFDoQX9Pl9Z7luOg83C/3B8TmcXW/39i7bsWi
	zy6dMmtclTVKsjfs+LeM6lEML3BdTVtqzoSozGR0/MF5dkPKE+pqUKAmehRVR1jRP30vgDQPQzH
	SKdUiMce5UHKqQbGFhpxs4MESavq7ElIkVO8rBjBhTmuPrehfUVvLDHFoXVbcWcr4OigzZxlxnb
	juH0X+BgIzebQ+yUGrfFvU=
X-Received: by 2002:a05:693c:83dc:10b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-362fa872acemr10206165eec.0.1792460877332;
        Mon, 19 Oct 2026 18:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37173189eec.5.2026.10.19.18.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:47:56 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:47:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU
 reset indices
Message-ID: <6ffb487c-dd6c-4a6b-860b-f4e02d381cbb@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184758_436111_8F3BF1ED 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> Use their register bit positions as reset IDs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

