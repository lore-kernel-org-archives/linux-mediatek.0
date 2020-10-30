Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E3C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:18:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CAD020825
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijZ29vT5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DvmaArxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CAD020825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pG57mrc80sWLhk8cOkcNQvn7Kibok/16XU2haptAlRg=; b=ijZ29vT5oxovLHrwruPXe4Bm7
	obhMKJC3xg0EA2vmyhqrFEmuZ2JlXz60Bklp7kpn2JEYtue4N4+5sx+p/1qiraAuvbzjw2GoONPHN
	Wg27Qi6yThYmrDUqvUT7oI3dN8hSGgJFU92DNG8nvf9kmpds1IIU3kJ/VlCZd6IySvmSj16IJvwZ/
	MJ9iV3TgO6YiDavL+6raz3N76OTTQh00xuuBHLEZg+LVTjoIVtCXgQiJAnH71sAtjuB58snuU2mrF
	T/yHzOlZzcxSCi2dO4Pm0R4jluNLjJN399pC+2pxOyJwJdzpObVEytWBh8M56V988bEB8ocTjsjfh
	VNHsNX8Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYRUN-0003FU-JU; Fri, 30 Oct 2020 10:18:31 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRUL-0003DW-WC
 for linux-mediatek@lists.infradead.org; Fri, 30 Oct 2020 10:18:30 +0000
Received: by mail-ot1-x342.google.com with SMTP id n11so5111567ota.2
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2020 03:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IwY6FSEEQBoBQdBLoaBkXQfT/X+1XphfDMCbhC85FPE=;
 b=DvmaArxE3OLEtqflsjntfLlw/Wss53+p2/dgBLUeQywMt9TgtmFviI9Ck1dtZoxs0S
 osEpDNFeaFdOpCvTmssUE0GQLkrYE7+2oesIMZe3W7dBb3WC9jZOuo94KTIjnbM2W3kP
 7hevmXm2cfinGdnEnBdAJM3QkvRQc5FGjF/jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwY6FSEEQBoBQdBLoaBkXQfT/X+1XphfDMCbhC85FPE=;
 b=C7MtHuivxMnfNTeM9CGT08ThSUXL0BVLTlIpt9rWbwCvZcZ+vvhqdv3GdiVv42e8YK
 exJkOqlXP1dnDcOmQ1GZUxrRzBNpNISHWLplojgOkaFtsCqR6FfOr0gUw8MacRJZXpwZ
 bzMB+YYeuZjPFhD2OG4on/p1NvV/GzIZbdjA4+MI6I5U8E+MSZSw0crdF4w1MxgN5sML
 N/OhhS1S4qx0IENBRZ089y3+HH9IFTCEu1xcdbMN7u9a7lycUlsLVSoNsAVo02M0owQ+
 bpHQHn++Mh4J4jggXp5CoyR32AD8RDzzeYBBQmUyL9NFF/CKa7kOWnBCFRQFwNqwg6ty
 wLOA==
X-Gm-Message-State: AOAM5326AoLwlWfYVx/SEsOSv5fgnf3G2MlQfiEjpmOkFWBT2g2eIEmI
 xcuUIuvO8dI+80ebIuM8/G/amcmfBK7CLQ==
X-Google-Smtp-Source: ABdhPJxTO847QG74GP1b+9SzkWhQ2XAM3dRQ1wx28HvsrkM0Wj56AzKyPSTHcOq2Ws0dQee4Oex68A==
X-Received: by 2002:a05:6830:3092:: with SMTP id
 f18mr959946ots.357.1604053106402; 
 Fri, 30 Oct 2020 03:18:26 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180])
 by smtp.gmail.com with ESMTPSA id k85sm1320118oih.48.2020.10.30.03.18.25
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 03:18:25 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id w145so485635oie.9
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2020 03:18:25 -0700 (PDT)
X-Received: by 2002:a05:6808:95:: with SMTP id
 s21mr1001625oic.55.1604053104887; 
 Fri, 30 Oct 2020 03:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
 <20201013124428.783025-2-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-2-acourbot@chromium.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 30 Oct 2020 19:18:14 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUscqohRt4v10=L+yM0KO65Ny6DskvG5V549YByVDDgbA@mail.gmail.com>
Message-ID: <CAPBb6MUscqohRt4v10=L+yM0KO65Ny6DskvG5V549YByVDDgbA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: mtk-vcodec: move firmware implementations
 into their own files
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_061830_096181_27AD8BC8 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 9:44 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> mtk-vcodec supports two kinds of firmware, VPU and SCP. Both were
> supported from the same source files, but this is clearly unclean and
> makes it more difficult to disable support for one or the other.
>
> Move these implementations into their own file, after adding the
> necessary private interfaces.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

This should also have included a

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")

Sorry for the omission.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
