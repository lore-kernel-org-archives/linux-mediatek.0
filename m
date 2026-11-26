Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3A606A32D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0pSaCkL;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A1rrdMvP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=; b=c0pSaCkLhDo2PP
	BGMCka7aTg+S9UGmSshn80LHjbIqLPwWOroD4K/voipy8Mpffy176qobgtlL9tn1bhlbcSusYWc1h
	+y899jTTLJvUydPgSsuR+433mQ1BFO09d4w54S0HrfjV6ttw3Y/QCkId5WjsfaM+FHMJGH7fg5SUk
	8CwPAiV7tkCHmVs+V+ykNdrqZ3ss+IfGoPCE6GYdm+rJhEuPSB7nZ0vI3p7W6Y8EKvE0wuMsCmgnq
	IKh6Wzuh955kfvhZqoM0YnLLnP/Kqa38KEwvZF6i0auIErPyT2FKSVWz7EmYT8gzFqUwZxu6dD9H8
	S5WE9bS8HRwCcvpnZgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVcT-0000000CVod-1gYo;
	Thu, 26 Nov 2026 09:18:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVcP-0000000CVo8-2jHa
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 09:18:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so4570239b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 01:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795684697; x=1796289497; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=A1rrdMvPVxCtaJ1hDLd+HYBYZPst3ATmdeE+M2JBsoc4yWbVSc5GMl7zCsCIpDPwCY
         H64GCpJygPqRgEDxv5Ooq1ytzGs6KCrl/1wzIqrKCESY13PpWuf4DHi3w9kadgnUxgWp
         pbfUH93YV57sK4GjCwVvSKU4kLLZW3dAbG4nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684697; x=1796289497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=JPTxgkRZ+r7OBg/dSSACIb9HtE8jBHioJCsolSzr45SyH38z0dk2YZKM44nfRZPoE/
         9pU0Z8veNIMvhS1HAA2Uk5pOqh3HVJKnV/2mmfS5ch0J1Uvjo39IJbTX5YLcF5UQKOTT
         PhDQviov6XV9m+JpuN0fjQawI745BqMqKnMKTbI30R8xHTil6/eMmyXohmMJyrYWWxzf
         HzEJ1srJJCJt+2O2XxZG1AMPxXRv5+6gXU152HkFhbKVmelyw6szaF2Pmyhsn5WIzYtE
         Od9L4E8s2LctBer9KCosQvho/68D+dZ37Pg0JCrYWGT+Kod1w8rdcmeMa2oBlU+2BygW
         MTuA==
X-Forwarded-Encrypted: i=1; AL+hErEoYqyxKm2+YE7S2LLNNwOlchIitYQtHin2351bLhnmNkNJyduQ3UdBULPTqL0lW14wT0ND3EvsXsJ4FkRYHw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9faRmDfDgmkscnOJeafHdh3gbat3/w0f06NYG/VxQNFELIupdo
	7ZOjqC2zict0iBn6uRk1IqPfKZnpuWvoxEEraBFin6S72+1PKzP1sZylHY2LXzZ1ZNlMMzK7IY6
	xzCHRlg==
X-Gm-Gg: AZFdTZfe5ANSHC9AdnOrDZe5fadH+0/UpFHlR4OA1ddiZB51KX1Z6e3SjqE99Iymksk
	LdO6SGFeWwQlAuzKrNnFFoSkYzTj9QcSpg2yLN6X5omoA1hCj/CHUnVcCPNEi6Q5+ZarE/jaL33
	3CJ5q2aR5HQV6Dm8V6NjwYmNFryns6WxajoXoAdnsOWIZ/qLA6TLqq4r5yb+OLxmi6lv8K+vo8Z
	hHKej5AYjSh4ASniewDautsPRUapp12bdUSDO6caAJU1sV8q6NqxkfLiJ4mhLdg5MCtqZg8GYtB
	qML7p6/N9f9W8Wvc+RXH/+0Sy8p8D0xrE9jzO/oJ1sNS0a5RvHwueUgzTMDlSWUINJ0h8hGwK7e
	zjD1Hjp7wb9KjveYe4OxS99dyi7lj+3OK5NmsuO8ij6E6BlQiC+AjLqAWW7L9dvoBx3Yysj8+vE
	r8lJccbLvOE+HdBuLH1x0TQibYdS1efPcJCJsJkA4qm52DomyIsjLuds+U0/gzfMh5FrCtq/P4L
	nSqSDd6O5Pppxk5VZ+rOwpjXuEwr7x/JrLNLhTgnyiQ5t7sBngFNKLA1TqJ6ZcDUYtXOn431pty
	/fTLhkwncSp/Jg4aAoDLPMhlpVYLL54bXJivHc3NeYB65X1GrlAgCQS63deLlegQmIs=
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr17295614637.63.1795684696852;
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cc4eb26293sm6911671b3a.16.2026.11.26.01.18.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so2092176eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHSUQ0kPFkPolfBWvzJFpEN2t9gBsPKldEbUVhrM5y100D2yUoHOjgIeaiK0sAMVnhLbl98WoR+s/w24ebBPQ==@lists.infradead.org
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id
 5a478bee46e88-386b82605b9mr10045446eec.7.1795684694765; Thu, 26 Nov 2026
 01:18:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 17:17:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
