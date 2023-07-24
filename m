Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F98C0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y2BQrqwgHAcr7TNQ6Z0S5e+IoXOK9iGuzrzPncPX4k=; b=L0Vi0D6cL0zpW2iEAyLtX4Hi2a
	oPsWHtvHAXxNbx9MRCqhRvWcxPYqZYgwQWnWMMwyntvnA0Dv8HIdWUFFS0IoPokNLSa72QupgnTwL
	UYFqmGy6hrqKPJrtvSktS+/EUYb51tH6Ig3p4sQ3wNJ7/VkxWFkdsukuUldMgcqbHNeuK/cmfWkpO
	lRS73mkRZ/EkS/gYTV1+Xv1Jn+ni52/pcleNQMvAuarFOh6R7znKzx4SqI8vUh+FBkClPhkF3Cu/o
	o5icQNfJlzsUuMzcyPAcGP8t4hIWJfg5dZGE5/RCBxTTmQ/1SmMsCv8ngowA292sZ/j9O0HR6DD/Q
	8jLgNMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuiq-004Eou-23;
	Mon, 24 Jul 2023 12:31:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuin-004Ent-1w
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 12:31:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C92366113E
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A448C433C9
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201888;
	bh=arSozrwxDpZ+l0skGmjtu0PIGes17IR9Ze3bfBXTz/0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=X9/cu0n3kCtcRYE9ifYOdiKqnn98QOy6rQ19KCEqPX6QYXoYAAZWXlCe++ro4nz6J
	 FH9zBNBQB0xVO4+bBZ+lLykulGtnBqxCpmFMsGg4uXg/fUbRrAlzdeDyYi1STh8SHZ
	 cglbke7zxMLifp241QWcV5u7fpfeZFf+WuhBSoUVRUxfibzzooNT6Qp3y3pq1q30h5
	 I1BSTGkeJomwxbftlxSL2bfzvghPP12FluNf3mLpBLCQFLfLvOQyF6LCWt/XXZhGb4
	 VvPw+WbHRR94+NuJ+hGnCm3rM9PrHEFc1/tYPgxqnrp2miyzvLyaOyQxEQD0VDYffb
	 l8I8tKp7Ii+sQ==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bff89873d34so3474011276.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 05:31:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLYyFKWSixMehyKueaNKpQ2KLgl6/Z/y6ChrYmyHN2+G2dip/Tw4
	21IUXKkX30uvAwqldQV+NsjniOtxyJDxozJoc00=
X-Google-Smtp-Source: APBJJlFX6Rz0HrOPIzSj83lKd/AddSySrti6u5QaKYK8HNySYxuAQM/Kn7sFwmxfhEdMfkNysrN+U3KeMor6GXr+jFY=
X-Received: by 2002:a25:9003:0:b0:d0a:8973:b1c with SMTP id
 s3-20020a259003000000b00d0a89730b1cmr3068049ybl.12.1690201887298; Mon, 24 Jul
 2023 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR03MB41573133CF759BFD9D6C25BE8F3CA@TY2PR03MB4157.apcprd03.prod.outlook.com>
In-Reply-To: <TY2PR03MB41573133CF759BFD9D6C25BE8F3CA@TY2PR03MB4157.apcprd03.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:31:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7GTXtDywu25Tf4c6QP_TPvs0EbujQWT8BJoHoZH=fxLw@mail.gmail.com>
Message-ID: <CA+5PVA7GTXtDywu25Tf4c6QP_TPvs0EbujQWT8BJoHoZH=fxLw@mail.gmail.com>
Subject: Re: [PATCH] pull request: Update mt8195 SCP firmware to support 10bit mode
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TWluZ2ppYSBaaGFuZyAo5byg5piO5L2zKQ==?= <Mingjia.Zhang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_053129_683742_3FD67064 
X-CRM114-Status: GOOD (  20.45  )
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

Pulled and pushed out.

josh

On Sat, Jul 22, 2023 at 4:28=E2=80=AFAM Yunfei Dong (=E8=91=A3=E4=BA=91=E9=
=A3=9E)
<Yunfei.Dong@mediatek.com> wrote:
>
> Hi,
>
>
>
> This is used to support mediatek 10bit hardware decoder.
>
>
>
> Please let me know if there is any issue, thank you.
>
>
>
> ---
>
>
>
> The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf=
6d:
>
>
>
>   Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-=
07-07 15:24:32 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/yunfei-mtk/linux_fw_10bit v2.0.21961
>
>
>
> for you to fetch changes up to f41d890ac9e3540caf59cbda34be50a6ebef31f3:
>
>
>
>   mediatek: Update mt8195 SCP firmware to support 10bit mode (2023-07-22 =
16:07:30 +0800)
>
>
>
> ----------------------------------------------------------------
>
> Yunfei Dong (1):
>
>       mediatek: Update mt8195 SCP firmware to support 10bit mode
>
>
>
> WHENCE                  |   2 +-
>
> mediatek/mt8195/scp.img | Bin 639700 -> 635492 bytes
>
> 2 files changed, 1 insertion(+), 1 deletion(-)
>
>
>
> ---
>
>
>
> Best Regards,
>
> Yunfei Dong
>
>

