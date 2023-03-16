Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA30C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfPC5VKx2oVWtngJw76NtBCJ44uq8j3AAfOFLh7Nvso=; b=ANDf5869UwsJBTsJh+r8uJzGxw
	G3QAcCWmZMEWVxrcHhy59FEgbEdexj7ATf+5X7RwuuNUqh4HFDIx2gazlniDnUJSiGDX+XnxTiEsy
	PY5hXjYbOoEaRvKh2RNwCXtWjdkHKjeQadrMaqFw5eDyFyTcrVESsBbO/2euDlZxrkzeTpO1FkG6U
	zUgHObvPSR6Cgrip6lozm5zEbZB60zLtTAmTHJSgSAaGpPyXJU3ikNATqe/HoUEnl08OpbJBTgAXj
	IOl4hp+DbYrfJdns7ZmCdKoB3ndkX51eY2ZI6QC6xYU5tAwVjgvujU+3tvd8+vlfSlup62kHo3brx
	zobxbJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pclUb-00GAMm-0F;
	Thu, 16 Mar 2023 11:09:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pclUV-00GAJE-03;
	Thu, 16 Mar 2023 11:09:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDE95B82107;
	Thu, 16 Mar 2023 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2C5C433A0;
	Thu, 16 Mar 2023 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678964986;
	bh=VfPC5VKx2oVWtngJw76NtBCJ44uq8j3AAfOFLh7Nvso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ot1uiIqCRdvbzUCUvor586j2NbaqealDUs/54l3q38YibKgzGjgWgtM6SrmT94Xef
	 UjR0FcucXSghxtO+zFLUT/K5cOAGJyKP0SjIFlBY4gPK6XbZfwIasTM52za0QLh6E9
	 DGwE1mm9HOKG43pPPbk7aCDPzhwP6ck54Nl/aObd8+vTQf0ogdCcmCntXrvm2pjFEe
	 xhvNo0ldz+uRPnoeUJYI4qHLS5/iWLTkI+w+BaPiTM+buF4IopmCvu6JDdbgRx+7Ll
	 ZITHZfj2ObpatIchjL1Ql6SoqNzwcpJqD2EIYsPaeSO1VXTeAac9+zID1etwC+CA4B
	 X8IaM/pdCXGgQ==
Received: by mail-lj1-f174.google.com with SMTP id l22so1215943ljc.11;
        Thu, 16 Mar 2023 04:09:46 -0700 (PDT)
X-Gm-Message-State: AO0yUKVZdOQNNnqUpdn4AmOuc3g1huaQmwUCxX9yMSuToB+CbDfYNg43
	q+lWBf0Wf1s7/cI15o7LW0DKJ5TA0qobjll+2Q==
X-Google-Smtp-Source: AK7set8Uait8tPk1OmPFdx09+OFJ8l/Lh1GbWVJppjXlK8js1MN+hKB5QFvJbeFyKKPywkVWSqe/eCCX6VpDoroIM1U=
X-Received: by 2002:a2e:a30b:0:b0:299:580a:9473 with SMTP id
 l11-20020a2ea30b000000b00299580a9473mr794092lje.10.1678964984542; Thu, 16 Mar
 2023 04:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230306080659.15261-1-jason-jh.lin@mediatek.com> <490e5a70-885d-4214-c6b4-91ddd59db883@collabora.com>
In-Reply-To: <490e5a70-885d-4214-c6b4-91ddd59db883@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 16 Mar 2023 19:09:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9snhUYJ7Ox7w9-efARjToAa0ZaXDzQOMfFSuPEmuz-rw@mail.gmail.com>
Message-ID: <CAAOTY_9snhUYJ7Ox7w9-efARjToAa0ZaXDzQOMfFSuPEmuz-rw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Change mmsys compatible for mt8195 mediatek-drm
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_040951_368871_20C3CAF2 
X-CRM114-Status: GOOD (  17.89  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B43=E6=9C=8816=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:0=
3=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 06/03/23 09:06, Jason-JH.Lin ha scritto:
> > For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> > pipelines binding to 1 mmsys with the same power domain, the same
> > clock driver and the same mediatek-drm driver.
> >
> > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> > 2 different power domains, different clock drivers and different
> > mediatek-drm drivers.
> >
> > Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> > and they makes VDOSYS0 supports PQ function while they are not
> > including in VDOSYS1.
> >
> > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> > component). It makes VDOSYS1 supports the HDR function while it's not
> > including in VDOSYS0.
> >
> > To summarize0:
> > Only VDOSYS0 can support PQ adjustment.
> > Only VDOSYS1 can support HDR adjustment.
> >
> > Therefore, we need to separate these two different mmsys hardwares to
> > 2 different compatibles for MT8195.
>
>
> Hello Chun-Kuang, Matthias,
>
> Since this series is ready, can you please pick it?
>
> I would imagine that commit [1/2] would go through CK and commit [2/2] go=
es
> through Matthias.

[1/2] has been applied to mediatek-drm-next [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Thanks,
> Angelo
>

