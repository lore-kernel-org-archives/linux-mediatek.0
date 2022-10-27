Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D5FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP+7R/Fr2VMJLa5AXizn+zOIuwCy4AiCbk7L9UfX4Zw=; b=fNuzSkm4ZbfqIShlJb/FSmgHhO
	/9EV5CjfKRZ4u+neoeacRt5gG/fpENL1SDo1LrULdxqZS/tSRo7U346ln9ksBeP5mHNiZbacmiU9p
	BRYn06/ObTc5ZrKnu+M0zQsq4T/HNl/xUFWfguZE9mdCp/bZP7HsoJ4HBoZOS1pkJiTE3ouB6M/1H
	4xj349ajQieP/VcQuCO3awjMqQJWjVmifgNEgJHHtQUMipR4aFEruK0wi6Fhx8X+qwNhcP0xCM0Es
	lSijQbyZOWNUpZk0M0T7AJn1Q+xTmfppoen5dHNe5ZA57EBDVn5H4QrYYez+HFgbh7o9PRcJGPAwh
	ho/YYq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2FY-00DDRJ-F1; Thu, 27 Oct 2022 12:44:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2FL-00DDMn-Ob; Thu, 27 Oct 2022 12:44:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so1343369pjl.3;
        Thu, 27 Oct 2022 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WP+7R/Fr2VMJLa5AXizn+zOIuwCy4AiCbk7L9UfX4Zw=;
        b=agwMaoXKy9Wbn7+kG/2zoL2ab09hLBHI3OWHuBTISVwNYL2VkJUvzxCRoL49OCshBj
         vLioT/vawmbM+eFCEGMjfNYBG7euvnY+eyE98TBYycgStlmJnIPInsn8srezL58PDRl3
         GbQRFNvB+CskWz5NEW4VF4ylYuXxQLQIFGWxPAPRT4aobnXX5r3NioqpU61GBtW1SsyN
         78gcwnit22wAzscY5gBg5HbZTcffuWqOnD8XVVJwUvz5JS9yy9l/rcL1J9r7YFGn9Tdr
         T1bD5t0YqlJzWkGgCkwslI3+2L9jbWFoe1V7+E7bwxjo1dJHsQjhJGvfdnoIhxetRjTP
         9fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP+7R/Fr2VMJLa5AXizn+zOIuwCy4AiCbk7L9UfX4Zw=;
        b=uma6hbyYMWcOMQyZBSb6Nsrt4KrMANg0SahqOgpXRHeGUdzgfAXNoXrUrveUBYTjck
         bcBWZV7Cz+oNZDrXFo4lTq/xCcUp9G1zUuN8PW/rGtSTS7SVyWmYXDMxGjG5fVbtff7O
         AGANtGSTMlrOJvkwKtQHVw6X8mTEF7cVx7BNDM1xVCJj2HhzdXb0MPTu+ZbHlo1/9lkQ
         ms8OuOJeQqEBuNvR1gEejJeGKHN4Tl81Ekxh0LXhSkNP9WwiPmbwXQka8dFlS47MOBld
         mQKpNYxdCXGo1m+h8u9uFI+gdTBj127JTiCHQ+jREODHp7h7PFW/FezgomYysg8A2KvN
         7K0g==
X-Gm-Message-State: ACrzQf10CMj/nMLeO5U2CfHVjMrhtWjp4ECuiqhoPYuMFl0TBLe5lfh4
	JaHed0GXIrzF6+SwcAVRsKs=
X-Google-Smtp-Source: AMsMyM5+O8XthDRDSKyEQ3I1jHlcTzZmKX7d/XfEB3c8kCa+btVU5AIiiGXo52VS5hqEqrrzqoO+lA==
X-Received: by 2002:a17:902:c20c:b0:186:b3d0:f77 with SMTP id 12-20020a170902c20c00b00186b3d00f77mr17479095pll.26.1666874668179;
        Thu, 27 Oct 2022 05:44:28 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-37.three.co.id. [116.206.12.37])
        by smtp.gmail.com with ESMTPSA id i7-20020a170902c94700b00186b3c3e2dasm1125991pla.155.2022.10.27.05.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:44:27 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 28834103F96; Thu, 27 Oct 2022 19:44:25 +0700 (WIB)
Date: Thu, 27 Oct 2022 19:44:25 +0700
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
Subject: Re: [PATCH] dma-buf: cma_heap: Fix typo in comment
Message-ID: <Y1p9KT1ZZ0bqIhdu@debian.me>
References: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XHaG62drdJ2C2Nnp"
Content-Disposition: inline
In-Reply-To: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_054431_840238_81EC7B96 
X-CRM114-Status: GOOD (  18.53  )
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


--XHaG62drdJ2C2Nnp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:26:38PM +0800, Mark-PK Tsai wrote:
> Fix typo in comment.
>=20

Comment on what function? I had to see the diff context.

> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 28fb04eccdd0..cd386ce639f3 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,

Oh, you refer to cma_heap_allocate(). Please mention it in the patch
description.

>  			kunmap_atomic(vaddr);
>  			/*
>  			 * Avoid wasting time zeroing memory if the process
> -			 * has been killed by by SIGKILL
> +			 * has been killed by SIGKILL

Duplicated "by"?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--XHaG62drdJ2C2Nnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1p9JQAKCRD2uYlJVVFO
o2ycAP4mutv5A+U0sVGBxomMJwORB1VaIuTIp/xeL/6OqueMIQEAq2u8IOVlVke8
K367ezUx4yUU08CTyQcg97a1puTuqwU=
=bsZY
-----END PGP SIGNATURE-----

--XHaG62drdJ2C2Nnp--

