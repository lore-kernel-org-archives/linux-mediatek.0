Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E7C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:18:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFB620756
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0raJUWc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhJZXWD1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFB620756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+EYFr/8YKvkA/sX20r5rFXpGDnhI8Gyc+4cf/UtHKHQ=; b=U0raJUWcLxtYoN7TY/AamJfWr
	n8KAIbZjiHagqA/G3Kx6WsSjWf+DgxGS7u/p+UvaRbFxq0UQuKmuVYLJhXwy1wYeFwHnbdGzJOEqX
	WlyxcXkVzpKSsXQ/3U89ZuuaJkXXqs906TqIOlzbNhwTo006bJGtw8TjKDpBj1efoPVkR3gUgUZ7+
	kg/I/I0n6J3+FupEEbbD1Lwo4QS2xKomRgNSR2dmqaAJA+nkLxMn0WTnNWTJPSSFP7/cQu10QUriN
	qM1lYARnlS+cnGmiHd9Ays2cXKdle8xq/8ycCWcr5zxvhMh1zPc2rC9WSMYrNRSZGNf9I7YgT+YeN
	//tCGgusQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKhFv-0004bq-9W; Tue, 22 Sep 2020 12:18:47 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKhFo-0004Zh-3O; Tue, 22 Sep 2020 12:18:41 +0000
Received: by mail-io1-xd41.google.com with SMTP id u6so19233189iow.9;
 Tue, 22 Sep 2020 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42PP+L0P7UrDlAUQ+gEm/uFRSDGJTrEup5hV3ngJiGo=;
 b=rhJZXWD1dSNuMCuNR0DuR1E444XFj4jI1z6RYDLS2jN+Hu2LfVa5pzhpbNBcr565HR
 FC2hxBx6FbnFbeYNhDyU7b36ah8xStOyNQnwjiSMI9Yi61oCD/3vLxSewppO4vT7tY5P
 dfnwWqj2FLg9P/mmnf0A5BIbYB0x/J/FrW//0Un8GW1uOOR0oQrUDW49b71y0Ziguu80
 /blDFmIl1QW17ucd7C5sygy+aQUq/hDhM35it/Bcwr8QeHpUg75wpLMTFjpeELmgQbQY
 4QKpMVmDmei4AJCBV1uwGWaHV4HYwYKZGa2Oc9F6Azykl8rSeLDl/UiVRrdvE/jSyNMO
 WU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42PP+L0P7UrDlAUQ+gEm/uFRSDGJTrEup5hV3ngJiGo=;
 b=RGW9yKyNCAQbCjpp1yxioh658FpQn0FvIIICDsHKQatJAWHlnsU/ZYdkTYVii3paSD
 rC2O9Du04Cug9b7ZFSAbG0jgIYLO03/kXKpQ5kPGgIKv4aYGexHrCwhvxc5PE05hW3x1
 xMi5kTzhnUxEiKUHRcEAN6ukktMRBRJIjcbv11Ixo7up3D8p8Gvga0EOnoMQ5WG4j6mN
 RwTedgSUVK2c8R+UpLFgg3AU3YcFTKAenk+aav2se2AAFEiXZvPRQWEGR3OVen9LV3n4
 F/miNxUa79e4h5DtsH/AgR3GdAabattW27oReZoBKj6p2OmmfGoojwMwSCePpl6rTkPk
 By/g==
X-Gm-Message-State: AOAM532Uzane0jeOlO6YGJxUdBbijbK5QaVYbAUi2en7PRNhQtRTmSh5
 6+kJf01Wopk3KpYZaozmBSJBKdp6F0CnMzl/zKk=
X-Google-Smtp-Source: ABdhPJxNd1ARfGmnkBsYPcYrgCQe6SpcQ4UoTeAy2LoVim6jeFJ92m2Thejku2YrwvIeFngjWCa9d5eeXg3yrv2xN4g=
X-Received: by 2002:a02:4b07:: with SMTP id q7mr3953267jaa.84.1600777118139;
 Tue, 22 Sep 2020 05:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200922114905.2942859-1-gch981213@gmail.com>
 <20200922120112.GS4792@sirena.org.uk>
In-Reply-To: <20200922120112.GS4792@sirena.org.uk>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 22 Sep 2020 20:18:27 +0800
Message-ID: <CAJsYDVKJHg=CNeomk7FAQXwyc1soQziJk3PLy=M+uYsb849w4g@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-mtk-nor: fix timeout calculation overflow
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_081840_268519_209AFCF6 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-spi@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?QmF5aSBDaGVuZyAo56iL5YWr5oSPKQ==?= <bayi.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On Tue, Sep 22, 2020 at 8:02 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Sep 22, 2020 at 07:49:02PM +0800, Chuanhong Guo wrote:
>
> >               if ((op->data.dir == SPI_MEM_DATA_IN) &&
> >                   mtk_nor_match_read(op)) {
> > +                     // limit size to prevent timeout calculation overflow
> > +                     if (op->data.nbytes > 0x400000)
> > +                             op->data.nbytes = 0x400000;
>
> If there's a limit on transfer sizes there should also be a
> max_transfer_size or max_message_size set (which we should pay attention
> to in the core for flash stuff but IIRC we didn't do that yet).

There's already a 6-byte max_message_size limit on this controller.
spi-mem dma read is the only operation which allows such a long transfer.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
