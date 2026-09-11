Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14741C79FA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=; b=0g9/H2O3dj2/FSzqjeaRW56GLf
	GtpAnNdRDzl7jeVLxFJJPdYVtF1FmQghEQVQbgEGenOwtSdzgCp+rwHGSpSqhSmXiWHn/ukSWEZSE
	2t+vAa/yg7o27kCO9EBFE8ovwZM682wVH6we9k+njINBhN7SW4rxL/JdWnOPizLd0HhzZcv77UVkO
	V+91y9esXGNwTwvAsWDviIKdzxSrxbPpivVYurK7mnLs9kLxA4Qi4OQt7pkXjSC23IKqMhmdChgmq
	ahhmExKV6Jn9+j31QsF7MAsqHaSqFC1TDwx+s84pw3/8xZsJ37O/a5tmzHihsR+qSK3MI+zH6phDB
	zjCHzEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzS-0000000G45n-3LDv;
	Fri, 11 Sep 2026 07:48:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzO-0000000G42r-0pS7
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 07:48:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so457986b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 00:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789112881; cv=none;
        d=google.com; s=arc-20260327;
        b=QS/Zk+mNRpihfRykL14tHiD4B4dv7PnV1OCiGrCPXAspwIYG3ZwnSFz64yQu3tmqdr
         vbvQFcCErMRXzz1ScIxENxfzKdNiJrOCBf1pjAYvQk56hlW5vGhK1YRQWfUoRpKCpiqj
         KfC7GH5MDxFqFKewLUaWk3he1VYYZZVdreANUPAIlevo9m+Lz9TcsgN2LDbg8RGX0PSm
         Cdrbb+feb2hGVZvN6B46fQXCRPOpxA94qM5yn7PxDGcsgSJaoPl0kBAhKaFpTNPUo/Aa
         1Qm/PkHenQh2fTG0x7aEC/qh8SKlgTfwlK81C+SNfPWb0NhpDxpR9XIefOJ4lT2/zzQb
         3CDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        fh=HxHAHuAdbjDqcFjmO3/Xpl4K76gvdp7dRJ1MzPvsiNA=;
        b=F7ktYt0zScNjI90YFuFdt2ouxQsCGKNIUFI8qdW99nfx5kSdjrYeS52afUaZn0YmBR
         t0kTCEfj8/Tbo6JCI0GMtm9AnbfcN3O63gCkqOIOFipQCcy9WtpRgnvCVQfPK36WVFKG
         PTsyA6IbT69ejS2CxYH4bFmOUo7rfwhqv0yoj9XNBfn1+j4ds2jdyUrCIYG0bwnpy34x
         um96hjknIgyXfYHrS8c+k/Jk69BqX/123TX+jaCnYjEoHH47FCwPmWzgS8OWZ0rnmKTW
         O/26I0FREzslw5rBYS436MUqrLjfEMUsJlMKX/V4cDLjPB4jm13WymM+ew0Wyg+pxE+/
         nwJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789112881; x=1789717681; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=g2csJUTe3Hel2HJHUkAkeOIIw/FAcAkWcpIUDqFVKKsrM5wnLXE32U/dzTCTs7zcws
         hvuiFdq2OlofkSKUN/uuryzvn3pxJpH758hPGo2PQhrWJIPwwp3RXtcTnR7DYrSygVIh
         INBK8vtvihGwcNgUKoFofnwNS0f2Nf6+BZ76BUx5/PHzZ9J8CgY+qI9EmY0NyFlccmcS
         Sm3g2M1wWNX5hZVx4dCBdRnEoWiJQlLeuHHoexhxPNsXQ7f2MIMGbru3/jdzREy05isl
         dDLU2kc9th9kIPTCO88fuhdzG8vxC2hnwihch6EfTNIGkyFSVZsWYbTc2lJCzz+Ma/kn
         fKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112881; x=1789717681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=KLrN1G2mPAGfxQzRSxKYJNjm4pWxh3bK5+eka0j7LhVM2+YWNCyvMF779AZcXdFALP
         DDShQ38bSzDFPrqoUL0liaYBO97wMTX+jx+WsMSKQWOW9w2orCGeHsG89WNQH+e8BKQA
         moPvYxA1YD9LDyQk2kwgXs2rw8cj0PuqngQPxOryRh1tE6OD9B4B9zPfPEUUwuQJZ417
         CfI9MuIcozrMET33s/Rh0LfKK4F/6z2LNTsIpbregBr9wekERVQz7Fymwrh7DtI7mVWK
         jDZakDZEouOaz2oYVve2Xac6CrzseStkVDP8SyZ6xGI+cV8YSRJX7zbrQ3HxY4lwe/FD
         YXAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3YNHx2EU6klz/c3s6eZ0yWW3DAfTnKSHjs0z7RIi9I4q4JCjxOZ0u4yrCniUu+5zNLN2W5Rj72QgwISBz4A==@lists.infradead.org
X-Gm-Message-State: AFuF++lJLFr3mwY64RQ18IwqgPcOtXFNz733pQl4N3pyUfQU3aHuwvWg
	YWdqwnfiBLt05ASh+FlLa5EPkPBAHZ5HubK6KPoO+D7EmB68+ONEbboxx96LV2r39q8QdFM7Rwp
	C5Vhi6yNJMy+tRCf5aCeh5NLKRIPUrOQ=
X-Gm-Gg: AYBFou3zabIHXtgUst8yH9OFmjO0p/T118m2bC/MKBqOPpCHxJ/MghUOlH40GMLjr4C
	tM57vy0f6Ewa65TlQBprvdlxQhMUW7jBjKJe8D9/7YhMA7EFmpfzCPg+/iwc8Dq2b1FKAADwYIg
	5g1M42UD6gBvpHmIbN1ixDfclb4YgyHV2GASfOxtjytg5vaLGD8R+zjXYpTt+uw6cOZJNTYUNIE
	PWq9pm14qy6q6rFbnyCdKjB+Sk77x0nnoJnRiNEqka3VvJs0tw33b4Jt1gU6ENTpFiC0vQ1RUKE
	zIuJUOn2wnP09SudVM8PfQxcGwyPiqKxUOTDHjUyzDbNeWajXsRDZqMsITgImAfOvZHaFPmc2vv
	/6BVKiojoGw67meNeAZ7+5HL8ToYX3KEq/hldmdmMFXrx2Jcz/CsFCqZOcXBaDHd1T6Q=
X-Received: by 2002:a05:6a20:a103:b0:3d3:adbf:7779 with SMTP id
 adf61e73a8af0-3daed3b7ec5mr5165165637.21.1789112880724; Fri, 11 Sep 2026
 00:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com> <aqKwGQDkB_HruLyQ@stanley.mountain>
In-Reply-To: <aqKwGQDkB_HruLyQ@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:47:48 +0700
X-Gm-Features: AcwNN1U0HOa6yp6q-cu6PKO_-PEzbPG32NAKnqHP9l3WjK-sZPO65dMRXGkz238
Message-ID: <CAABR9nE+NYF23XqXCZiHaK7CXhcmVKLznB5Xz3eDr03NCM2dtQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_004802_246622_ADAC11B8 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

Hi Dan


> > mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
>                                            ^^^^^^^^^^^^^^^^^^^^
> It's unsigned int so it can't be negative.
>

You're right, thanks for catching that. I'll fix it.

Best regards,
Phuc

