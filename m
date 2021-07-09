Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9D7C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26360613D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26360613D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x+wRxN9OulonHdgM+XTtiMw6jE8BdRvhCjkWouz4gA=; b=Dj8Eu4Co+hqcLZ
	wT65DiGf/E48k0Aix0xKa5ZV/qoQuNqMcruDhMTvM81+80NbLqf/vWl292Xl0GTMtWgOoPNcSqy3i
	MXW/WhkqHTlXKk/aeuXtNwXEmTKTkciFAI7OFhcExBkMJG0d8QwexoyPYRH8qeEwLViciXE+cRFTe
	gyDzrGa3K9YWmNlcNPcwPc5pwQchGaIIq6vLCAr/ojNzxv5+blKFONQA/OFbXd/VOlzXaA1q62AKn
	OF+M6uCLdksBuU+Zwfp3qrfbJsPeJ5jQ07uIpvKOqyGY392PqFG6St80p/2Zh3Gdz9676wHoGjp5p
	O1pBkKweR8Y9z06Sjcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mTg-001Fxw-Bw; Fri, 09 Jul 2021 09:07:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1mTd-001Fwm-S5
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 09:07:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id j3so2755516plx.7
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/uc9H5zfGGjDARI0YzyvKzeEpD2wOClc3tIHfeaLQnc=;
 b=M+M0yYUEtZSkXRq1SttoHZPElhf5y1HWt6Uqd2WPOVvykCW2uMKJo+dWqB/b7T/uAQ
 fjosM8Kqi5f4SzbPGwYgm4oKpWD1wzaolrW0tjV2nOJFb+dnjxqqmOLl52TBqBzgacFW
 P0+adWQQUibpuf3s3sD9DAyLwdemH1TUc3jSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/uc9H5zfGGjDARI0YzyvKzeEpD2wOClc3tIHfeaLQnc=;
 b=Asqzyyseyb8f8kvSbWHzYDOShEFjk7MuO4YhNC8cyoR7lfn4iIzZXrWWCrz0OV0pEx
 jmdGKTK4G2PGIVv4Z3y/jHJJ9xeuVSC+wZFP7gTJcTQG2AnkNzkihygt3DA0ZsjzhMVB
 Hc7eSV60BGUWA3lkKbE7VGL5Iw80OyTA3ymp8c9f7WPBlMQAX8nCt9bZExkg6byKTwLz
 S6xYcMo0pdr4etQ2JKOP/dmdKPa5uJOKG1Y/fZFdP4ZkbaTqAm64upTliXHTeQHeHj9D
 aona9L1X70KduSz9MZi3T2wC1OteJC6JFq7TTNcoZR9XhQf+caynu8X1IsaoVbFik1MK
 mgTQ==
X-Gm-Message-State: AOAM533Ymqc27DEtr27b/pV028qyfU9xzMNHO/KQaPPJ7GlnFLZVZnMj
 9WbvdM/JMWfB764GuwiCiTO4wQ==
X-Google-Smtp-Source: ABdhPJz4I0POPOVj3Wkh8i4WXpamcrEJC3Grht7ICVEj/onjcRzdIfX2RaRoNse5+ehpA/w95ZtaNA==
X-Received: by 2002:a17:90a:4595:: with SMTP id
 v21mr9612932pjg.202.1625821636697; 
 Fri, 09 Jul 2021 02:07:16 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
 by smtp.gmail.com with ESMTPSA id 21sm4831945pfh.103.2021.07.09.02.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 02:07:16 -0700 (PDT)
Date: Fri, 9 Jul 2021 18:07:11 +0900
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
Subject: Re: [PATCH v2,3/9] media: mtk-jpegenc: remove redundant code of irq
Message-ID: <YOgRv143zAfbrlXa@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wUPX0My5+7gBBo5N0Qf4VbpK96=vS8_F6xrRt+-T9O-3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wUPX0My5+7gBBo5N0Qf4VbpK96=vS8_F6xrRt+-T9O-3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_020717_960495_68B23374 
X-CRM114-Status: GOOD (  11.06  )
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

On Tue, Jul 06, 2021 at 07:00:33PM +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > the func of jpgenc irq handler would not compatible, remove those
> > code.
> Need more explanation about why as I believe it is non-backward compatible.

Right. And it breaks bisection, which is not acceptable.

Kyrie, please structure your series in a way that none of the patches
break any existing functionality.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
