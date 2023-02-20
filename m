Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B58C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3CakrJQFkm65YXyhehgRdoeBRtU8OyX2oDLK++gsBY=; b=UlZBallkqxqIywBXoDaADMt+tD
	3oe1qoRWTfQGq+pHN5mpBnvhy5g7DljjM75LIbtiNZ9vLxy4t+Tf3U2lAXjmfXrVdwB+JYQO5Zawo
	W4EW72QBbrOcwdBr4Wr/Qq8FzCW9FMqaolKxm03FXwGPpfierS3PSfElvYwo5fDYtJ2zkSeJqhplc
	WWD1YpRLRPd/JRqj8Yw/O2elMwL/xOfESGv0QmicdcMpxgfNu6Q8DxOuZNMV5hHX/Y9Rw2IyYRWNl
	w/K94LI7JmG10Id06ZA+wyAatoeqKLNksJ/rT59wPSF4A2g2D+cKFvdGb//j9imD6AM/Hi1jha30E
	X0tqdRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9DK-004txR-O8; Mon, 20 Feb 2023 16:40:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9Cq-004tsT-N5; Mon, 20 Feb 2023 16:40:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E13860EDF;
	Mon, 20 Feb 2023 16:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120AC433A1;
	Mon, 20 Feb 2023 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676911196;
	bh=i3CakrJQFkm65YXyhehgRdoeBRtU8OyX2oDLK++gsBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bI9ADxHVdLO03aK8NOrCaGWY2YoFDs2a3EPlDq7AUHL2O6K+8RwisxFqgxrnMmS+i
	 iJnIQ7FxYw4Cgz99zyEZLICxZFiaHASQr1NihMYu157vqCNyU8OLvUES3VLfjGEtV5
	 jht3flOOJONEVxcZ4AsTmv+cQIf3xLrDCBtPqcGxAfD0gPwC88qLErhgKxqYGOauzG
	 QFAFX1hsUvChb24nl09j+j/lDG5fGA7scrkqO7UZJAEanVjEumJTi7ypx83vv8RUNF
	 984mIeGuYr9NWw42x39qMT+OUg+BacEQrnskRhE9wEXVjR5l1jH6jTAVTZzxGUDPE/
	 j38UGWkWI7lhg==
Received: by mail-lf1-f53.google.com with SMTP id w27so2456228lfu.4;
        Mon, 20 Feb 2023 08:39:56 -0800 (PST)
X-Gm-Message-State: AO0yUKUYdQfHWCv9fIcbbSG8zJa3SEBN7hv1yJA6sar3rVOFMDeSJVU4
	W6KCyvFqq1EaEFCmb7djMod35MaX9cyrNYYV8w==
X-Google-Smtp-Source: AK7set+2kJBOAKEpxRGpK8KOJwvlu/ZWPTWd/d0PjSOJYzKrSDyF+z8L7LKeT5FGF52CAVPsomQ/d58pI0EpLGJYPGE=
X-Received: by 2002:ac2:5495:0:b0:4d5:ca32:68a2 with SMTP id
 t21-20020ac25495000000b004d5ca3268a2mr881249lfk.7.1676911194865; Mon, 20 Feb
 2023 08:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20230219233439.3157-1-chunkuang.hu@kernel.org> <437c0c5c-9a71-253e-eb2d-39e167e35099@collabora.com>
In-Reply-To: <437c0c5c-9a71-253e-eb2d-39e167e35099@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 21 Feb 2023 00:39:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8wQxEHGiPrWc+JuNWKzEfk4=Fe17P3tCrY2jW-dQCYPA@mail.gmail.com>
Message-ID: <CAAOTY_8wQxEHGiPrWc+JuNWKzEfk4=Fe17P3tCrY2jW-dQCYPA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove unused helper funciton
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_084000_810766_7167547C 
X-CRM114-Status: GOOD (  14.23  )
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
2023=E5=B9=B42=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:3=
1=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 20/02/23 00:34, Chun-Kuang Hu ha scritto:
> > cmdq_pkt_create(), cmdq_pkt_destroy(), and cmdq_pkt_flush_async()
> > are not used by all client drivers (MediaTek drm driver and
> > MediaTek mdp3 driver), so remove them.
> >
> > Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> My next cleanup step would be to migrate both the MediaTek DRM driver
> and MDP3 to use the common functions present in mtk-cmdq-helper.
> Function mtk_drm_cmdq_pkt_create() is (almost) a clone of cmdq_pkt_create=
().

It's good to hear that you have plan to refine cmdq_pkt_create(). I
have one plan and wish you may consider in your patch. The plan is to
remove cl in struct cmdq_pkt because cl is used for channel
information and the client would have the channel information, so it's
not necessary to store the channel information in every packet. In
cmdq_pkt_jump() and cmdq_pkt_finalize() use cl to get
cmdq_get_shift_pa(), I think it's not necessary to get shift pa every
cmdq_pkt_jump() and every cmdq_pkt_finalize(), so client could
cmdq_get_shift_pa() once and pass this information to cmdq_pkt_jump()
and cmdq_pkt_finalize().

Regards,
Chun-Kuang.

>
> NACK.
>
> Regards,
> Angelo

