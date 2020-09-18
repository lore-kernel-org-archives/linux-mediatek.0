Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B472C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 01:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F064820659
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 01:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8nllwbv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ExnwxyuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F064820659
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NAVDqicT71J6rcRg4WWITjviDG3jU0SsnXNuFtz3N8Q=; b=G8nllwbv0JyTsKELQ7xJxgnnv
	kjIzoWiLI+hs77cQxAZnb7ZFYceIYzzkuHogn5eUTpxiaazRFrJf4yzRfi7Yp0gMIV4zC1Z24KMGa
	o+lMzRDOu8VvlluYy8OuzCOVpj8BvLc82hkF5eLpvvMPTMLJpwga54W5zXshjOVKhQzLk30tgxgRo
	VxrksXPPsdFadYb2RDmxjqHHJdvQSfnbSsd58HFje8ulAjx1sYQsIm+ATrJLGb+s1H3Qj8c97CxMb
	IWM9jX0uqa1cj9pF2ytKTXcfe2IFIejcuKMRj9bpuj36oXUNQOW7/PRlsLnSZd9fpfZiW2SXCwp9g
	zaspRvH5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5IK-0000P8-Ch; Fri, 18 Sep 2020 01:34:36 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5IH-0000OG-OB
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 01:34:34 +0000
Received: by mail-io1-xd41.google.com with SMTP id h4so4939134ioe.5
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2020 18:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMfYmzq61BMVuIay6MAmJ92sX7yw34AC1En4dJC49nM=;
 b=ExnwxyuOZ5QMOqFjrHje1iqNp6G4EN6OIn/hhbVXhERcc2Hj8jQQiDqUgfcjXqbKJR
 nJC6Iap4LGotN7XE+YqDuuwkJusdLs1MoPK67eMhwgsxsxdb9iVWcyUiJxWREwjcA3BQ
 2D7GL9kz6Uw4uAtVWDLsPTZO6/5Vei+rvdiA8Fmit419cA8HElorA4GgkoWcfxv5knOe
 c8JqlY1WTGcOHnr0Fa8ouqQd0wNtZEgRFFMHM80XqZ3sgimqtx20knjoAmd9Fj16mckd
 5hhZoUa1rs/NlRAVfzkDmNM+D8g9FPIcEXYyGYmM6NzLkl13Xkt5M99Ds5lDAe9gS99E
 xHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMfYmzq61BMVuIay6MAmJ92sX7yw34AC1En4dJC49nM=;
 b=Q5spVcJzDhz9ujFrDqoJQ/1Qw/GoaWn9VygeGx/mBW9VdxSX0pEzECQnvLiSCbvwr8
 Koc0KZY0kMgYsY43eIGv+FusS3/uMOfQGXBQfy8esHlabDyFUkl8sXxvFc0RIEpMON/H
 OnPRRIYGRHb92TjZrk8FXzGXZ//ivrGqVqK0pgn/W/9zZj7ePVpEO8bmhS5LzmpPkXcz
 Uuy73atuoJ5k0aG+7YoGwsNE/DhAh+RFWlB7Yvpvvg/EtNNM7fCia9BDctPdk9X+Fo7W
 rnHBw6+KhPK8+MypMtNXZHacBnbyKCUi1UCv6AOdH175CTh03TS27gCJUFaWZGdn5oIo
 cxcw==
X-Gm-Message-State: AOAM531C01vUutKPHcMwgCSsDMmDoMUqqljhGdEHdSGZLL3PnX6zCv8K
 f2lkM1wCct3Gmy3DynJAkQsb3CkCU5nAG1Pdp7e2Fw==
X-Google-Smtp-Source: ABdhPJw66SDlFRYI+47lgkH0zEhjVFqIUONt1+UdZYGerOhsCrn5ST22s+desHXe8eF/5qzEZsphVeuuWKzN1TY5lIg=
X-Received: by 2002:a02:605c:: with SMTP id d28mr28107291jaf.12.1600392870588; 
 Thu, 17 Sep 2020 18:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200917063047.2875693-1-pihsun@chromium.org>
In-Reply-To: <20200917063047.2875693-1-pihsun@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 18 Sep 2020 09:34:19 +0800
Message-ID: <CA+Px+wVLBgzXm7FucaPpHRZ4+XeH629fPZYBZ33RtPSkaN9Fsg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: Add support for mt8192 SCP
To: Pi-Hsun Shih <pihsun@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_213433_812329_7AE8E6BA 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 2:31 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> Add support for mt8192 SCP.
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Has done 1 round review on: https://crrev.com/c/2297082

> +#define MT8192_CORE0_R_GPR1            0x30044
> +#define MT8192_CORE0_R_GPR2            0x30048

Remove them because these 2 macros are unused now.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
