Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FCFED2C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=; b=X12Or2XdWt3lM06iAPtKAS7SKn
	PYHJRtP0SLUUW152GNEqQqROxzk2s/vukhxwLRm7KxvJQ2p31EG3ivcl2WttJQvuZvSv7oUU3oKqG
	W+85o9dhOvi+pK9JcIFcg3kiNVMgMOmqgjrYUyMRbZ8yAOAJWyZ0mq+fKkUu4lB6C0WRgDg5WuTx+
	X084y/3WmZpjllxOse3GPKU1bp2RioujJRv/REFbIKAUEtP5216sE3MlBxh9D2eMdz6+axV3MMUpO
	ptyZDTO15rbUBLiUmG7G65ClXwS91OYdRGVGtK9oGGw6BEs9Ts0OYd3tXpUUVCaKJ1zAqbB6kKCnf
	ora4XIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Xn2-0000000DGxT-3lMT;
	Thu, 12 Mar 2026 04:36:52 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Xmx-0000000DGw7-41BR
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:36:51 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-899fb030812so8391816d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773290206; cv=none;
        d=google.com; s=arc-20240605;
        b=YQ8x7+wNc0hWJjHGCdzhrBIjHudYWvlvExzW8WA78DXFEq0wOL7sY08pDRDnBG5GSn
         8ymWuD2pdrNuwk+0vq9S+6oNdHbsnAlncPEpPVSFZfYgh24T+FPBhBtn2f4ziC3cWGrQ
         OrHMgbpR6K/2RCcLE0wyrK9M0ZrBU2DDVg0n+5pFXaQ/7y/vW5rL+hss03ugQ+tsbbwo
         6qa1K63TDBDfBwjoqeMsb9Z6eb3G+PVA7xBwun420G692vr6mUFPsYKMn+Kfuq1e+SMC
         eCPLU91rrxUr0kISOtEiJt3fud0roCYVFzqnSYsMXX7IQPBrdX+vqJfPsuTEkRAY5oOp
         ulIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        fh=m/7YNRPAZxkHKbDXzpEmcKdXt+WuoW9GNbAYD1lo620=;
        b=b5Eeqc1rmpqpzzy2seqmdXSm1SzZ9YCXqHsp79YBjNIH3czZIWxZHZln1PuZpoPiFF
         QPzLzQNwVjJg4FMd2nVGc70aGRzJhNbcTs8vccEmBdQCW+NperLkkUhNhb2DTGLR6Rnd
         +JWKO8gwpIxNpkGU2BuXKViQP2+vbWeZJyVLrVlEwcvC6L7rLXNt14hGlKNup3OJe82v
         xowzsR922dnw2YH5ml3iWtlfiM9UVsMtsnAcoVMQEpor4Mt2yTp2P+X1/eLMQtVsPkaS
         bINTP/2f5XU5mdJODma1bvx0X+7iVmHSd3DJ3fX6MW18cy3F1QA5sqd+v7hVXe5vdQhi
         3KmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773290206; x=1773895006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        b=aBiN5TFYUllj1oKQ71LboihKZmwxaMNQiOmSUJG/l2+AVen9869HLIHXw3Yo+zvG03
         80F/GxMLXdNucSbjNOjP/nIb6EInK347jRQfl2mjwrMZpM9cO5n68K8353fI4Wmo0ZTl
         OnU/BPriMFIqXRgR7sCRUcnYkHnzF5dJIsR3tcs7u4hKYtep6ktlyE+kPRaWUG8maaye
         D0L1bqrxqolpEb6X3r0OzWP5g/3SXn0wxJ2ee3q/ONTE5mFUv0nNM2AtBdxPqPPI36dp
         KDv3pjpYZqWyuVFu/MhBIpMBUlwYVJTWTHcOodPljuy3212bd/jT0ScIcrDtHgNjMfP7
         1iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773290206; x=1773895006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        b=elLDSYzyUKgnMmFCxoDcnbXc52AbOQtUG6U/Ugoaz/VcFZPtkfWagc0aiWB8nkU9kC
         RCze8GDco6lNXpOxnQcrvFVtZZH8DvBXWElAsrBHl6jbiaQb/dgypi8v2ylsaxYc+HmF
         byOc9gh0XQSXKi8dy6rSwsPcqsQmXvhNpEi498fdM0Hv/fjEL07XQZ7WoDqBFZQiXHyY
         V4aNSUVWusohXHwusE7ljIGcP+SUfkSIgQPVhcjsxFkrh6vHkFNWj55xtV/IsyfRK4pV
         FCD/8C6SSmOiCtrIhkue6AUjwZzntPPWRw6ay1Vfio/mR9itK6Ys29OqQKuN8MYXjnPa
         V6tg==
