Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60B606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dachKHzC;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AqvTCW5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hPH+xwQQ5YvRprFEfig6JwjI4JJt7gcVnXPnZvpsz58=; b=dachKHzCVZ5qcg
	OrlTLQteOe1Dv+uFcyCNm5eYxK8yNUl32Qyv1j3q8gz2bEQb84ob+bQPCK4oNiYlk9dPOigNvWKzG
	7kUCuje3nUMk3Sd8vmwrWTg0jYnff3f/fDwBo9+rY7zP5TgY+GQrE1vFlGeSqtfiBs6xHg3LtqBnf
	uWsv1JVtR93sxXEyy0OY+rfoAxt1tZeiT3g5hFbqx1KHBdmzNPzXUmYvEgZscEOxJd/Tr0FGn3xER
	Qcd9x8QL4c0xLrUKU7BUuFndo+TKLAyDwmpsIaM0obzy56PZsyJWsYM6/ncLeD+uee78GO7sxl1B3
	JkOv6fq+qf33axdR7H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSQX-00000003EX9-09sU;
	Mon, 23 Nov 2026 11:41:41 +0000
Received: from mail-244122.protonmail.ch ([109.224.244.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSQU-00000003EVP-3ZS6
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795434092; x=1795693292;
	bh=hPH+xwQQ5YvRprFEfig6JwjI4JJt7gcVnXPnZvpsz58=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AqvTCW5qPw2qcd8PAjH5z5PbIyHUU6oizOI+s+K7cDDXtV7PFmj9IPlnbrb215L2x
	 m/RWi1veWIhSUlB/2yxBLWKrJ69FXS+kDOfxoOAtKdY0VGw8HX5V4CcN9NMqqdSUOO
	 TkIY/hivq//dNMMUveqVLQH7TGTHMWrbAEWJz1WnXIp5tUbeopHRYv8Nald0kGqiD6
	 +ZHfgxEipxsOUqfvrohVIY580xB1XNgjb6Uv0ukoGEnvbw3xOJCRhfzLNO0s80dZKr
	 coDUkztBL3JK1cVGJ9a4XYR96VHe4UDIgcQUy1tcuYlBRkExLmlf0LDqW/KmalhSrC
	 CcDxrCenLvhJw==
Date: Mon, 23 Nov 2026 11:41:26 +0000
To: Alexander Letuchiy <asalde.le1@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Message-ID: <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c6b719aaffbb9f16cf86df1433c20e78eaceb862
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_034139_047818_13A78842 
X-CRM114-Status: GOOD (  18.25  )
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

Hi,

On Monday, November 23rd, 2026 at 1:19 PM, Alexander Letuchiy <asalde.le1@g=
mail.com> wrote:

> This series adds initial support for the MediaTek MT6895 (Dimensity
> 8000/8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redm=
i
> Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
> with a serial console, CPU idle, the CPU and DSU PMUs and the volume down
> key.
>=20
> Dependencies
> ------------
> The SoC DT describes the pin controller and the board DT uses its pinmux
> macros, so this series depends on the MT6895 pinctrl series:
> https://patch.msgid.link/20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.=
com
>=20
> Bootloader dependency
> ---------------------
> This was tested with a modified LK bootloader that is not public.

How are other xaga users supposed to boot the kernel? You might want to
port uniLoader instead, or if you're on an old enough security patch you
can even replace stock LK with U-Boot. U-Boot chainloading is also
possible.

> The stock LK cannot boot this DT, as its Android fixups expect nodes
> that are not present here.
>=20
> The DT relies on the bootloader to:
>=20
>  - update the /memory node
>  - add all firmware carveouts to /reserved-memory
>  - pass the command line from the boot image
>=20
> The carveout addresses are therefore not listed in the DT, as the
> bootloader allocates some of them dynamically. I can describe the
> fixed ones in the DT if that is preferred.
>=20
> Firmware behaviour
> ------------------
> Two things in the stock TF-A affect what the DT describes, but not the
> DT itself:
>=20
>  - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
>    The vendor kernel lifts this earlier with a SiP call, so with this
>    series the idle states only start to be used after that time.

It might be worth porting upstream TF-A too.

Best regards,
Roman

