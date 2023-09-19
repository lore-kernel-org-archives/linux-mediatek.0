Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A8CD343B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 05:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q8O8tWvnLQBFm13Z0K7FvFC/W1hQRUqZ5JIYPkfrQ4=; b=fwZkHwm1+Y/g1EbjUzk/kh5ddF
	oZ4vRqwYW9YDQhIgg/gVrfGtE+z3gx0S3sfNCH5qUrFH/KvpiqJ9PoT3gHwraOQEsA/OkiGApFT08
	K9Zc2A9Rw+FScU6hHK4ja5GHkQGjE2Yl/+M1hd4iKcg/F51BZGVy1zRJx5QPG6Hf5T9ANblO6vOMP
	p64gdvBiwjG2hDvWmc+gZLooUN9kkFtrgsJkkaH9EqJMWyqOnx50x0Zv8aFZ6xSZsGmMB1D6U3w4Q
	lOMtPqjxchQDTlcEO2yJv2SRFWIY8h7aUTBVvX0PjFsIVOxlwzkUCjFzlhqbXB6YWGc2zlviljCOz
	Osc0Vo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiSxe-00H0wZ-1v;
	Tue, 19 Sep 2023 05:07:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiSxa-00H0uj-2c
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 05:07:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso6181388e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 22:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695100057; x=1695704857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3q8O8tWvnLQBFm13Z0K7FvFC/W1hQRUqZ5JIYPkfrQ4=;
        b=DCXDbJy1kce4lqSeUszNnmq1DaKOT9tAGqtEaj93/ppZnYS2dEHIel39LeFlo9JLqv
         5BXhRVXL1M5KUpuT8ZfKmniY21/0Vzh2MTML8tT5fTVY9ZYrP29tsgoAwz1+4f6bFHBS
         D6Ar5oQP/X4JmAsArx1hQwLq3YcOnzTNSzyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695100057; x=1695704857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3q8O8tWvnLQBFm13Z0K7FvFC/W1hQRUqZ5JIYPkfrQ4=;
        b=NqqpJVMghWkD0Qzlwclsp9dajqwgNANOBrxzzelC88kmhyXnfWsnM8IMjSAV43Ty2x
         whzxuw1rGMfvy0Xu6zV0vx6J1c7au1vnyjLddoHoN1dz6ct0BHpTS0wpBVUDiOSy0Rwd
         +uQtrhNQjAE3RnNecNHsXbkPP0wc4KguelASk4IxFEbRHGA9+B51EvmmFtw2CXDUWNde
         6I0ERP2NgUv/6j6wMmRgIAum+/Y/QlubOGCLJkQYnJDygVYWGZOSpqAr2jiNO2uipugK
         ksnNNfbRGbkuXOYOj5SnRWX/ccUa9laOQRpkzrFc+yiyUXtDlAvY8b2BP7vYK99icP3X
         wbHA==
X-Gm-Message-State: AOJu0Yxdl11csiCWQB67TgjRv/whjTsZGTBkox2WMmASs7TNWbS6TgtS
	YQsYeDTNKaF6emzYmNJLNSg2wzPFwlyN9T8GD+OLqA==
X-Google-Smtp-Source: AGHT+IG7rNmlTgr6mtc+pEDDwj3hVW1OJN/J2y44JelHkWF7gUusMiA1KDRGT3JZU/TTjFtk7VjNvQSjnr+5NJPaqPw=
X-Received: by 2002:a05:6512:3b06:b0:4fe:8ba8:1a8b with SMTP id
 f6-20020a0565123b0600b004fe8ba81a8bmr650772lfv.7.1695100057325; Mon, 18 Sep
 2023 22:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <ZQH2dG+l/dONUsyi@p14s> <20230918103141.126271-1-laura.nao@collabora.com>
 <CAGXv+5Esi=G0xgkP=+Bhf39Xs3gMN1PBzarxKBKduOjgwDijAA@mail.gmail.com> <ZQj2lSl47qZQv8fX@p14s>
In-Reply-To: <ZQj2lSl47qZQv8fX@p14s>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 13:07:26 +0800
Message-ID: <CAGXv+5Gj5rERcX6uxVUUq8beM4k4ogXnuh_86piyGw1oVrbyvg@mail.gmail.com>
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Laura Nao <laura.nao@collabora.com>, tinghan.shen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_220742_850371_9A0B241C 
X-CRM114-Status: GOOD (  21.48  )
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

On Tue, Sep 19, 2023 at 9:17=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Mon, Sep 18, 2023 at 06:44:25PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Sep 18, 2023 at 6:32=E2=80=AFPM Laura Nao <laura.nao@collabora.=
com> wrote:
> > >
> > > > Other than patch 2 and 14, I have applied this set.  The remaining =
patches will
> > > > have to be resent to Matthias.
> > >
> > > > Thanks,
> > > > Mathieu
> > >
> > > Hello,
> > >
> > > With patch 2 missing, the SCP is not probed correctly anymore on asur=
ada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence=
 of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or=
 multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 an=
d MT8183 are multicore, leading to the following errors during initializati=
on:
> > >
> > > 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-e=
c: invalid resource (null)
> > > 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-e=
c: Failed to parse and map sram memory
> > > 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed=
 to initialize core 0 rproc
> > >
> > > The issue was caught by KernelCI, complete logs can be found here:
> > > - asurada: https://storage.kernelci.org/next/master/next-20230914/arm=
64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt=
8192-asurada-spherion-r0.html
> > > - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64=
/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt81=
83-kukui-jacuzzi-juniper-sku16.html
> > >
> > > Reporting the issue so that patch 2 and 14 can be resent and merged s=
oon.
> >
> > This being a backward incompatible DT binding change, maybe we should r=
evert
> > the node name change. Or, the driver could simply count the number of c=
hild
> > nodes that have the "mediatek,rpmsg-name" property, which is required.
> >
>
> You have a point.  Can someone send a patch that makes this patchset back=
ward
> compatible?  Please do so as quickly as possible to that it can go in the=
 next
> merge window with the rest of this feature.  Otherwize I'll have to back =
out the
> whole thing.

I sent out a patch [1] implementing my proposed change.

ChenYu

[1] https://lore.kernel.org/linux-remoteproc/20230919050305.3817347-1-wenst=
@chromium.org/

