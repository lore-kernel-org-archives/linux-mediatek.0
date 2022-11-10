Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF616C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usAZpT9en/YLKj/A5eBXlI3apyC0Q4TjOlw2uPUo49k=; b=n2o04x9PBAHCIr5QzvyWyr9pNd
	oxekdszAMJyufAfdcbwX60q7dGfY3tYkxx3E4O2Tfkdt8ZhM1EEehq5vKb34o6395veUAZRiQWl1/
	gZDRvfpiP5vXi0jvqATCHck67F7avUYvPVI8v1KdqkdTmQT5AMgrY7Xz/E9zRFqOgpRjam3rTx/Cs
	aGTXMU43yJ1EiFawOBIaCifbPansqSwC3OIza7fdm9nc3P2n0dMxknRvzyvZAXD5JvK73gTi6LVQ8
	EgPIvNqBvKaGUvxmzKvwt3pu04ZojCAXpqbz/yMZOIk8cLP4gCej0eRE04VV5q47Dmsfra8kGYgcb
	qN7Ha57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7pU-0065sf-Sl; Thu, 10 Nov 2022 13:42:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7pI-0065kO-EE; Thu, 10 Nov 2022 13:42:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17C9B61899;
	Thu, 10 Nov 2022 13:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BFEC433D6;
	Thu, 10 Nov 2022 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668087758;
	bh=4U7C9niDGrmfi8IMDATi6BtcBIfDiuOKvkxBiJpdV3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SX98KqeYKns7KGfDa8dTp6G5wayF8iiATI9dVap4Wgzf6d34aTkI97ttMf366XE+1
	 R2U/r9UCn8XAghsEFSpznVYcqr8O4mENHj6OsaLq+Fq6HN0VtBRF5F87Flp3fz7U9W
	 nvj7W8/tSmA7L4xJk7dnUI98uInsIF93sAvIZzyrmOw4EtrC/VyKLAoiFVV/YaO0TE
	 juhdMKkkNBetHZgQdRAht04cUd+m9+wVS6uPEhlXh6VGR8enutToxoBG4kAhDSNlp5
	 DlWpLWUfxIYQqAAL+Tvyjtd7LpIsGuKzn/xSnrb8o9O8thutGRnRZK09gfgNgN9+Eq
	 peEprHo4LiCow==
Received: by mail-ot1-f44.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so1126047otl.3;
        Thu, 10 Nov 2022 05:42:38 -0800 (PST)
X-Gm-Message-State: ANoB5pkTFH1LJgn3uEmKl0fAb1JBizJ7WUfSrghOBHO6lF/0N/dkeoKA
	5YUEScwNFoBXeYlTtpJEfjqbrswvoh1BYfPeZw==
X-Google-Smtp-Source: AA0mqf4gARCZUERKvwgaAfgdC1LEqRRi5pu66mk1Uqd2ev+ik8AG7xmvItT3O8MQpM0VXWbeKoELJNlYq11nhVFHllU=
X-Received: by 2002:a9d:58c3:0:b0:66d:2f7d:2a68 with SMTP id
 s3-20020a9d58c3000000b0066d2f7d2a68mr4817252oth.40.1668087757150; Thu, 10 Nov
 2022 05:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-7-jason-jh.lin@mediatek.com> <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
In-Reply-To: <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Nov 2022 21:42:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__vvjKASUJAGOvL=-WnAq-ji7sfyEEY7j49ty0P7Svvdw@mail.gmail.com>
Message-ID: <CAAOTY__vvjKASUJAGOvL=-WnAq-ji7sfyEEY7j49ty0P7Svvdw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_054240_572630_E296D560 
X-CRM114-Status: GOOD (  18.43  )
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

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2022=E5=B9=B411=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A7:25=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
>
>
> On 27/09/2022 17:27, Jason-JH.Lin wrote:
> > After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> > mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Chun-Kuan, I understand you will take this patch through your tree as it =
depends
> on DRM changes. We can also sync so that I take it once you merged the re=
st of
> the series. Having vdosys1 series around maybe that's better to avoid mer=
ge
> problems.

Hi, Matthias:

I do not hurry to merge patches. To prevent merge conflict, let's
merge step by step.
The drm patches depend on binding document patch, so I would wait for
binding document merged.
After drm patch merged, you could merge this patch.

vdosys1 patches depend on vdosys0 patches, so just let it around.

Regards,
Chun-Kuang.

>
> Regards,
> Matthias
>
> > ---
> >   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc=
/mediatek/mtk-mmsys.h
> > index d2b02bb43768..16ac0e5847f0 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
> >       DDP_COMPONENT_CCORR,
> >       DDP_COMPONENT_COLOR0,
> >       DDP_COMPONENT_COLOR1,
> > -     DDP_COMPONENT_DITHER,
> > -     DDP_COMPONENT_DITHER0 =3D DDP_COMPONENT_DITHER,
> > +     DDP_COMPONENT_DITHER0,
> >       DDP_COMPONENT_DITHER1,
> >       DDP_COMPONENT_DP_INTF0,
> >       DDP_COMPONENT_DP_INTF1,