X-Gm-Features: Aa3M54qPRICfCIh7RUjjGiJ_0TC4b-0YY-WXywPDgZZ0L82ERU6OYtXByrL3V2k
Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
Subject: Re: [PATCH v2 22/46] soc: mediatek: mtk-mmsys: Migrate to new
 Multimedia DDP HW indexing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011817_819872_FC025F7E 
X-CRM114-Status: GOOD (  21.45  )
X-Spam-Score: -2.1 (--)
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

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The mediatek-drm driver is ready to switch to the new Multimedia
> Subsystem Display Controller HW indexing.
>
> Perform the switch by:
>  - Adding new "from_comp_inst" and "to_comp_inst" members in the
>    Multimedia Subsystem HW Routes structure (mtk_mmsys_routes);
>  - Changing the MMSYS_ROUTE() macro to use those, which performs
>    the migration of all SoCs in one go (as all of them use this
>    macro to declare their route entries);
>  - Adding new mtk_mmsys_hw_connect() and mtk_mmsys_hw_disconnect()
>    functions, making use of the new HW Component Type-Instance
>    indexing.
>
> Unfortunately, this change needs to go along with the related one
> in the mediatek-drm driver, otherwise functionality of the Display
> Controller will regress.
>
> The only way to make this possible in two steps is to duplicate
> all of the routes structure arrays for all of the SoCs, which
> would result in a total of around ~1200 lines changed twice, and
> that ignores the big increase in size for this driver during the
> migration process so, in order to avoid useless bloat, I opted
> for an inter-dependency between the two changes: mediatek-drm
> and mtk-mmsys.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 99 ++++++++++++++++++++------
>  drivers/soc/mediatek/mtk-mmsys.h       | 15 ++--
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 ++---
>  3 files changed, 90 insertions(+), 40 deletions(-)
>
[snip]
> +void mtk_mmsys_hw_connect(struct device *dev,
> +                         enum mtk_ddp_comp_type src_type, u8 src_hw_inst=
_id,
> +                         enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst=
_id)
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       int i;
>
> -       for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> -                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask,
> -                                             routes[i].val, NULL);
> +       for (int i =3D 0; i < mmsys->data->num_routes; i++) {
> +               if (src_type !=3D routes[i].from_comp_type ||
> +                   src_hw_inst_id !=3D routes[i].from_comp_inst ||
> +                   dst_type !=3D routes[i].to_comp_type ||
> +                   dst_hw_inst_id !=3D routes[i].to_comp_inst)
> +                       continue;
>
> -       if (mmsys->data->vsync_len)
> -               mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN,=
 GENMASK(31, 0),
> -                                     mmsys->data->vsync_len, NULL);

The refactor drops this vsync_len register write block, leaving MT8188
VDOSYS1 unconfigured.
Is this intentional? Otherwise please mention it in the commit message.

Regards,
Fei

> +               mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].ma=
sk, routes[i].val, NULL);
> +               dev_dbg(dev, "Connected %u-%u to %u-%u\n",
> +                       src_type, src_hw_inst_id, dst_type, dst_hw_inst_i=
d);
> +       }

