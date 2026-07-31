Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF250C55173
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=; b=11l94ZYL8zsBNtAtSO8hVbsCmy
	SAGpvJZINZthx3yF1OWU6nFFCSUbC7tkay8jwNyZLi9C+a46ttTI6/l32bCcBXxO3Ty8lHNDFbLPH
	YUaW7OpZn6pJAy4z5CMEyR5S/6tJ5NenH8eZvzk13Hb3TUymaW6C5kDu8hJxV7dWRTIWSdjSYkiGq
	8eiLKghTy99OYwV40cn+al9Yq6x4TqLugRVMjypIEkl7uQTfVdoeaVueShxrUmYUFLsDTNdVwbZYy
	9KYAs6fwp7KGYuREs8HKamxZSP7phIfUQSEBXmVoyWdJOK9C7r1eZQH4zZed7GDUnL5DEQu55+Sz3
	D4IKUcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0O-0000000DdI0-26L2;
	Fri, 31 Jul 2026 21:43:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0M-0000000DdHC-0ZZr
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 21:42:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1087248a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 14:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785534175; cv=none;
        d=google.com; s=arc-20260327;
        b=FFBteS6bB34Li3uf9/4tSKxJTvXIwlWROHRT+/CG9g3Q2C27AxS3HssjSOgEnrKkGM
         KdxUswj6SqtS7LDxCU4onMfHvwDb8gxiUpLJVpiU009kjJpj9ski3DEE5B9O2lhUAa8y
         O/OVDJf0EVW8NWizg4b/wDzYKKQ4n7PIaYkV1TwOfSAUaNa4xaIsK5yvTlTe7xYurnSv
         gGQCLu1dygL4+pAQrmYYUQgQK3HnXlIOitsEt7EMnI7an/5O/dAs6roUFLilUioqi2pR
         DjfUxEJHlgWQzebFDB4ExUE7u9XgpRtWoFVSzYxeiwsT7wwy8nXqVIQmCfugL4TpM+Be
         yV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        fh=D7ZC15h2gssn7kMJ6eJFJbMHkndoUopGGF2UKmh/Wlg=;
        b=NVkRNbgpqasx0Q/8Jma6IETeg+WHC14+KK7BA7FwmNPj3IpFvc7RM+FshVO+hKwuKS
         YBFwRqxCuMFDKd3K27zwLhbAGKJVX0esuF0UsBLVMWiIzd0IxFPVi6qoZPfkk9R9OgG2
         kfz66G0QT5REoEN5W7HWiAyXC98pGj+7OZHq1RM9hVE1p+1+vD3csoL2ENm7C0wg8sq/
         D+n0DOZ9wRInCs6HtLe2PVV5RfV1HkzlIWvNgh9KZOpMQYFvgtysX0AcowOoiDnSIDhE
         thdkB2J4QWUsnxQ/Gg+5URTKDQ7GZIEG163hSZmoMvM87w8tpwlpqwt6L4tSFnAs0xqW
         ugaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785534175; x=1786138975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=ORGZhSVF4dqx1e6GOt3KT24x5zTK/69hsuo+J8S3MCxwfshcdgBCDmJzS5hzzndgP0
         JTgnv4gNabtAb00MrSZlF/NJ8Jt4ZnkgqA9RIvjmR0vY7UiX1yZzi59ArNG/L1OGHt7l
         ZqhCshWmYRj+KZs9gS5F+9xxhcG01bBEqIeaPt1GRxKovPN+0g8IlLV92Ikx/QnF6GNE
         BeX8wojWBATwHs2bjN2dUAQF0oftJF8jjHSj2MjRY9z9xy1oMQve/alCqIHr0FHCrvyR
         0k31F+2uTma6J7Xf9vWBhYR+UYHZRI2DUBQ21/BwSj01Y+pgkkV3TXh+tKy/ULXCAYgw
         7I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534175; x=1786138975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=l56Gl9n0CiYGU5BmrhM39gogWl8r6ZMHr1emuf7X1hwWrXPOVc5ytqgoHPDlfgUtC9
         +2GiK585aqsSpvKEz6dedlBrNaD/PhDv32/1vbcTXy/gYXyWSTGQhVp6eRsvmoLMgGmh
         qoAqvES52A9e0JXCKEF29h3Q9FVfByvy0hv4omhFLKWoerQv5YYdzbhXRs3YiXo8SeYr
         q0yfvdxSWGeqQaGG7+kJ2SAvfSjWsZDWO3iCawUnpCGRsNr5MHz3sutAx6QpaeTol4xT
         ZI62WD3fTBN2/gEEpzbU9c9Vlrj7daY1wE09OQWnE3HGCtQh60lEF95sCOv+1WwzA3+T
         EVEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIk+Jj0tZnN27ODixMewBWlBKoCl4I8n8kfjh5sllr/Rje95olpJZxmYAPFYyyiUEpylJ1juuQOYWEpWdJUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznxe/UsyAjeo4tWdp3p4uGDM7qtP5GRDcJcAXXQWrShR26eGbY
	XeGTvGiNelqXLn+wYq1MM9onXG0lkzmRo0ay25s/S3ZSEwBAU47H8Lmger5ds77xScVAAekTo68
	HqkDl6NE8yC4VHP5UiMxDXXRTBU9zq6VIhpsC6xwB
