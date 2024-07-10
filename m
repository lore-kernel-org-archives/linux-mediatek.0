Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDAC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=; b=DojOI61hMH2zt4
	bDvLXEdMOqifRvq6MmpScnR+dPjh4UqQlnf06qBwaRUc5+JYlSs0nvrFfRdTDALftW8o162HGJKon
	DGeWKTaSN7ScGm6Bw3u3250lt/UuFZg/BP7Bf1Qu5Xdn8WyyDibm+5gAc37M3aDK3d7apoXzDs5s+
	nLRvuI5j7Fk/EH2jBiqhir+qbDfqg/eudqnfHS5AUcsvsWrpInrIS+777P8d47JS+t140qr+hV7Ub
	8u0wa7L+33xx4p0KzuAt4G9HgEq7WA1K14+pvtE+/ZFtRoQX2XeBxTAYuZ8LhktnwQSH2qdwry3vR
	m1Wc+TeGatAsQqb7nO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa5N-0000000B81y-0Uyj;
	Wed, 10 Jul 2024 16:22:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa5K-0000000B80g-1rBe;
	Wed, 10 Jul 2024 16:22:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so439757866b.1;
        Wed, 10 Jul 2024 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720628545; x=1721233345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
        b=RdD91lZymcfxNpwIput/f1s0NnGYSrS5U8jgNnR4TU3JbphXM6ShHqv0DFyu8SPBTN
         w6ACNX20HsD3tjY/Fj80pqPlE3Totbi3DljkLQm2k343rSiQPSgZxv+oZn2iCv5+RYb7
         vp/PLnr25sT9FkNtzJQK2ptfxu17EMcEoU1amBosYPsVql3ws3lCCXjSjB9CPegAlUnZ
         qRFnSBgcEnKnpbPkvW+vJtumqewmCa/aOXsc7NTc9axvjEgvboc2EGM252U5u036EQyD
         VHBNdLZdupQqwaaemxsHEDPk8mrNKVCpdNo/89PPP3UiaILmYZu4ZemYBFyLJzFHypaK
         cgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628545; x=1721233345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
        b=CuGIbDYJ1vsk+BqWc16FHOZVS/BcqbJ2o2xVxqLNQKmCyyN8yrGQw4W93eOTR2YIQc
         ZMjlyl+UYG3A/ZZcRVZZosapIHD8NWqh4XyJAO9W2KJ2w3Y7aO51k5Bi5bEZhXuqpuGB
         KVqB3NJMdB0EV9FW3x57pE0SEVSEoMOCwRAXpiSo6bk/S9PHsFe00E9mk1x02rGx1AMz
         jsFRk5oYlj7alw4ErRaLQ3m3INER6uq65C24hn+ZL9a8b7N9uZVtY6WFgZj4bqcKMj06
         CucWgkjW0YJoVJ++rmHwquB9KLWpXNZLFS1lmOB7og6fkji2GL4VXMOKlY9MA90Zgd09
         6Uvw==
X-Forwarded-Encrypted: i=1; AJvYcCVQRsmRlTQaKS6dgAEGt7RqdxLlDClmoShz21bgytOsT/LdcIG7Yajvh3/RHAP+ZedTY15/A6lBbQPZdQMAMkURT438AdlsEOlvu3Oi3kQxC3qJI3tI3wvbS5zO6j+wPVcdffW0eVWTaeHTxLXwvneAoF3cMNtyiok=
X-Gm-Message-State: AOJu0YxsZu2vKBRrSD7eLa8Wzraw+f1f6SDnQEi01DOtsCb/gCVmf1Zq
	piGu002QpHxo1phf28fmZbAHNWG1lPRJ9N8vXyBmHyuu0kYgKQ5oKxVmSVvSzEzye8uOeSGrvqg
	qejxdBDSQQV6VMAFL18wvEoXP5ac=
X-Google-Smtp-Source: AGHT+IFNvET9t815HfmplLSrRTvXphreJ0MNbUuIvztk3gg9+0wgDIzf2fKBnSwvpmHDF9a0kWQlSc1e+i3iMabrSK0=
X-Received: by 2002:a17:907:2d87:b0:a77:f5ca:f847 with SMTP id
 a640c23a62f3a-a780b68a20emr471719666b.3.1720628544538; Wed, 10 Jul 2024
 09:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com> <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com> <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
In-Reply-To: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 11:22:13 -0500
Message-ID: <CABb+yY3ddp6Ex50yh3hZn2aQcEULvmFfd99xb7ZNVnTPn7=mUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092226_523003_98556606 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 10, 2024 at 9:28=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
> <Jason-JH.Lin@mediatek.com> wrote:
> >
> > Hi Angelo, Jassi,
> >
> > Could you help me apply this series?
> > Thanks!
> >
> Please get it reviewed by DT maintainers .... Rob or Krzysztof.
>
I see Conor Dooley listed as another maintainer, so I am picking it up.
BTW, I was not CC'ed on the original patch.

-Jassi

