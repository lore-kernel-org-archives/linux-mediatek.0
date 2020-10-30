Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DAEC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:19:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C435A20825
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CenU6qeH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/brQsIE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C435A20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B913UuuCmz7eJarjdcJzpgI8SNf8f4UGEUCmkUQYKMU=; b=CenU6qeH4R1TM6tPZ5/vaFhh+
	z10myeYmohMr1gqalismq01rKcliRRmWAU2IyHlpwRfiTga6AuhUiIJB8IXK16HlrdkOg8EmZ2fUY
	5w1blDbsggqKASYnZtQr+yHKIvdMoOB+EOy8nsJiVTUza0q+kbzKI8hPjL1c21+pTgzUu3zmrpogO
	ZX7I4XIGvAvnWQ/zNF0CSsPj0f/jVIKI268wcTqDoBRmVXQbkhxTpJDX3skqk/GhdqHkUnNGF74UB
	nphK7/+EXuDGC3xxYAizgmGNndhw1RophtvdO4UfV0YGroeqyiv3SpIRPH7f71/ILb5Xc0I4mVo5g
	5kU9Fx2Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYRUu-0003TK-3K; Fri, 30 Oct 2020 10:19:04 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRUl-0003Ot-UL
 for linux-mediatek@lists.infradead.org; Fri, 30 Oct 2020 10:19:00 +0000
Received: by mail-oo1-xc41.google.com with SMTP id u5so1463800oot.0
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2020 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qSrgT+Sq6ixZqGRM1ApDzYbdNLSfueKKt5jrYnIpTKg=;
 b=J/brQsIEXjkMtFsYYqBCMbN7+7Cmh0sjVyNHa6GCk49DXyvdvhr/CvjKzFrLjPezzh
 Ks4w2XDcjvzJb+PPrLEQgUhcZX1Jm9QbzrgXNMykyjrC8K2BKrEoWVHTDkLX1pQBkosi
 Ta+c14qVOgbtbcqoDC7k92+K9+TwjtNqNP4zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSrgT+Sq6ixZqGRM1ApDzYbdNLSfueKKt5jrYnIpTKg=;
 b=DbUFtoIUAqPAIyECxyPrRtRFHEHTNzk6tgIIXY71S+9mo5STFKIjxeT5356iRDih/v
 0WKrnMEHqo5WvAbQNUvMzz7q6Dm6u8PwGjCKGrDo91bYPauSKCUaijdJbBXWVsulFuk5
 vQzKlOU1YlWdd2xyba3xeoMFv9Bs/ZGuDESBfqrxXACnpdhXRtqnVIp+V1JMN8tAii6s
 CPlB0bYWToZCU60EQ0EijlJHuKZ9pgtWHnLj7SQOfQjy2mnuepoGOTiMaU032svYCwbm
 NqDnB6Tq0STfZ2tsYHnuWsSLqRjSHB3rcA3kIuRQ/i+YnRjhG51v1ivNl/gNr1HTe5Iq
 yf9A==
X-Gm-Message-State: AOAM531YULYdJVzuu0jO8uMq7uqTXFIoyqQsjVvyoIxxTyOKP199boDW
 z+phCqtsXnjyleWyyu18bEzG4yctLvOcpw==
X-Google-Smtp-Source: ABdhPJzMDv5vKMKA3PWpHmMby9wm33CTWaq590Cg7uY8GDN1Iran4xpIkXudE2JmNQEyvxaTTjR/Bg==
X-Received: by 2002:a4a:b04f:: with SMTP id g15mr1213485oon.37.1604053132614; 
 Fri, 30 Oct 2020 03:18:52 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id h135sm1312032oib.23.2020.10.30.03.18.51
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id f37so5067239otf.12
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
X-Received: by 2002:a9d:eca:: with SMTP id 68mr1003531otj.141.1604053131232;
 Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
 <20201013124428.783025-3-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-3-acourbot@chromium.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 30 Oct 2020 19:18:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXpXEPsgkWXAo0p3u_zFyYk3kYqKx3=+G6XEcGcsKCEYQ@mail.gmail.com>
Message-ID: <CAPBb6MXpXEPsgkWXAo0p3u_zFyYk3kYqKx3=+G6XEcGcsKCEYQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_061856_053626_076A7373 
X-CRM114-Status: GOOD (  15.42  )
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
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
>
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
>
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
>
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
