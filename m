Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280E0CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xJdtdhV7q8ohpMQklnYYogPu+uXAwCgLJrxI+TZY9k=; b=t8b8t6aw9ImUGzkPgh8fJ0W3Rf
	80y6LIou3bDD8y903uGiZjGAVliNcUfaNDSTwo8nN9kD6ybBOBE36Vv0KgoUe3HJnFPGJg5HZxyQk
	Dgvq/j+Zqc0aEjUcgU+FJslSmEbRFKGBt7UNV9WVGSVSo1ESbojSn1QfpXt98d4KEJMjFog1BFBpr
	oe0QU+g9dY2y6+VyMbarMjsPX+65SFTJXctMcaiPiMlA8aP58jt66GdJghUZGaBSmywaaHF52cT22
	2AFGwn+QcLtRbKDj85sZCKnDb3o/FBQkMkuTH10/x90ITYzRK+98udeh/qqfH4y/y8aL+8AhXMGt1
	4S51oskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfx5-0000000GutA-02W4;
	Mon, 23 Sep 2024 10:05:55 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfx1-0000000GurN-203P
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 10:05:53 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-502b405abb1so1037882e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727085949; x=1727690749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xJdtdhV7q8ohpMQklnYYogPu+uXAwCgLJrxI+TZY9k=;
        b=HK3YRfwAs3zPq0yVEh8x8zlrvreOcuZvH4IeDqPDi3Dk8wibprwBiKb0/JzcWSDNMo
         Uc+D4lDMLxbOmyfinOZ/a2cSfSHHH/sKH9c1zEJh7dXyGG92k+e6AkCtvv778liEIUgJ
         E/lnS3wAP/GPgrEMPNcr2DqjrAGPWmo1ApH3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085949; x=1727690749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xJdtdhV7q8ohpMQklnYYogPu+uXAwCgLJrxI+TZY9k=;
        b=PagPH0gRKPDc01BGoUsfg5/IioUGxYd80hw8/4T7aZjHPKlFt/6i969mh1pHR0TW9K
         bEFt8HIVtcT4jey9/1RTUeHQVZ7X4JUjH73LmBCes9+Vybt/FBidENqARjy09BYkf4G9
         V8TRykV2PSPw672MBxoyY3IxO07XK/ul2sqO7MhTRlX9QCACKXnhsNw13hMxGrmqNRlU
         ix7bEBBrEL9c3YPdXCnUh1O5i98ql3O48Rsr4xfrfGwHtW7X5Hbkh2HoyOWHAeZ6cY6D
         0dnC8CATUqPz1dQaOH1gukl4ujXgidbHSex9BVUx0CGGHbPchFUYdvh8yHvHiaA/NGeO
         idEw==
X-Forwarded-Encrypted: i=1; AJvYcCX05Xx4dP9sM6i41QJ0xBUMGLwxSfYFEQ/zXylbTRbi9Psq80nZfhrGZiOFnx9VSEOg2vBqBdRfsrB68Zr+dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgB5IQ5wFWoPN28/HQWCWaojchfY+QnjvW/Vc5kRbqb4gCURUN
	hOMHb5duRxLIVnRbmxQzRKeN/0IPYXV9aTNN/iujrBBYRHrTR0cEyG5t93IQ4q2mAuVeqtG6rj4
	=
X-Google-Smtp-Source: AGHT+IGNZKoR+LZT0ThiMLZYOSJPF1c6in4WA6tIKknBG2iG9Ob3+z9CJ73BE+eGTqkEwwbe3I2UXw==
X-Received: by 2002:a05:6122:2216:b0:4ef:280f:96ea with SMTP id 71dfb90a1353d-503e040298fmr6305192e0c.4.1727085949110;
        Mon, 23 Sep 2024 03:05:49 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-503dae65be1sm1493096e0c.56.2024.09.23.03.05.47
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 03:05:47 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-846bc787b3dso1135430241.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 03:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgxHkcWzTmfBiqezfwEMDnvLChWl8hhOAFqnIA5RDGiUA8OO1a5hhhxjiBug26CRllKVXHdhyzSMulypvu8w==@lists.infradead.org
X-Received: by 2002:a05:6102:41a6:b0:497:50c0:a6cb with SMTP id
 ada2fe7eead31-49fc7626228mr7350845137.19.1727085946795; Mon, 23 Sep 2024
 03:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com> <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Sep 2024 18:05:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj6AdVHoBUJsduHiGfpRRijTx+zJ5e=a30+pYENqO-GOw@mail.gmail.com>
Message-ID: <CAC=S1nj6AdVHoBUJsduHiGfpRRijTx+zJ5e=a30+pYENqO-GOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030551_528544_D6E1D5D0 
X-CRM114-Status: GOOD (  11.14  )
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

Hi Angelo,

On Wed, Sep 18, 2024 at 4:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for respecting the max-link-speed devicetree property,
> forcing a maximum speed (Gen) for a PCI-Express port.
>
> Since the MediaTek PCIe Gen3 controllers also expose the maximum
> supported link speed in the PCIE_BASE_CFG register, if property
> max-link-speed is specified in devicetree, validate it against the
> controller capabilities and proceed setting the limitations only
> if the wanted Gen is lower than the maximum one that is supported
> by the controller itself (otherwise it makes no sense!).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

I confirmed that v3 addressed all my comments in v2 (with some in a
more sensible approach), so
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

