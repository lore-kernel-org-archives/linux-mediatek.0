Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0217C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 04:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuclnzYeNveopGINoAYYFBKbv8upkWfI9n54Jz9FA3Q=; b=DBel0LpjnBk+pGgErip3YVc/j4
	jMW/XKKVF04Wh2noxmilZX6y8Wkob2ZDhw8qTj6KswqIs4H1bJosvxQxZNylfDXURsuto0OEKDx2j
	Nva7PEaAJFT4LONvwlxtDgfQR9n2/lPzT24j0ulTdcnPk1RDQQXnB2TarzQh6ZJotSOS/XoSCiJmy
	8qfPanZQmn1VG1EYPRQtoAB0T3d7KF2kzyI/DMTMY5Pe/uAI+s6XoI+1P9SkYrkJZiuAXbHGwVoOl
	Leat8xdb+k8s5QRKo8qeLrwoQ0cyaiL+VEWOaruu1HbMF3vQjb8LjWObaUPr3iH+luoJPqtgdMpG2
	C+UyI/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kgn-004HVS-2a;
	Wed, 07 Jun 2023 04:22:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kgl-004HUl-0B
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 04:22:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-259ac20bdeaso929940a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 21:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686111744; x=1688703744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuclnzYeNveopGINoAYYFBKbv8upkWfI9n54Jz9FA3Q=;
        b=ObC0mWPSddnKk6l+q9yiBW3W+D5r8oDC8aVEO0gnYPusHnFC7Xyb61LSaFBdM9s2qv
         1dKflqt79dA2/mXyjcQsMp4CC3trIwp18xaFYylZoFeutAXTtbHs/A2k0aIx4gzR+7k5
         VVZ+cV02m3mqtjM1NtVi7pBdLcpJtkjmU9rCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686111744; x=1688703744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuclnzYeNveopGINoAYYFBKbv8upkWfI9n54Jz9FA3Q=;
        b=e5oGwmNdM8tsHMi93idyUu0yPRttuSSpu28p1m4qrVmiuV/XJzGkrWq8dQ3vjf88nZ
         /SCS2p0dyL9n+PuSAFFHY7AfQSMVyxxOG/a01/D+T3ngctuPu/qG87T/+pt37k7Q/FcA
         is9XJd3G0XfIghbRTKsKLtx98GNBvra6euRH4JZIhiaic5Yp/plpF6jMT9Mv06I8tt//
         KVzaP875Xf6WJPCSCRPr2kyDBm7PUgIBaXHCkAoTx8UBrRLD0E2vjhbzLL/rQ4Z1UFFP
         y2DISKeYI8H88dk2mkSeOfIgxl+gYJLc2LcrTyYy1XME0ll13xVEeZC6u/KtzheO1Zjs
         BXpQ==
X-Gm-Message-State: AC+VfDwdwYCDXge1vC9tNdGFQBcgXmK3wj09iYv+nIvG3Zg/GSh3B7Dk
	y7c/1yFgsFmCZYCswuodPxwdhdD2ADf6JY8cE1c=
X-Google-Smtp-Source: ACHHUZ4xDcXnQ6Me0lH6yLdIRW/B47myMRN/uCo39PqunKEWmqsuON7SbzDHfcMcJRBAGTNYiKFVxQ==
X-Received: by 2002:a17:90a:199d:b0:259:3e17:7e15 with SMTP id 29-20020a17090a199d00b002593e177e15mr3920817pji.7.1686111744651;
        Tue, 06 Jun 2023 21:22:24 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id nd11-20020a17090b4ccb00b0024e1172c1d3sm334439pjb.32.2023.06.06.21.22.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 21:22:24 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-65131e85be4so6945982b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 21:22:24 -0700 (PDT)
X-Received: by 2002:a1f:6d81:0:b0:457:134a:50ef with SMTP id
 i123-20020a1f6d81000000b00457134a50efmr1490189vkc.0.1686111413362; Tue, 06
 Jun 2023 21:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-2-yunfei.dong@mediatek.com> <b32b82f5-8555-39cf-9311-017a42b24e66@collabora.com>
In-Reply-To: <b32b82f5-8555-39cf-9311-017a42b24e66@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 7 Jun 2023 12:16:17 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhM26=2FTtVjVvo6d0aWqo+KVa1s9=8xHL1VgYSqkuDvQ@mail.gmail.com>
Message-ID: <CAC=S1nhM26=2FTtVjVvo6d0aWqo+KVa1s9=8xHL1VgYSqkuDvQ@mail.gmail.com>
Subject: Re: [PATCH v4,1/4] media: mediatek: vcodec: Avoid unneeded error logging
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_212227_118917_28BA98EF 
X-CRM114-Status: GOOD (  12.59  )
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

On Thu, May 25, 2023 at 4:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/05/23 03:40, Yunfei Dong ha scritto:
> > Since the LAT decoder works faster than its CORE, getting the trans
> > buffer may be done only after CORE finishes processing: avoid printing
> > an error if the decode function returns -EAGAIN, as this means that
> > the buffer from CORE is not yet available, but will be at a later time.
> >
> > Also change the log level for calls to vdec_msg_queue_dqbuf() in H264
> > and VP9 LAT decoder drivers to avoid excessive logging.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

