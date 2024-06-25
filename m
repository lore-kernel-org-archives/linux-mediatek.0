Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240AC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NPmpp8271F3SpvytlQVywcOTTsVz3c2cDeyVdLEIxE=; b=IpRjzFgz4BY3BfilFucBuUf7rW
	8sA6fTRhvt2BoWRRv+tyWHqS3cNMI71RgWcoBYW22LwQKUnvbhCtdoLjJldaMBeh99BbzuCgyB4lI
	qYidEJqBaU0HsukXJvl6mNhGKCAdaTRlS7LSFGCBscIsmY3ho2IpAO+NBNpkpmmTKqxo3rxGOyXt8
	rF0Tg4Y9tSHuh3FayNIkvpS2hCzblHezAiyjkM1WoCbcqjuZ10f09HJuoE9drCwxqaXHv9pP4UeWd
	4K7qsdHayPx4pkiusrNob7/Rd1XbroZMl+Wyi3GkNCcpv5j+sOhqyjBWEs0vS+UP/kiBmZfUw0ATf
	8J6BcpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCVV-00000004Ngz-3tHS;
	Tue, 25 Jun 2024 20:11:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCVS-00000004NfX-1dxY
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 20:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15C42CE1EFA
	for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 20:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629C4C4AF0A
	for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 20:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719346267;
	bh=hpr7QzhDFDqCjdlXYJTyKCTQNje35SXe6h5mD0TlRUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E5Johk2/nKnm71ar3ioCOyyXdKZdIQ6i28Tr241iD55Ql+1KtStYz0zulw4ULkuxo
	 JqpkeIQC9T5JAO6HklcjJ1EhVhJgMHQ84mampF0dHD3E/01Lvj7+ZihxK0+96ciCNR
	 YWwo1WQXmv/jRWP5x6LYhKjPEFq19zwayqV2nlWAq6HWkPEh/axcXaL0UZjAiaHX0J
	 Oq1ZnhLnZpflfmdyzzJYEiTZqDD9LXDbFXL/IhydrolpLLvKwoU8BqpR7bQtb3ZAKo
	 YUrAqDJJ7FMfoS4d58I3eqjnLOBgG5MNhkQzupcvavPUPuEvVN44aAAmG5EmfSZWX4
	 JQqqJ2wQdX0wQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a72494dcdd0so39917466b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 13:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWImiIVAn3OT2S0aRsb5oSdZYT+ibK91GcQNw3k0FMnv+N1QS6lDrtJWqCzv9d8jNxl1DNy2ITesbYcz8ejKbTqZuohlXu2WUgMrZRZGo/ERWwL
X-Gm-Message-State: AOJu0Yz4DZ6BkH1tC80UcuBkCA+d/hnxPe614PPHcdBeodcvjJwIEs5U
	2cPQmxsc+HsOEtjogLJiW37YXCFpxPmKFA/WLIa2fCLRNQh3bbeqdoO4QILPMwl0wR727tmHDj3
	6SmWTTXe02W7nVp31TwhRhfP+49s=
X-Google-Smtp-Source: AGHT+IEmjg3v4/vkEvS5zJcImLUEJLyeSrZ/RnyJkdkxhuZYb2B63ytqyAtzJHCcXAvevmNJV00Sw43CcjelXa6uXU0=
X-Received: by 2002:a17:906:f8cb:b0:a6f:e105:8ba3 with SMTP id
 a640c23a62f3a-a6fe7801dc5mr619881166b.6.1719346265940; Tue, 25 Jun 2024
 13:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240613030241.5771-1-sean.wang@kernel.org> <20240613030241.5771-38-sean.wang@kernel.org>
 <94abc74b-dcd5-47b2-9364-cfd5d3f28846@nbd.name> <4c02983e-2377-4c26-bcd6-3100eea19aeb@nbd.name>
In-Reply-To: <4c02983e-2377-4c26-bcd6-3100eea19aeb@nbd.name>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 25 Jun 2024 13:10:58 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzp7K810+pdrkzhxtzFZkrctY2aQyLObyE9Eq-bngj3s9A@mail.gmail.com>
Message-ID: <CAGp9Lzp7K810+pdrkzhxtzFZkrctY2aQyLObyE9Eq-bngj3s9A@mail.gmail.com>
Subject: Re: [PATCH 37/47] wifi: mt76: mt762x: extend mt76_connac_mcu_sta_basic_tlv
 for per-link STA
To: Felix Fietkau <nbd@nbd.name>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, deren.wu@mediatek.com, 
	mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_131110_702092_45144CE2 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Felix,

Thank you for making the changes. They look correct to me. I
appreciate your help with this!

      Sean

On Mon, Jun 24, 2024 at 12:03=E2=80=AFPM Felix Fietkau <nbd@nbd.name> wrote=
:
>
> On 24.06.24 19:44, Felix Fietkau wrote:
> > On 13.06.24 05:02, sean.wang@kernel.org wrote:
> >> From: Sean Wang <sean.wang@mediatek.com>
> >>
> >> Extend mt76_connac_mcu_sta_basic_tlv with the per-link STA configurati=
on.
> >>
> >> The patch we created is a prerequisite to enable the MLO function in t=
he
> >> driver. It is purely a refactoring patch so the functionality should
> >> remain unchanged.
> >>
> >> Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> >> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> >> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> >> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> >> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >
> > This patch is broken on non-mt762x drivers, because the functions that
> > call mt76_connac_mcu_sta_basic_tlv may be called with sta =3D=3D NULL.
> >
> > I've seen it crash on mt7996 because of that, but mt7915 and mt7615 are
> > likely equally affected.
>
> I've pushed a fixed version to my tree. Please check if it looks correct
> to you.
>
> Thanks,
>
> - Felix
>

