Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C2C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYt/Og8p2momDhgHcuYS5iX+cpuUqKiX9hwxMzS4blc=; b=3CpaFmhBb27WfOlxUr1oVh8LJX
	6OFV6PLx4+J21vOiS6+XTKJTzllxdyr1qGOmWJswW+/nSYSuX6cqf7fer0DSBhbqAreIe1Se0i5Ci
	7EN70A3XUKB4vnPGzsTPpcik8J3/yfahHl54xevRYlvEVm5lsyhysuV9OeC6NhhJv16wElwo9/Njb
	je2Y4q8VSS9lvEml6rLBzbdPhW0V3r9IOHZAOrnMAHoDJ7gi9oDAdjnyJ04mmcjNZ+vnRuCIChwFI
	XYZpHr5HA7IrY/BLXBVD2fqwqX6xd5KvOiHwhLgtMZ3mXXDC8mBVJC2GTbu0Rbjp8OBNqs6LE6Et0
	I6hug8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDKE-0059Gf-1B;
	Wed, 02 Aug 2023 14:59:46 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDKA-0059F2-2a
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 14:59:44 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-40694b191cfso52009141cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Aug 2023 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1690988380; x=1691593180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kYt/Og8p2momDhgHcuYS5iX+cpuUqKiX9hwxMzS4blc=;
        b=Xi+WBCiziQ3cHF88fwmCmkWvQI4yv33QxIjWVB51ktnlyBEAsL28b4oQ1BUdZaK+JF
         nYbXVEI1IGoSZKvYjJDrZnj+uDpTze3WdybGoiBgC83QaiCL/YWh2RlxRCdkgOzvXCaz
         VEgvXPDbTkYrVUc6FvsfNSIvLofL7CMKqg4yzMLGxjx50ssakplERt+G1CwdMJlGbbta
         XnndwNq881nOEH5sWbRYEzqVPQkzQe7rXBdTcvanlWM0NOLfGm+FhYwQfUZF5OA25rf5
         UfVpGn3qACVSexIk5541LPj2bx9+EoBerbxih3qj+iuXzCrRoxWS7cKgnwY25ARbwrWD
         kbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988380; x=1691593180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYt/Og8p2momDhgHcuYS5iX+cpuUqKiX9hwxMzS4blc=;
        b=W66ByNgLLrWeFSE6wvxfYPFb0Qys+64UIV/VpCRz3L4Ra/7cTe0fxAL2zn45SAZMNb
         2kZye18lRZo8k0uuVeozku6KRhb8YCJ9emhbj0T73oQCYlAd8ddUN0aXi/or3ka5rt8O
         tuM6Qfks4GssPQVJ6ly23b0j3IdPBH+nyKr6Obu+3/JjTiAPiKDvlpK8nZkCPadZk1PQ
         ZjPLuK5bv2pk3VaxJtz9Z6xr6Hzm0XrpTT/jooq+iuKYgQGesGfPNnuXxCwS7F6zA5iO
         lMEWUScrEgaJ/QGt2YlGw4xPneMm+nDJ4V9FrN2wI1HyyrqhnzOdEcfTbg8NS1X/ii1U
         0o+w==
X-Gm-Message-State: ABy/qLbEKyWtnXK/E9xZerSHFDredKOFcWOIgg5Jual5nRFwuEnXj4Rw
	umR8UQqwYeaQGyrcF+HJjzHf2Q==
X-Google-Smtp-Source: APBJJlEtOXevsfG2Yv79DAn4/lz0ItSRpvVSeZStBYQZom93mQdmljLYQZ2CJSUmNHoJL/XXeyC+Qg==
X-Received: by 2002:a05:622a:1786:b0:403:aa49:606e with SMTP id s6-20020a05622a178600b00403aa49606emr21938733qtk.30.1690988380513;
        Wed, 02 Aug 2023 07:59:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:10:2688::7a9])
        by smtp.gmail.com with ESMTPSA id z1-20020ac83e01000000b003e3918f350dsm5438001qtf.25.2023.08.02.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:59:40 -0700 (PDT)
Message-ID: <95eb0ff22da269ad6df5685aee6fa8d4ad0ca738.camel@ndufresne.ca>
Subject: Re: [v2] media: mediatek: vcodec: fix AV1 decode fail for 36bit iova
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>,  Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 02 Aug 2023 10:59:39 -0400
In-Reply-To: <20230704015135.31850-1-xiaoyong.lu@mediatek.com>
References: <20230704015135.31850-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_075942_838588_00393EBA 
X-CRM114-Status: GOOD (  19.17  )
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

Hi,

Le mardi 04 juillet 2023 =C3=A0 09:51 +0800, Xiaoyong Lu a =C3=A9crit=C2=A0=
:
> Fix av1 decode fail when iova is 36bit.

I'd change the subject to "media: mediatek: vcodec: fix AV1 decoding on MT8=
188"
And rephrase this one to:

  Fix AV1 decoding failure when the iova is 36bit.

>=20
> Decoder hardware will access incorrect iova address when tile buffer is
> 36bit, it will lead to iommu fault when hardware access dram data.

Suggest to rephrase this:

   Before this fix, the decoder was accessing incorrect addresses with 36bi=
t
   iova tile buffer, leading to iommu faults.

>=20
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 deco=
der")
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>

With some rework of the commit message, see my suggestions above:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes from v1
>=20
> - prefer '|' rather than '+'
> - prefer '&' rather than shift operation
> - add comments for address operations
>=20
> v1:
> - VDEC HW can access tile buffer and decode normally.
> - Test ok by mt8195 32bit and mt8188 36bit iova.
>=20
> ---
>  .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat=
_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> index 404a1a23fd402..e9f2393f6a883 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> @@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct=
 vdec_av1_slice_instance *ins
>  	u32 allow_update_cdf =3D 0;
>  	u32 sb_boundary_x_m1 =3D 0, sb_boundary_y_m1 =3D 0;
>  	int tile_info_base;
> -	u32 tile_buf_pa;
> +	u64 tile_buf_pa;
>  	u32 *tile_info_buf =3D instance->tile.va;
> -	u32 pa =3D (u32)bs->dma_addr;
> +	u64 pa =3D (u64)bs->dma_addr;
> =20
>  	if (uh->disable_cdf_update =3D=3D 0)
>  		allow_update_cdf =3D 1;
> @@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struc=
t vdec_av1_slice_instance *ins
>  		tile_info_buf[tile_info_base + 0] =3D (tile_group->tile_size[tile_num]=
 << 3);
>  		tile_buf_pa =3D pa + tile_group->tile_start_offset[tile_num];
> =20
> -		tile_info_buf[tile_info_base + 1] =3D (tile_buf_pa >> 4) << 4;
> -		tile_info_buf[tile_info_base + 2] =3D (tile_buf_pa % 16) << 3;
> +		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits positio=
n
> +		 * and clear original for hw requirement.
> +		 */
> +		tile_info_buf[tile_info_base + 1] =3D (tile_buf_pa & 0xFFFFFFF0ull) |
> +			((tile_buf_pa & 0xF00000000ull) >> 32);
> +		tile_info_buf[tile_info_base + 2] =3D (tile_buf_pa & 0xFull) << 3;
> =20
>  		sb_boundary_x_m1 =3D
>  			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - =
1) &


