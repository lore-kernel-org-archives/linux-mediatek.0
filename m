Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0894ED29DC2
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 05:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWBxLf1QC+y4YgB8POl0KL9EwXvMQCo2FGvWmorcofw=; b=Diidp/B7itxdOp57xhQEejYGqD
	tMmxtZdo9g2zfjEtiaEf/8w0uOq3En8NAROnhJHZ8QTour6DS8VMfTga9FG61cpPccHDfhJodBgu6
	88k1mWO9EKCNIxhpRbgY5e4qfyNL5Fc529w58cTeRu/7mKHFlmf3wuDQr2vGFBDTPewjKNHxxUZHW
	+NCOgir0lUQLYMPNYUQ/mhpVokWtTseJ1F1xOXV9aba3WvqM75XLx5klyYVRwydxs+npWXigh9XW5
	go4VqwWDvVlR5koL6MaT0/5Lrv1nuKnwyXGZfAtQh88ZNFg5H81m8UuQmsEWoEpP/9eWOASZq1lbj
	7l5+bZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWki-00000006XjR-23ln;
	Tue, 13 Jan 2026 05:15:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWkg-00000006Xil-3o6l
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 05:15:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59a10df8027so8530795e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 21:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768281332; x=1768886132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWBxLf1QC+y4YgB8POl0KL9EwXvMQCo2FGvWmorcofw=;
        b=asfs0pzM2UQyR/QTLUavCTVFX1ncbNk7KzUgM/7t3KVle08SK3eRGAPEEIIK2BzfmB
         6XEcTGHKBX1P0mIwI2QigIE71Tw6i0jrVm/dJ3+gLnofMlo9fMYTAOgvon+uRcVgGq0a
         eI3PzMKkcmc+02PZ/HtUh8d/GSvR0e8aL3/Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281332; x=1768886132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWBxLf1QC+y4YgB8POl0KL9EwXvMQCo2FGvWmorcofw=;
        b=OdtNL8LA2pZdCOVTSo4mjeuDD17n42Cjuvr1J+BFYkbqi4pCnEhK2n7FOlOWOx1SDW
         brNpX0rA/N2cQqtj5yUP+ruudH4qZs+sxTPq0EAdtwj1bNCpOrbllGtLaSPYlL/qA5vO
         EtFTxkdq/5aa1vGdHRjVR3qULHMzDPOm4kuFjzyQDam0b77I8jqbVForm98Ot0l+yMx2
         5bEep+VgJUNJZ2jqHA/la8LaFHJxFyg1XgKTjUxdBeXVXb/Dop2jcdJm5Z05TXj04SBJ
         e4ChVvjLE9EJWRulvTOj1Oouj6cEDS5r/MOKTYDxtcPHYWKjX377/WQ1hWUglzDFkXLP
         VJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkr+y80OpaTCH5ZJDljYPL819TU8vU5K4+5MFk8NvJnxvTVotj9rRvG17wT3bLa75DdxQu6IujgUwmUnZVjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfLazgyFmJVu2GMIPqD+rINRv6NwJkuWZ7fUyPNBDdElHdvzX
	7macX+C0L4gkkX7ncBhmB+l92ASbYZ8lwQDR2a26OjWRoX/1Y3NCeDbOzJB2JyIdbsDszB76Ojz
	iIljfD/bg6GzUGdIo0MfBCuylXaSA48RDSd1Yum8g
X-Gm-Gg: AY/fxX6Gv1ih+ivl3sd1rijufegShbKdGQ3GCEZg0tKXOhQSk9xI00x2pf5eHRp3vpQ
	ZyVmlCrxaeITGte1yOlg2f4gFeQ1U4xAH+/THEoVk1RF768TiJMSx57sQlc0AQxrZeC/OhyBHmr
	SVo3LJKdUd8FGqiP4zxADQIsOAPY94ATmWVxlNwXEq1ODvinLyLlamvdmOGXHIiNnYx9eLCF5l/
	7TEnHwxp6/QB12muJuN1/6WY9Cq+WD6oEmVhK4JIykPlXjn5kl9M7bJ+GdOJb9Y0uwhfeRjVusB
	RhTWoDRr+K1vWotOvnD9n4sNtQ==
X-Google-Smtp-Source: AGHT+IHWKs0mfOOzl5izVTf2Xnk+dBtkiERsFPIhjYONY21eCvBjmqzHviJFVUDrzrpWYYipwkevq6I80fQTIre1OE4=
X-Received: by 2002:a2e:bd06:0:b0:37f:af1a:d455 with SMTP id
 38308e7fff4ca-382ff6dd8d4mr54027781fa.26.1768281332335; Mon, 12 Jan 2026
 21:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20260113020959.2377348-1-moudy.ho@mediatek.com> <20260113020959.2377348-2-moudy.ho@mediatek.com>
In-Reply-To: <20260113020959.2377348-2-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Jan 2026 13:15:21 +0800
X-Gm-Features: AZwV_QgQaYc38zex9UgDK8EJeiDeEy6Wlobj2pgj5rttXP7rM_aLnUG0nodlUAc
Message-ID: <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	nfraprado@collabora.com, Jason-ch.Chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211534_985121_65A7585E 
X-CRM114-Status: GOOD (  19.28  )
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

On Tue, Jan 13, 2026 at 10:10=E2=80=AFAM Moudy Ho <moudy.ho@mediatek.com> w=
rote:
>
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> Without this symlink, the firmware fails to load and the following error
> is observed:
>
>   [   79.494105] remoteproc remoteproc0: powering up scp
>   [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188=
/scp.img, size 636548
>   [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
>   [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.
>
> This patch adds a symlink "scp_c0.img" pointing to "scp.img" under
> meditek/mt8188/ to ensure proper firmware loading for dual core SCP.

It should be the opposite. "scp_c0.img" is the proper name used upstream,
"scp.img" is the old name used in old DTBs.

So you should rename "scp.img" to "scp_c0.img", and then add a symlink
"scp.img" pointing to "scp_c0.img".

> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  mediatek/mt8188/scp_c0.img | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 mediatek/mt8188/scp_c0.img
>
> diff --git a/mediatek/mt8188/scp_c0.img b/mediatek/mt8188/scp_c0.img
> new file mode 120000
> index 00000000..8d1dcd4d
> --- /dev/null
> +++ b/mediatek/mt8188/scp_c0.img
> @@ -0,0 +1 @@
> +scp.img
> \ No newline at end of file
> --
> 2.45.2
>
>

