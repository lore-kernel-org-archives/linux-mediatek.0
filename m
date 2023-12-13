Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4105DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPVstSGHW2mJYYKDhOcbHVvFc6FCpsaEprPwYoO2QrU=; b=zP+0tUluOHkIW2eS0mDPKvVj3W
	PtuYw/vhf+rS00Dt7v8NoWGwHBYpsYHkzfZgYJiuj8eiTFnPXX3DfTG92UQH0CFRgbX7XdYgTuTeF
	WguNEElfqvWGnP0AGf44bN/N5SMjUuL3+0En3ChUR9zGiAbGEuv4wVSKmzekmv+o4PNwPlyXVjb77
	y2Uk/0aiTolqhUCLk9XBl61aeAnn6u8c9U3w0trAkiaLAx85qd8Ctw/9YKgpk/ymu0UAFiFyaHjhp
	SAjwlxMZKrzbSXRiLP4l1weNYH1DFSHXeELdvfjUWd+mXMGdcHfDsZRcxOJZKkAt2kh8o9Eabv31g
	xuKHMBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLBS-00E6UW-37;
	Wed, 13 Dec 2023 09:05:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLBP-00E6T6-30;
	Wed, 13 Dec 2023 09:05:37 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50c02628291so7024813e87.0;
        Wed, 13 Dec 2023 01:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702458329; x=1703063129; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPVstSGHW2mJYYKDhOcbHVvFc6FCpsaEprPwYoO2QrU=;
        b=INoBS9wUcnlPdxFrBTvnS9fpqp3E0nwhZs8qKylLzmg//rurW8k0+NAftAewJTh781
         PqSCiQGwVuv4dYBvQfl3AYbpyQwQsR7mEewpbei4pG1U/PclkuubbQKpSDE5YwgLBy0V
         qJJ+usqInaXAzOyxyYXG2wGmAgkyYbI/wfyKsWxWuxl1oGU9mXHHyd5FP91Caj71taZK
         vf/xLe4AddOf41URm12hHzedcxIiiUpmOTkODpS2WIUvVYJVz9cL1kKZ54BR77MmQB7C
         ZBKC7c7Q/XMnAmSbFuTeMqkqXYXKaNKQrjsQTgwFiei+TXIiGakiIYt2tLFN5E8KZ7Uo
         qTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702458329; x=1703063129;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPVstSGHW2mJYYKDhOcbHVvFc6FCpsaEprPwYoO2QrU=;
        b=mo/B/lpRq7DCkfI0Fvg9oO26mSiShzdLerWLAH8RIh6P/PYoplyXgDzcmit9k0YOQc
         E+0JX2bGjXcD+Yy3uSTekVeVBRbuqrXr52HZMUvbCC087VnDmOarQ9Hh/tjSmBcRvngt
         8tepQbb38+KRBCUa5pk5YVWsaihNOgRQXfXhr78zKnCfxpTpVGPx+Xa54SLSeXBK8BUy
         qtSu7fzDqPHxc1yQcMqC+DxsIg39zXuFD6SQ8fQCfNZLQpD+5MKZ+/8SngLyA1xNDJHz
         awXUmnwoVqzOBlJuzRjMTsYxOc9jcsrebWd1qIFZme9dFsu1xsCMT+SZf6GzGOqQ1H6P
         l4fg==
X-Gm-Message-State: AOJu0YyiDHsCjO6kN+1OaU0V0DDUthmYAfQ1FV81pKZJ98mIbBJe5Gr2
	7FpHf/HXt/f/N/4y4++yJKs=
X-Google-Smtp-Source: AGHT+IGWpeNIT+ctXpc3/nJZFateSOhCrGMOM+zwxTvVL6e43wnzc3r3OJ2tC/PYR81yyP2zfmy63A==
X-Received: by 2002:a05:6512:38cf:b0:50c:5aa:83b4 with SMTP id p15-20020a05651238cf00b0050c05aa83b4mr2890212lft.114.1702458328719;
        Wed, 13 Dec 2023 01:05:28 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id y18-20020a199152000000b0050be6326f2asm1597596lfj.64.2023.12.13.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 01:05:28 -0800 (PST)
Date: Wed, 13 Dec 2023 11:05:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, Matthias
 Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, John
 Stultz <jstultz@google.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jeffrey Kardatzke
 <jkardatzke@google.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Vijayanand Jitta
 <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213110517.6ce36aca@eldfell>
In-Reply-To: <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
	<DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaWmOigQ7D9ggi2.WnkRpp3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_010535_970683_15ED5A1C 
X-CRM114-Status: GOOD (  14.47  )
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

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 16:36:35 +0000
Simon Ser <contact@emersion.fr> wrote:

> Is there a chance to pick a better name than "secure" here?
>=20
> "Secure" is super overloaded, it's not clear at all what it means from
> just the name. Something like "restricted" would be an improvement.
>=20

My thoughts exactly. Every time I see "secure" used for something that
either gives you garbage, refuses to work, or crashes your whole machine
*intentionally* when you try to do normal usual things to it in
userspace (like use it for GL texturing, or try to use KMS writeback), I
get an unscratchable itch.

There is nothing "secure" from security perspective there for end users
and developers. It's just inaccessible buffers.

I've been biting my lip until now, thinking it's too late.


Thanks,
pq

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5c80ACgkQI1/ltBGq
qqdqdg/8DMTwQfWf/EfE0E0FOjM0IPMnzZreMPcRlHBqMJqgQA5miVL9CVE+novh
ohRbfFYLwut7eqtK6Dzn+6hOIVFRMpGPkWe8qHfT+CJ8Wr3hD8Q23PKEveH/FENO
G+XUbPzsnlDTDs5MB2Bb1TAiWQLS8Y1/nstMZ49l8mmW6Iim0Z+/xhyqUyLaHfpm
zB7JRM7CSN8gyPhoqoAAITy+ZL4+yD7D28izgQA4YZD4JzkE1fYOUFzNb4QRA/T7
GxPSExZlU7+CdIL5zAJvhqpHh9nxMdOUvaP3aQBzShcTKDVoet/TZ+0QuEOuD1QJ
gHG05Hcp5gREsbjn9oytS2km0LcL7ZmR98NOrf9idl4jZDjVTEMQvV/FrSSwiyGv
5whtFHkkDVy1nXjyYmgiGO7dvIptO+dNGgRtACt3xe0tdvu5ndP2+hG21ADVWebc
fd2T4mnUoANro1gOjWATV5+0fzlOK5hFff70pvE9U2ATvqXo7i2I+kzW/EJFPilA
4EqR7cIyLCaVRb7q/dC4CdWUu0NIxCp7+u22Z/B8pHFw2MnQZa0twIKV3GJokfrR
A4PfZLAvpbSkfr7SalrN6eYFHhJOpcCJPHXCiQSnRT7DU5u6NhUr35IZgq/YuANC
YrU/v7fiWv2v6I0I2FN8fBaH1baL6/SWpA5q43OECPVewbA/Uwg=
=DQfN
-----END PGP SIGNATURE-----

--Sig_/DaWmOigQ7D9ggi2.WnkRpp3--

