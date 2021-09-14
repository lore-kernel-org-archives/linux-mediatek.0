Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 04:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6709C603E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 04:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6709C603E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0nemgzMvaRbQNGJRTOAlHdlisQPyyha5UqlfLrbG0Y=; b=2KV+OwxEzg4B0/
	oSolbvEnine8NaKkY9TLQ/z9QPshVkg3raslCsolsdyY8ZYDUsYM78FJQjHq2hN/rQrgRzJrm5SoC
	GHajIuQGYMWxslTxVIeDpSl0aebhKWDMOHYDdIJVmYt55xEbjPWdE8SLGh9ulId1gsGvTTsAZxAaa
	Z827SoCQE2FiXb2qipdKTcQb0xfAJ6qsBsSOrmnK/woGwFLMLcmgIsKatiOcdLeRxbXVL9nziE1k+
	F6T8wuPSK+CmruOQ89pF1JlmZzN6dRP1bdVgrkKrC2lWFM5iOmI1t/ZKmROFfE7IwH7G1DQvdn8L7
	MRCSDrWZJZS0F0uzB4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzdN-00485X-Vb; Tue, 14 Sep 2021 04:01:26 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzd7-0047yl-MA
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 04:01:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id h16so25731968lfk.10
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 21:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqV90RnceA3yUtnO20ku1+cBNKzKF42y3vDyfuFCg6I=;
 b=aymb2xNw9MWDQ5r1YExaL02R2WTT4y3lbBNUJ8uNopNlkPEkkjyy256PCafoeS7q7y
 UKpbxQcBXuQddeingdXPXg3aneXtL4WsuplQpEQZA1tHOcs+YufO5uCYTpjrRq27gWL5
 BG0InFWVu3lKlC/PopTnD3xQ1A5NdkHpqMkC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqV90RnceA3yUtnO20ku1+cBNKzKF42y3vDyfuFCg6I=;
 b=rIW7ITZchJAmWS7XD4y8Y5JnsbuaRLXAJwfd068URVtWnQLFFrb416YjYmKoVFadKs
 I5orKzgRsuLvS1fZ1tTjG9jTE2z5Jdexq6rUK0iWtPUsy3NB3Z2KCgos9i+FhWl0CAWP
 Z5KwileHiCogKYRKfAWDT4qxnXWse+XOrjOFwD8bNrxNcyAzsH5IDBnBDpR53ppLCDlk
 j6wpKOZ3EcEh6vFipqx74JD3S6R6ztV27i1Bq4VW8ZAn2RuwImKVi8fCo5Wz8BLG9B+T
 5vwN0xnbAV1sWRb0hlCrhJj2LA+ntENUbScLPPyDmvokfQ5ZYsE4YxyBNIN6u/o4OziQ
 j6cA==
X-Gm-Message-State: AOAM532vaEdmFMxE+2zdQZPELvUS81UnsfDOb5mDoTYI8eS9Sz7AIQas
 cC1ITT67/6bZr5mBNIHucnX2yQrJeAQ+u65oLUUOHg==
X-Google-Smtp-Source: ABdhPJyXt6wQvXH4+CYasTSE55XYxX4nwPX+R/D4dbFHy4B3qEDKTJWWK07WS8HP4DQqmeU2wX22v89UmPkH5YLwkHw=
X-Received: by 2002:ac2:5d71:: with SMTP id h17mr11277423lft.670.1631592065978; 
 Mon, 13 Sep 2021 21:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-19-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 12:00:55 +0800
Message-ID: <CAGXv+5HWT=9EzdhMvmHOS8Y+CpLyn5WZht_KP_YxzKG+x85AtQ@mail.gmail.com>
Subject: Re: [v3 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_210109_770401_E14553FD 
X-CRM114-Status: UNSURE (   8.83  )
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

On Tue, Sep 14, 2021 at 10:18 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
