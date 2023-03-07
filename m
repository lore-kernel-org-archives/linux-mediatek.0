Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABCEC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5DlCuYa7/0gszYKTKl13EbxZ9aUeXgRvcmWQ1j6cpk=; b=VaTkjZa/16Kq3war0GGBum3C8M
	bBBMC6TEn0KDzXma4nuxDXAy8pFDYQpw2TbDf+6NpHWVsxd/fJvILP1HKWwVKw8ayU8PfunyJRtDU
	saGtt/cC24OnBrI0leCHcv2tzbl/otNQ0BOv0l2WtKY+oqaUJsOxA919D9MVwZyaPcMfyK51R30b8
	6LOZladHLGQu3LDLAkEcydv9V06bHWHPTOs7KFcWd7E036yboocXTIJXS6zMlFu8UaU/lg0AroEBb
	g/cf8YULMZtlXMeY3e+z82XNuQJSk6+WammGdqgy6ZAwBvMChj3R+uchezSCHvhFbDjudXe99Bqve
	jVU5FDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU1K-00H3hm-4v; Tue, 07 Mar 2023 09:54:10 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU0q-00H3Mp-Sk
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:53:42 +0000
Received: by mail-ua1-x934.google.com with SMTP id bx14so8474495uab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5DlCuYa7/0gszYKTKl13EbxZ9aUeXgRvcmWQ1j6cpk=;
        b=iYVNJhITTewI0WpMkOykHA9MEJqLR9u5GxtRG70p5Zu/GSgLThwV/iZ8limQX6EPfM
         QsUNbKXXHV4j72gPV9NqqX/s7VJ+8MlE3JEPlKPZsPCh9I1iLiORTPTvoXJG0S3jK7Ed
         2g14iWOM2PvMqyYjxVBaV1NDiYlCAidKKmc4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5DlCuYa7/0gszYKTKl13EbxZ9aUeXgRvcmWQ1j6cpk=;
        b=cPj7qfPFgoP4gnBPVvl66fUZcRaTBXstAG+6oEamXuBqFFd2v2HW/zcejnPT1AZ0P/
         aqL0UUbkOcy5DC13FZP2QUtGwzda36hKoK7sW3deOj23TFiSUP36i6bLLBlUPhMkywa8
         grKQE2sLQvPUC2XjIFdkXL45qhyu0XbuD0gpXivyLNSQWXQa4VrRkVNUUJoCMKhMj07k
         VtcIeQ4gHS28ju3KhCtfjuuTJIgQlNqhIFQTRm6ne1SpKcNf8H4mhJ3fqLezt45muJx3
         CuTeFJ+TIgmLmZnMFBZwbKui1zyXQtTvBZQSTdtZ2P//ekGUOdMBaDPdsDNns/vvjTv+
         jC8g==
X-Gm-Message-State: AO0yUKVqpDrGC9n8UsG43BGBoKtODJ5UIfyfRj5xxqTBQXo5u3V/GuHG
	tObMqind7XfEuHvOcmf4Iv37hIqw/fxSiyr5H8OnUg==
X-Google-Smtp-Source: AK7set+q9jiPd9ivFHGiyrKW+e476+Rr3GZq5Ktk/6QxdnYWJr3wJ1xgCC/Coq26W/IugJcUukY4aCFPLpWw0ND7HAI=
X-Received: by 2002:a1f:9dc2:0:b0:406:1fd2:bb76 with SMTP id
 g185-20020a1f9dc2000000b004061fd2bb76mr8622549vke.0.1678182815197; Tue, 07
 Mar 2023 01:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:24 +0800
Message-ID: <CAGXv+5G-2knqWMd9EtbAqXDwmRH+-ou0w__uXAXcfzyMoWdbRQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] drm/panfrost: Add mediatek,mt8192-mali compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015340_943234_D326F8F4 
X-CRM114-Status: UNSURE (   8.46  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit descripti=
on]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

