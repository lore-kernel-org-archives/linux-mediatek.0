Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8BCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khWTrPazDRXs/RM2v0O9wjs2bqj7qxq5S67ky2y7oZw=; b=FK5lajPbl5NpbQqDxTS1GwRy/L
	sdW3KQG2Uh6Yg+b5aFB/CNEZ5QYcQ6EhgVMP+M/F2BFFokXzy6bZDrxNi4SUjaQqzKtP2RN90xAjv
	Bh+T+qqRLgy3bGBfX6Y5oqb6AsrnD/CeFPx+7ZruT0i6dd+ro7+0aJtd1Y2s4PjvGuuJzJyjaooF+
	XdpoqFGXGGbU+ysK4Y7SpTwY+sJA+zPY9nfZmiqGCV9b8n929vlZWU3zSHhaSMWYvTBrWW0BauF62
	K5Rw7Axhg6Q1A0I5Gy+pvqu2nzZFUmA2J6mIJ2LjhfrIDfS6BurMoHpdkZStF3ojr0+AwMwYKvhfc
	yM0ct1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rralz-0000000AVFX-3PGM;
	Tue, 02 Apr 2024 09:49:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rralw-0000000AVEZ-33sV;
	Tue, 02 Apr 2024 09:49:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3434275ad73so953698f8f.1;
        Tue, 02 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712051378; x=1712656178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khWTrPazDRXs/RM2v0O9wjs2bqj7qxq5S67ky2y7oZw=;
        b=drekyB4e58q75qtZozanK/qqi40i+6rMOTZss/92jGqZBoZD4j447yAM5kdmkP8uRz
         gwb1NmG4KjbtNbiBvPWo7Q4rUsg3eNvM8nbDm3zdUrwFy/Toofu0wCgmO9yLM9RQgXVt
         qImHAyJuQfrszvu3f9vTuH32bMmXF7D60YCCMvh58648b7Z1YYxGv9jUalojS9O4J3xv
         WZsApetf03iT81mt83PNqEkqkvGeGhqkcSJvkrac/DbBX2Kz2m/hy8CkQbQGq1YDqZee
         CeR2yC9rV5Ro5f0ZJ7JOQ4vSGXOltygzMHd0hUAo+K9RQZT7Cu0+es4V87tZk5knDSOk
         gLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051378; x=1712656178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khWTrPazDRXs/RM2v0O9wjs2bqj7qxq5S67ky2y7oZw=;
        b=ODDDFJuQQl44bonXAjaxN1MPfu+5d+8JG8/cZLYX3Zp/sd9g0gUR7KcKgtZIbvler8
         BUcJJrWKghtrtp1IPjdUZ5Z3Cr//Dm4Xs/8S5jV87HxKiKOkANxd41757RQB3sAOIlao
         6ltGTASKZkLjOhVZ9un6vLWFh4RCOAYtVWruZsnuZ4PLQaQt/38AyYpal1NWL4/N3xbD
         KGm21fI44fan7bG1EaQIbVInfyPJJ7ndnEZZQhl3EOxdQ1r6pfEOfXPINvzhmTIxxvSl
         txCGZ09mZq5cv+IE4TZ4s+0Q/zJbtwYFExwvwLSr7km1tHtg6K4euiNlduwNSPAK1Tgc
         ZIKg==
X-Forwarded-Encrypted: i=1; AJvYcCXAwmCdT45Mtb1IYIpPOtzedCSje2ShWosKlYjeQj1uWhGOAf1HLZlK2ms7w3q1vJle+5M6On4iTKDZFNATdNTNCh+W4hA1INTwj+giLTFaoRH91EIy0Ma1syWLsWcIzEg2VudDP1zL7EltcHAWzzlAhJ33PVTzmsE=
X-Gm-Message-State: AOJu0Yy0itzzEctdlEVopdIucgLKm7QktUU2s/awM7KZtIlHEN6D3GFQ
	HF16A1JZq9vrdvRhPyKLuZD7ip68gM9jKcUK7U75O1qjMWldvFH9TEOJG3ez5vPzJcLDh3MgZ0r
	dj0JNf5oZK/mQBOQRJgH7pP+pz4Y=
X-Google-Smtp-Source: AGHT+IENhD8t5MKDpeopK1nj7kc5PGim4v4nlxjclGl5XXLECh7hx+H71FVqbAxoCfJ/OfxlpBVKd9GpIhiZyFZPPbI=
X-Received: by 2002:a5d:4d07:0:b0:341:cf9b:c8e with SMTP id
 z7-20020a5d4d07000000b00341cf9b0c8emr10357697wrt.50.1712051377736; Tue, 02
 Apr 2024 02:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231222022741.8223-1-boy.wu@mediatek.com> <ZgvRmhbvVoGHcLqu@FVFF77S0Q05N>
In-Reply-To: <ZgvRmhbvVoGHcLqu@FVFF77S0Q05N>
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Date: Tue, 2 Apr 2024 11:48:37 +0200
Message-ID: <CAPAsAGyzMBgwCTXkBO1xqETt-tvO-gD1=C1Snmu5arhX9SFrXQ@mail.gmail.com>
Subject: Re: [PATCH] arm: kasan: clear stale stack poison
To: Mark Rutland <mark.rutland@arm.com>
Cc: "boy.wu" <boy.wu@mediatek.com>, Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_024940_797634_DD895E05 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, Apr 2, 2024 at 11:36=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
...
> It looks like you're specifically referring to what arm64 did in commit:
>
>   0d97e6d8024c71cc ("arm64: kasan: clear stale stack poison")
>
> Where the commit message explained the problem:
>
> | Functions which the compiler has instrumented for KASAN place poison on
> | the stack shadow upon entry and remove this poison prior to returning.
> |
> | In the case of cpuidle, CPUs exit the kernel a number of levels deep in
> | C code.  Any instrumented functions on this critical path will leave
> | portions of the stack shadow poisoned.
> |
> | If CPUs lose context and return to the kernel via a cold path, we
> | restore a prior context saved in __cpu_suspend_enter are forgotten, and
> | we never remove the poison they placed in the stack shadow area by
> | functions calls between this and the actual exit of the kernel.
> |
> | Thus, (depending on stackframe layout) subsequent calls to instrumented
> | functions may hit this stale poison, resulting in (spurious) KASAN
> | splats to the console.
> |
> | To avoid this, clear any stale poison from the idle thread for a CPU
> | prior to bringing a CPU online.
>
> ... which we then extended to check for CONFIG_KASAN_STACK in commit:
>
>   d56a9ef84bd0e1e8 ("kasan, arm64: unpoison stack only with CONFIG_KASAN_=
STACK")
>
> If you can fold in the description above (i.e. cite commit 0d97e6d8024c71=
cc and
> a copy of its commit message):
>
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>
>

Agreed with the above, feel free to add:

Acked-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

