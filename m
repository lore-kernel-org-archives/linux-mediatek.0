Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C229C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcXomuFTNs6kAOjv+oYFgSUhkraR2OB9WxwHOqU2kw0=; b=eLK44UiWLxPiWDLzAdRNbin5yL
	QTqSfmfTFu6cAxATRJ3hlIBzLShdGPt/jZSMaHjByp2VKgqwFtpOfePBrbG6N4LftoiigzwaClRaO
	Djy/2pl4xlGzKDNagSuZL4S9GtKa+Oku4G+m6UZSXVdE4sLUGfMOoij1eReF0zmQbKx73AruCuvs4
	kES6dkhgsPIqTUyzTICB51Qa48WK8J3uwyvdBCFvDMroNzIlRsj9YI1kK/HGRLOIj4reJN0bOSj/m
	4KFzdPowTm4RXbGoLGOq2n61zYdbx4KCKAa0tJgjBHP1Owblr0tFdZt/ccFwWu6pQGBewnqqwnoMw
	qlUADSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BTZ-00000002zAa-2bT7;
	Thu, 09 May 2024 21:38:53 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BTT-00000002z7S-0315;
	Thu, 09 May 2024 21:38:48 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7f170dc5f70so381208241.1;
        Thu, 09 May 2024 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715290725; x=1715895525; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcXomuFTNs6kAOjv+oYFgSUhkraR2OB9WxwHOqU2kw0=;
        b=TMBmyKWy86zQnZfSvaXmd3U6FeK0fRGgL2qe/jTjiy5CIdLe7RAef5U7PkcrAzMd5c
         MnkVlvW7+wqiU4I8E4BR9isi5G7v0gwtZgPBGzo8I9pwwgGrdDQL/BXQ88pxauNPlh07
         9NmVk244xV5z74pk2Hs52fsLdoANhPDF1swS7JJpKKixNPbFNaJ/nIvpB+aFaeniZiQa
         zrHd9QL9OuA9cKepbb91x1jUGdmvit8zqQKvMrKEtygEBL5Cub2/0FIxrCd2E7ECLBtn
         3pkQkeLZIWpCuqAb23Bg0mmuQReQ8VVfmVgKJQVw4w95WpRgGUnDO8X7HhDO0nitO8f3
         69tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715290725; x=1715895525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcXomuFTNs6kAOjv+oYFgSUhkraR2OB9WxwHOqU2kw0=;
        b=fHXh0G3FFWPUPjOYeAjzzGweGpgS9DsI0cc6UI/8yU0KaU5uqUD9qL5JzQu589UzJT
         sE/IniXO3LFdoV4zJJJ3fJzQ8UE6C4wd2iC+g1gnld1W7l3a2H/W52OElYAtiKo0LZaY
         oX9CWuFj6AdzoU7gzHYd7GqBkseUv6J11X4Wt680Lb/NztvWAL66V2u7uvcjtO+YZ1GL
         oqJKjuV8XP6101tSC9w1c26hzP6kq8MnCDHyrqVWuSbuP9maDVP+aZkhNzTcRbEI1rFO
         1M8F+mUzD+jV/fJcgInTPx8aOAhTaNazd3o+q/oCRzksglH6kHLxxFIo4hrw5gnBLXz8
         Grrg==
X-Forwarded-Encrypted: i=1; AJvYcCVEDvHardhwB90EnKipc5pUtPiwgPpKuQ0kvz8FTJzyOd2pHHP57JUk2fmT0cg+MK2rLqTv9Ou9vN5wgADcFNicZlfkjtv7PqIptwvtf2JPXDevV8tMbd+9iJ4WHO9K9ITLWWoGfZdsd4tBT9W22UMsnPp5RuGjhWM=
X-Gm-Message-State: AOJu0Ywz5c8Rm3028gS27i47dDrN/6yfUnKuS4tvSPdEu1jaXFM54q77
	D90vUvSsJfhJP0QMgbeqG6Xn/jY7P/LyDFoAINQK1zht5AG30CXuJOisNmT+5EOzGujX9GELml1
	P6JzLIZ+BP5DTWD0i05OOdeOhhKM=
X-Google-Smtp-Source: AGHT+IGDPdAnAHFbOGEVVQfuthPYBDUFn04X97C8h8u5g41EhAQrrR+vQZTM+R921KKRTb5redHLdvkWlrvB0RI6wnw=
X-Received: by 2002:a05:6122:2a51:b0:4d8:75ca:8cbe with SMTP id
 71dfb90a1353d-4df8839a7cemr976657e0c.16.1715290725239; Thu, 09 May 2024
 14:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
 <20240508201654.GA2248333@kernel.org> <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
In-Reply-To: <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 9 May 2024 14:38:34 -0700
Message-ID: <CAOMdWS+WRC7KOqPUXJ88ikCDPS-6oZ0i6OFTUk95DFTfYtNZcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Allen Pais <apais@linux.microsoft.com>, netdev@vger.kernel.org, jes@trained-monkey.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	kda@linux-powerpc.org, cai.huoqing@linux.dev, dougmill@linux.ibm.com, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, 
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com, tlfalcon@linux.ibm.com, 
	cooldavid@cooldavid.org, marcin.s.wojtas@gmail.com, mlindner@marvell.com, 
	stephen@networkplumber.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, borisp@nvidia.com, 
	bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, 
	louis.peens@corigine.com, richardcochran@gmail.com, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acenic@sunsite.dk, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	oss-drivers@corigine.com, linux-net-drivers@amd.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_143847_089642_16C6D8EA 
X-CRM114-Status: GOOD (  18.43  )
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

Paolo,

> On Wed, 2024-05-08 at 21:16 +0100, Simon Horman wrote:
> > * As this patch seems to involve many non-trivial changes
> >   it seems to me that it would be best to break it up somehow.
> >   To allow proper review.
>
> I would like to stress this latest point: it looks like the changes to
> all the drivers are completely independent. If so, you have to break
> the series on a per driver basis. Since the total number of patch will
> be higher then 15 (maximum size allowed on netdev) you will have to
> split this in several smaller series.
>

 Right, it's a valid point. Per-driver might not work. Depending on the
driver and changes, I will try and make it an independent series.

> Beyond making the change reviewable, it will allow eventually reverting
> the changes individually, should that cause any regressions.
>

Thank you, I understand the concern here. Will work on it in v2.

Thank you very much for your time and suggestions.

 - Allen

