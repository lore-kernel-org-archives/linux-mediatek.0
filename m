Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9167FD25049
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=; b=Vf+uU5xeNiZVfxvPS7x+UpDMgj
	AmuunFx+QRAk4fEasqCc6u/9ORp93cx3Pkrz0SA6eVIS9ROAjA4otMOc0x8KKcWZDEhwSd1tmolXx
	0cSHFv3gD9CQVqYlQr9rE7SOrNDRiYhqBx+LAXM0PC/f3SUvF4FYMyykP5xkoL/DQUD3Jeq5icRjF
	NDgEeEhGjaxjnqBfe8705KdUBf4AN8R5o24BEkAT9jnmyJpvW/KEK0ZjeKjGIozDzxG0/PAJXNQk1
	7aq1vyc17LZnkPV8Uz0iZA8LcU/o8OdN+WzGlnL+bk4lj08d55VFx6NtGKiUGNZz/CtWAr6GsebZ+
	/m9I/rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD7x-00000004yAk-3F6w;
	Mon, 12 Jan 2026 08:18:17 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD7u-00000004y9n-2RzL
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 08:18:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-383251c34e6so19699211fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768205892; x=1768810692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=;
        b=E9QSeHva6P7OmoCHLFEw5CWnreZur/s8t+xQ4DUcQg6CQU0N3kP4eh2SGEw9XU8Mnf
         XAarfliDsED6Hqg+hpDuF8yTmUO9dj11gTiAzAVJPzyW7ISGJjV+3xK8uZqF+qNR/PeA
         ugXzOhF1i3JJaqce7JY7lu1mwMtzFB5G4qr+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205892; x=1768810692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt62OmWNgAkc9wLh99OWIeUZ7UDyhb5HWbuPmDCRPzs=;
        b=j38cUw5iWKAvobArprXAFHcdBIlOjUYubVcTaFuXsEFUUdC4GCM+wWddqJXebAVrQX
         PFyQQNP51Q9l9tUAqjIu65dsbDdMT8W5kSnRFne1I4qGPshVtTHH4rYEtPHhmcrXdGRh
         vX6xFXtwAFTW/vjyZqMytQAxXIgnhxX98mjomFaZUw6hhEoHKc5Z4NL2lsREGBCTAaIi
         6oZLwC9/A6qkuAXrXSJJ5tqO6R+W0JT4ehRPXJQom73hHYCmOfBBoO0a9dU0n32bik4L
         ko4Dla2AsN3YLoadyQjMG9ubfKycXncVpwj5eox4QNoqapxtqkRiQMuB24FRxahxUqWH
         NUOg==
X-Forwarded-Encrypted: i=1; AJvYcCWqm/5kc+wiH2aplhsQPZ7RNXt/5O5kxW7dP0kgME/EHVmhqSo8VA8lBajqw4NZIt13oqqXpzWe4WaByQoDmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR4BoWrcAlnlISVhkArS62gc/rAbWjaRqlyfmp3WeC+432yr2Z
	tg7ZSeBtawRna9pmuI/+zWYr65sOqLtw9aa4SQgJHIdd35WSkxQVsWIyV7q8WQdso/NXfjO6HYl
	Opow9Gg4FdIHnKDMIRO8BiVR3noXuMCfj6yb601J3
X-Gm-Gg: AY/fxX4dYv69kjyskTsJXEdTBY0XS+ExRNHybii09dzSmomvb3ScZlwb1dMrezP5xpC
	wLixIJQqQfkDO4hdya3lDpLkAAbt7RtZqm+VGEur1OTD96TLO03zKlqO5wnbkbNFwtLM8EfG4Y7
	Bx64dFSQBQ4T4uhpO1JCLIuaRLwChxoRyBkzH/ErlaWo5sHOZvQD5/LLWicGPAVbf8J0YTV9sw3
	8oUSYwa38XuRdh0eN24EUqAiCFz7U3oLv3APSdyvygRXeQPkgkEIiSzNnSUur03q7w6IRkaC9iC
	p+cDzrd8mMOtrZNFV8DTiNXf
X-Google-Smtp-Source: AGHT+IGx4V1mUXbU15GtT44eKVpOEb29WTKJMzbAoN89WgC4hrv7YNIuzZX0Gjd3/5EsNVcfP279dNFvkxagu3pPvnM=
X-Received: by 2002:a05:651c:50c:b0:37a:5cb7:968f with SMTP id
 38308e7fff4ca-382ff82552amr62183761fa.29.1768205892531; Mon, 12 Jan 2026
 00:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com> <20260108143934.69634-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 16:18:01 +0800
X-Gm-Features: AZwV_QhZ7-2DT35BSI-MBrcYVBSsLnJPqpTs3jsSxKZmKUrz-0wsA0fkQDOVy4M
Message-ID: <CAGXv+5GXcH48fy4WBaB7J0PM0Kt71L3H7ASTW_J72cV1TxE=cw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix warnings for
 vdosys0 endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_001814_919964_6C71B7E1 
X-CRM114-Status: UNSURE (   7.39  )
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

On Thu, Jan 8, 2026 at 10:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This machine needs only one endpoint (@0) for vdosys0: remove the
> address and size cells declaration and rename the endpoint@0 node
> to `endpoint`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

