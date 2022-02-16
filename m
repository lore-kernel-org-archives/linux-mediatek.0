Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLnYb3fcaIPHt5f0v/8szAJ4Zet/BS+17WVOB6PDFgY=; b=2LKNkrIfeIYlzz
	aCymXhcDg3ouZAH4nmgdbhKBH1arYtEpdyELI+wfZ34zw4jA9lIVZPVHxNQ4UoznkoS05GDol3h0J
	3z8IFj8OR+PBK5B6u31u7L1W45DGIiKZUwTuZz1kwpghqtdpBbSMPuQ+SrR7XnNqmJAUrFLYhtIzc
	TRunKsBAlXEGrJ+ezAKeRtuv4rKePDgr+75VOI1hLxHcb1VV9Mgpxj0fAtrHAhVaVFPPJR/vMfVdX
	94vEn43Hoiol2P0WO1v/UjFbFHx6jPMrsJduENikJkUp+GbY3nteHXp4uL9u3btWRSzXdL0M20ycR
	bPhjTfpb00YAK396N+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKDLX-005ci9-9r; Wed, 16 Feb 2022 05:59:23 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKDLT-005cgg-PK
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 05:59:21 +0000
Received: by mail-qv1-xf35.google.com with SMTP id h9so1288896qvm.0
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Feb 2022 21:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CDBQKjrOHx1jFqanGpjTZz0mkLi+B8rGvMm6ZK2mah0=;
 b=ANYaNLWFCQkj69oiskZkSh6DjZmPGeiq9PrEgU2cP3v3dn1nkwLwYm7cx+4vS6oOKw
 RwNzEIyq3NLxuuxq6/pXX241+VkGVJtb86AlOXZXiNaOF+o9MwFTZ3Ial6STIS1UiAA5
 dhBgfFPAMgGgTKfxv7tknbGcdLXT5auCslnVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CDBQKjrOHx1jFqanGpjTZz0mkLi+B8rGvMm6ZK2mah0=;
 b=A/QmMLqgpr1fmPKpTzpr4n2uMEFVANW3dzphDkgvO7u+LW8ClvJcfXVRiQOPseuqi9
 Ta3RQ8nkKNhdkX4iSNITS2FM3g+Pk/+rCCNXITY51YN1Cy67TAzQHKyPTsmLdmcbiCNi
 G9dxbue23jKPXY7wuk+QwB1T/SRYhdN5uNq5A4JPgAiFJxdzBJJJiMXg4zRlfVLA6R1b
 g6FV5qgfYCRr+ogGkTG7Ogq9/fB0Ut2zI2xI9tkJ2oxQYLQexunRqurXDMt//YojZX1y
 ycLrqT52R6bep11ExDJ5N2cqZTrrbQjxCPQ4HHNO7wdo8qWyxalcOGWpMUNFMWOkInmg
 Uh5g==
X-Gm-Message-State: AOAM531mDXdmGkKqmafGgamFXBqHuxi/tnlahS8WJN9Hi9HTpOW73P7O
 vLLK1H3FXkT8W60Qjtp9p0U/LypoVHfRlg==
X-Google-Smtp-Source: ABdhPJzAMqlVCvAjKln+UYeZtNKYUx+eSyvGbBkBqM+MiQTOOup1lAksdmh4hHkSp+wQ4+6GQAMV3g==
X-Received: by 2002:a05:6214:1c43:b0:42d:20ac:823a with SMTP id
 if3-20020a0562141c4300b0042d20ac823amr830960qvb.67.1644991157924; 
 Tue, 15 Feb 2022 21:59:17 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id u18sm21356236qta.76.2022.02.15.21.59.16
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 21:59:17 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id bt13so2920965ybb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Feb 2022 21:59:16 -0800 (PST)
X-Received: by 2002:a0d:c383:0:b0:2d0:f04e:7ada with SMTP id
 f125-20020a0dc383000000b002d0f04e7adamr1070020ywd.229.1644991156422; Tue, 15
 Feb 2022 21:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-9-yong.wu@mediatek.com>
 <ca47becf-adc9-f11e-5e59-03f203920344@collabora.com>
 <d9637b40196873f392ac9cebfe369106a6f0eee7.camel@mediatek.com>
In-Reply-To: <d9637b40196873f392ac9cebfe369106a6f0eee7.camel@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 16 Feb 2022 14:59:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cqg2xPwtzcom_EZ1tw1tOBsND_i1YAQCO4kF=+eWePBQ@mail.gmail.com>
Message-ID: <CAAFQd5Cqg2xPwtzcom_EZ1tw1tOBsND_i1YAQCO4kF=+eWePBQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/35] iommu/mediatek: Use kmalloc for protect buffer
To: Yong Wu <Yong.Wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com, 
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com, 
 libo.kang@mediatek.com, chengci.xu@mediatek.com, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_215919_854680_E7DC0BDC 
X-CRM114-Status: GOOD (  24.16  )
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

On Wed, Feb 16, 2022 at 2:55 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Thu, 2022-01-27 at 12:08 +0100, AngeloGioacchino Del Regno wrote:
> > Il 25/01/22 09:56, Yong Wu ha scritto:
> > > No need zero for the protect buffer that is only accessed by the
> > > IOMMU HW
> > > translation fault happened.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >
> > I would rather keep this a devm_kzalloc instead... the cost is very
> > minimal and
> > this will be handy when new hardware will be introduced, as it may
> > require a bigger
> > buffer: in that case, "older" platforms will use only part of it and
> > we may get
> > garbage data at the end.
>
> Currently this is to avoid zero 512 bytes for all the platforms.
>
> Sorry, I don't understand why it is unnecessary when the new hardware
> requires a bigger buffer. If the buffer becomes bigger, then clearing
> it to 0 need more cost. then this patch is more helpful?
>
> The content in this buffer is garbage, we won't care about or analyse
> it.

I think we should zero it for security reasons regardless of any other
aspects. With this patch it's leaking kernel data to the hardware.

At the same time, we're talking here about something executed just 1
time when the driver probes. I don't think the cost would really
matter.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
