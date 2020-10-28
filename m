Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625DBC388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:14:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E89124741
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PEWqz/Nu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JVgFxESf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E89124741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YRgZIku8Cz71sFD1cwChl5XZQUsjZKo+J7tmRAErt2c=; b=PEWqz/NuzJJmmLb+mq420gTDU
	JCSBt9m/TScD2SibsuFqWKjIVpknBmuhKgAS7E3/jvUWbOIxkncwOSMe0PisynhkS1/v5qDTqr8BL
	vlTNTbshYLCO8csU7XlAx4Tdi0dPpYP0AQxfzVgI/j3t7CADhpAHOrn8tDrgEkteL/xO4CmG/x+cX
	QI2LRt6q2dqJy2UteRBUS6lyEwZq4zYYUMJNhSfa+TmUpDGTkFeFoWjhA6J0OjLYHbUQXu8IFQrjr
	wQKfNxQkwDK5omYqMyIOhPnQKPKksAHWzXwKVdQFnkhg8k6e2n54pT8JWIdxjxVZpUA2k6/2Y42tX
	IuaWx3QnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXlHQ-0000R1-9A; Wed, 28 Oct 2020 13:14:20 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXlHK-0000PU-DC
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 13:14:15 +0000
Received: by mail-io1-xd41.google.com with SMTP id r9so5263701ioo.7
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2020 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0YQo4kVcnhVHmUOB0gTZ0jk2nK+H5MUUNH6DtMNqxEA=;
 b=JVgFxESfJtdCSlw1tMDAm4fkeVE2n486thk2/41Xj3ue5Q3tdnbMLvbttltwKPt66W
 hkFPl/7sl2B5R5K+aFEZiKq95heCrpdKTWRoVacDyeXDHcxrGs9o6C9I1THEcW0fBV1W
 9MT+2pvIAlfvbYfGI3kw7iqR5r3CiceCDsvyWHaXsK6uBNYL8cqMGN+ld/R/2pv85Jkl
 Qxtyx4SdEllw8nqvSjb/43gC2gmKX3Ci7s96VwIdqc1cneiyoHFCYtKAku7WLbdMGbqA
 bziy1gfJJYLxn+KOcaslKCTr/u0drlG6kMH8SBy00aVj5QyuFtBtMrMK7mOpdzVk2HnC
 +u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0YQo4kVcnhVHmUOB0gTZ0jk2nK+H5MUUNH6DtMNqxEA=;
 b=Q9eb7j8vs6fwFj4hny9WVY5/1R6lCarqtrgT1Khj7IB2V0IWEXsv0KMJkwkLadjW0S
 HTK7rdIKd/27cC+gl7FOI+4WUZwnrqk4dHeKdhD0X0pnl4kLEaIHBmpRu/D/czv2B58g
 ffimTSqaH80xTVmF9yuP6td2Igrhwc2rXGv8SDu0txH2II+COD97b+dsRFiB9zwK3uUO
 4V22kTnwbViL3uGDzV36R6dUkQbbILZ571y4/7Fq5IcVx5VXbjD9Zo44s4YRT08kTIJq
 E6ILncXkJ7F/tUutUUG9nmary9cZ9fQ1HuDCURZkwEIvoSkERAgCMX3FEGRXdGJToSH+
 Kc8A==
X-Gm-Message-State: AOAM531ka/7vkOV2Y1t0wkEFElGMPqvkpuShGPjcK2elEFYS5jpOLLk5
 aY/vJ1/fJPYO19TNIrFIbgMw2P4X4rgr8A2THx1RCw==
X-Google-Smtp-Source: ABdhPJxhEwUa7d09wLvFmG9A0EaYBwneg9ZuZ/qW/4QMveY6Xe5CKT/5zGwnQYB0pYHfmC+OWNdZAv9l9GA7rS18hLk=
X-Received: by 2002:a6b:8ec7:: with SMTP id q190mr6044595iod.42.1603890852501; 
 Wed, 28 Oct 2020 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
 <20201026172431.GI7402@sirena.org.uk>
 <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
 <20201026203608.GJ7402@sirena.org.uk>
 <CAOwMV_xUWea81rKFE=zD4xWL3rZ5G8cpWm5xJHT_AX=_frLDRQ@mail.gmail.com>
 <20201028123258.GA6302@sirena.org.uk>
In-Reply-To: <20201028123258.GA6302@sirena.org.uk>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 28 Oct 2020 14:14:01 +0100
Message-ID: <CAOwMV_xsjp4on0W79c6-zweY4dON0+gC=Vxao28=WirSZKsX-A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_091414_570450_B6723F1C 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 28, 2020 at 1:33 PM Mark Brown <broonie@kernel.org> wrote:
>
> You should be using the of_node from the parent device to find the
> regulators set, look at how other drivers do this.

Thanks for the help. I got it to work. I will send a new revision of
the patches.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
