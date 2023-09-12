Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE73CA0EF1
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eoo29MeQUAIUv6tGjm0mF+Jl3ogymeV13KAAfraCdL0=; b=WMoiBBFuhZ0Nff0or2EG5vKFTy
	T3V/Q0co+Syu58/OEgpctkwkR1A2576s1wddvn+DRLDvd4s+T9u94BYHhuXUTc+B/zbI7dozJnXAe
	FN9Tj52Sn4IassrKYBypNF8ttbdD3DcMjWydSZG1tSIeOJojCUtQJoKzJwYT+XzF4qX0j6Zbi0lAx
	ga6jtNylqnLFOKiMKCdj60gCSDnzuSop74fC+1AmMVMD1zXvCJKTxClXlX6vRuDUBEbFV9C2sYu5v
	RGGr7Dka2Y5Lne3ZKm9QXqzwVX71+QL2F6vzod5WgIvEpcPyjaNq0aAiIsDxLRuArAiU6yupNB84K
	J5iGUTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4qr-003gD0-0f;
	Tue, 12 Sep 2023 14:58:53 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4qo-003g9y-2z
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:58:52 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-76f2843260bso350909185a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694530727; x=1695135527; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eoo29MeQUAIUv6tGjm0mF+Jl3ogymeV13KAAfraCdL0=;
        b=N/E9pbtj3QZT+urW8srFfyhEtEidq8J/7IilabDCSnmHlMglVz/2wZK9qjyDYSOC6N
         1VKYxA4S1ymrdf/PuVsUGqnl0HJ3E7dkqjPnCywmJvQigSVcGXRsvSNG/pVaV74TE0IX
         kVfJUoeWXHEvWoH9r/KYpiKRcLcGJh7mdYEuzWUoyeQ60WaSrdXDPAAd0eto6F0MjxN+
         i/wc/3m8788SzQUi43wM44HxQhtXa5ByalMQnzGFS8wjAEMvZY9BJR0ROQiloQQmop/z
         fuyrsgEu58goOgB2rngOSntW2vRlY9EaefKKrn1KZdS1ICKwY5KDJFxvvWLMKm6t6CkB
         eM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694530727; x=1695135527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eoo29MeQUAIUv6tGjm0mF+Jl3ogymeV13KAAfraCdL0=;
        b=dthrhti2OhK8Sqo0+f/WYjYMB7pLsTwYxqqJJm7qFBQ7ovHZV9nGBOAeWCvVNOqyEK
         CPR1s8xHn5nK8yAhG+PiICDzXSj3WNBFoqmsU4Obd5E159VkTso/RvnaH9qLZaD9JTln
         kp0lzcvF8gRMHCDg4he/6zF0fu10RuH7SFGZFgUmQFy1+CmepnWOw/Us4jxEcd4GWFlT
         NThl7/AfJKWYGTMSB2C+w2xlVIBZXr9Ib8UhUjsNv5lV+WbbTkMBpT/hQLrJhDnQmsEU
         pf0X8ALGemmzM8aMB1FvWgmqQRbns2tH6UDEnePR9Z7XjP3+BzmsYL0EL5+82PTZssLj
         z7SQ==
X-Gm-Message-State: AOJu0YxkxWPyRsCTFt20JPanU7JCFJWFLrTwnpxHC/d/fAbpgofLfRgf
	kIXZj5xFUwAcrLa36wtMBb+5hA==
X-Google-Smtp-Source: AGHT+IGyVl5EhWb4dmDbUhd1ETJuzzG2tL8uNGiJBeQ5lfOHSv0Ap/ccPuu267/edyULKyU0FY0O+A==
X-Received: by 2002:a05:620a:408a:b0:768:4206:fc8d with SMTP id f10-20020a05620a408a00b007684206fc8dmr17108475qko.50.1694530727023;
        Tue, 12 Sep 2023 07:58:47 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id m12-20020ae9e70c000000b0076c60b95b87sm3208422qka.96.2023.09.12.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:58:46 -0700 (PDT)
Message-ID: <8140975aa1f5c3cbdfa2e6f42aecebe3701f29da.camel@ndufresne.ca>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
	 <Yong.Wu@mediatek.com>, "jstultz@google.com" <jstultz@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 12 Sep 2023 10:58:45 -0400
In-Reply-To: <95797f3d-65bf-1bd9-9e19-6de42605cfe3@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
	 <20230911023038.30649-4-yong.wu@mediatek.com>
	 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
	 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
	 <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
	 <255ae6b9ac1b6bea9262069747824b8461475e70.camel@mediatek.com>
	 <95797f3d-65bf-1bd9-9e19-6de42605cfe3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_075850_971034_BBD8D083 
X-CRM114-Status: GOOD (  34.97  )
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

Le mardi 12 septembre 2023 =C3=A0 16:46 +0200, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> Am 12.09.23 um 10:52 schrieb Yong Wu (=E5=90=B4=E5=8B=87):
> > [SNIP]
> > > But what we should try to avoid is that newly merged drivers provide
> > > both a driver specific UAPI and DMA-heaps. The justification that
> > > this
> > > makes it easier to transit userspace to the new UAPI doesn't really
> > > count.
> > >=20
> > > That would be adding UAPI already with a plan to deprecate it and
> > > that
> > > is most likely not helpful considering that UAPI must be supported
> > > forever as soon as it is upstream.
> > Sorry, I didn't understand this. I think we have not change the UAPI.
> > Which code are you referring to?
>=20
> Well, what do you need this for if not a new UAPI?
>=20
> My assumption here is that you need to export the DMA-heap allocation=20
> function so that you can server an UAPI in your new driver. Or what else=
=20
> is that good for?
>=20
> As far as I understand you try to upstream your new vcodec driver. So=20
> while this change here seems to be a good idea to clean up existing=20
> drivers it doesn't look like a good idea for a newly created driver.

MTK VCODEC has been upstream for quite some time now. The other patchset is
trying to add secure decoding/encoding support to that existing upstream dr=
iver.

Regarding the uAPI, it seems that this addition to dmabuf heap internal API=
 is
exactly the opposite. By making heaps available to drivers, modification to=
 the
V4L2 uAPI is being reduced to adding "SECURE_MODE" + "SECURE_HEAP_ID" contr=
ols
(this is not debated yet has an approach). The heaps is being used internal=
ly in
replacement to every allocation, user visible or not.

Nicolas

>=20
> Regards,
> Christian.
>=20
> > > > So I think this patch is a little confusing in this series, as I
> > > don't
> > > > see much of it actually being used here (though forgive me if I'm
> > > > missing it).
> > > >=20
> > > > Instead, It seems it get used in a separate patch series here:
> > > >    =20
> > > https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediat=
ek.com/
> > >=20
> > > Please try to avoid stuff like that it is really confusing and eats
> > > reviewers time.
> > My fault, I thought dma-buf and media belonged to the different tree,
> > so I send them separately. The cover letter just said "The consumers of
> > the new heap and new interface are our codecs and DRM, which will be
> > sent upstream soon", and there was no vcodec link at that time.
> >=20
> > In the next version, we will put the first three patches into the
> > vcodec patchset.
> >=20
> > Thanks.
> >=20
>=20


