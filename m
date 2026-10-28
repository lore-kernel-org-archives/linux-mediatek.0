Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2FD606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 03:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+KKwN2Z;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RiSFbNpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=; b=z+KKwN2Z63o1Xq
	oeVhNGNjQichiBq2h4h2Dt1CYO/vbOLV2Q2hlIoZjSuLt5Gz3x9I5l8n5KoLvmqfenVlK6KCHXQxv
	GnbzVpTBpC4E1Mt/6hgy12D5uxkHRZzHPV4b8+XHd/qqeBtZDHriUEE0Stebfr9C2JSo7N9bSjTK9
	MnvQle8K9MnsElCgTNCRE5FdBthNJ6pO3/l5b69IjcFcBllmmkN0u03p6o+B5s3TSBucNJLpTwqz0
	lmqBL74DGcvqIz3QBxuow/DkJwaHpHPCX/Bdw9q3LCKo4RDPBGAxZzPfwWtHtoqJ7Kj/5WUVeBAOI
	vNf13viSPoa6+XtL37EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLubV-00000006ElF-003w;
	Wed, 28 Oct 2026 03:45:33 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLubR-00000006EkX-3URT
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 03:45:31 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8ab43af5e97so6369827b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 20:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793159128; cv=none;
        d=google.com; s=arc-20260327;
        b=DiPW+FhAyaJgAv4qlnUAk7VyeCDJeE1gD/tZLRdzIO+EIc4pAYHbqPz6fxX6qL8ZJn
         b5vhMhnKwJkvcm+m6CTDUDMGG2QouxQgMx7j6S509qr4moXFpLAfkK3fPN1edN+BRZgJ
         lyalrQY4Ts/XJtl83FZycy/6Cu11R8HFWM1qvhfMCRxnhlv01UMbWjlOV2Yki5bF6i/J
         uUEnCO0lYNIjkoY+0Lt48aUnyfnH+wXr0/pTiSZnAV2acV/ulSS+9g4Wmn71yj1wGy84
         H75AAnUcKCZnv24c/icVOWrfvWQVWft1akYuJhqAOg/vnpC3b5bZ+r9WymRBjfxMdH7P
         GFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        fh=HukNlDt34Xm4Afk1o7WsWee/iq32m0h5TTzfoysWb44=;
        b=W/JLKSejqaWhY8em1eIJzZO0E1Li3HBemHtq2KtyxEyDQmOICQDSnc8WSbIihTHq+K
         ZYur2UeK8S5epgyGpXlNnST6CcEmzcfG2QzmocNrXsQXFwDINEgdvznAXGbf1iHbLhBX
         t48KAE+44UcmQFc61rIkW/OkFbsP4S0ZGRVbfw0jGdjLLDAtXV8uQGm0Kl9jRdetyvrd
         iXFAmFtU9jAJjwwVjCTDyYsX5O/a6OJ4l/s+UDXVu9CVv94QsdT9Iiz6Wv3IV+R9Q3J4
         sorl8XEWVRLApQiP75732zGIXVjPalpTzlfuP7K1uRSOC8wg0ufTGLrRX4CSjyLx38GZ
         /tGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793159128; x=1793763928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=RiSFbNpmWnZao5LNGp8HGVXXrtwqMQXAZewxsStXZFUtso27kbei+nuw46HZLOgQIN
         +8E8v/ZYcugzW04y5qfCBXfLaZPGg4iiznZymV7nP7kcG4MF+mXoq6+SIMdbWyuSxJ0I
         pcGKSPN8ZVx0NDhFXaL1RBaCAyqTRtJckbaoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159128; x=1793763928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=K0TX+sKoYjlHaAnQAz9uTfFy0yh8yTJcr/q2j++AnBKWpf0e/IxRTDX9jqM+Jf41Ou
         44OsOdtC1Dxf2ZMwEJN3jY81e3B3SweNEOFZkgBa1W1SOYaQrhnLsf7WHeCTcTb6Wte7
         0+SZSiFPh5aeV05Rf+rnE1G2Qv9sl0U0SjUn6Lmd34vxS1015OMxm5m+rW6FEhx3nuBy
         ns+MyohlQz+cIwum2uQV3ZVncoc7Eg7u27DKo/MUtkiPWO7hdHHsY1JZrUg4A8nNvoCG
         Qk+w+5lq3bSDWKN2BTXyrpkXy4vUNXSnZ7xW/IvwG+9saEX4MxYqF/gGy6i6sk7tQPWl
         q3SA==
