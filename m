Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB401606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MLGzJIdR;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=lf6cJxbL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TicYu1LNyXPUHNb708qeXtsOiE9Mjvg68dH1aSn1fi0=; b=MLGzJIdR/avAaL
	bxxMzta5Sx381fM/yQ2hwsoVIvJzAmkdRaKEhg8DWG2nSSOKuT80B+KWyjecs8bCtNVBWP4GbKj2i
	LV0W6ePSFASkKeo0ZNBsUEosehkZB7kxStJB/YPbIcoxmFvjsfM3mdDJ6yHYUFpbxWb2o72Q53IDC
	gAgAgYTF6uuNJfTdATQdk8Z1V0L/QZzBYQ6L0eFkHxT27jFa5emC7bPyaZZFVNyrKroT06hV2x2hc
	VwcgP9djq1qYcfMLKrB2OGgvGkJZI15Ov/h5lImrhVnVVcOpTjKbSZ0MEf+5Pm29U/kOdZZDtMBqz
	5Axh43dhYZK23NA8g8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSmm-00000003GwX-23Pq;
	Mon, 23 Nov 2026 12:04:40 +0000
Received: from mail-244122.protonmail.ch ([109.224.244.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSmj-00000003GvY-3hJJ
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 12:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795435474; x=1795694674;
	bh=TicYu1LNyXPUHNb708qeXtsOiE9Mjvg68dH1aSn1fi0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lf6cJxbLe7iiJV12W9PIZ7Z8UkQW3hiHJcmRegufXQUe+h4hul9GeIQY9gNswlbrV
	 e/YBSR3kSvp/KIzQ3+zblIFRaxxNtVVVN23D2vTLIL/M0SbBr1pn8utflUy/pfLaoJ
	 ZKPhXZ5uTtT1bWCHXdmKXRTfOEKb6sTzLUCa5vda9ckRNP8z8qlcpNpNFgQOoQhI9y
	 TzzaFEdTZGjnoiOvzUxYSzHc53VYBCR/86vCV6eQZvo1FLIuSXbxgiKqipKOESU1e4
	 N1YNKiDtfH5I+C8/bCV2nbXQgl2BSoRL1sH63qNApscHCqbYFJ7Yq5cG8+UFozKQB+
	 k/+kqGhL8O+PA==
Date: Mon, 23 Nov 2026 12:04:26 +0000
To: Alexander Letuchiy <asalde.le1@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Message-ID: <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
In-Reply-To: <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com> <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com> <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 89375ca8f2e561b9db71121183ab2a32e2685cf8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_040438_077030_A61568A7 
X-CRM114-Status: GOOD (  15.11  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, November 23rd, 2026 at 1:59 PM, Alexander Letuchiy <asalde.le1@g=
mail.com> wrote:

> Hi Roman,
>=20
> On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
> > > Bootloader dependency
> > > ---------------------
> > > This was tested with a modified LK bootloader that is not public.
> >
> > How are other xaga users supposed to boot the kernel? You might want to
> > port uniLoader instead, or if you're on an old enough security patch yo=
u
> > can even replace stock LK with U-Boot. U-Boot chainloading is also
> > possible.
>=20
> Right now I am replacing the stock LK with a modified one that knows
> how to handle mainline DTs without expecting downstream Android nodes.

LK is known to mess up GPIO and clock state. The earlier you replace LK
the better.

>=20
> In an ideal world, I would like to replace LK directly with U-Boot as
> you suggested, though U-Boot chainloading or uniLoader are also valid
> options. Luckily, the security patch level isn't really a concern here =
=E2=80=94
> xaga is already EOL and hasn't received official firmware updates for a
> while, so LK replacement works across the final stock builds. I
> definitely plan to look into a proper open bootloader setup for other
> users in the future.

You can take a look at mt6768. It's not upstream, but we replace U-Boot
and TF-A with custom forks, as well as provide tooling to prepend
meditek-specific headers for the latter.

Best regards,
Roman

