Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyOFUjLm7EGE5CosJtUdOd81MHTGmHyIGhwB8R0A4Iw=; b=g3h7mrgXat6OXh
	//lc6GVGEm6T+ZkHDfvy3YPmVyaePOG+UHZ4t3VGzmTt2jfEgzvmLSOK0FXBhuACZTYoWHMxvI8+j
	wHIlOpoLMSwv65rn88h99MnQKXHh169o3KHBzjVqnjWGBm2EaRNMpV5z7/ZBKGVslflvVj1FoSbDF
	GpZNM3FsFH0lyCEMSYJNLNYwF7LfkvqWXYGi9d8I7Bc6KdpeAmjCTWzrpWRgbc++FnvLYkeuPaIOQ
	DyQYtx1FZ9yHKe2WOrTw4p2My0HgGfPOTwXANc0c+diP8EHVafj9EvPPBjWw0NCPXRqPzmWuq6Xye
	DFem2+VM8JaDhew4Y9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgfm-005jVH-Ee; Thu, 03 Mar 2022 08:18:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgfj-005jU4-Qo
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 08:18:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j7so7067864lfu.6
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Mar 2022 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=on4cm3w97gy7RevnM2fAc8kCbBYemQ93B0MGug+f2Sw=;
 b=HbmOUBeULRAj4VjhmZVI3EKmNdxqiWcxb0dr+4Kpd3Uum3VcFHkK4pe8+KHgkMhEwG
 XEhHYFpvjPm4aiqP904xnKALwPNGd2RH8l59cDmlnI68h8iSOcWWegi1H5Ir8tSZAbFc
 m61+tI1InDj0JEM9IXyUtSFpJN7s4yoRuKDdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=on4cm3w97gy7RevnM2fAc8kCbBYemQ93B0MGug+f2Sw=;
 b=ozO5akCVMXqXfXwXn5r4+pWz7GQLlpWj9Q0FkNq6bKPnZHf8LM7GDtvoWCKoSdikqX
 g3nE1xYmpQAv6WtJDt+3C2tLCzf9+1rqSE5WDkV4zoBDa1Boe7T9IYBWJ8jZ7HlUvtRC
 2qs5FgpB/a9Z1rOU/8LVnIxP/9UriVxP+1dMkBQ8IPtPbcCYt7VmwKlkjqejKog2okYb
 id8Umr7nc9noBNTvVILIm5GbtUncjuOTsW4S9Srn4ax/O4u50KmJXbuXGVBkSYhY1hhu
 lIUx/8tIT0id79HfViim8LngPmNKD/QZTJ1la3btFfJNODVMhl7bjx+AZpqYOpoc2/hN
 BTng==
X-Gm-Message-State: AOAM533QGinl5VZM9RMZs8kksYsFaP1ZAyuiOUZJliiVQ6oBlKOlMWZk
 xVb9luaoUUMDBuNY5AXs1BWr502Na8wOCETOAUSa0w==
X-Google-Smtp-Source: ABdhPJz7qOkcs9NrVpx+qNqlVj4sTQvZ7OlQDyiM5QuV1qHK2lks0edta7sb7odh4BSvah8kBcAyY+1/w97q+jW/l1Q=
X-Received: by 2002:ac2:5fc2:0:b0:443:82cf:9603 with SMTP id
 q2-20020ac25fc2000000b0044382cf9603mr20717684lfg.142.1646295528442; Thu, 03
 Mar 2022 00:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-5-johnson.wang@mediatek.com>
 <Yd4yy2emxSSh80UW@robh.at.kernel.org>
In-Reply-To: <Yd4yy2emxSSh80UW@robh.at.kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 3 Mar 2022 16:18:12 +0800
Message-ID: <CAJ66y9F67VNRWE3JsCqnX4AFzd+R9Y9WJHoxnk_t7u2rHhuimg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: regulator: Add MT6358 regulators
To: Rob Herring <robh@kernel.org>
Cc: Johnson Wang <johnson.wang@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, broonie@kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_001851_897015_B07B37BF 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, 11 Jan 2022 19:45:47 -0600, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 06 Jan 2022 14:54:07 +0800, Johnson Wang wrote:
> > Add buck_vcore_sshub and ldo_vsram_others_sshub
> > regulators to binding document for MT6358 and MT6366.
> >
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >  .../bindings/regulator/mt6358-regulator.txt   | 22 ++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Just a gentle ping on this - I assume there's no actionable item on
Johnson's end? (or better to rebase & resend?)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
