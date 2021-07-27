Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDC1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6204960FE4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6204960FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7KHlBIHJSX/eJWUijUHZJbcD100CpEGKt/o1BhY36M=; b=QtGWRCyh2rY/LG
	hftEobD01b0T+BuYb0TCdOrmAkYfNAN0P4IHpD9wFenWzFX/PDMZo8I9LzGKCiO0cpJ2CUWr22+Et
	fArZ86Ovev/0Dlx9bLcRnEL2Eff9wjywBO0db9CtPbRABhh/0OFX5BLL5C+sgEqS04xsrTCLLkXHB
	HV8IN4rneWkc6/u2RvxfWQlwY7fszgwTZnvodRGYPqmHZxV75DujYadENmbAUGMjLjpYEfc0tVAxN
	bZG7Fu11diOkkQ3EwJxce3v0/tR+W+yNy1uyL5dqJoNoNpoFkhpTYs1xltus7LLDA/765+NGTyv9c
	Rm0g6eBKBXw64P0MIyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F1i-00DG7F-A4; Tue, 27 Jul 2021 04:49:10 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F0W-00DFbR-Q5
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:47:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so3194558pjh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dGG7RdUKVnT/omOvzH3kep9Wm/lxv7TRThq47QpIc6U=;
 b=fPBwG3J8Gj98l4Fltb9Yei/aEYXt+b+10cEkqeUH2qfJlKpIYVmENKFdDMnfCmjMzc
 WZR0jfwmpiuDcihSVapgx48UBxugPpFm2BaibyPCX/L8pXurh8eN5TadhNDjTF0mrbT9
 B6IFMynY5O6UZIG80/lsQLdkaNZEMsFtS5v4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dGG7RdUKVnT/omOvzH3kep9Wm/lxv7TRThq47QpIc6U=;
 b=CvSCiNwOlG7nuBRA6AK1o85LaKmSGSfWBUoa0kHY1IzdwCOYz5zSHNq1fcKpGKhg2Y
 iYzy5h/449kEEkYn/EbbFUDaCjpDrefAKudASVgDt9vFt2RBVn/vmpkw0E69lxx3d9jD
 kM7gFoaZU7Xp1ZffrrUc1hekKADq5t2u4lPwWUSKbqlm5EvsqHRTEkOhQI41NgKZ9cBI
 LSwtXjB5gbKpn3Kumrrk4RZzHtG557lpVYNCj4e9aCtxWCcadEQVQaHH1J0CrMLk3tHD
 Mke+8OrRgct4WXIdQF0Tm+ur7UlYIVX2D1PEGxwQqLTLuQ5rVQVTUUbWTWc+TkRZs6si
 H5gA==
X-Gm-Message-State: AOAM531Q8dErFLU0Rc4KGNYQOlKudZ2+F82tXV7ORx4/twXijTO5TYYd
 0ta5dbZzNWPZdS3YxuTyfr3ZvaYn+3WBlA/dWvHf5g==
X-Google-Smtp-Source: ABdhPJySJP+/ZQoBEHFro/AzJ188fCTnIOO/lwuwj0nJAUhz+aPHfYkIzGrffavFmHSBLICxTeAXj4op7J6mUDK/CV8=
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr2401217pjb.126.1627361276245; 
 Mon, 26 Jul 2021 21:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-22-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-22-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:47:45 +0800
Message-ID: <CAATdQgDhiG_Omph14o-Wu79+4W1AVyC70o5Rdq3Q37T4cJ+xnA@mail.gmail.com>
Subject: Re: [v14 21/21] clk: mediatek: Add MT8192 vencsys clock support
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214756_893674_765F5FF8 
X-CRM114-Status: UNSURE (   6.96  )
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

On Mon, Jul 26, 2021 at 7:03 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 vencsys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