X-Forwarded-Encrypted: i=1; AJvYcCVzJ1sz3Nl3QDdPaYjVqW4Ttsi870b2Cp0e9WPOIC0pbAfH+EsETlTDj8HKvYDApFGJy9kci8TKrOEMkBUZog==@lists.infradead.org
X-Gm-Message-State: AOJu0YycRA0r4+9zcKOAjFOo0dLIZFgm4H0rw66eKYP/E/JpiOiI+Xk4
	ZLJyjU2tUuJGyV9F2Crk5cD2nf3xBJUOsyOLwEg1fDhPgQfcge6c120XWh/DFNTaIgxagDJSO+b
	RA8ZwOBzmldBvcJJvG4Vw1K44klYdYOc=
X-Gm-Gg: ATEYQzx3O0WWSIq3uqbcCToa7qdem9lJ2ecRrKnpjWK8t9jQVACa1K3ne0zY/AHxuaK
	5hvla/DXNdQS8RbNoreUi+BfU4Ewu7h2PJqlmXLp4qVwm0yjo6U3j2FDGzRvaCpjjZtP0+NRJlY
	AmJts1WVcHuyltcu3PQZXxIAFMyqoERpIKux43jCjLvhpSj3v70FnshPw4mVzdi3b/op0aZZpXm
	YZ3S6R+0DJRCI3wvRcyY//r+tJzXRz+x4QfrixfPLjBSB0pcxthTy366c0NWmSSC1eObYnapL1L
	IOpN/kDJ/nPY3vERUN+iUwhvkQ==
X-Received: by 2002:a05:622a:1921:b0:509:17e4:ceff with SMTP id
 d75a77b69052e-5093a0c6df7mr62767181cf.31.1773290206588; Wed, 11 Mar 2026
 21:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com> <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
 <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com> <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
In-Reply-To: <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 12 Mar 2026 13:36:36 +0900
X-Gm-Features: AaiRm52b3iO4YllKLxTy076zO5CoI8gqzYjvZNNALgsMyNPOjlsY9BPqBID541M
Message-ID: <CAKr_iV6tVkT1be8EjXoNjMerTek0s79W2-n2shzt-wrmB1bYgA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_213648_148326_EA59A305 
X-CRM114-Status: GOOD (  15.81  )
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

On Fri, Mar 6, 2026 at 11:06=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Ouch. Well, it's mostly done then, hopefully sooner than later :-)

Thank you for your consideration.

> > - PWRAP and MT6320 PMIC RTC
> Start upstreaming the RTC (and MFD parts) right now maybe?
> That all depends on the actual state of things, of course.
>
> Remember that you can upstream whatever is clean and works fine, that doe=
sn't
> have hard dependencies on other components.

mediatek,mt6397.yaml says that "regulators are needed",
so I have to complete the regulator driver.
It will be completed soon.

> > - Power Domains (scpsys)
>
> The power domains should be handled by mtk-pm-domains.c - not sure what y=
ou wrote
> but if you did it on mtk-scpsys.c that's wrong.

Ohno! I wrote in mtk-scpsys.c, thank you for telling me about this.

> > - eMMC/SD (MSDC)
> I can confirm that the MSDC controller in MT6589 will work with mtk-sd, t=
here may
> be some very small modifications to be done.... if any.
> The mtk-sd driver does support "very old" SoCs already :-)

I forgot to add "CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy".
SD is working and can boot from it.
However, increasing the frequency causes errors,
so adjustments are necessary.

> Keep up the good work!

I will continue to do my best!
Further news will be sent via patch.

Best regards,
Akari

