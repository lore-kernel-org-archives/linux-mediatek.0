Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2906C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 09:43:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3AB20672
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 09:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nm9g5lZd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csQ2h+t9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3AB20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=taT0U39Qsp112R5GDSpT1zdM3455lCILQA1oHwGmj2o=; b=nm9g5lZd4hPYnHHB/vPIgvth2
	pZuLvKKNT/5+UlZxHVZyclWriYADz2IjKNSz4NHeESBXPF70GO2NchFUuo99i0syAweG9q4BafzVm
	U/gUFAIVy+xCTQu7ed8lG5PxNhT1X6Rd2OsWwGWLRk8qEjAtpie2gmcYfnVA0JzVenMd2ZeE9iq28
	0RcUkQIbXi+tg93t25uCJuEftIwbyWE2m4NXABgCAKChWmNOlBHe7F6tZvgDDnQszRXRKQB2x7bXQ
	z0Re8mzVCSDiz18iMYpiZiIF7nnL1fwsJoTcIU5hR/qk9IEl7P2QpbWDFM+zSMTytJswXL3UDQyFq
	MMJWnsGRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxonk-0001tE-3n; Tue, 21 Jul 2020 09:43:08 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxonh-0001rr-S5; Tue, 21 Jul 2020 09:43:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id f5so23343544ljj.10;
 Tue, 21 Jul 2020 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Bcjce0RSi5cAzugVx+NeI/QfodEd9VLTjD9tWZICZgU=;
 b=csQ2h+t9/4bNMtFl20Jjm8Zy8IkQ0DVCWJ9xhRepggj3XwNjA1zV2aAOux6iX9mjUs
 lddDYyEZeTuDmZaVz9tQVvAlrsDs5zIEqmM/F0RrgAmnNRjMb/4XaaiyShFmHm69WZTh
 MYqybCeZ+7KVBztFmMdFCOHupgLGiP5FFeyu+nPuteNgS9ISab+QtAAA/uuu6QTelLgW
 c2XGN5z/jYFwGVmKhiPAvAYFA37I9hxqO19+dlwS+362TRD1KV9ibQGzYHCc0v2GzCFq
 FHWiuhlrageaKZJSfgN8Zs/Sm/EVKUrJLv8kvutZC3XReTurmROsNzQRjmXAGzamDTBn
 DCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=Bcjce0RSi5cAzugVx+NeI/QfodEd9VLTjD9tWZICZgU=;
 b=FhXBt80f1TlxEK3JCNV/dIJzuRXOmcDP+V3UTUnJnQdH3vjldafrbzpPy9s5FPjdUM
 BOdX9qolDjRX1Lu/PZnLeWZaJrESKkpeBDrhZh17S2NJuGrGH+MQxD2AH/xHHexxMbct
 XqJ0gE6cQm6phxKPNA6m+ixQPYQunJHhgfc0AtqXn4/kO+HCXN5+bmCJUiDqRtOcOgUK
 3VyUWDtY8I9Ar90lKT+0+1clFf1dvU9SBs7yGFIriV0xKDswYQgESaQefTzkVwsibTMF
 kr2p7Sgj8bsoONyEvPHo+U1POCnue5zsCsNi/abSi5Qi1AcnzgWtE5iJyBYNc7/M6t/1
 yQPg==
X-Gm-Message-State: AOAM532MiIuVCrWouDim/cHzaIJhp2klWPoQ7DoFJU3xVfccwIDhIrsw
 Jq81vPZU1lbEd8aXMofEpnI5ZClMH8G2lA==
X-Google-Smtp-Source: ABdhPJxMAgGCe0cQOZaYb/3wDk2OTcBA7dPCflgu/NLzSq165ySZN9nZtSsFvVkOnnyS4JAFyqhZ3A==
X-Received: by 2002:a2e:730c:: with SMTP id o12mr11930894ljc.165.1595324582604; 
 Tue, 21 Jul 2020 02:43:02 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id b81sm2944612lfg.60.2020.07.21.02.43.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 02:43:01 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
In-Reply-To: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
Date: Tue, 21 Jul 2020 12:42:56 +0300
Message-ID: <87eep5p5jz.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_054305_942769_92DE7BD8 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8893362544377270847=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8893362544377270847==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> Use readl_poll_timeout() to poll register status
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

I had a lot of trouble to apply this patch, could you avoid base64
encoding on the patch body next time?

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8WuKAACgkQzL64meEa
mQbgQw/8D5MApknAagQ1QHV5vnpIQ0lR2Lv6nf7GyipydG0ROriUsdYZx0WIXYp8
O2pMl9dzA5QI4MDMIwS8T8/iC7SZS30b9+5jNM3gIyIMgVirenhgMVHV6CJhbuMv
76KpmPx87FGVgpW42X9YXfuSUqBjK9DeXt9QzRDJj7rho0jh6OQpVzwoy1dI1Hcq
Qrdy96W+vG4XGfkdZRROLw9dkAzqLC2R7uhq2kWRKje4rYDKNV/bvj/MQ4K2fxu9
3YbPPp+CMvTTsLuqIEyGy3FkQrXDRHB1miM7Ii9yAbmGTeNDpdtXPFCZV3evfCBI
/xzTmUTcAkHlmlDP8O4/I2HsYsdqKbrBbbCYO1Sf8dKa5IeeXNc3dNGVtrKHlJgA
x2p3Iy/Bydhyh3eEYnM4EOCX92vhu3CTCq9zzXF20pGtzbzqrItZcCIQ5uAiv1W5
uEF/zyHg28QU6q1slo+nVWHwP+m4DDp6y3eFQfy5JejeJDUUUhMeFAqMTH9gSK3V
5R1DC0hx6p9oLAGiXTzXzLa781ynVfQ3/7z4hLXpez8zXK4Vu7duiV7KSOSMKcyb
Ai4gl+Iwloo0jkDk10vIZGMTvibbXeFkRxlZEV7OFGJn3I+SOEzQzKfiWKyhvBkA
2vuAB0ozj32RV0IN8Ogzrc6m1z+yh+B77DOt1Lpx4BTL/daY5Ks=
=4+GP
-----END PGP SIGNATURE-----
--=-=-=--


--===============8893362544377270847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8893362544377270847==--

