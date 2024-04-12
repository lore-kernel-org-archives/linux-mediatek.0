Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436F5C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXhULSRsCjHCssdtYJT1cvp74SqjokSLuEvNUkZIlH8=; b=i2Hig/waaTACerfzfpzYQcwINm
	aWmCL+YSHiyG5qk9gbw6tvWZhCzcLiV4dRPP6IkTf8nQ+NzweelTAf8B9R4NxN4YbRmx3npAw1Eo2
	41HvtdqHAJlyavmneCLzSh62CpaHkSkKn6b5sh7U6QpsV6sMQa9Fcvu6fR7IBPhIW7um1BJKfLjUR
	sdpVQ0r10W+82jF8uncEbF98slAtFBRw9TMKeLl2hwY3iDoKsFt0bzv0UDU5hpZnDwyJzXF19OMmp
	6t1r+gBF1tRIgkRt58Y1yHZ6iQOq7GWvUQCEFBwc9/CF57hSjh7NlYLSMS3VCqnFw7kRiKIfECPhB
	BIh7dBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCPU-0000000G68G-36fa;
	Fri, 12 Apr 2024 08:37:24 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCPP-0000000G67L-2qgT
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 08:37:21 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dcc73148611so736985276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712911037; x=1713515837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXhULSRsCjHCssdtYJT1cvp74SqjokSLuEvNUkZIlH8=;
        b=RbdR5zHnTVTxkOhMfOpolOx11d0UE3bFAkrNuGy/rC6oAwifG83Wm3mZ3OkA6PXd2n
         xwBhR6lpXHTy2PDVIwIP1/VxJFFwMNc1NSVWXgSBjNOT3s6fNYl/0P+Hnms6g8g5cXBF
         MhjE48c4KpKoDY0Jf7SipFxenbQdW/zfs8EfK7NLme8IP7XelcHR6sqYS+dS2HCG0oIl
         r60SG7lqFzWrsn8yH7gMJ+WW+0vSgWiNl0G6Ql5hY2Ya0TJ6dCqxXZ3lZ2iyiqWuOJYX
         832C/ZP7+XiBA82IjV7+RBEsXdisXvUcsnC+3n8Y72QH0YbJVT7JxPSI2jFaYQnoh/gu
         GCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712911037; x=1713515837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXhULSRsCjHCssdtYJT1cvp74SqjokSLuEvNUkZIlH8=;
        b=HJ/QKy9QE9ZzvEDOzp4dce+DRYg478FSYWhkj69xROHnWyOwRBbm3q7M5UvJ74FLAA
         9Epx7+Iz1+Kvppflrw2FvdlJWqln0UQV+PM8XOjG03f2O9aXh2eKzR1XENymdOg3TZad
         Rvl0xu9F5U7KtSbwSsSuPzeDUI0P6IpoJ+SkQ1RD9K8xTvkZsrffn4JxJZHQvzn+9z1+
         9LTKRpbfkV1UwRW0iToGAS0NdXC3L1wS5RIhQYNqlxCbIaxaJX9bzVIw9xuIIaLCr/Gh
         slTfEpiLcNkKX4OlsATeEWPbmCmy+NE/MARfBbq/J5HEWCh//a9nMVGNEMVCzWpY1wyJ
         6/qw==
X-Forwarded-Encrypted: i=1; AJvYcCW2iahdUOvG2EiiyJiJIpMzi9H1Azv4ZpmOLZWdCYkxCH8C7Gc+ijadF81RyY9Vg6JwH8LQAXEWnqglH0eAh7vcXZdJ1KTRZhphQhL8iHzo+H2W
X-Gm-Message-State: AOJu0YzdDcS3yoByCywYmUyEUq77YB9vs0eW/r2C5gnnri0puQPrJjQQ
	0u0Ba8Kxj6CRT4avQSe5bWJHbM1sJFmXhRe39oJMY1RA01mAAoJbejXAy8UfRiafsTlscvmzyWc
	mccywMOpmlqybUUwxTBnYNzv1zxAsH2EfIbR5Fg==
X-Google-Smtp-Source: AGHT+IEDIX9KYQNW/UojXF2G4UMFeUDK0N84b3GjCBGs5oNVjsvP2eeUiBkx3liWnNP1h3R3ng2gaSs2JzTXPv1Htfg=
X-Received: by 2002:a25:c70a:0:b0:de1:133b:5053 with SMTP id
 w10-20020a25c70a000000b00de1133b5053mr1898633ybe.20.1712911037446; Fri, 12
 Apr 2024 01:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240410073044.23294-1-boy.wu@mediatek.com>
In-Reply-To: <20240410073044.23294-1-boy.wu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:37:06 +0200
Message-ID: <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm: kasan: clear stale stack poison
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Iverlin Wang <iverlin.wang@mediatek.com>, 
	Light Chen <light.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_013719_769862_D556F869 
X-CRM114-Status: UNSURE (   7.57  )
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

On Wed, Apr 10, 2024 at 9:31=E2=80=AFAM boy.wu <boy.wu@mediatek.com> wrote:

> From: Boy Wu <boy.wu@mediatek.com>
>
> We found below OOB crash:

Thanks for digging in!

Pleas put this patch into Russell's patch tracker so he can apply it:
https://www.armlinux.org.uk/developer/patches/

Yours,
Linus Walleij

