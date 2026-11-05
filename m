Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CC606A336
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v8uzq3KO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfF9xjfE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=; b=v8uzq3KO4f0yYP0S5bomB2lZah
	ry2hVvspoXT8tsI20UbO4wTBK8TwmrE2Zppb0aMqmLKINq3wF+VjmMV/fWgHXiO2q8rD/YyEVYrOR
	s0VKCGLkBajCuPdbqo50ooOLz2mCJOPCv0Y9q/j6x5WrwGF1QDGt0GdJ0+P0CMTUSVLl6WqwpUzSS
	e/iYZ217XtqGkbv7qyHJzkpxaGNDGST2jhVMdi/BSokWdvm6FglvmHxIsTrbBHcr0j/56543lJ5eI
	VOS66xL8H9D3BIzGrcF2+amDbqfiJuG6IUzYGPWSvX2208vMrN0+wvWGOo4keujcFdEtYc5m1Oy0/
	UwFxzfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtze-00000008LcS-3Qj6;
	Thu, 05 Nov 2026 09:42:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtzc-00000008Lbt-3YDq
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 09:42:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2757981a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=rxJiOtOSeRxb+hbRBmi8MSRJw/xsTffHCzFjtU5hs1v2QbdN1NmcQyMVyWZK197DE6
         JP0MQG4eR6StBVkWEFKR6z0FRcJF28ZFujzXSsH4TPFLuHG4jJjbwcmYbE7eN10hWB0G
         OLkKFgf4BvvrsjEMRN0FgNiwISKP0WuPArIXhivxfOJGiglyHlOYAizCxedQRk0En0s+
         b0QERbHKbkVXiP5toQMuGuMfGX9Z6y3Yij7naz7r7vmaytFqizUeY8JjJesdyX/AXa0o
         SrEV8E8khDcr/ghCIdd+ZOal7p0u2mocbkSx+UKeZ4rJIrjRX50QIdGefhjFZTItQBJo
         FudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=HCEqxO0RgbOAubEHss8yDItSNiqKQe+L/Qw9rG35gtg=;
        b=KLs74YEDs1eI/p3Mxx5vMkU1Xvxj+80SPuO/20Q7GGcmjWhzAzEzwvbuS0U+79roR5
         qB7ZD0spQNMPxJhm51DrvmRneprSrsnHTlnntq3ZkeqmYHCgQ9SFmFqGLC7l+FfyJARt
         LAR8Ajcx/w14sZZxw/a/cF3auY8ShNV6HVE1/BWc1JG79ZmSnBHjWToZKHP9S0NvVCGZ
         sb+4IF5nsKeJ9X8F0KTP0KTZveD87SdEZ4030PxYRQCv9jhGH4nDytQ/k9OkGBNuJyOt
         BrhnG5T0/MDH2tIV5lrVD3RyWb7e1LfDHmFG++pY1wEo5vAknLf0DpNOO0TdgF1+454U
         14eQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=wfF9xjfEjVR/PBstarnxcLN7CZWuhgCKaMyzRwTSNnjduNGaAh+8S/dk1H3EkTaDpO
         cbfKGRJ+Pt6YFbf0EGwGwWy4v/Beb0ySuGW4j7Ntlol5NMI5+g3h/FT6ia9xJnR7iWFP
         ttaYCtGuElmIOwF880pBXvyuvjK9eR+8BR0p+Sz/d4QaMSdyhg3Bbm73rjmJP8hOky+i
         2yAp52NnZL5GQeu35WeO7MYQg+pi840B7ILjaBb5JGtJoBrl6velQdH5oOGPT4QY1CFl
         N34o4/aQUtPeby4Mn4vtxILKyKv+Hbj4qZSuHmZMcBhzk76zLTVdLJkgGR9cii6AOSZ2
         9etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=KHXWnz4Pxfm06dF/4TSNJvJO/4p/qx2BCR/kHHWSPJkYUtZFNpN+6mF3zM6Odl3qkx
         CKSwDeCL5ErWJX7KzTX9YgmwmPEeRTS2qQBDj4OszE5grWLgp3pMB9C4Egtf65Rtm0+5
         r7G0k7q5PSk3ae3nTYAQy2aCNpqqVOVklWAtFR2qvP73AC05gm5q0zGeA2R6nUKPlsCD
         4Lzl+KudXNGrHjKLlWu7lPIltfbvZRYUiI1FVvJ2P93KiQhWVQxqFrI6F8Uj9YS/lDiW
         9IQ1e3L08jZmDWxvkUPlQD3SHSIX7eBEmZXZ7tIaMgR4y2McyT4rs6u/xumz66zGPS8p
         uG+A==
X-Gm-Message-State: APuU4Z/XUkyM5Ob0bnpx2a7T7GzrkbALrrjT23o08KzaVRLxrnIfhkZF
	f6fzgWfebgnhdL/TAQ58W51Xda4L08vjx3mQc2rLSBLADASki4HcS0W/YW6H+NRuKhBytqqOaRP
	Plr+oDdQc7fc+gm/tQNx4wJzfdwuBqRk=
X-Gm-Gg: AYBFou0pXkuWiIp1TKPnjHR1HnUhPS0+xbRjiKbW84qUocV4yHnf4VRjWURvpyHK6NJ
	PhEfqFPYrhjAVXQVIV1K2pXX9Jxz5s9QBRhZATKjsSysmhoEPSKpl6eaKnFZuO+FN9KLFGc76Yu
	GnTy/qalAHGs+uPqvcOayWFHX3S/h9a3+SoTUxAiUPpvrI+p47mtUDZ7SoYnmIAhJJc97U4TN+2
	b+K479WWDMpSHibUL8lXH8ZU5p4APauqzI9tPrBkaJuwPzEYP+68LGeU5Hyj2Z9vg2qFjOwkesq
	fHaSCV28EIWjue+O/Eh7alDzT40opdS6FoqOEZJPjDqtUw0GRiD5+TcaBbhZOQBWhheg6LnMj6A
	rLPLb6AXEytbuantxmK/TTNFhitMGkQ1FuVw=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_014248_940156_76E715A0 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

