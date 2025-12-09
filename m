Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840AD3B7F3
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=; b=09LBK/egGsZ7+jRvxvj1DLtw7T
	0SpL5vQ1yuAS/eFD26rK6ycn7IU3RDiqeA4AcRrrlxF+mv95NgT2cdq0HkiXOqkPNoif96h0eUaut
	B/rbBVe5if+/EvG5D95Ljpj9jMPBDoiklKL/Epwj+pSpDSHkW+Dhd+ZWjmLJpaRBbkyfwn1nBLBvr
	4pWdnMz9Dx7DKKkv2RiFixRs2uL8KAGnxS2fzZN31jVb5jB7pDJAHQ2iHh0WEsraA+yUxyQC08F4X
	fHBACj9G/yqexAcuqNksVpHW2XRtufNaJRcXUQsGGjwKn43rk88z1Vh9lYyLqM5I3c+TGvoalxQT/
	VRSmK36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4c8-0000000Ek9u-0e3g;
	Tue, 09 Dec 2025 20:47:16 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4c5-0000000Ek95-2L5X
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 20:47:14 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ed66b5abf7so2174471cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Dec 2025 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313232; x=1765918032; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=EgaUsGvfTqTyfb4MQ88Ki0tl8bYQFAYvqIR8Clh+G/aAmVkOb9fSyZhsbpygzvhs13
         oNb0NBfkvWRHnVYtK/oWW76NXsJh2f3M1kH6ZOWMurhdQ7dQdocR9zvz3KaQsnecHD6s
         6cAx5MAui9Rqd1m4HV+sqBbCj3sGuv+TqZmCrnO5Z2WH5lYhFoF/D1CY0rY60jvvU+AT
         n+phX8U2GPAaYupVb+6akhVIFW4FRthuP+C29b2qhEtpf6WQ+ub6nW3Bk/gaVPOzxI+j
         X/nAfHjK595j3no5o3Nprtxu1gqgSSkZgyasFVTDLN/AQCH86UkxqsjiJPLXbWPzNM5J
         lIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313232; x=1765918032;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=R9zQzn89Nke0EBUeoCFlLOztmrakoZS2UK0t84FmMi6c+e0L+jI17bwLJ4s3irzJ0R
         LanygCXUdrfkfGFDG0kMvIe58kNumpWPs7i3bF4SV2hcHbw6btxIFS7HgznOdd9L3qer
         378GRiLt+8P/RF3GrdhrAYCJFP1qtxnEfjU6MneOVdtjP00bm+tVQfDLroUrD2rm+eqI
         MlrHKrB5fBypXBzNWJe/Hl2QvH6NXA6L++ZgQJupGftXgBfSl1n1YjSMOgZv7XTfkJ7e
         Mint0aqW1cHU5qDJBvMCcrd1HQ5rdCyxi2I2BE5/RermNqtJIOZW0QmJJ0OxSknj/WW7
         KJvw==
X-Forwarded-Encrypted: i=1; AJvYcCXN173oo7Qvdlg52eWCCB8fDjEX8TEvK7u5FBiXhrR7Lib4Ie3sG3uuT8PDa+e77Riovvo8liCr+GVA3/4sRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8rjMJf+5cg81mFXIntpUuaWx4b6BBRVyIGOHd5K839fCiTu7H
	PAv/880unJf6knuuDuw/c5vIQMpz6OcND+aMGoKqUnc1W/WiJBZM5gKJoDRlLHNhWnw=
X-Gm-Gg: ASbGnctJcI7vkvuYbwgjnXFcqR3YtGx9KIZ9/YwoLP328VByb4mCVdkK8eTFqutlP7i
	Q3wm5y4In8ZOv1Ir/BbNgJjawEd2K/rF9oB22zbG0QyPRd/7VOjB/P7zXB47oIr4ZN/NFXBpN+y
	k6/nbATta0bp+hEkyZdmhaI9NmzLnm3Gsi/Bbximd37tV6LmTzqi5Ipf49tHF0tjz37wugudbmj
	cz36JYsEMl4U0cvQ+vRhLzxGD3dlDJISS0PKnZ5fva4+MqZ27OdF83oW9Fuwevnhae9yIwhHuSX
	2LBXmbY9UFIAZEzn2WWzNzecP4/tmqPVwF9P06p266nutYjoi1T+IkPnDq0WlBWcY/9T1+JTssM
	CwQL7o3Qc0TUrppF5jj74Ltav/P8mzzk9iSyKTD7hndI8djvPNR5OPsnKwUAjy0kPfhiKR8A/PW
	bHgEfPnrPa01s4vbj2
X-Google-Smtp-Source: AGHT+IEoy3WsJss4eewDF1IObVZFsEEO8RMc62bsDTegGuaNornhGcbzFkR2E0lJrV1isVMQC9W0cQ==
X-Received: by 2002:ac8:7d86:0:b0:4ed:b570:569 with SMTP id d75a77b69052e-4f1b17f042fmr1022671cf.27.1765313232127;
        Tue, 09 Dec 2025 12:47:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d2b3a4sm108009241cf.25.2025.12.09.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:47:11 -0800 (PST)
Message-ID: <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar	 <jassisinghbrar@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Tue, 09 Dec 2025 15:47:10 -0500
In-Reply-To: <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
	 <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MnGLK1uGO3sHzXuy/5rZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_124713_631559_2B6666E6 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le samedi 01 novembre 2025 =C3=A0 00:02 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
>=20
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index d0b0b072f953..5fc9263ccb78 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]=
);
> +	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);

I cannot take that right now in the media tree, as it won't build. Can the =
SoC
maintainer help me know if I just leave that on hold, or perhaps you'd like=
 to
take it ? (or its in next, and I just have to wait for next udpate?)

I also doubt patch 4/5 is make much of a difference without the soc changes=
 ?

regards,
Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;

--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiKzgAKCRDZQZRRKWBy
9HnQAQCvZCLQCXpFlsUfn7DWx1kuIT+I+byuKT/dhCrJ0Qly3gEAh9feswFfhKgL
He/DKiOx62zT1aAhbBCmngiS+Tir/wg=
=/OPV
-----END PGP SIGNATURE-----

--=-MnGLK1uGO3sHzXuy/5rZ--

