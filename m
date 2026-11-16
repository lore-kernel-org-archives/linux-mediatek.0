Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758AE606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3viRAr2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPyXr6w1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bY381tBpZ0JDNechNv9i/NECgodmDi16DU0CcXmzrM0=; b=u3viRAr2w7yXJO
	ixrLx7EYioI4pU69yXKxAnPdSpYTXgz/sWwb0JxTSoK/FZdPLxc9pKr7e5u7eh1I6jrw5OnyzloQe
	/zq2iAnMIwsM0gONUwEOxpCR21tMeBv/O01zqmJOiuiwJ3k/zcMv2i2vMu+ZBUHOgKAH6QuQY6YVP
	mFniyy2VXZl/FlzcyLHJX1XBkVJ9Mv7GuOSX3exyyzuB7OP0sMbeGMh5790me6iNkClyszlm19HFz
	qX3OISPbqAKN7pXxt2MvRX7MbEXRJgCwtDfkQYdNSsZt+GrJS7iUFhbYyxiQx2txTLpsSzuhIcLtx
	pYomDsxgmo6329FRj7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxlf-00000002tKW-0kBe;
	Mon, 16 Nov 2026 14:33:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxld-00000002tIl-33xq
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 14:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5E1560D57
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 14:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E22E1F000C6
	for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839588;
	bh=bY381tBpZ0JDNechNv9i/NECgodmDi16DU0CcXmzrM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QPyXr6w1dQ/89QeuFQ1KjnpFQ6Li+1rotUlAJIR6EV7qx49t+IRSpNEpHFSIDibg8
	 lNYJQPhgvl5tG8VasH57evNHHgH1q/XodLOMAdXhbQ79whp0QdwDvgeapGmfzsRooV
	 EyVO9AunbAWq0px/ZqGclYIsC8pacu4WUl7Fmq3r5xadAiLzX22FFdafvu0peKSdB0
	 gN2CNk9ku+envrFidvHsh7k0ppZ2mjZgtuILLbN4fcypIsJWHVcy1Y4DZSMDr5HpJU
	 +XMiDVtcXZk3CHnbE9AzK21Q0FKQYKbPJgfy1Uu8GIFO00VDLTZs+ufdNzDJMUVd53
	 p/mEO2k92wymA==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so4857986c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 06:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG2UIBMMxNpYffcgyu68Rovll+LMzGa18zviOV2t+FWWmECWwyY2l4LoZgrw5yqAUcAoyY6fB/3P52tzhNhew==@lists.infradead.org
X-Gm-Message-State: APuU4Z/q8nNqPWfUcPNxT+fzzmc8XYTvHleS6f0mLV1gYc0N+NZuOesN
	ZROnGrY2+3duQVATjJGTuNfXXdqIdEoIn3yzYImNAB91IeG+DdfIPiLyT3okNGP8NrFoGRCD6kN
	bwn1budWp6x9YCWlbsEIp6O66ZaZdug==
X-Received: by 2002:a05:701b:2706:b0:1a4:c892:b14f with SMTP id
 a92af1059eb24-1b50312144fmr9904001c88.29.1794839587963; Mon, 16 Nov 2026
 06:33:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
 <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com> <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
In-Reply-To: <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 14:32:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY__vpA+t+T5QM1J1pkcFYju5HjQ+MnwNt-60Gh_0wbTzzA@mail.gmail.com>
X-Gm-Features: AclHuK83NHlxO1R39k_ekBxI8gtiR3r3nltG-X9iF9NvNtWqqPTHxKvu6MAR4l4
Message-ID: <CAAOTY__vpA+t+T5QM1J1pkcFYju5HjQ+MnwNt-60Gh_0wbTzzA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "ryanbrue.dev@gmail.com" <ryanbrue.dev@gmail.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@mediatek.com> =E6=96=BC 2026=E5=
=B9=B411=E6=9C=8811=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=882:43=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Tue, 2026-11-10 at 20:26 -0600, Ryan Brue wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Hi Chun-Kuang,
> >
> > Gentle ping on this one for mediatek-drm-next now that 7.4-rc1 is out.
> > It has CK's Reviewed-by and Roman's Acked-by, and it still applies
> > cleanly to v7.4-rc2 and mediatek-drm-next. I can resend it with the tag=
s
> > if that's easier.
>
> Hi, I'm Chun-Kuang [1].
> It's not necessary to resend.
> I would apply this patch later.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D93e97f715b24114169d18654e09c646fd9e14979
>
> Chun-Kuang.
>
> >
> > Thanks,
> > Ryan Brue
> >
>

