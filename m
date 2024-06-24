Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6794C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kxohx/D4lQvH5yEqhdibNfTFYx3+oiP32XseFwOkRYI=; b=2Ue7Qkhf44ehSXbWyfEZbtatj4
	nidhiV/5LizzDYbuqtQ/MRQE5YNU3l/TisuDtTFjErTTSHWloVto+CxXTBgC4j8eanFQfEoGJwOFk
	SR4AGXSGiJHbA3Z870LJuOXHMm7vCwpy2htepJBLisCUfNRL27fpVRdY0oEzoNfhH/nmPEUn1RC6c
	u65dvH5k6Gvp/bvE4xCbQ6Sirg7r70vjWXMIVaW/tZrftCkpAMa32ZInjvfaZWXkEiUXVR7ND8s2f
	PvtKR3e0hU+QXuCBWlbeSW74vtal6fLMBssbBu7Xys2wG47u1fGsgX0mKn5DIeSwdmttKwwc6js6x
	l6Nwk5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhaD-0000000GXMT-1gEV;
	Mon, 24 Jun 2024 11:10:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLha7-0000000GXIp-018F;
	Mon, 24 Jun 2024 11:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08AAACE10D1;
	Mon, 24 Jun 2024 11:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530DCC2BBFC;
	Mon, 24 Jun 2024 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719227390;
	bh=xQpJ0O+kFmzdnd+u2y9biX9+NfS+Otix6vWwyOgcJmU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qlDgg0xtHSu6BTGehgfLiSiYR9gYNg3ol4RFgHA9xh+XkG2CX4e5cmCuFx+mMuNiY
	 /kBYHkFAQJwjcNxLcBCm2rkQDi8xOacvGfO3CUWckK51uGqCxvHb8lGjqjfhOisbVW
	 s1UPYdKEFy6zofHBiuSu4c0+De47dgBs2EgkxMun8BUU02kHlqnPECvQmnXuysGzJA
	 a6XJyoSep1ju8LoRV6JC7B1gsMjhTrT5W/dc100y8/fSB+ELHzjlw4NxviwKYJ2dgW
	 EsWunf/9/8uLl7Kh8cjGtuvViBxFsliqnzU3Y7wV0hq1m5ycUVbRB34YHa+RzpykOf
	 AkntivKplX3wA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-644630a8de9so7345537b3.1;
        Mon, 24 Jun 2024 04:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX072D112J/7rSvsOYkE0cycK2BVP1ysimdZ8Gqh+tSA6Ud369y+nbc7bBjMbtokoPFUwufJwDiw/LLRJwvvFhnHU3+tkTZ3HpiTD1T0RfeG2YNh/0XokhQ722LXJ2glWzi+AIbuWjHG8eWkil7DlTP6q/uObYXDLg=
X-Gm-Message-State: AOJu0YzYBcijmScm5MPfcpWLUmaDHTQychwWRjgZc+tqOaDJYPgn43Is
	gSeGpBxiF62C+7zK1yN3szrawXbeHtFt4alzFT42QnFaTEUj85DE4q+6ONdpJYJHEgU+yRaDWaf
	buu+z/+WVtB0cfo/69dJ3bSSVXIc=
X-Google-Smtp-Source: AGHT+IHJewWlgVgVWeiPC8QQql7oiSxVMmM3qo+hU7W4gXmRpRgv1QFrjde4yVk+TqcJHqfarcbqEzFfGA9KZlXNCIY=
X-Received: by 2002:a81:b654:0:b0:618:498f:9dbe with SMTP id
 00721157ae682-6424908a767mr29142797b3.10.1719227389508; Mon, 24 Jun 2024
 04:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240622102347.7004-1-irui.wang@mediatek.com>
In-Reply-To: <20240622102347.7004-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jun 2024 07:09:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6dmCQpeaP0fhzx6RYc_sGPY=Ae3T7+r=pyt8rLoFLK3g@mail.gmail.com>
Message-ID: <CA+5PVA6dmCQpeaP0fhzx6RYc_sGPY=Ae3T7+r=pyt8rLoFLK3g@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
 firmware to v1.1.8
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_040955_251475_94BCB9BE 
X-CRM114-Status: GOOD (  13.55  )
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

On Sat, Jun 22, 2024 at 6:24=E2=80=AFAM Irui Wang <irui.wang@mediatek.com> =
wrote:
>
> Dear linux-firmware maintainers,
>
> The following changes since commit 77eb1a9398784c42e23ad087acddef599f0dd9=
d7:
>
>   Merge branch 'robot/pr-0-1718900951' into 'main' (2024-06-20 16:54:34 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.2.0.git  v1.2.0

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/235

josh

>
> for you to fetch changes up to 9e6aff680098f0def484e018413ad7c002c2f4fd:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0 (2024-06=
-22 18:06:17 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

