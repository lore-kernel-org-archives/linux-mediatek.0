Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0072C83F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=; b=r329MznltWiMxBuqLPRDv49K0k
	tH3hKZBxq5NfZmLDf/zGXJl3LN5uYAcqd4HExmB+N6n1X2kq+LblQQ1SCLq0R3W42ktDrI/30su5J
	q8LhHnqW8CX3aTvXFqg0HlIdCylYisn9jOypSlPGP0rtL9znWqRGChtWCddSzpg0zEL3pfRZc9PuL
	S4gzfMin79UIe+QZlyCkP4I3GYvXv45W/tUgNIKvPLlcXPlOz1liCUBPGt3p6K9ncUTmh7WKZJNE+
	dDKGgwKnMe/nHAoRQoWtnm/ZbO10Ig+kJ9h6JNLKMdjBeRSvE8YPFwWZa9r9z9iCEOD2c4/wa3Xoj
	o5LrWrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uge0N-0000000G2Ny-3tfg;
	Tue, 29 Jul 2025 06:40:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdxu-0000000G2El-25q1
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Jul 2025 06:37:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b5165cf5so6505919e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Jul 2025 23:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753771052; x=1754375852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=UxmFoUjfEFukCCItWOQ/e5qGBo4Fzh1pLvDDbs3+xkeeCxKZXeW77arwSdLciev/XA
         2LKQqfzA5WsX5Bu4S6/QaJHnbpbkPkwrLgcVqN1FavJRi6cpIDGGqC2z8FFZacuMgXXg
         8JaG/FvQZciaM557GOx+yN6CBu/LdWeszAxOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771052; x=1754375852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=ZmIry825EJT+3a6eM/OqLxq78DpNjdGEHW0e0o2u+0S7+CUvQuURiHTB+KYaKLGlVd
         azZk8oGwbs7+SiDm//4FbRk2XuCU8Y2QqoRcVqPETp45zVvGGyJACwCWHzc/1/jBKty5
         dAm1Od0xhSp+8Uwm9f9mdC7lH4fsHCQZYWyOSQgQmdEj2j0oCZmqZCSTI9ctTKkaZeru
         EcRWHwX4+sJS5tR9OVlKCjUczX3la9TjxR3b3wEy3XcXxtGO/0OECliCVo3BTi5Wq0LA
         NHTP5VEGKjyIhZBzgMig7zzjtIYKD7Ln5mantlEIU818uLdGKl6GFHVi7+oSsuqLeQyf
         tLaw==
X-Forwarded-Encrypted: i=1; AJvYcCXGCqxwgJUPQ6tQLk12va96Gmr6kyci6J3HxJl1hELukjrL6sfxBqJTvSvc+euNVxGvn6bxSVWaf0Gg/YD94w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB9/d46fxpLXS7BQPduyWFa8wF3RQYHWe0Dln2WY9zS0qAo4TC
	phTkZKJi4TRGoAUV7R9cyEDCxZpQ+sj4E3RlUWWwv+ewX4uMj41mBfwyjuMe5MCWZss1K7QDmgw
	Jdeve8INM/KN4L12CayD2nIt8GHCU5GNzwwMVZgja
X-Gm-Gg: ASbGncvbUhDTDyRYoccLh7rUGDGw4HRyw321ONt3S7cY9NjLDdHSX+HjVyBjRjX1nfd
	FMwWR9N9FEyYL5EAgi62w8sNveOwkVJN/00AT9pdOkgtjtP/SP9BKiQvvTLkdio3zgUenvZrthp
	Ed5BR9TwU9Ret/vVls38GELxfsODZTUxJLLM0j1VjPHJvDVzVu/u+FFyRw3dA1PumTAgl9gn7mZ
	r3U0to5Xbs97q0sQAKBmQ/jtjIsnlPoZwmoUWV13kK6
X-Google-Smtp-Source: AGHT+IEgvlc297To6fHbXdTZorsH91fq0QGaKclycxBL1IjMJRB888ehZGOrD1mGdyChv8MiWaDPZvyajrhgWyt/Rok=
X-Received: by 2002:a05:6512:3c84:b0:55b:57e8:16c4 with SMTP id
 2adb3069b0e04-55b5f4abb78mr3766968e87.30.1753771052463; Mon, 28 Jul 2025
 23:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
In-Reply-To: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Jul 2025 14:37:21 +0800
X-Gm-Features: Ac12FXzoxBPnyvKXGXlu3ix-9ADJidAZNN4VQPkrQrPMR3ZfP3Di7o5rHnp5ZrM
Message-ID: <CAGXv+5HCnAXoPJmh4ewSF4ay=qRVM_BK0w17yvjbx9efktXX_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
To: Terry Cheong <htcheong@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baili Deng <bailideng@google.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_233734_988146_B5BB50F6 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, Jul 23, 2025 at 5:44=E2=80=AFPM Terry Cheong <htcheong@chromium.org=
> wrote:
>
> The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
> Updatae the MediaTek drivers to use such jack type, allowing system to

       ^ typo

> determine the device type based on jack event.
>
> Signed-off-by: Terry Cheong <htcheong@chromium.org>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

