Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24DCC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C053E61078
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C053E61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w90CR2ySlnsHyyvbKlxPv1K4JsyncD0OWuA7Fp9cBSg=; b=oL2vubFUBHRMzM
	s/nh/ikYrrJUbPdAAzowLucWhlxX88H/XUYogLSW4F/dYhzBW/1pqB/hrXEWCeiBBHJfxJTNSwhdk
	1nipXbyK++Lz5MeI/z08hqXPp1YsEEnIzCRyf56kYg6OSelT/yTHvsX8qyT9K7rze1bPXuenZSiUU
	OVY4Kd7Ptm3ms//awaV0CkEclrznkx9V2egOj7THJ2QaWnJrEPMPXfvZgsq94x4LYHJVS5YMfRHqX
	Uhz3Nu+KczaP8r5AOp0egemr09ivV3/mpD5DijwwoU6uMFo6q3YD/PcluJsSdKUlUsVMQAMrsSFoB
	MuIJ+cuEm3zrh+D97/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Etg-00DClo-EE; Tue, 27 Jul 2021 04:40:52 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Etd-00DCkZ-E4
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:40:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso3180573pjo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZkLU5+I68BDSpPUBxl1D1RwJQIxuQUsCqbOXE0ZiPA=;
 b=dONWso6Xo2S65eXHJ3a6MOLOGmiJLOocwrJ8F9zzqt+sh1tr4IOowdeANx5B4QRv3J
 uW9rYNyF6I/HJg2TCbpnsogvvQv4aU2gaJTuRnjia9nr6Tzgrs47MsnPWdGxZjgIomNu
 /WRyPRS2yydvYLgsviGGRJSGKoHvDQ6AEdV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZkLU5+I68BDSpPUBxl1D1RwJQIxuQUsCqbOXE0ZiPA=;
 b=kLyAvQzPsntKrDQ36xTC/YcGb/9askcle/YH/FEa95oWmSZRaUCGC/QNXasQEmIu5r
 4EelzvGNEoKbs+lY6o9zalbQ9uxkcnnigPcolFcmn0T4Th8Q5ORbGRrVdy4AeSWbUocP
 NPQn6VoNq0n8Ny/kE3/W+z4/rDjZiWNru3qLQo82aqeZkvXWX1ldCdMYlz8ssWt8Oz8w
 qJOlsX5gJWR8MPswtE5mdkU6tYY6zhh2maVk1KbNLNudUxneCh2SAcQ1oVJ34ob/fO4Z
 tI1lGmwz5khELgSRkSgnrpYOx+1Uxo5pu58zJsY2pAF+WypU/6+oNWR8IjpDF7pvHoHE
 IxuQ==
X-Gm-Message-State: AOAM53053WOFqtGuVvztnAnnE9EOaIZAqLp9bn3Hv/nZDKiW54MPohB6
 2vecGwRiFy86thgmL8dS6HbXuckP5ZsfI0DevbdztQ==
X-Google-Smtp-Source: ABdhPJwsbl6R45nDXufrB/990yLoLfbG3vMw+gUt78UIcaNlMR4EJGIo1SDOVr+Sotax4A15ROr6FzxBbyl2wFCd0WM=
X-Received: by 2002:aa7:8387:0:b029:395:a683:a0e6 with SMTP id
 u7-20020aa783870000b0290395a683a0e6mr10051268pfm.12.1627360848905; Mon, 26
 Jul 2021 21:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-11-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-11-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:40:37 +0800
Message-ID: <CAATdQgD63DTWWq1chx4n3sMEc_Y4ghnx4z6gOa=feFkBGsy4uw@mail.gmail.com>
Subject: Re: [v14 10/21] clk: mediatek: Add MT8192 audio clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214049_532183_89DB9663 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 26, 2021 at 7:00 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 audio clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