X-Gm-Gg: AR+sD10xtAm2GW8F9JOWQR0EixtfjWVHfS9tDPZnC9FtVcqORKYf5psOzQ4Q0cqdaF5
	JeISIOuhfan9PVMAML1BdvPAsxImSKeywJ91tQroHCfkHGS9jWOPXy8kvtKj6L9odqWRTfZZjSi
	R4mDwIabYtRMEv+PPZG15Di+nKP8eG8ILUfZUuSBVj25edkVnAAREmdyL5PDsQH9wHX4zEZnVLG
	p4cH58Gu2wrZSMlqOEuBcREC1ZA7WVKk7M2EjJydNsn/OwpWEVVYgzGqRtbdXbaHCwo/GInTFf2
	YphquoBwqorBwxPncmkFhPIV9Ma/LJLZziy2kYs2h0r2FxmKqcg/c23qWDr1frd+I8kCLtjWiiK
	irfDwASIIeXnOWgKVEANJ4nCL70Hq3LtElb6gL8N68eXPbfr0s0mvijt1LGQ=
X-Received: by 2002:a17:907:961a:b0:c16:8aed:cec3 with SMTP id
 a640c23a62f3a-c1fe8315915mr71437266b.58.1785534174731; Fri, 31 Jul 2026
 14:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
In-Reply-To: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 14:42:42 -0700
X-Gm-Features: AUfX_mxeDK0UjkpXMoBLEays-SsJvXAu7pPwCo_E4Ldx0HgqctY1Xwd1UgDCFnY
Message-ID: <CAKwvOdm0NpX9LXO9J=u4+S3-VzJN0_jxBMy=aDf6zUi9r5L=qQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: fix ARRAY_SIZE() division by zero
 on UP builds
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simon Horman <horms@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_144258_221050_820BD51F 
X-CRM114-Status: GOOD (  17.90  )
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

On Fri, Jul 31, 2026 at 8:48=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> airoha_alloc_gdm_device() initializes the txq_lock[] array iterating
> over ARRAY_SIZE(dev->txq_lock). ARRAY_SIZE() expands to
> sizeof(dev->txq_lock) / sizeof((dev->txq_lock)[0]), but on UP builds
> (CONFIG_SMP unset, CONFIG_DEBUG_SPINLOCK unset) arch_spinlock_t is an
> empty struct, so sizeof(spinlock_t) is zero and the expression is a
> compile-time division by zero (undefined behavior), reported by clang
> as "division by zero is undefined [-Wdivision-by-zero]".
>
> Since the array is statically sized with AIROHA_NUM_NETDEV_TX_RINGS,
> use the named constant as loop bound instead of ARRAY_SIZE().
>
> Fixes: 78a35725e533 ("net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loop=
back to QoS offload")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607311850.6p0ZUVq4-lkp@i=
ntel.com/
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index dba7c52c0896..64619e9a704d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -3467,7 +3467,7 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
>         netdev->dev.of_node =3D of_node_get(np);
>         dev =3D netdev_priv(netdev);
>         u64_stats_init(&dev->stats.syncp);
> -       for (i =3D 0; i < ARRAY_SIZE(dev->txq_lock); i++)
> +       for (i =3D 0; i < AIROHA_NUM_NETDEV_TX_RINGS; i++)
>                 spin_lock_init(&dev->txq_lock[i]);
>         dev->port =3D port;
>         dev->eth =3D eth;
>
> ---
> base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
> change-id: 20260731-airoha-spinlock-array-fix-d239f7841cb8
>
> Best regards,
> --
> Lorenzo Bianconi <lorenzo@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers

