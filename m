Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E661AC5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIxHgySimhudfjPoZi8j1w/98XwT2TmQjMhDhWg7BtU=; b=l/bXjB1G+bpuUtXbS+8eEKtGRj
	ynsP8eJWf2E1/5YnGZ6u9Qx0T9I8ILiXz0oRm0KHqm7grs8yx+jESMr13MOvxL6znEt/4Dm5EmBcs
	1+tTGW9JhWieRW1N6hZbCLIxxArtNI1Cqar9vfs69TM+eq7O+adgo2gWfeQMkOuYoflbggnu8jXjS
	JHw8G6PY/DXcZf4Yop1RdjpaZU2P/76DwKG/GtaoG3zBamTAm2BqJ0B6Jv7Lc969q1qZE0JttR+IM
	CzzWBIu/Mnm+Ce9MY/syR4XE1E6skeBw3R0TVIF69Is3TUeIGdERXhQ3kZjB0XWx0LRQsRBtVVlUB
	yAB1M1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWVZ-00000006oNF-1rak;
	Mon, 26 Aug 2024 09:59:33 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWUd-00000006o7b-3H1x;
	Mon, 26 Aug 2024 09:58:36 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b4412fac76so36892517b3.1;
        Mon, 26 Aug 2024 02:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666314; x=1725271114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIxHgySimhudfjPoZi8j1w/98XwT2TmQjMhDhWg7BtU=;
        b=CaoD7UeDFzQtmApTPE6gDSx21JC5nfv17aPPu4Gqkr9KYDV+jknDGUeFa6eiKpXBS3
         fOi7px1P6LIcGwViHP7LmSGU/r6FZS36AbYw8JwYad0zD065dqchALrNvQPHFQ5n+Ln5
         RMW1hB3ri5QbWgKvAmbsnZLCagRoN488e/W2MxPXUlESwZ8Gm9nkAKnoa5ug8o8chh4i
         H6SUCh9VFaOfkikFmU/3tS7MtXXUon+L3Q9xvPE0tsNmugFThT1ub+B3H2fQ2qiaAKCN
         2gfuXAvR3jdEe47DsXFrc48fb+6h5dfTQ76kReASwdAhL1S2QEg13dbAGNPr5QwbzGaV
         eRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+FN8iyp03WDsPXB1E9aDpWPiUUQrI6Ep9GcBXBYGGWESRC/Tgnj+fujfnMgJxQJtVwnRT1ofG/D6k@lists.infradead.org, AJvYcCVwUMukjrY/bow8Zdct7oie+/hCtaGFm9Dho9i8MxfPfU6v82hKn6WjYUFXkphU5L60djHTBr4SKc1C2m1vRdQ=@lists.infradead.org, AJvYcCVymCVWVILMTr94TscpS1gBtKElaITQIzUmPXVbtskO8mjvLPV9yPLAAm4g1xVV19cH0R+vqLw+HLgI/Py+h7o=@lists.infradead.org, AJvYcCX1nuc2UffZt9COCOd5jjyyQuKFUFQmvBj9UvGoLVhYB+vGg4aAgMZckWwMUkzW3zuZ+otlfigVOIjPo+Ns@lists.infradead.org, AJvYcCXHQuukWZIWUVMMUKUYm6MbRUohVE9WKqnhgME7Q/U8fLb+7n+m+Ri0DimZxq5TUysXiy93x8yrV4OIbE7RlWS+KA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpzcIJMqCootajn3txdiHOwlGOIVeCEwKN+LQpOmhThmY+M10d
	C6wLq/0SWfPOGpECmvspjksJHXV+N/uSfPox9tqtdhv6yX6h4wqVJh53YzR6
X-Google-Smtp-Source: AGHT+IE+BSr3vSJyvCKiBS5TJxW0xNaioQcrCekukgUcEjWum8SDdelZO1MfxInNrfOSHuBPjrA8vA==
X-Received: by 2002:a05:690c:ec9:b0:615:2a14:4ea6 with SMTP id 00721157ae682-6c62422c0b8mr125625867b3.8.1724666314093;
        Mon, 26 Aug 2024 02:58:34 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3d5c8csm438811785a.98.2024.08.26.02.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:58:33 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a1dcc7bc05so267417985a.0;
        Mon, 26 Aug 2024 02:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3ogmls0xilJ3I4UAh+6GPsTCfPzcgFedwR5pEN56VQEQvnxN1wiEuPvN9O9id78YCpb3u6I4OxANn@lists.infradead.org, AJvYcCVUUggp5XsfBx5fXRGyr0dkzDaxVYkje1/NHeeWdZYw9PB3Rn15NUIskNjgUP+9EtHmg7A+mDreHLGPppB1EU8=@lists.infradead.org, AJvYcCWzE/K4HqfIHFx9dx8CWzv1VpsbSxHS71+YNBwGcRm6nA+krx7AON+lZqEbDOeNKk2pP3cw5DCXO1KAo7uK@lists.infradead.org, AJvYcCXC9S/GhlAKw88AUY4tdvqQoaNI+Bw9gNRAdM2YnBThytYBfvvqTkGY7xO93N/K27Mty0q1BKRPTdadNPhWws0=@lists.infradead.org, AJvYcCXYBFaszURqICEyhpj9xeNGuZOtql9jEZ3y6hZd3ysVmfVwjn2mQ2ZNS8td73SYe5n922yq3YkDFHVYXLGVjsYThA==@lists.infradead.org
X-Received: by 2002:a05:690c:4246:b0:6b2:4154:e598 with SMTP id
 00721157ae682-6c6262f43e4mr95411167b3.26.1724665994139; Mon, 26 Aug 2024
 02:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240826094328.2991664-1-ruanjinjie@huawei.com> <20240826094328.2991664-9-ruanjinjie@huawei.com>
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
Subject: Re: [PATCH -next RESEND 08/10] mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: miquel.raynal@bootlin.com, michal.simek@amd.com, richard@nod.at, 
	vigneshr@ti.com, liang.yang@amlogic.com, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, heiko@sntech.de, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, kees@kernel.org, 
	gustavoars@kernel.org, linux@treblig.org, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, erick.archer@gmx.com, 
	christophe.jaillet@wanadoo.fr, val@packett.cool, 
	christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, krzk@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_025835_844002_6D125748 
X-CRM114-Status: GOOD (  13.51  )
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

On Mon, Aug 26, 2024 at 11:37=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

