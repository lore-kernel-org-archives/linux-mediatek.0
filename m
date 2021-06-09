Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53879C48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1754E613AC
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1754E613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DlIUK/10ObPQz4IpEXmzg97Na3QtVnUmgSxEEGCFVw=; b=1iwtLYHQ4n0REw
	Ka715IF4o3+9OAbsiJ+zAJEeFlTm1RovAOCft5+d74JKzIawyz9iDY6+VsnHiWcAcMeLCg0d92XJd
	31WBO7S9v71sNwPui4hBIHF29+nmgd2n4ogRaLYVi+M/3EUW3fBi/lFDyF4BkXvQZV+WqcMGvxdLB
	/7paRRpWOs2lbR5iKl1x05Q2YCr67UVohIYCTVwjM07gm+Huk1K2oApHMI3vFvvJv8Lxw/Pi5lfND
	AwB3LuTyFgrKvQj8ZOfn8WzEqj1JMNARoc99eIoRwqaiy0wzz0GOigvfUKF3SuyU49YFHFohUG9gi
	w2ymk8yq1so/GKURmhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvjk-00D6Y5-38; Wed, 09 Jun 2021 10:47:04 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvjg-00D6Wk-Vk
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 10:47:02 +0000
Received: by mail-il1-x12a.google.com with SMTP id b5so24944438ilc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+5GzVyM+TFuTZLW/qFX3WiZRW9D495A3O6aGgKjLxs=;
 b=icqvxZiYbmJBLHoQNod0FxFLxphOWacXqY4xuBdb5fqVvTYbUo37QfNhVZL+BVBc7v
 vv3ricSDDsmBFXoggCz0oXH5e33zFyx6ZkePhITrR1kcFEGVWqJ1B7d+62BnZo77+GEy
 n0fpiYQsT5Qk0tsjZc/uP4tlxLa24JdPBxt7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+5GzVyM+TFuTZLW/qFX3WiZRW9D495A3O6aGgKjLxs=;
 b=kYbvA7GgzaekD3i5NFbZ+FHjFQdOa6+AKnZ2o/9WaeSJGVy/ocJaAWH1cKhUAPjVJc
 /MMXGkBw3BhP9jmXRw61ZtD3KR/VqM90DJV9M6ceYBkUF6vmlQ5qcX4tgH3eqaxSQLCR
 DnyJe/JYqZC+68FqNni4YN+cbh/mJuAfCpC+rR7KLQHUHKeOF2+QORiSfZfDFcT4wx58
 tFfXxQ+QU4vfq7qEGKWOGQXisM/nAVGDlydC7XsD7r+xJOUrUYt/00qr9DKr+uVIk70j
 mbEfcZophcE+umvoHAFrlbZX/5jbuFCS4EYc0G3cR/7wFEA/w3ex1zEhnYQykWl/uLPc
 JOig==
X-Gm-Message-State: AOAM530pW0lqmBhAFQz3+jvYAKrf4p3gVXXPPjXARpBDDgdOvafbqYZ6
 CEWFaGlqT/HupAn+UqjfWe9vIOu4XLFbFuoJduFEhg==
X-Google-Smtp-Source: ABdhPJwgBjwFhsmtC1XmbGiOcK7Z4pF0o5B7kd44vj0dZ9UzBo2ihwDg/0svNbMUYUf6PM+t2LazOCf1UIXVUByntUc=
X-Received: by 2002:a05:6638:11:: with SMTP id
 z17mr24468108jao.102.1623235618594; 
 Wed, 09 Jun 2021 03:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210609044854.393452-1-hsinyi@chromium.org>
 <7a96166f-70d9-bc0e-72cc-53a8612741e8@gmail.com>
In-Reply-To: <7a96166f-70d9-bc0e-72cc-53a8612741e8@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 9 Jun 2021 18:46:32 +0800
Message-ID: <CAJMQK-gtQpHTJvjy240fN31G7=sz73w2jJQk6_zqdeAiYpXJsw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: add jpeg enc node for mt8183
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 maoguang.meng@mediatek.com, Yong Wu <yong.wu@mediatek.com>, 
 Tomasz Figa <tfiga@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_034701_063868_E734B585 
X-CRM114-Status: GOOD (  15.97  )
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

On Wed, Jun 9, 2021 at 3:46 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 09/06/2021 06:48, Hsin-Yi Wang wrote:
> > From: Maoguang Meng <maoguang.meng@mediatek.com>
> >
> > Add jpeg encoder device tree node.
> >
> > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2: rebase to latest
> > v1: https://patchwork.kernel.org/project/linux-media/patch/20200914094012.5817-1-maoguang.meng@mediatek.com/
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index c5e822b6b77a3..fffe0c52909ce 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1329,6 +1329,17 @@ larb4: larb@17010000 {
> >                       power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
> >               };
> >
> > +             venc_jpg: venc_jpg@17030000 {
> > +                     compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
>
> We are missing "mediatek,mt8183-jpgenc" in mediatek-jpeg-encoder.txt. Would be
> great if you could help to convert it to yaml before adding the new compatible.
>
mediatek-jpeg-en(de)coder.txt converted to yaml:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210609104053.617751-1-hsinyi@chromium.org/


> Thanks!
> Matthias
> > +                     reg = <0 0x17030000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
> > +                     iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
> > +                              <&iommu M4U_PORT_JPGENC_BSDMA>;
> > +                     power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
> > +                     clocks = <&vencsys CLK_VENC_JPGENC>;
> > +                     clock-names = "jpgenc";
> > +             };
> > +
> >               ipu_conn: syscon@19000000 {
> >                       compatible = "mediatek,mt8183-ipu_conn", "syscon";
> >                       reg = <0 0x19000000 0 0x1000>;
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
