Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC429607079C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KY/XdUMA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WiGxayX8;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NuEJJH1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=; b=KY/XdUMASgTZny
	gNDWVE748ptIyTj+ePOQXdplXhlRLFd2xEJ3CSRpJX7NtRnMHvnF/esUKCEkfF0IFE8GdaGzLFdvv
	kXDHZlmcDZexLjYMeGmxU2f4pLtsb1arMZ1sPs9blKtXPu7only79x5XNC9I6uw3liJ5BZ0E6S00z
	9qn1A3WN9OJV1/6g4JYbd/UvJlgIMP2x3RknOCziz8BrRG21ZvtVrVQEFvB7P3mbaPpi3VtDKB0BB
	YLcsPck9kDuvBWavgDyJevXCY/z6gg9llbF5h2hEotJQETnm4l+02egzKu0MI27TErPQEKgPE/MSb
	TNMDFcgGrzE+Usl7CjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNR-00000009CTH-3Wj4;
	Thu, 12 Nov 2026 08:41:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQIO-00000009A2b-0Nrq
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=; b=WiGxayX8OU2KROPX0LHcIZ8rf2
	A49PAw+f/rTSpn6D8iqch2nt6v0sP7Sh7h0KWiUvqThNWg/QcKfduno36Y/hd5LA5nS1DB1mqgwD5
	5qhbcOk31BipWBgpwCrryS8YjFw9WxOwpA4ShzoGIVEEZKWOm9vdHc2DrhmMDrSMVdu0LAQ2R7pOJ
	uMCxPe4G0FBCy/cIpkSlV1Y+86xRa5mQ6IUF8V88nm3gZYVYG8u4ia6Q+oScLYZlDTRNoSQmrxVrg
	90A8s8wjCi2Y2j4H8xi1rgD42xUXBqoTSDHlnkt3+sUcZmdcxZja+q35KoaSDGEHhqBK2ssTm8Oh2
	sw2/7Njw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQIK-0000000A3wE-13tr
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 08:36:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ed0e2015aaso17157185ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 00:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794472589; x=1795077389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=NuEJJH1iY6kJWckCUZl2YxUKoxcRWnojwlEoNH831dCPnN4Ulxi7l1h9Vjoqd93F6v
         4rxo7JYHhUNXhdoQhUrhxkDo7blhvEM3o/ugSSBRdlcdPzeAFDj3Qc9jWE/uQrqXBut3
         nv1ZOKE5qExyTSSYnBMONd0xOPPB4ia1y+EtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472589; x=1795077389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=oEA22qPkYLWaz6z2U2s7/ecDG7S9qcbkFHY+FkPJygqbl4L2BQZTLZA7lxnjhyixfI
         6JPpBMfB66JzBkMK3KpMgPVSX+s/6vCVOC4uQGjwBRYV5lzW1jFN5jdcIjV4qaYCkUVI
         GCYOf6H1ZVUoCfTTBXZV/1AA9L+LfHXqEA2RZXv53BWwlDWw3Te3TqKhnYtI7wYgj+UN
         j8f7FHdmO/a9qObR5+OMyYTlSpO7I06yXICNSFKSemkMsiTnAd8FvzR1eiKSAQncTIME
         aMpp2n1gAMA56v6LgdzA/Xc9OMosOxrDImscjcE2M9POM4t47rTE5syDDv8xfxZamc9Y
         BJdQ==
X-Forwarded-Encrypted: i=1; AL+hErESWNjzxcr6WzDVuetX1XRHGxKrW1aPC/k0z+Ae5/7iKiMzkOKet4k8eR/Hg6xp8dFOzZ8kGwZD3ggCGbAykg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8PuPJT6iIcVYcafqbLJfgWJEpf4Qr9JXc1/hmpH6ydOMWGXJ7S
	BBgnba0adwkJ5s2HDOWFmfxGoQELvR9wCkIxMPiqrDifttssn4fk+EztP4b8zHS//ciiMf+7qG8
	cyR4zLA==
