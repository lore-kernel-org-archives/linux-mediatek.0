Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8787606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 03:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QN9Tb7IT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFoV2cD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=; b=QN9Tb7ITOR8n81
	/j3JHBtBq3k8ITUoSxPNry0rE7kryiwf4+OYqJS4pIu7XI5/FZ31Rpc/7WxRjeIiB+jYXc4avfji9
	JfmHe5mJyWkK7r/WWwzjO6fX3Ag+r0GAosruZOA3SxK9GnuCAv3q9cKxFV6t150ZSiVlCC4Y10W7j
	r3TLCW8heigJV0niUvuuQWh4Ah+TkcFQzz6qNWFyHFj8fusXNy9Nb3HnMpMl+aMnuA/TVYA1ftfsd
	kCXsthRdUePrXCUeOrpf/S3iP9xosxCHe6tbwnHfa/RUK1VY1lZKOENNQjcRyT1/9aVf+T9Fbs8ju
	qrU3eJH/vku1xAphuYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNifU-0000000FRlE-0orW;
	Mon, 02 Nov 2026 03:25:08 +0000
Received: from mail-oo2-x04.google.com ([2607:f8b0:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNifQ-0000000FRjS-1gkv
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 03:25:06 +0000
Received: by mail-oo2-x04.google.com with SMTP id 006d021491bc7-702ba2fd61cso751617eaf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589902; x=1794194702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=qFoV2cD/exSvx78BA7JgjvC6hVn/KO1puLe4h+Rcv2Ww35vx7dSBkbL3MnVFB37jtX
         iog0DPEXiAa+fTfd24Om2pcopP1rVoq3MqhWahnPLpSBHulQyegx1hSDzjERpZBzrL5f
         u8SAIQUZC+CvyVfGhZL8Lp2UxdS9r7HLeahtZOEhf4nt0fy7Drhr0hnSnNXttq+I/Jy7
         xITFKVECjjXgeIcyU4HrEYeGsJdMLQOmbdm0pEId2Xi1nGKorVHGh6OyI8VOjWTDAk7A
         CQRTQIM+i4glsPcKVzkd0CzPwPa7buCyHgdqm4LBfeUC3zVwuyNeYEJCUcxj5IpLwLSV
         YJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589902; x=1794194702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=me9wiv0mdBai5euQlD1RIXN9jFFepjbAJNy6IaYftMPM9tOsJkx+o8kL9UiHNVtQ5d
         ci3/+aC9MDZHIv2yt95z9twv7CO81S3MmnAwh4QmhslLhxP2L4GBQ9HADDjyDFCIoJio
         eNsGd7Tlu4XOC3oPNAaJewhwn9uHCVkE7TMQApnFZgGxFM9c3jFdxWKt5ioH1LY+7ZG7
         opkehAySNvWjlujGU4/+bn6KOevWIM87fJXi7hzF+lWFUrzPCE6lKfvz0brnrSHsSiek
         yeHr2g+t6cW2ZCXVd/xLxg8yS93bDfSwiXFymGKRRjH9WUD7DFYCNxVoEqlc5F8v6fgY
         mZ9Q==
X-Forwarded-Encrypted: i=1; AKwUvByTJxaGO1TWtnnJldzj8g6mDSLuSsGAkQRPFz/lvgflor5P0Kifd/xAIVh4DxlOc6nuYcubBD3XCdHlQju3Zw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKKveZZjbdknaDsHG0QGSmE15cqMqA02S4A7YxnamQmgYI4ZoEj
	k2U0vCocbUsJlTtSXebT5tWyZuMic6lakLF7/rH69AgjgbkN+N0e/yVk
X-Gm-Gg: AYBFou0WPG8DsN9awLgpDcePC9rC7LMRJSJYEniip7V/faWDaPeCnp4UJYshRG2q0Y6
	t68MviBYGn6s3CGRAzjO7mc5CWsiybWfHoq9YanM3hIN0AG5bd9GWSb42kUEUppMT2qT8UlpNFf
	Qk6rW5xmb7+EJALxtma7Ybm/duAOC5sHmxT8g/3n+6NnngWx7ZCAa6joPV26lp6cj9dcbFVEkcT
	kSTzT8LdvWXlCgRlpDu/B8GRKQc+yyKGX/An7Kms7o8s89PzY/zNbh8M0cke4sLUwFUUhzOcJCK
	UgXGmWdXLv7FCIfkt/gIk69M9HKpEoys+3DqfAd0AD0gR6NbI4rP4ANroO/A/uru5f1WeGEvWr1
	3cqTE5mCnveg93Wn0Kily+7xpLVvfen01sgGhZiYDGo4q8HVrsjwUYQ5E6QM2YKo6GYQH5SjReQ
	1/MPuuOsL9txHZQE1kuzG+v2Evm6bzzQchXAvK1qsevLz10YYxxqolxRTATY5G7LihdTdVZj0Rg
	X3hTFlqJcJBNGtSv+s4lrkLl2TOKqVWPVPoLaJ6vQGy6h5wf4a8ZLyag3ykpKyiZixquS1xyNYG
	m3pyf+AnFoQt8TBjJncaAipMidEi0+7QH0U8Q4PxA9ok
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id 006d021491bc7-714f2480119mr5364303eaf.50.1793589901912;
        Sun, 01 Nov 2026 19:25:01 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d35499153sm8255830a34.9.2026.11.01.19.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:25:00 -0800 (PST)
Message-ID: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
Date: Sun, 1 Nov 2026 21:24:58 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_192504_445387_DA0171BC 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dmitry,

Gentle ping on this one. It has an ack from Rob and reviews from Mattijr 
and AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) 
that I'm posting for 7.5 uses it for the volume keys. The patch should 
apply to input/next with a three-way merge. I can resend it rebased if 
that's easier.

Thank you, best regards,

Ryan Brue

