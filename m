Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258F5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCgynGq67ALKegDWHOnwBw+W3AAJiRXYWJGBUDwaz7k=; b=qB7EXxaaoox8Vw1YdBGHQCh/ZF
	VZYCmQJtkAaoV4PGq/1yjkKV3YA7wyHCiX9I/0HWmj7l7ojkp+S3YYOnWTwQ1aQZT3qxBWEiQSwdK
	e8C+QdbRK7bbYSbWuz+iRA+iy9bnEiDrIixbZfMAYLlpP9JeevULk3cTJvIfX2ywZsUqpAI5sgmgj
	2qa3mbVFw4DTOKkISu105hmrwhpY3eyLe7O8XqaMG796MQHkmaH9jrh/Ji3dnc+jtTo/F6YP4Ats3
	tZXmr+dOhSzAvl4w1pMdHZdF1GLlQ9YhNl295en0kJjqBqMIZ+YP5Cnqa0bQznYRE/xs8KIq3bNEo
	7pUZulYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tmF-00CjRV-2V;
	Tue, 30 May 2023 07:28:19 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tmD-00CjPz-0b
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 07:28:18 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-45702d3d92cso2690259e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 00:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685431694; x=1688023694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCgynGq67ALKegDWHOnwBw+W3AAJiRXYWJGBUDwaz7k=;
        b=Scz+y1v49XF8CbK1f5L6+O5+BLeaDdOqS7gfMFDV9xOAeweo1APxY9t+6TL2fqiDZ1
         mu3D7zp8dRU2KBgliZVXcrYJC1Zlu3igaZqbKSn/2Zyl+SDgwlJGpcH2eiLpSBCVeB3t
         ISSeQl/vhsKbxBgS4SOghVBiNPTQa6DXKfu94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685431694; x=1688023694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCgynGq67ALKegDWHOnwBw+W3AAJiRXYWJGBUDwaz7k=;
        b=LBnKoynrd8e6BXOe24JWBnaH+P7lCI7Ph6qvEgZXu5ZIhYtg7KVUk9MNGeGqDvwFaH
         /tJriMazULAH3KKtPItt06CdY8aguStQQEwQWOQhV05avttv8DaCGsL7hog4GbGjxAFy
         lNXzGIpcvoea80gBfRR8X06mr8+PfIULsMlpoX1fzCXd3MyXReDPmFQEcto25sSw0KyV
         1JcecLFpUqSSBU5bF2yC/yayis7DsZZUU43KbVw9PmbKlx7qkWJmiXXaEdFQNii+NSd4
         4nR4fCvq29GK29vk1auv0v9V9pE52my6Zef+6eE3tAty9/UhPgNSsaqqaZoqDJTybEMr
         H7nw==
X-Gm-Message-State: AC+VfDxKqBsytnfmpsA7W13mC103ccwLg3K5aFQuGXdb0dH6SE5uR697
	KLeFhEI4kv0HtM9phxkkgAmz/9DM/dYWYP+/GwuRLyzWZkQl5vSD
X-Google-Smtp-Source: ACHHUZ6fL/grV0awl9WykFSsFWLwHVGeiIhqkSVSfAVpNCJK6q5E8S64jpA0MWKklZJMO1VR0bmMP3sKJzadwSXq2Ak=
X-Received: by 2002:a1f:5e8f:0:b0:44f:e6ff:f30e with SMTP id
 s137-20020a1f5e8f000000b0044fe6fff30emr368533vkb.10.1685431694694; Tue, 30
 May 2023 00:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com> <4ebd1c9f-0460-4436-8e17-0e46e88f4828@notapiano>
In-Reply-To: <4ebd1c9f-0460-4436-8e17-0e46e88f4828@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 May 2023 15:28:03 +0800
Message-ID: <CAGXv+5Hd-8e9QWGQ2MB++xjNH0sRemmQnVnAk=CfE8DBhkYZQw@mail.gmail.com>
Subject: Re: [RESEND 0/6] media: mediatek: Update video decoder nodes for
 MT8195 and MT8192
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_002817_248575_D8DE252F 
X-CRM114-Status: GOOD (  17.43  )
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

On Tue, Apr 4, 2023 at 6:19=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Mar 03, 2023 at 09:38:36AM +0800, Allen-KH Cheng wrote:
> > This series is based on matthias github v6.3-tmp. Since there is a
> > dependence in the following series, I resend a series for them.
> >
> > patchwork.kernel.org/project/linux-mediatek/list/?series=3D702423
> > patchwork.kernel.org/project/linux-mediatek/list/?series=3D702078
>
> Hi Matthias,
>
> this series has been completely reviewed and tested for a while, and the
> bindings patches were already picked up by Hans and are on their way to 6=
.4 [1].
> So could you please pick the devicetree patches?

Ping again on this series.

The device tree patches can be picked up.

> Thanks,
> N=C3=ADcolas
>
> [1] https://lore.kernel.org/all/98c48690-631d-1086-9b7c-004c61cc8dbb@xs4a=
ll.nl/
>
> >
> > Allen-KH Cheng (3):
> >   media: dt-bindings: media: mediatek: Rename child node names for
> >     decoder
> >   media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
> >     decoder
> >   arm64: dts: mt8192: Add video-codec nodes
> >
> > Yunfei Dong (3):
> >   media: dt-bindings: media: mediatek: vcodec: adapt to the
> >     'clock-names' of different platforms
> >   media: dt-bindings: media: mediatek: vcodec: Change the max reg value
> >     to 2
> >   arm64: dts: mt8195: Add video decoder node
> >
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 113 +++++++-----------
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  59 +++++++++
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  70 +++++++++++
> >  3 files changed, 173 insertions(+), 69 deletions(-)
> >
> > --
> > 2.18.0
> >