X-Gm-Gg: AYBFou3zuZdHJHHlVFcVz/R8iEt0z+PMd2S3QH0jQpkJ4PN1d2kjJYC5VyaaldCvTgh
	lALq7Gey7LTWpKzcwm+93USZR5AR/cC6hSt3tHYk0emA0Eo7VrVIPKEfMkFvbv7zAsFLHrpDVwo
	gNvT1XbRnH31gPkgSIcMQH/7K76z019UsPkWVfHcUJ91mbvcJgQ8pTazT3YAMewNO43Wom2Gz2f
	M5D8whwL7XgW9h5STsdAeeFWt/wD4UvYpWHbrXvutg46MkNS8nF2QUzWEUcI1PwQ259V0KsSrE+
	cf2hlXXO5gqyUNfR+3TEwJbCTU2bmyEzSEEMda6IR3ezd06xyjVv6Hiq4L68VtTgwKzSt5e55/K
	IHHEYKxjpI+blxqh9nYfhzyGBF+nhiCfhzRR34TJqYyG3AEziPZPZWP/wN2FunN2uz5yz50jp8x
	e+7L0inqy5b9X7ortAV7KIdMY7Kn6BTmtfEkN9DqeepceOd1T5eH9U8YCvkAlDfGPDttPs+I0Tj
	uoC60mjUyjbPWERFjO2ZWdwomtqyoHlfql+bNCbx6JNn2Fcljo88VCBkc3P3MKgtx9G+hSwU96I
	1I1ww3AN75Xbb9hQ61CzGXZ8hgW/O7fav+TKdRfG74UAS2beUOiKRFw9cJ/16q+HjU4V
X-Received: by 2002:a17:903:22ce:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2edd7ab69e8mr46863895ad.24.1794472589411;
        Thu, 12 Nov 2026 00:36:29 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a4013csm31176685ad.1.2026.11.12.00.36.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:36:28 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so7341184eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 00:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkn2HnMHuOOvO2JzvaYInS0NITEw27izF27a5nm9osnqF0LWyeOFK8VBYTVML155r+4ZpjB3CV62Cr9i/QAg==@lists.infradead.org
X-Received: by 2002:a05:7300:fc15:b0:36e:a265:8ee with SMTP id
 5a478bee46e88-37686171585mr5111950eec.18.1794472587019; Thu, 12 Nov 2026
 00:36:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112061736.4014993-1-yidilin@google.com>
In-Reply-To: <20261112061736.4014993-1-yidilin@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 12 Nov 2026 16:35:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
X-Gm-Features: AclHuK-lH1eh8S-718xAEgJiftUumas93CKfUyPQy8uMkB1D_yMS7HqTV46k4yw
Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
To: Yidi Lin <yidilin@google.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083632_200597_FAC4671A 
X-CRM114-Status: GOOD (  13.54  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 2:17=E2=80=AFPM Yidi Lin <yidilin@google.com> wrote=
:
>
> mtk_dp_aux_wait_for_completion() returns for a read as soon as the RX
> FIFO write pointer is non-zero, i.e. when the first byte of the reply
> has arrived. The rest of the reply is still on the AUX line, so
> mtk_dp_aux_read_rx_fifo() sleeps 500-1000 us before reading each byte
> of an I2C-over-AUX reply and 100-200 us before each byte of a native
> reply. The FIFO is drained this way even for DEFER replies, which carry
> no data.
>
> A 16-byte EDID read therefore takes about 16 ms, although the reply is
> complete within about 300 us of the request.
>
> Wait for the AUX receive-complete (or 400 us timeout) interrupt status
> instead, which the write path already relies on, and drain the RX FIFO
> without delays. Poll every 20 us instead of every 100-500 us.
>
> Reading the 256-byte EDID through the DP AUX DDC adapter drops from 266
> to 6.5 ms on an MT8189 Chromebook, and from 547 to 23 ms on an MT8196
> Chromebook whose panel defers every 16-byte read once. A 16-byte DPCD
> read drops from about 4.7 to 0.5 ms.
>
> Signed-off-by: Yidi Lin <yidilin@google.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 64 ++++++++++++-------------------
>  1 file changed, 25 insertions(+), 39 deletions(-)
>

