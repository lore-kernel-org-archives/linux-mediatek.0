Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF3606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PDbMhVtG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S25K4l1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=; b=PDbMhVtGgJkmzs
	tYIIsLe7H3nzdigYKRZSR/UQC4WYQMGa0v4qmDP8ca0IBc2tmpqGSFqR7m0waB7zK1mcspAfoK37Y
	Bo9Ul/Dv+Izhbq5Ehvclx3cNy6fj+oIAgAXpxYzl/2n/gwPWURSNN5ROHc9STzp7eXNOmkAGRBmDA
	OYhBIN+29zrD7P1dPgA47FWlgGZDbJI9BScNpcIt6shOeIbJ34ZOoTFHL6eCI0uAk5fvgRwX28dZA
	z0MzhJxzozIYMU9laJzyf+v27fW/3c75RBV4ajl72CNM92Qy7UVcL5KVvBKK99ISFd3e/YUXXWZRF
	RgQPnGuGfHbhmmudFIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROBu-00000008oTD-19Dw;
	Thu, 12 Nov 2026 06:21:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROB0-00000008oGG-3xtU
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:21:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so2918013a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794464449; cv=none;
        d=google.com; s=arc-20260327;
        b=lONblig14Urw6WkI6d9MmSPFuA4WFOeECbu4S6oO6FSQ6+lZqdAs46YCYX6lTRZgm+
         jf7s5Ky39/gUmZQ33AH3CTOyQ2esOg1ZvrUsU9tfhEyHJVfJcAwvlFdIs0Fi/bY9O2RP
         wcz4Wprz9rTk2E52Rv7KoG4846QfWITxlb9F5ONczPoYeMLNdJUIUA+UAbTF2Oa+iJPs
         UMXSCLF9wuFWWZkIgulw00SSdWzOUNC70S+e00GZVAux0xkz2zEWjGzn+ZngHVDdazqC
         e1+KKIrM9br2yPpBakjFFQ24McGYFm9lvrOVIULV7mbzVSsHHiCBg1i/aP4NfNlF4qIH
         Pb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        fh=MxZx74ccaiDmi0p8+7lNPUY1RjDdDK3gjwnAT2WKreM=;
        b=h5+WZEsteMgKBvn0QjxOSO2GVaOBIDAgJxlb7+Pt+c+FaPuooGFqgx1cmncGG03B8h
         NW+wN5Z/VD89rYm9737JVj+NKbe44pp/w63bbnZ9X9USJ0nH5gX7P2l23SjPdKwVsmyI
         NpUY67Z4Zm3vXdTZBAwGjcGUX8is+YJOcSofH4rI/TfKOxFZKgcG5O8+9hxh0CYCXb7G
         mziTrAIJMx5MnL0XQVAyNVvwVtdnNomfPFqw4Q+1RLlSoxIUhYWFosUdFVDbaiGyKj7M
         BuM45ocvh/Ui6q0CxaRjRXM6AGi/o+1NXKM9ubyjUe6dsjgogUqAB3VN5a6MGNsRWt5/
         4pmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464449; x=1795069249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=S25K4l1XjqUv2OhwPYAkYwn8xp8eTtkuubt3nyQolCPBXb6SYydb9z6M2il4r23+jR
         tZrPf4G3PwCPMckbVtiTY35IbwAS/F7a0tcXfk0QubNS89zOKKiqlhtN7rLUj06NVijI
         9+nGcZXcB1RN+EV4TVwPSEulJK9QlZcx94Ctxv02aBOcJCrdXlYbWtKHb3YdiHl5rY1T
         1qagYqQcQq40VNn4lr0NYEQU40eG2nRNHeOqMEqoT/+9H2dd1tnjXmKCLiI73EanYi1p
         PNegJES00pvY8zVc5M4NGB1R3/SHwvOYigMn9eaQfdDpEY+IPKg83Ec/tpqRgdWlBfZQ
         cPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464449; x=1795069249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=NiOHWZ6ZwV6clRroByxEEpK9PkngVgORrGmrI6p9zjMPvtv+VdY2p5Hh2OeD8K7F6g
         qaE5ZC0yVmGNP1xnrRv4SUrPY2xBYz47aOxufz0NkgWYiP3kjHdYwFtsFdFzI2vERUz3
         59UHeSxaKk3oRo1zK017MXnfRbyXvUnUWr5UEZV9E269AtuTK3OqBXoErwhgpNDAVzZs
         ndiRpz21eHiqpT1unBiGMyPZUzw1Wnu4M34oE6m6gNZ4RhrQpwBAP8NhF8pkst8TV7fw
         0AmdYGqeuXtknOkP8r8IUqtHPq6rA8/FNnZkeX0bJ3CLKVbeO5SzUks7F1SnblgiznCf
         xA0w==
