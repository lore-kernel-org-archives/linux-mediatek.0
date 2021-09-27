Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2605C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB60360F3A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB60360F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1ld9+N7+UeskCAJUPz/LkF0HlVDya5lAVraXLEq/lE=; b=J4iko+MMfG+M9V
	v73iR1bWTOfC4L8rIYX3sdH8at9/z68kGDgNZJeSzSQzJfDHz9+Oqib2yIRUO/gvIuqNvzHxVAQKY
	YyBOF/unwALsmr92QiZhWCoYZoOQK35tqKcWgCr0J6rg7kQ0rIWWjCOJlOWQQX7bJ8EREjWYn7jR6
	YJMqS0NpaJJ/YJmSVNatrznlqsXIKwHKU2b0RJuZIJoc8a/WbqxSIHn+z7j2fCCRtsiz17jmtAsO4
	h36kA5zlQQF7HFI/MFmhU3ZMcXaz/Bdyxm32vjG8ydACYmuJWKiACUPf04g6HuCGmD7xzRzzVO1lE
	OUK9h9m+MHf1opOEAq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUu25-003U4Q-SU; Mon, 27 Sep 2021 17:03:13 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUu1q-003ToL-Fh
 for linux-mediatek@lists.infradead.org; Mon, 27 Sep 2021 17:02:59 +0000
Received: by mail-qk1-x732.google.com with SMTP id 73so37637463qki.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Sep 2021 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
 b=DaJH5fJcZaPTWSS82pjbCuzrmgUbbbI8rDumgBGUwFhl/oYhvIG/pZqFDRqj3etyng
 gynjZU/qESEM03OCs4i9F0KxLfb9njtq1177Zhh6o5nIU4Ak6ZFaHDvNbgLrAZMWuX+7
 /vo8yFf6ik5YAvsKvs/gkABlt5Fb5DP5jWTCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
 b=HlEUDyq365M6MjZP3uDTlaHyrJGNWs+AwAuHwE3b5WgcowmtfsFoE+RXNkyToBIXZg
 eZhElHgP1KhOfmy7XelO8HfFciWPFEcVbODtb2McWFwU9q3j7P4vz7uzkCTYLiiSFDZ7
 Px87nwFbInX4u4K/zVjMyWeMhhA6kBjLDNHZboEddAg+ThaygwZHCQqj1maqVMNS5sdf
 CXu6yCYyC94QjDxTH2LzSQ27abmkMCvs3xk+UKqJaaHCaxdcIuriBt8QTM/xJCIRMU40
 NME041S+4R197JL2KSgAb9BqwJVANc3BksWLr9+oivZGghRGEYcRaCcOTLIg4nRJMQgc
 OkEA==
X-Gm-Message-State: AOAM5305ENEq5Df36UUoJUHd5fCPbTL563cb95F/sPgRXw0HrIP9M1Yh
 /CdULkbE3G2uAomfPSox3CrCbvb4ffnLQD6u9pKECw==
X-Google-Smtp-Source: ABdhPJwBRvTBeyV1410Jpc8AMLHK25Pf6f0uExAdgdt+d7oQNAG2MpwCW4ToDnxi98Sln0HasYsHB8qhK0klEJITwTM=
X-Received: by 2002:a37:a087:: with SMTP id j129mr979840qke.253.1632762166561; 
 Mon, 27 Sep 2021 10:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
In-Reply-To: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 10:02:36 -0700
Message-ID: <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_100258_540061_0AD84BB4 
X-CRM114-Status: GOOD (  10.50  )
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

Hi Ezequiel,

Thank you for reviewing these series from Yunfei!
This series is one of the main obstacles for us at the moment for MTK
so please continue to help & support reviewing this series.

> > According to google's suggestion, it's better not to use v4l2 async
> > also.
>
> Hum? I haven't seen such objection on the mailing list.
Maybe coming from Tzung-Bi?
Yunfei, please let us know.

Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
