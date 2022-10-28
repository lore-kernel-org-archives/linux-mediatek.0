Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519FAECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 03:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsqVuyl6BD6W3LOL9WC66L6RjSvAiVZfFFErAmVMHQE=; b=PaEgTHgClYsfacsPOdFCKKMLR3
	Sqj2FgEreHD8h1quyovBrHXP5nMO+GXNDys6xqkLVp5su3UexsKbMa6kRlYPklVyltF1sY1IcK+de
	R0DGKMX71PEfDQhlgB4r6Vqoaqcl3j7JSUOoAqadgKZ4ZJ9FnP69qfMevZXyJHzyRtg93FcrcONFh
	v/fX8MApESHQ70oKKMfxWFd5y8+k3s+jF75kvWX68mlfYVE56H7kK2WbpmhfGh7iMZo48q1NMpRL7
	XVkQ0/ZbSHujiwm4NM3WceqVOPclZX3F40w+uUaqp2eF8mGNlbC+bm2IQ2LSy01lxeb0/IQG8tieA
	ac8jU6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooGRn-00Fg8l-B5; Fri, 28 Oct 2022 03:54:19 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooGRd-00Fg5T-1b; Fri, 28 Oct 2022 03:54:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id f9so3761649pgj.2;
        Thu, 27 Oct 2022 20:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsqVuyl6BD6W3LOL9WC66L6RjSvAiVZfFFErAmVMHQE=;
        b=dUYSa32+9bO+LCOLFp+rBQ0F5Pnx+isYGovlF40t2/P9vWnEiDG1Q8itO/+XkeTfSv
         zeWWwwKbS7UPTj37mKzqvzWyo/9u79rMxtpNLZCnsQzGCKG4/XQEGI6rWazC+esHIrR9
         btLXbLJDJGt0QWJbBzwMHmRSR3zavgOTLsv3dHhkf0LRDL8A+8mbGkgYFXyRzhuBME86
         10p2gPkZHql6RgTLb1NnMmQGPGAKRLo8YbKihP4ZEHe9sgtbn0EsxUvy7e386JtBMfKD
         5P2utkAPzf/afxV4NKBCtAnnAe9Xynyms7eS195Tln69ZL4ofRdB8AwNHZDVRwsk8AX9
         RCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsqVuyl6BD6W3LOL9WC66L6RjSvAiVZfFFErAmVMHQE=;
        b=l3jd56XzChRHTzLak6ZShI51kpQyh9HoUoysBvKBrNPDxvGZudw1wsH+5tiL0qUdLT
         WMpdtuu6JNoBnMqY+G7ZFM5EJhj7gvekW+zkHsLeCqXyf/115QPesbTMh1cYq+uZzMxa
         3BgAlJZQOZIMNiFZoHIIwuLGQgEi6F0SxdmbRcgWK0kkm+tu6+3vhtiC4AYox9GSKIeO
         Q+P87IamNgPMOqKMlFwvh2Xbz1n2H79r++Mz0AMerMhBCjzts9mByZBO1NaXd8CH6QbZ
         ++rqn28Mm2z1yVKjNQdNBPCbp5E2DFsVyDoB8TzrN4NVSEu0fvbTluBx5eW79IlbRvXD
         C3kw==
X-Gm-Message-State: ACrzQf1P+rFIzWbia84NKILqwXv4PmiINGtS65N4yI6C06dKtVgWMI9P
	MeEJPhDUltIAbDCLIzT0RnEX6lwNSdQ=
X-Google-Smtp-Source: AMsMyM4bStqmnjlTlD7oXh4az3KTHKmmK9eUmdVgeh7CmFo5zsALPHcOUlMD7hSZndCAJD9JRpyh8A==
X-Received: by 2002:a62:174a:0:b0:56b:9fc2:4ebd with SMTP id 71-20020a62174a000000b0056b9fc24ebdmr28907080pfx.21.1666929246176;
        Thu, 27 Oct 2022 20:54:06 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-58.three.co.id. [116.206.28.58])
        by smtp.gmail.com with ESMTPSA id b79-20020a621b52000000b005618189b0ffsm1888035pfb.104.2022.10.27.20.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 20:54:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3F7BD10030A; Fri, 28 Oct 2022 10:54:02 +0700 (WIB)
Date: Fri, 28 Oct 2022 10:54:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
Message-ID: <Y1tSWo+eRvkVofbv@debian.me>
References: <20221028014422.16422-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jroqsdkTIsPFvYm"
Content-Disposition: inline
In-Reply-To: <20221028014422.16422-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_205409_108985_121DDA2C 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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


--9jroqsdkTIsPFvYm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
> Remove duplicated "by" from comment in cma_heap_allocate().
>=20

This patch isn't typofix but duplicate word stripping, right? If so, the
patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--9jroqsdkTIsPFvYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1tSWgAKCRD2uYlJVVFO
o7b5AP9yoSZf7rdWvcCNTl0/IR/t+dbwcnJqX/nlQZpEECxVKQD/Z3fAqDYIRA+n
wGfL9LkOMEPw+7g5fFLl5BC/vBZFBgw=
=krRN
-----END PGP SIGNATURE-----

--9jroqsdkTIsPFvYm--

