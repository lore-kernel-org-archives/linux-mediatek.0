Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488C9C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 05:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F246C21655
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 05:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/iDy3J6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iTL5r5Eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F246C21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyt4OdS+q85TmGf25E2jlY11NlwZKNRxF3/vF4r9Zd8=; b=n/iDy3J60WVoEKpOgrYiVc5to
	YrdV6oWvBL/8+GesUJExarlo2+oCXNih0RfjpqTQ40mfNfTqClcjlI2IAU3pnvAuF1vZB7mOce7xw
	/KzTtTFNArullJ71S7YYpO21J8DhB80gynyu0X5r5a/cFesvmeK/QAtPu3bhl0UoPM8LfNzFtmAXt
	82U1K+byov1Rqzgo65wM2cnUM96NwZsJTwUmp4gaiZFjqMYRYVBVfKmSuwvHS+EmEKuUN0hI7/A5M
	Qd4vHq6g5PkGWQfgfyiiDv9A+Qv71Vwyqw/x4zu/IrMWaKqs12OsWkklFc2xDJdoicUW/3/WACbTV
	rV9OxofUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIPxL-00010o-B7; Wed, 16 Sep 2020 05:26:11 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIPxJ-000101-Nv
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 05:26:10 +0000
Received: by mail-il1-x144.google.com with SMTP id t12so5304166ilh.3
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2020 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhiY7Y2GDkmenr3RW8iCKeFZ464yhM9aptv5gXYqCGU=;
 b=iTL5r5EuBx9aGAfOuyJXdtu034fcXzIWs8ucYLZk+fXWI9z0eRNlfFWyZznLYZcV0b
 g8DS+T0jgryHAUTeN4hhM9e4ziCexjJiCmOIWcnV/4p9ddpOxdJXmYb+W9sMK3BlJ1Sg
 qLrGcXRa255k6AhXlk8LJTfft/pVtcDF61LeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhiY7Y2GDkmenr3RW8iCKeFZ464yhM9aptv5gXYqCGU=;
 b=TYUnmJkvzeIqy82rlKEEdtcI0J90jcNsgguHd3MocSAeQwPG0kVzZxYF33oNogVTsI
 XjFxMo53tcOHvG6dFKDnEZbxde/XxsNSG3lzwd47qyino0cP1vAaiscO94vyOnzzqhQn
 vJCHQtite2EaWBJcNeaWk45aSoAp9abRY9OywqzW3gyfxrC4uS5X6B3KFNa5YTuxVoj0
 Jm+s9WkBHeV6d5miXwQVI0rJs1DoJmEb84dWqsMZMpfL8KJBK2zUL0m145uwP4Bhndmv
 PFQBDdOObK+od7UjKddKIiHAhtN8nKunfZdRE72e+7ZYsMouA9YLuKjeQrASDmuGM+K7
 4lgQ==
X-Gm-Message-State: AOAM530XCFw87P8q6lldavf15c9zs3HLiz7/GiUtBqHdZcQOaeA8MqS8
 nESCxvxhlKbszYAusLUpLUJ90oewPUnCNZ8pMOAVAg==
X-Google-Smtp-Source: ABdhPJxT8z7WIBS7kuiEGh3KSqXqCOJVa+EVNITfmaz6yxcucn99yBZvsWJeomWYLsO8IIK/ntQpfj3QX1Wb/reJfbM=
X-Received: by 2002:a92:5f94:: with SMTP id i20mr672574ill.106.1600233966837; 
 Tue, 15 Sep 2020 22:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200727074124.3779237-1-hsinyi@chromium.org>
 <8aedcc7e-fea5-367c-e3a8-8a013cf629c1@collabora.com>
In-Reply-To: <8aedcc7e-fea5-367c-e3a8-8a013cf629c1@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Sep 2020 13:25:40 +0800
Message-ID: <CAJMQK-gA+N16RCeG7Tc+pO04DLNYamqDH_pFj7t+WKww5_M+Eg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: elm: Fix nor_flash node property
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_012609_842093_E2FD62BD 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 31, 2020 at 7:21 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for your patch.
>
> On 27/7/20 9:41, Hsin-Yi Wang wrote:
> > bus-width and non-removable is not used by the driver.
> > max-frequency should be spi-max-frequency for flash node.
> >
> > Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
Gentle ping.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
