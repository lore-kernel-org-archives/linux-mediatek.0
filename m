Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F90606A337
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGYMPh7B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N63M5iY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=; b=DGYMPh7Bg0v5Q+
	os7hjAyme/3t8HfxzFnrRZ58gTEB34CggopldjgrmrAeHuh645gfl0/b2imQAm7ywMVERHyB7BO1L
	GRjCYswwkgzOcc7iATVbnH8j0ga7BBSA0SP0SLZJqItE4KAZ/pAVvNbeUFmTAmJxBuhK/1ZqHDYbj
	03uFOScQfqRa1k9jRE854nT0T/koQTxEe97uZ3FnNj8y0C5RG5w0f5FnaRmzaJt2NGq70Ce2hUSCj
	fcfGs540o6xjiEE6Vdpu3qkAqc9UYXQQoio8WAM4o/ZA+qMBPFuV94qRRc9xh2eR1GeRuf2uTRf3p
	vcwtndApF7HwE2xDJzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy38-00000005RVo-2Ftr;
	Wed, 11 Nov 2026 02:26:58 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy36-00000005RUk-0YYx
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:26:57 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-4511f6a63edso611065fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364015; x=1794968815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=N63M5iY7gn3WvUjALJUngkUWNGLWyc1v3jSPuK82eXdZbbm5gfCIY32VhqfkGXsz1/
         IkEWfrtBXmIexSN+scfctipnIlkD2cc7pOWNzCH8Ti8dsawkGPpGxLu6tCr94u7xZzxY
         4nc3/9mACeYj/kcBrT04ctBMCeWqsbTytnyVzXYhxYddOyiUqipugnRpmmOcKM7BYDjF
         wWBH/flWQjf3ttRzfKmRDdvFqhIHVhVCN3ZwaUyLmljfQhuVlzyHjrxq9gwnbAAJYAu/
         9NmHqSGyR0cjwZHzWR2pl8eEn/k7U0BresXumuMfGQRqxlct7n/WiocQjU3z07HoIoi1
         l7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364015; x=1794968815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=k0BaTn82e4q78WmIUilLdqccDLVlXJY5iyynk/cT/8dNEdo9DSsGs/3mf3rMVzhk7s
         0ZWsAuRHl4BAbqKuKr18N72H6QEbL1ZVU0L4/+dlngw4fEPCRETZeS3BEoACtxCMZOuo
         vGDgK9Awm+xjS0tLsvcAZgWbBe7eINI9qvCo7c877dINPcUSNZGljf6TxJM1YL7kq/pl
         Cvl+cC4t8gXQjJYbXquvFBkAdFe/q2t0CUHZ+fz8hDngFNP+6pGCroJjQ+lHw0LH8c44
         bHYx8s4LMjZjS1rm9x1wZJm49k1BRpdLs3LZf8lKwNyE+mYnzWASjALowUO8uM1BzNT+
         7Ymg==
X-Forwarded-Encrypted: i=1; AL+hErFSnIVexXeDlTiJScYv6/LjZuaEKp8qrV2QYJq8M+d3mg0tkXz8COEplZyi3lBy7ldH+63WGW5H5JXiKM76hQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8yokvGVXLdMjLHHSeckBz3lcxdxnuEH4YQtFQwT0kDc3O1Ay/L
	lzF4dh2TkPuDpzKHJRBcYMxHUtE9Bu3amTlFLKEuzk+l0Dx8GIHMNsEi
X-Gm-Gg: AYBFou03QCZWRQ3u4MTbf9IPMAErmynf+KBfK6USGvz/cKY/cPkhlGcvSxvFIr4XygQ
	2qvh5pU1EodUmkZyqqfz/b9RH7mynppxy5WDFevRetFSSUgkYtmIpodMq8HnM8L0ECotacU6Lml
	lPLZ2JXvjuB9+fgVDIXM72gTqo3zbN8UazLyHLsmXxKdWhqJ8YWd7dmts9kNqGof9wZnJYxsff0
	egMBKzhuULgKyN2o3saFMyoj871vTbGaliMmBVHKeUzpwddAuzuZHlnNA+GQNWHOxN/yUsUlFfm
	aNbJSL6IACSabZJ+2+epLJako4Jfkn4PxqAWUlIQ9aDVf5ShhMOaPf5PEg1n0z/kKV3BLKNgjlI
	Eys1z/vo6JR1CaKzHCHyGtJ+tCpfv8OncjbGjrmsxt0F9wJ616WqFi7QOlVqNkzvJnI4jrsYda6
	C4O2UlpgyxITFG3T4KwY8f9+cTgsaiLtXpIHzyOzbWExKyPg/7cP7M3oYVhabTgWASLUeegxc3G
	zh7V5D5sFGKnRfYZdMSqYkhDpqF3B4lPHSEbiBt45mNGDHQsFuI7Tw6KCW0Bf5RVbVR6GMikmfU
	P1+Xe70IilEAkIB+hQv8kXSuFPYFNnC4m3ZIgyviVtm+xg==
X-Received: by 2002:a05:6870:1649:b0:48f:e0f6:c45c with SMTP id 586e51a60fabf-4ae46c42d59mr1213442fac.42.1794364015190;
        Tue, 10 Nov 2026 18:26:55 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22d1d541sm2789026fac.2.2026.11.10.18.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:26:53 -0800 (PST)
Message-ID: <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com>
Date: Tue, 10 Nov 2026 20:26:51 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_182656_174741_62ED6144 
X-CRM114-Status: UNSURE (   6.12  )
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

Hi Chun-Kuang,

Gentle ping on this one for mediatek-drm-next now that 7.4-rc1 is out. 
It has CK's Reviewed-by and Roman's Acked-by, and it still applies 
cleanly to v7.4-rc2 and mediatek-drm-next. I can resend it with the tags 
if that's easier.

Thanks,
Ryan Brue

