Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA677CE8E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baOBtxFYfxATlQ/+UCeALat88Swax0Ym5gF2ZMycblQ=; b=CK5fs8RSUPukR6jIwHdiqHtQTN
	Kp/Fl0fZk8zc9VBmU2kuvXj+lQ61Sd0SPiNhJtSVac4EYdRCAEvsRx/hpoeQF5Wr1DLej9B5OLyMy
	uanT8jMG2ai5rAbH4CVzgQLIovK83AJ65uhxvnHApVd/8IdYtBDMD0FCR1EFb1R5YTE0MWgyjuKYV
	4K6GSVA+O4QEkV5dwBVuAHS+3+V75ztizepzsKRs572Qv7A+0qTSd2QPmvBNBCm6wkl8BIr1A1n+w
	xmwRoFTRRugsEzBiz91aOEoJ0ILku6YQwu7sa1uVKIvjhoNm1FKRVX7WAAIjwokQ84ZFdTYCMRBIh
	RXnV98QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNv-00000000FwJ-2oMN;
	Thu, 24 Oct 2024 11:52:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w7w-00000000EFG-3Ru0
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 11:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F9565C598E
	for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 11:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF432C4CEC7
	for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729769739;
	bh=IdwdsxuRcWnqzUXoIUQ9b7ZwgQsB2W6jCb7IWb9z+gY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MIIv31mEf2ONXGH2AacrgaAo6fS47mXyPcAymRqSKWi59QR6X7nuBhEgr6/YtAbCf
	 MWKWt5jvekNbpyW91we3cqtQYW4MO8Zs6fjHdHbodlhxOHVknhEYJyCXxR8gyOpwN9
	 XAtQOnQFONc0xwgfSKO9vw0mBapRpZtrp4V+Lb0Ve+V8YliFqZObjP1To+tgq3ig/0
	 rAgVQI5GWiXuzQr2xxN0hxJL5Zt9TQCm9i6BBlPEilyV2JhPvVCamGTIxWzcg4mN1w
	 Q2HYqO+LzarAfel7h11Zt7m291qjhaBcmqlF0q6yzf8hSBPvg79l24Qa9/0jIRJAuQ
	 ruMbPcO6MG0mQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e5a15845easo7611487b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 04:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM55XmwsInEH1PROhOttVBzwI/60Cv9YdKg6oCNXD1knNQDHPDUY71ukeja1DWmty38XZKtMEHDwe+I4vbnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaVNkcWS6q4iJggHdOwOfm4UiAjcsQaQnPyrz8L37TWLuX94pa
	MYwNyVjP4R8uMECIHb73PjRAOn1FoEqsB4NUip0kbP1OlLjKH7pR9lBuyNssr02vANcHRiuHuXK
	YMsn46S3XqDLEIQBVD9z0Uj+hnN4=
X-Google-Smtp-Source: AGHT+IGRI1O4aNGzuKoVpVV/T5fv1dasW44R4aRBwV94E8TH9HjNwffsurSaB/nBbJ5KSyQzZhwdMAfsOTt9/PvcQAs=
X-Received: by 2002:a05:690c:3411:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e7f0e47ed9mr53310277b3.24.1729769738925; Thu, 24 Oct 2024
 04:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241024034558.667-1-yr.yang@mediatek.com> <20241024034558.667-2-yr.yang@mediatek.com>
In-Reply-To: <20241024034558.667-2-yr.yang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 24 Oct 2024 07:35:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5aDCeDN6Zb8g_9otPQz6bJR9ngrYfEpCUVxw5gyaiT-Q@mail.gmail.com>
Message-ID: <CA+5PVA5aDCeDN6Zb8g_9otPQz6bJR9ngrYfEpCUVxw5gyaiT-Q@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Add sof-tolg for mt8195
To: 20220315151852 created <yr.yang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043540_971750_05F9FC38 
X-CRM114-Status: GOOD (  14.86  )
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

On Wed, Oct 23, 2024 at 11:45=E2=80=AFPM 20220315151852 created
<yr.yang@mediatek.com> wrote:
>
> Add sof-mt8195-mt6359-max98390-rt5682.tplg
>
> Signed-off-by: 20220315151852 created <yr.yang@mediatek.com>
> ---
>  .../sof-mt8195-mt6359-max98390-rt5682.tplg      | Bin 0 -> 16191 bytes

