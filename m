Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94CEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahbeWucAcoOgJsJY2s8d1VaxXiv71GHKoX+Vccdy9XU=; b=yzgOq9MKlU9qUjaY5CnH6ZlG3e
	O2qPhd+1RU7le4y5yD8TbiVwuR3bfxkMM+VTl8veTGQ/02Lx4PlBBVnwOcDtojs5L8AdVXOF/YEf0
	HrwkZiGqYFgJhxBzj7HF+MU+r4oQRkZc+gOf/Re+J7L+BDFf5M9+GU5XROkJyU+l0nZUypNfHkSw+
	cYTENkug2RXJHICJfR2Ee8c/PKXkMHY6gFtkgWUEawYgW9MRqNjf5gZhNEDCx+DOlVANj0peuS39j
	TMpwtkLprva6enzPCps62a3SawD7jSn0tzVG05FYgPbpxrthI6h2HT9zmLMYnV0WGXc6DNQC1zMVo
	QdBti+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4LL-006gue-0U;
	Wed, 19 Jul 2023 10:23:39 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4LH-006grR-37
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 10:23:37 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7836164a08aso360198639f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689762213; x=1692354213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahbeWucAcoOgJsJY2s8d1VaxXiv71GHKoX+Vccdy9XU=;
        b=EPBukdUU6JZL7z6rax1O8Y1jHxExtSvPJnsurmUPhC//wDyCKsnEIw6X+7A8G7MeJV
         c4yDExgcwcvfrRyQbsYkWalcWU/zFvzPGIoK+/JOWSys6t1UlBfjbd1Vqd9otuPPA+MT
         Qz+qhGIpykg0AX4Z01moBKrysghiXmOSxaTXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762213; x=1692354213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahbeWucAcoOgJsJY2s8d1VaxXiv71GHKoX+Vccdy9XU=;
        b=KJlHv5eqzuY/vKhflQNrf7MZ3QfIVTtOZSay8WL8FiiBGo3TcvelJzogUczeyC0HV6
         lzt+Wsmu4tsCmjKf2SshQP93Haz+Tqtvh8I0wHJM4pBA+P40bWWakMPb28MNzn17Hjf4
         uHAoz+2F4vR7FVH8Py5rI4rjLZ4Nddfkx1MeIbUUjjmg1TCCh5a2qf1B0HlgPsGYvVb1
         BuS48OanqTMla+SVjdeMNE75X+BVUZLkfoaSYZ6Hf0zzRPiiHd59FsuTFM6qqFtZ7lJw
         fU+cr/f9Hr0m4/r55xGc634ihQLZ5enZNWpIsaB7M6Loptd2LFIOxWUVPhMA/S12Kt8H
         wuGg==
X-Gm-Message-State: ABy/qLZgdIAidAuRPQHZkLPiFu5mUn6z/7FBg9T4x7a2MzXsL0OFf8fW
	8GrkRg9NMrTmlatzQvzZRP65Y0vijJEidNfklVM=
X-Google-Smtp-Source: APBJJlFFtKaW8UhO4jYQs3SML6YaCS9+hUhZpWwIWhTuvIKZ3MSfeewJ3J2jEYdBwohrHmwXviFNyw==
X-Received: by 2002:a5d:80c4:0:b0:786:f10e:a473 with SMTP id h4-20020a5d80c4000000b00786f10ea473mr1283082ior.16.1689762212805;
        Wed, 19 Jul 2023 03:23:32 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id e1-20020a05660222c100b0076c569c7a48sm1248972ioe.39.2023.07.19.03.23.31
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:23:32 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7872d448c5aso361504839f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:23:31 -0700 (PDT)
X-Received: by 2002:a05:6602:3314:b0:783:60f7:ade9 with SMTP id
 b20-20020a056602331400b0078360f7ade9mr1781762ioz.5.1689762211675; Wed, 19 Jul
 2023 03:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com> <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:22:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng+s5Fr_Evwct6E5yPZD8hN_NLYnx2sitrUWK3b4ti73g@mail.gmail.com>
Message-ID: <CAC=S1ng+s5Fr_Evwct6E5yPZD8hN_NLYnx2sitrUWK3b4ti73g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_032336_008473_1231F534 
X-CRM114-Status: UNSURE (   7.86  )
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

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change drm_bridge_add() to its devm variant to slightly simplify the
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

