Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF07DD59D90
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=; b=O9s7nZPikgLhDcjUZaaj219s4j
	0EJAOXUf4/WVjoNsTHe9qHchvfnW9l7Z+E4S76juJSj4/vEO5/qPyP+xdOmoSmVi97E+OHEgmLCbg
	GP4dsDJ6nkZoMxkDbHeQrwZLFkTt7jjUEM1XF6t1/0de6nUY7ngf3Ua0uetokSZJUea0JWfgFXhq4
	bzdtxtvV3z3eJqxtUZL5OuwFnFUFYgLgDevx0SdRu9CuSQUwY+WvphhJfZc0Bvb3VJ98rHXQ6E1F8
	GXzhUetC5oU9SU8KoKUUQahms/tjIUNgLIY/2bwZLKbOiZhrnbXYRZU8/Sbbtl+l/5HtIHu8zHzRz
	t+HEwNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFseW-0000000AHYg-0M6s;
	Tue, 26 Nov 2024 10:18:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsdH-0000000AHI6-2xgG
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 10:17:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso7036844a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732616242; x=1733221042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=;
        b=AVAAkVSgA5VPhQyPNo5lRHkagTxYir27RwuGyKqog+KI0siIHSGb9yZC6CsjlKTGqR
         wA/fgBDCTBscy830ssVhypsspx7Es9tBip2Ttpson+inipblMqCVFrseu4Wjee9b2Yoq
         NC04nA5FlH29ySK7sJ4bkiFmVRpdnaAD19YJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616242; x=1733221042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=;
        b=InJzu/L/Vxisx82rWBQiRr+QViqiHP7pAi8ELiLwa8daHg+Ztfy0x/a6n1cKAeP9rw
         B0ba51wFh9i5VkUSForIlzfbNY986SGCqEVU/THQxbj7eZyAy9kPpprhwFMk/IvkD8sy
         jo+bObareXpxXApgl4dtX71EOy6KGiUtWZHJA7v3MmqH7bzXl1uogEl0321hJB2FLCYe
         fSYi/eyxkDJi7fT3YeL4UAM424EpknwEndFjq0gIqO4GVdZCcgNHhh+UNs1V0NKTspe3
         eNLlwOVXxAxIeQeqIC2GRYmTeJVtDbw/cbijM148/6Ij9lbzXndXU3QN+F21/mx050Ab
         y0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVOgbokNwRKJZy/LCYe63IPkNMkV0bPHh5/xIJ0XYGduaRrgBKXswPnUEK7ejz98u/FSvtND4RRWaEMqYfsUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4pd+YIV6Qs7oBHu1WuLJQB2ib46iNKXxhhPAcZXlCllXOr7yS
	QUNQVxHl1EFMsWtEm4XY/DRsccUlCrC8dLQgEBLhJ67xf56gqWw7e2/c9mDKSC6fqQAtfBMR7Sk
	Z4g==
X-Gm-Gg: ASbGncsfSG71vst+Jp6303yywANR+VsijEXjPFEDYC/MREN89DGhel7TgViOJflWzNj
	FvUVlD7S61B9rJbArdUlXOehk2K4cMYyGqPAC4Feon/4EAAboL+iQHhQlzg7/ii4Eo9tYYsjwLG
	lXJe39EL7fOb2kAGYF0aM1WOY5kgJDH7dzs31CmEzTv9KfSnm4z3L+fPmZ/mmc256MLSLGGRdBP
	4ZPqjCMKdmDLe78eoJsTZnOvIuH/r0bYJS4RGRmGVtQDFSu0dVXoiwtwpTXwU21oVSs2W0C+1fT
	LYHXYyqP05MTZhIZ
X-Google-Smtp-Source: AGHT+IGpZdbCXA0yjXxYQ5hH2oWMsi55+Gm+uZvc+cmc6+Rdlh5dVYj0cnqXMOKp6T0lUNt6MYEypQ==
X-Received: by 2002:a05:6402:5212:b0:5cf:e66f:678d with SMTP id 4fb4d7f45d1cf-5d0207a3a02mr14685865a12.28.1732616241457;
        Tue, 26 Nov 2024 02:17:21 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57b6c8sm578295466b.135.2024.11.26.02.17.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:17:20 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so5732a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmNdTZA/kKkduEkA7YfzpVP7Eg1yOGokcI8XyNYG2uoBaDIs982aaZC7T8HDA4BoWCyvtmtOLmgZo0LRjHPw==@lists.infradead.org
X-Received: by 2002:a50:9505:0:b0:5d0:b76:3ae1 with SMTP id
 4fb4d7f45d1cf-5d06f5111c2mr40797a12.5.1732616240006; Tue, 26 Nov 2024
 02:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20241126-damu-v4-1-e746eec2cb52@chromium.org> <9004a82a-56a3-4d88-b0be-7e9d45932607@kernel.org>
In-Reply-To: <9004a82a-56a3-4d88-b0be-7e9d45932607@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 18:16:43 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKNrOUPJ+3DE+f+78-SAeQkuqEHqFXmwwaPTG+ni_1MMw@mail.gmail.com>
Message-ID: <CAHc4DNKNrOUPJ+3DE+f+78-SAeQkuqEHqFXmwwaPTG+ni_1MMw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on Damu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_021723_772009_F572B03C 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Nov 26, 2024 at 6:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/11/2024 10:57, Hsin-Te Yuan wrote:
> > From: Hsin-Yi Wang <hsinyi@chromium.org>
> >
> > Sets DMIC one-wire mode on Damu.
> >
> > Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board"=
)
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Where did this happen?
>
https://lore.kernel.org/all/01020191db901d32-5c318445-b8f4-4f4d-86db-316dc0=
db04ec-000000@eu-west-1.amazonses.com/

> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> And this?
>

https://lore.kernel.org/all/5a668114-2ae6-4217-9614-b690c0870849@gmail.com/
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> > Changes in v4:
> > - Add Reviewed-by tag back, which is dropped in v3
>
> This resend is very weird. Didn't you get a replies that this was applied=
?
>
>
> Best regards,
> Krzysztof

This patch had been applied but was dropped due to missing a
Signed-off-by from the author
(https://lore.kernel.org/all/20241009071543.5230cf79@canb.auug.org.au/).

Regards,
Hsin-Te

