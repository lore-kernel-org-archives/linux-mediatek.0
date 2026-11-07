Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7C606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNhlx1yg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LirhC5eM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=; b=RNhlx1ygLyrv33
	mLSFrrVT8KBVgsSaWDFPYHDx4XDvDK+8R1f5FX1QU2l/YSAWRGoI8mgZBluwB38FgVRGWFt85b58z
	uDSrvHWH0BxwpuvSxg7n7eEXC7lQBaV8h262gJkf4Zdse6848xehWNIQ0WdNZsxt81ux/gTKY1fGX
	Pz9jxNZfTFMirDzHL8ohhFTpk2fN6zBjPiDm+BBODjG8gwCbEDIMNOCYXTvkzyEDSCy+sjBUXmw0B
	jerB8kEiawITy2/ZA3WbZi85XB9XIUV4MtuRc34XN/NA0gpauMrSJj01uHQlVfGf2FN2FJlSy4+tx
	6SLTfgS2rslZGpEmnyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcU7-0000000EPJo-2tNY;
	Sat, 07 Nov 2026 09:13:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcU5-0000000EPJ4-0P5H
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 09:13:14 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4d28f75d62so184874266b.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794042791; x=1794647591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=LirhC5eMfpFULQE6YLZwMtyFjhBSWf/O9bcDC1UlA5ScqMO4M9gaARYMPDslZa0XkF
         GdqU06RAEEOuCv8AqLlFc4pq4VW/XaaG99mtj8ddIb5+zY/6K7vpgadjsuqQpYMRUmkx
         8Wn3oySdjbTCzHErBqdvpICdjzo+PajbtTbbyywQR/n01b98hDBnw6SX0TbyGYasan3n
         /bgzNL2VMNpV4bjOWh8bWPOGf1IL2D/iApuYKKfWwDOkBx6k2wFeYqkI4uC51JVLOSFt
         F7sQt0hRpyCHFGOMSKJQo3wV25A/J0jPkiH0PdixeOjUerN2CMAY/JL0uaHrNICFCmGI
         D0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794042791; x=1794647591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=ElZGC3+weQCA9izQpYH7zzM8VgXx9ahol1xOnJvG7+7Z5T2vIEsf0Ybf5eBmC+5p85
         5zgWpSwsRwbI90meJc1HgNJVSl1DDCw6c3gukv6iMYXGBvnFO+gFPNUiC1mQgtkeVlUS
         tlQRH0Py2RptxWp15BJsFCf1BLwYbBSJZy3Nc+Qv6Y/JAXC0ESnL3tMQ99DpJ7+nn1a7
         sEnPdfcqNsRHUNJdDp4iuQERrm4rN/VHFTEw8ZO4QOVMBhpvAyMdlqwlGQre0P0qgxnD
         wAAa9qBDUJtTvsDhUvaWcPIgUGe9uH5enQKpySTVpTxj8CCa+htzMpOqZtGU0mFhGIVA
         FUAA==
X-Forwarded-Encrypted: i=1; AL+hErF5kJewcIFkzZXVRewbI+SokIdIMdmdz0Zup8gUEdAGzSkRL18okJVz8MHOvYVqvCCJNi/FqiOd6gfHcebtVw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/OR5Fif/vriA93zQRdGeL1kSm0f4013VGDwlECK2bW/Wii7hZV
	E/qJhTMgVM7aaKs1Dgnu/Evd9LFHERdQHz5AixY8KfGJtIp9zKa6oTqw
X-Gm-Gg: AYBFou2iid1gQwD3ujVzex7kzC+jRxyvWEmqfehBeb7cF/XvB9uJimqO3Rub0UhUByt
	LOmiUZxtgaAcJ4++8tuQ4fHfXckXpVoF+oLpSL5wD0nE8EXxqtVL6yAN4l25UhS3UIGG8LfrFq6
	+wNzHFZV/t1bEG42rO79hmK9RpfLHTu9R9MWyu6JitxS6/EaY+Vu+lrz9pVEnO2A1fYt0PZMidJ
	RQEdQzvt2wFxK9IjtQmfp/bvrg9J8TXWjxm02LxrBenumcslsf1VsWWYSSKx9m4piaffP98K2H9
	nEea7F9pceci3A5y6zXmzEe11jC15LsUX3hVWV6p0VwfiZ38UFBGFNzqNfZuuMz9CZCnYD+BcPT
	lnd5m+HuZn9GKpfc5AOlleW/vMo1fEA/nATLsCZ9apYEsRww4UD7dbNwcxyO6OS2tDAF63tW7aL
	WTkznB1XGLk0zJ42jlGIDbTcNC0MqB/YXBreqaZY2uurw2DeCGI0Bc0QVwFpRbT9E3X5mx3YQTS
	4DvScAQnUC9Gc67W8WYL0QGxc+eW6IzmkxX22yom+Vo/SquYntdQJ4RksxsynkZj13vDaHORBz2
	pyj7A5ULmBLNFIr3p7vo9lABoqsyDWq+47W0FllRfj79LHnAmQ==
X-Received: by 2002:aa7:c3cb:0:b0:6b3:c422:9257 with SMTP id 4fb4d7f45d1cf-6b597805d85mr2374834a12.25.1794042790711;
        Sat, 07 Nov 2026 01:13:10 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b6e82bc5d7sm1405043a12.13.2026.11.07.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:13:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	Roman Vivchar <rva333@protonmail.com>,
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
Date: Sat,  7 Nov 2026 12:13:02 +0300
Message-ID: <20261107091302.16545-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <au7UMdlP9O6oo41i@buffalo-ssd>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_011313_206719_B6FC3A05 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akari,
(Resending as plain text, the lists rejected my previous reply because
it had an HTML part. Sorry for the duplicate.)

On Sat, Nov 07, 2026 at 08:18 AM, Akari Tsuyukusa wrote:
> Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
> "mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
> once the actual reset layout has been confirmed.

Thanks for the explanation, I missed that the mt6589 entry now
registers a reset controller. I'll make mediatek,mt6895-wdt a
standalone compatible in v2 and add a driver match entry for it without
reset data.

I'll wait for comments on the rest of the series before sending v2.

Best regards,
Alexander