X-Forwarded-Encrypted: i=1; AL+hErEuvktX5wY3j8s1cmfvUtJpt1a4mkpVsjP+YiA+fMwCSQoLmzCCV+bdLZaRvT7MlcR4CqrArMzWrkbd2VbJ4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9/Sn7OZLoCaZbUHVjOT39cydteRPv6KJnv9Peu6vdouzXX/I0J
	sUpWlfQU4OIAithKlC0MWyuztAownOe3/wPE/Dk9K2sYH0fQ42Fo5HGzv+RIa4vqq704M01D5fl
	FvrCPf4gTMD+QGzwO02HLtSH7oJTfYw==
X-Gm-Gg: AYBFou0WvBRGhGK4CebRJJsySM0sku5+Uuf5UY88oiAerbbU5eP7W5YWeH/BS0gmO6H
	imZ3IULRf908sVml8VF1b10AX3aQIZtirZeQZio+jaxQgiY48tsGc4A/tqoBIMkj9+4x+XtF29o
	uQEmXyNM8uxwyOeYjCV5J1m4DLmzsnjU8qmRmd3TKEk2gCduGvtgLgHRvlGCK9uYmeUcr/L1huR
	IqmvC5DACBHyczng1I7U0IOZdGaO8U2PD6kwNF/zhq86Ji+pj3i2yTg4TQRw75zcDQY87Wa4GDZ
	sMVl+R7y7JkpYmFX7fBn42R2JYGULNuGW/qQGZoFyVa+6Cbv21J7iVZHlsq0K6xf2v9hqDYOX+M
	3PBxI12VFfptHuAbi0UZMwdRDe97olz+TAijkbp9eOlMRhGKQT28DGcB+Is83WuX/0rS6bTKMbR
	pCNH/yS1ur94iPbRrkLL8BrDHFzqapniGePYkUPLfso1N54yo=
X-Received: by 2002:a05:6402:2809:b0:6b4:21c1:21a9 with SMTP id
 4fb4d7f45d1cf-6b7778159cbmr3839503a12.31.1794464448878; Wed, 11 Nov 2026
 22:20:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011222234.2098904-1-mhun512@gmail.com> <179406798190.3424803.7064068903462702662.b4-review@b4>
In-Reply-To: <179406798190.3424803.7064068903462702662.b4-review@b4>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 12 Nov 2026 01:20:36 -0500
X-Gm-Features: AclHuK8iacxlbWVlhHrmZf4nXYKveYZX5zn-UdiKOJPEhizJAmxWAuRAURZ4Y8g
Message-ID: <CAGEsz8FAOrkf7AzjfJS+ZXnU5eZdTbSjYtVtceBimH=RyMz7YQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_222052_647763_12DE0F05 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Thanks. I've rebased the series onto your for-next branch and resent
it as v2 in a new thread.

2026=EB=85=84 11=EC=9B=94 7=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 11:13, =
Mark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > The AFE IRQ handlers access regmap and PCM state. Register each handler
> > after its inputs exist and release it before the final remove callback
> > or managed component teardown releases those inputs. The mt8186 patch
> > also balances IRQ wake settings on probe failure and removal.
>
> This doesn't apply against current code, please check and resend.
>
> --
> Mark Brown <broonie@kernel.org>

