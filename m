Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9317CD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnnQ3s+GwRKjZuujvx+iDfiO0JJCCFMA1JGV0fiu7C8=; b=ED2mKEIFXhpQ//Iq1k/M131tpP
	TQS+ctNoWoVzSMjfmC876IQUK5KkmAMZ4aABMojih7UJTVn3ewcI1h4iFn9NnI4nBe6qJooehKER6
	KHLCAr0H9dkgQK4OWos+SezIgO8GHUwfxvD+FDWzFJTKml6g4h/pmhj2ZX2EPzaneE6gdDxmV8WW+
	ycTpeT6byf5eB2Epe2hF/HPsOEwjaFOmb9FB0Dg72PVvAd0NEJ+cl8jIEAzLv/8Cw3FcqyyGlYBos
	T0bPAysD/iiTHfo2U3S8BJSvQ8A+jcwKHhUT49PfEQUa895667zIvPJYI5lYKJuzsPe1Ki0bG7Vn0
	zSdUbwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYWw-000E0z-1s;
	Tue, 19 Sep 2023 11:04:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYWt-000DyU-1e
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 11:04:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50307acd445so4455128e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695121469; x=1695726269; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnnQ3s+GwRKjZuujvx+iDfiO0JJCCFMA1JGV0fiu7C8=;
        b=CuC6CnY1I/qjYr/XYchpzRLwRbyg7g9hFS25oqAgRjuklTNy8guu3vZpNvRBcxnD8J
         7ZI7u/be4Hp/FUXo/Kvxyp7Iatac/cakGUPposn5VXcOVtfJYrdtVKbr0qRoEqiXeqAi
         yWtjeSx2U2CP3VTCfGZ76lcORJT7cARK3QNxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695121469; x=1695726269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnnQ3s+GwRKjZuujvx+iDfiO0JJCCFMA1JGV0fiu7C8=;
        b=waDIzTmE5pJW6izfKFtG1xSfVrCbzIm/BXoXt4JxXuvnTe1L2vb0Gboo8J0WM72OM8
         OGmaBfUXXItOs/EzqOxsANcKvCNI4R+2hHjmtQOoZCXj4ztWJhVLCDffnDrpipDZYav4
         23fkvaU7ML3CuKSNz1vbaDd78oBF1GwWkEmqYpgi9B9z/JaakKGO/rsXu8dixLgmfTuw
         frdiMktPqCagBowraSoMEakudjS1VaDwZG6p/etgcxH1piyrq2PIl2tShyYTsI5Claoe
         mdwB8h9MNDh4wylCitgFx0RviE2hGWgRAZb7+pQj5+TfxTXPviH1LGJqy05AcpVkSq2w
         SOCQ==
X-Gm-Message-State: AOJu0Yyqff4fL9tTc/yOlQr+Tfk66vPB6N2o1GuLFNbcAb0AQjxGK5Mc
	MsvjWMbeGmELIgJYS2Fu777REjdSjb/NL7E0zLdLZg==
X-Google-Smtp-Source: AGHT+IGcV1dfcbMagRfMyNyQcnzYkHiXYtQedB3yY9VjknrAYCXYI60T/bUj3J0z+oKX3RZLt4u29SWWXZup/QVezkM=
X-Received: by 2002:a05:6512:312d:b0:4ff:9aaa:6e3e with SMTP id
 p13-20020a056512312d00b004ff9aaa6e3emr8647917lfd.41.1695121467746; Tue, 19
 Sep 2023 04:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com> <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
 <87cyyetohx.fsf@intel.com>
In-Reply-To: <87cyyetohx.fsf@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 19:04:16 +0800
Message-ID: <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_040431_573913_A69F14C9 
X-CRM114-Status: GOOD (  14.34  )
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

On Tue, Sep 19, 2023 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>
> >> The sads returned by drm_edid_to_sad() needs to be freed.
> >>
> >> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> >> Cc: Guillaume Ranquet <granquet@baylibre.com>
> >> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> >> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-mediatek@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: <stable@vger.kernel.org> # v6.1+
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Looks correct to me.
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
> drm-misc-next or shall I?

Patches for the MediaTek drm driver go through their own separate tree,
maintained by CK (Chun-Kuang).

ChenYu

