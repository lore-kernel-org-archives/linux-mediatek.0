Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6BAC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:28:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115BD613CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115BD613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoKoVvnuouUSZ2jvkGRHBNJ1/nEnxSCcsViA04XgEwc=; b=2Mgpx48fGXJH0y
	syn21/lhT/WJJVbjr6CtCV7k4Dk9vLhRfqx9e1GQgDO9Jo3GZGLI+wm88bocRRpHFuRq4ufdmhM9m
	H1VoVcmHy1qUdXameTaFWCqcQcEoKybaA4qVGc1D0cmpp7YhRIti7XsHxcoOGoxKjl0QKnmymebWU
	LW30rkG/U80mvBA7mPB97C5lcnT85zES4a4X0CPVwp0u/3UvB+ciZ2rJCrsqbS7sWdrELMY02movG
	sL/Xlwv326xM4wGoZ7USFVsOwit+ANnnlBCP0DpwlhSkMmHlukScLYwN6Z+PzOMhi6S9CQUTzQpse
	cSTFiE+WEjf0rm/7jwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1lrT-0017vM-Ug; Fri, 09 Jul 2021 08:27:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1lqm-0017lK-Du
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 08:27:11 +0000
Received: by mail-pf1-x432.google.com with SMTP id m83so417589pfd.0
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yU9Twe5lXj23b1mNka/5xOrpyF7ZSTRqoQCTkjEokB4=;
 b=LIfVVMZPNUHjO9GLLsf57mvnfsctNvpBsj6fgEhwtEMYU2QPQ6BXihMW4SZkVW2q16
 Qxmr/bSKL2oMkgNy53y7JgditJt9aOU8Cd84q4+Vrqw63I36+wpNdi9w+PutgmATOf8b
 7XabHAsqBzIS7zS4SnDN9sLqcex4HGp2Xy17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yU9Twe5lXj23b1mNka/5xOrpyF7ZSTRqoQCTkjEokB4=;
 b=WlwWrFHovbJuU/MYfcmdqpl6nOtHRXqX6fk95SGI3bZ6uNIgugts+RckoMMqZYXDOO
 IB+9ZVo1ootASOfowIu3Bdcnc5GJbpKBS42W07BL4igUZXs1MgkgpAkMvZWf7db3eDN9
 fAql1HVyRKtPT3w9ktwyGf6ChBaVfISwinuXQTK+yQbA6Q4x7dXxE+2CmaZvHOf33uyI
 k+t5pECG4S7vGJCPmUsdd0sIogtnrvitV13jSuGDOZXYjzdQEz8Jfrr3AmxRA3rR2HCO
 v2oG5NagPu9uY+tyMAu17TtsTqCwg6BISR8HII+xoKZFWNDWa8PcYm83VsmSYcrYsJr8
 L8IA==
X-Gm-Message-State: AOAM533kL80N/q8qHdTfOFhWlsHBL6IgoyNLhQnK9cpJP+kZCXV9RX31
 ei+qZucrXr82qn0VIu9hlyZzyQ==
X-Google-Smtp-Source: ABdhPJxk6FrpXb7jO30ZusT2cxQ16M60gq3kw3CbQwTLoJvyedQynzhdP7rkgXhS7oB7FCkbYSPS2A==
X-Received: by 2002:a62:1750:0:b029:328:9c55:4f5b with SMTP id
 77-20020a6217500000b02903289c554f5bmr3424022pfx.6.1625819226849; 
 Fri, 09 Jul 2021 01:27:06 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
 by smtp.gmail.com with ESMTPSA id cx4sm4143678pjb.53.2021.07.09.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:27:06 -0700 (PDT)
Date: Fri, 9 Jul 2021 17:27:02 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
Message-ID: <YOgIVnhdZeK/FR2q@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_012708_519964_A3B3BE0A 
X-CRM114-Status: GOOD (  15.89  )
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

On Tue, Jul 06, 2021 at 07:00:17PM +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > add component framework to using multi-HW for MT8195 jpeg encode.
> Could you add some summary for each patch for getting an overview of the series?
> 
> >   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
> >   media: mtk-jpegenc: Add MT8195 JPEG venc driver
> >   media: mtk-jpegenc: remove redundant code of irq
> >   media: mtk-jpegenc: Refactor jpeg clock interface
> >   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
> >   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
> >   media: mtk-jpegenc: Use component framework to manage each hardware
> >     information
> >   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
> >   media: mtk-jpegenc: Refactor jpegenc device run interface
> The series has some consistency issues which would make readers feel
> uncomfortable.
> 
> For example:
> - Whether to capitalize the first characters in the commit messages/titles.
> - Whether to add a period at the end of English sentences.

FWIW, it's not customary to add a period at the end of a patch subject.

Best regards,
Tomasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