X-Forwarded-Encrypted: i=1; AKwUvBxgSZOHZKWEYTlFyh9WUnJ4CIkbArvYMf0QYxYcvLboRFf/gSZzub8GP10iGF2pxbkMQfmeqQofFhJx6b7Fgg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI5TdYpk3XJmIK9mA8blTpcCs2m0V1hMEkNpWzEO2ZdZTIdW5s5
	5Zk03z7iWWdZHsJujrgPrXlCn/5GZ4Vzd0LsbPENqMsnaXwGmW1WnaOLJVal5GgS4SZ3Mh5BLJn
	NlJGAGvpVQL+OUs12qo/+h0GU13eXmEN2vVw06c4G
X-Gm-Gg: AYBFou2xy0Wb4vEMt1Ww7toDtxxVEbFQErKOfmxYWkKiDO3KkGJV7FYZgEVKK9oqdrZ
	2MmYfyl52qXYXK7PoW6jatkV3j/7l/qnuI6CQMvW+OOSc6CdFy9RWtWZycXblgwC5N4OyNMUDL0
	Slv5M3aY4PxiYQ6LsA7n0sD/X/d4Gu0otyUxJu1xtB4/N+obuHh56KnxxfkAz3HDTIhSN8lhZ8L
	5ZgdimWgMZ8LkrpvoDy+4945Bcr3Y0pRTqovBUkp7il8jPKcJpqOOGVTFo+MMRXYHX9cjwXrlQ0
	grPpTt/kP9GWfrG5iEnzuz8O+Hr+C03DzwhyecHiiLbApFG2CkwTY2WVCDfK3mSsHjLqaSFn/u1
	5MSozsCCTo+LVixtotCUKt/5dxtGGKw/bPZM7NsasWBzlYbdoKLrBjNCkOybj0Y/qau4=
X-Received: by 2002:a05:690c:d86:b0:8b0:a5d3:71c1 with SMTP id
 00721157ae682-8b19caaac51mr35421007b3.37.1793159128558; Tue, 27 Oct 2026
 20:45:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-25-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-25-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 11:45:17 +0800
X-Gm-Features: AclHuK_qoKOPS0Bqly0_GwH5QpE5HmWgWi0Q-7IU47_qa8u_hGoz7lpTqegB0HI
Message-ID: <CAGXv+5FWZQ1zM=mZm22qcqU86QO2oXQs0wtnGn1H9TrdFvfW1A@mail.gmail.com>
Subject: Re: [PATCH v2 24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_204529_909203_B1D325CB 
X-CRM114-Status: GOOD (  12.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
> irq_domain_create_linear() before registering the parent interrupt via
> devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
> mt6397_probe(), irq_domain_remove() is called before devres frees the
> threaded IRQ and without disposing child IRQ mappings, allowing an
> in-flight interrupt handler or late IRQ lookup to dereference the
> removed domain.  Conversely, when the driver is unbound, the IRQ
> mappings and domain are never removed at all.
>
> Register a devres action immediately after irq_domain_create_linear() to
> dispose all mapped hardware interrupts and remove chip->irq_domain so
> that the domain is torn down after child MFD devices and the managed IRQ
> handler have been released on both probe failure and unbind.
>
> Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
> Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d22=
6d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