This needs an entry in the WHENCE file.

josh

>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.t=
plg
>
> diff --git a/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg b/m=
ediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> new file mode 100644
> index 0000000000000000000000000000000000000000..427d6c62387b53f8ac898a86b=
506e8c0cb4362a7
> GIT binary patch
> literal 16191
> zcmeHO&1(}u6pz+w(N^lmNqX2rz=3DIIFNk73u)1-xBYy&knp+qefth6*Oq_-X_2p+7W
> zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~BlU>2!O{
> zkq(%+D3^pi1iL88-LUjIB2=3D7isA<F9+InIcDJ+KPhV=3Dy384^QShn|4uGnegwJPI0;
> zFP2Knb4v>=3DH|MPUd~x+!@%k;x9`LNW4e`7nPG(^(QD#h!ap>%Raj$&)etP5OudVjY
> zI~N!?V`aBCaQ!gs13E(<3Cn&E+R?(eo#^G2#)_&RJ!p=3D~I2qp!=3Do(_1g)KrEUl%kz
> zKGvI<DqKNPDe#?{o*JLY=3D8{TZReV2j2TR<AkP+weU2i_T+s>z7or_;x{rLNm9RD-n
> z`&`&KEc@n;0Z(%b*jIN9E~3nPQ=3DdW+KaP4L*L{c^l<a|dVy7d-_7pTfksr%VOpYb&
> zgc4?@gVeAJThfN{6Q85dPtYv@^%<7()iJSe!hVM(MnA;ov#_kob6=3Do$&%^?`OU&ud
> ze!JWq+!c2Rai^W4>US1ZEK!ZIH-Njzea>AwJa<z9A%CO7xgPFvJR-^6B)J<5v(iC=3D
> zT7_+^xy$cQm%E)PGw%*%q<{m8a^B4p7nfI-W-WWjyMn6U^>CLh)qdymJE$9qyqnrD
> z++~uI^X^H+hdGl>OiZGr7Wn?nyM<hz(piObJ>2E@JGn~^$Dy1roHu^IedOG^r+GI;
> z?gqoGbU;5{QDN)F-OXdo%ex#0>N?cr?(lB7JM8wf+N%1Ug}WuH=3D;mFz2XMD<pK~`A
> zp1b`5A%CO7xgPG4r;+4tAGsS0v(iC=3DT7_-1xr?uX%6fN%2>?RwZeW0P*Ho+{eEpWU
> zbg2mQAeEdnVi0H)0&}>L{M%3U%!TvZm9@9A7?r;%T;&{nPlpj6I9vB_#{T1@dY!~*
> z9X_Tk+k44Mmx}P20Cn$rR|&-w4iEzVeDt1_QRJh}+J{3*KEl^`9V!p|X?&nk3@05N
> z%rQC$)bd{S45kshck^Q*r(VwxNr#X9mhH2)l+ngx<`|V?_~_tZj?qEDmybSkzY%<t
> z->Du4RB-{<T8~p;8)d!(f?&O@{r=3D9WVU7lY)*w)BO*5tygMdMx2?*5wUVDu;n1Yyp
> z_?%}1If&1F(y;t2zatvOxiJ5)kn4thza;;+!TnFk&ittN><8U2Vi0Hv0wzDU1ZLBS
> zL7*uJL^VG$?%MpQ`z*F8K$@Ex1UwKh`OyOubIKqP5d@-|AGwy@nIHAujYMQ<Oqd4%
> z0h1pOz#y6~{I>{1H9zwI$MQQ$J`Z-^QFfqH>=3D$!rv-U}b*++`^quP5R5wf;~>01z1
> z#7SV)lznN$N_XELunOK3rHxLtBe2r$TM$;9cf=3D~pex~Y3f<J}XUlhhSxYg>b7=3Dz%=3D
> mEs}c>R_;3*Vx_x(M7p)Ii2iHu=3DLqAgY*=3DytR>7MIB;P-JU)df2
>
> literal 0
> HcmV?d00001
>
> --
> 2.46.0
>

