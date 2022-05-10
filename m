Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAtjdAVdwptad7M0FpsdMXgyhREJ1zTGlAEubTqX6jc=; b=bZQ7K72tE//2J2
	UDnjksEWZHP9wykdciAQBYCJb/F2oo+MxsNr6005bS+Ix0/tRaFgOLaG09WzL5qGaLYEUt57DrILv
	2xwQ+qJa0yyEN2EeLTwablKlVE7drrZaw6LxYZzW4Z/lTpwiOHNPS2uN/UaC24poHlRH5o2QZtVKU
	cPlo8mGF4d/Yu9LZkCekEWJr/kmjFbGROfkj3bx+bxFnADcI0tRnhbUdtnL2KzLjwMc7Ns63kwU5D
	1VrDoO2LB8HE7y1SLEmjRojtL95Y/CuUUiXDgSVlmwakVxpNhVz9l6GGa7OqVgKcO8cQn1f0t2eyq
	8jieTkOJeJ7HgGOnPSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNFz-001GTh-Ri; Tue, 10 May 2022 10:38:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNFw-001GRR-JY
 for linux-mediatek@bombadil.infradead.org; Tue, 10 May 2022 10:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=18Z/sTz+IhJS4WIQidF8Pkf7x0QFtzeGTd5zgt1XcsI=; b=lH1O3TKVRWmLLOPzi2/7CtG4kI
 a4oZHPXArxNV6uZ0xv00bv2w7QhGAgSv9nImFxYahX+eJ42Kba6+0BOVBmW5iS3hBGcBe+7Ft91Ew
 ceTt1LU7Q6yfFLLMlwfuM0cUyZnYTyPy8R6077WcpuoWxrKvuuhIoTGVcMyrzjt90j1lCcbOal6QK
 oUO5/QiT5IsSwZYpZ93A6FZADpXMO+fjQipBDN/Yboz+4IGUPuqkHM8pgvFf9cAHLRgqoMMZqqjjr
 Km09UiPp5PlDsSNozuFNPk7OGeqcBAejkskrB2DowSA1VcIBwoepEi3CGIn8Be1w5DJwmzY2Ay5ZZ
 QPTJ2rdA==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNFr-00CokJ-On
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:38:14 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id e12so29859864ybc.11
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18Z/sTz+IhJS4WIQidF8Pkf7x0QFtzeGTd5zgt1XcsI=;
 b=mce5YmBbmq67J2zhZTHGEv91yobyh5mk7B2CT3fMjjAqcnjQubzRIntpwRppCEnqp+
 rmbixFACXH1Fa3+8SQbPTl8SgT/K4WNPHtxz5QmUUgQ0SUdbjb5qhG6im/W3dUulSp/u
 HJ+wUlbTR0YAU9r1YHMPQhrxD5BLUFa1TOZJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18Z/sTz+IhJS4WIQidF8Pkf7x0QFtzeGTd5zgt1XcsI=;
 b=NHasiM8P4TX0sLBgV1DxZkriV3DNflbA76ouIBkbYv7f+kT0xOcDR8s1k/5PWsG1Gk
 w2MhCKacu6gNhlbMbvApmUI1WBWHOG1qEnNfQ0/nKil6crOu76UqbfCK0KNMGQgk7rCD
 x5jsHe9Vf63Rs5Y9fQ2yzIcbYSuSnV/CARNbM62i46ntnF4TjdwABcWeWK8ea7HpFI4y
 QSU3KmIckIWDy56fQmtXaiIbLDbG7WySS1v+lgVKor7gF3ivMd6Un1ioEiCTWaZohVPa
 NVSHKTbHa9ioqOxiEAK71mr6BQ/dLmdbUvBzr5o/6eMbqUJlNZ1dGN+dQjaMRLF0YaDH
 +VyQ==
X-Gm-Message-State: AOAM531oXCwFJbVDfG9NSm5JAY89/AVq+KN/N2X5Znw+fFNUARuvKvpl
 YYWHfId9Jk7hGQGBVze0X1AC6B2uxzMUJrMjIzDZYA==
X-Google-Smtp-Source: ABdhPJydfNAKQMhJh5sK/HAXZvb2Kunl4GtH2wnKZ/ZK7z6LCCVG+1efFg9HYbdUR9Jq5koVxnXByhS4ux49LykcTBs=
X-Received: by 2002:a05:6902:1501:b0:649:ff91:5409 with SMTP id
 q1-20020a056902150100b00649ff915409mr17647450ybu.278.1652179088847; Tue, 10
 May 2022 03:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
In-Reply-To: <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 May 2022 18:37:57 +0800
Message-ID: <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_113812_238008_8A0B82F2 
X-CRM114-Status: GOOD (  16.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 10, 2022 at 6:28 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/05/2022 10:45, Rex-BC Chen wrote:
> >>> +    soc {
> >>> +        #address-cells = <2>;
> >>> +        #size-cells = <2>;
> >>> +
> >>> +        vdo1_rdma0: mdp-rdma@1c104000 {
> >>
> >> Generic node name. dma-controller (if it does not conflict with
> >> dma-common.yaml schema)?
> >
> > We don't understand what dma-controller you are referring to? Can you
> > help explain more? Thanks!
>
> Use a generic node name, as Devicetree spec asks:
> "The name of a node should be somewhat generic, reflecting the function
> of the device and not its precise programming
>
> model. If appropriate, the name should be one of the following choices:"
>
> I proposed dma-controller, but feel free to find better generic node name.

dma-controller is covered by dma-controller.yaml, which references
dma-common.yaml in its entirety, so I don't think that would work.

What about "blitter"? I think that is a generic term that is/was commonly
used with display hardware and sort of describes the function of the RDMA
& WDMA blocks, and if only one side is memory and the other is the display
pipeline.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
