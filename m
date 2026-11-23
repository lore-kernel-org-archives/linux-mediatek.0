Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D1606A332
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVfXvteR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIPojpav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3G6I2HBy1UTihgVzffidRJ8qc0m2dAG1ryDyw90kJ+U=; b=zVfXvteR55/Vkp
	70y/SLmQ1uzR14zgHeFr9kY8mQxRs06/tqWT998A80s5LTpWrol62y8eFx4A1wQiaRJuYiDGnz6CI
	P04UDzVahvZFv8IXh823HUpwf5oRhtRQNZHVe+hmiQZvnreiSaieDZvSz9jYWqaePwVkzRUywK1b5
	eYSyyMn/C04FOkEbdK1/wdFSVhkU9uXQEAwXP/0sVm5l65xQCvxb6dJZN3g6JFR5Irltr+MlHQ1rs
	FH48jiUy7iQi9wqi7LPBpcY94qXTyYmMttbFtaMc/2+wziD1JygwDrL4fQvXvdmmYyecb5hzdT7jr
	ogob87X2Qq94L+04LkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWO7-000000045lj-0ciE;
	Mon, 23 Nov 2026 15:55:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWO5-000000045lD-29Yx
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 15:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4945F44EB1
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717871F00A19
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449324;
	bh=3G6I2HBy1UTihgVzffidRJ8qc0m2dAG1ryDyw90kJ+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YIPojpav0O7GuwdQ8vBLY/e71DVXviFdsS44PLAZ6U3mzJmNA6TR2JMjsN8z5lxCr
	 DbkvMGQFYOuHHzjMf8u668uvyZWYP73Ki5QI4dd172ddRmjLFNCa1RTUNH56JBlA59
	 DWJcJyl8C/QXuR7xiGNwKc63hL3TIUzKnOEhWm6p/JSDwbCrHijVfhs4JXS77SRl23
	 /lEkfV1otEaHf0WCm2jhnwz3dRQVyDEuB/CgyXWuGu6IpZPRjTt1E7VOxNwDDZILJd
	 Wh0IWvZYsXb6pcvxsO9MTrZusQddlEn9jgt7S6z878feRaXG9PYA+wtFIkq7dSQc6L
	 qisckzr3Lptsw==
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so10326505eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 07:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFYhgwHhRZvkjYbP7C4MPtT8O6wnfqhkcEYzJ/1re6luG/2ofluvqrdwyacYE6ipN1I0yhgvhxi5TYk69vwHA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/61La6O6LtYPOaEUody2rdr3efxQA6sE2r6pvU+GaA8xXgbjD3
	JR3hnOdK5eNMiAVhRwya2fDcYRpOJdz6QH+MK9P1Zo+QuwZtfxdqpLrD316lgfNwm7/GuIvp0Ae
	89BMpvEHyiemJVWNQxSPMXPXk3c1ZOg==
X-Received: by 2002:a05:701b:4212:20b0:195:49ee:94c7 with SMTP id
 a92af1059eb24-1b556877b4bmr13673422c88.8.1795449323806; Mon, 23 Nov 2026
 07:55:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-mtk-dsi-long-read-v1-1-0b6d9b67c011@protonmail.ch>
In-Reply-To: <20261105-mtk-dsi-long-read-v1-1-0b6d9b67c011@protonmail.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:55:09 +0000
X-Gmail-Original-Message-ID: <CAAOTY_86OXNzY1ZCM-TkRHJBL2D251TmMUAb7KciJ=J67zzpdA@mail.gmail.com>
X-Gm-Features: Aa3M54odlecVrJk7CoDKPAKnCFnRzxRnnufzNqT2mcMd-MnXgiezzVi7wDx4zUE
Message-ID: <CAAOTY_86OXNzY1ZCM-TkRHJBL2D251TmMUAb7KciJ=J67zzpdA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: Fix handling of long packet reads
To: bengris32@protonmail.ch
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	shaoming chen <shaoming.chen@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
=E6=96=BC 2026=E5=B9=B411=E6=9C=885=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=
=8D=882:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Ben Grisdale <bengris32@protonmail.ch>
>
> mtk_dsi_host_transfer() decides where the payload starts in the
> received data based on the byte count returned by mtk_dsi_recv_cnt(),
> treating anything longer than 2 bytes as a long packet.
>
> This breaks long read responses with a 1 or 2 byte payload: they are
> treated as short packets, so the word count from the packet header is
> copied into rx_buf instead of the payload.
>
> Fix this by checking the packet's data type instead of inferring it
> from the length.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---

