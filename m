Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1812C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:45:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D22B61970
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D22B61970
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dpl58mdN0gWhUdVV+bytyeoyY0LvmUqflhLonF1weKE=; b=acyI+4YZDwG7n1VeUn6CKfZzC
	0rDdUtWUO1YCyN0ovGkAwPaNtsGaPe+UuquSTvZ0pCDsSFxkZBLx/ab3fz46C8hFW7u0D82AQFx2X
	/eudUvqn8oBa1e78GmKXR0jowHk9n8bWBH615z59ZfwmHg4IqkQnZkwvJfpxsBiWg6GNZdvW4Ki5z
	411sWZsF6XhLlwV/TFLwpFFNi6ViLMH99B0tJg7Pgpex+ORc0F1Vx80nsDgFeNjvf1HgcdFyQGu/1
	GJCHay1j/Hgn9fXpFzm4yUu3MvJABff0PWvnKClZOkEczpYTjKTur6d1NVzLFWUqA5Gf+b3e7mXTj
	OuIfNMW4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwsO-0016bW-1r; Mon, 29 Mar 2021 18:44:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpQk-000atn-Sw; Mon, 29 Mar 2021 10:47:36 +0000
Received: by mail-pg1-x52f.google.com with SMTP id i6so1990871pgs.1;
 Mon, 29 Mar 2021 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efW0R7xutPE11DBN9SEnqyt0zcFDSwQ/E5/CXYn94wc=;
 b=jPQsgKEHQ54eLWy6kIy7wl774HD78Yf7Uu148O2sQGcjnSPcNidouj546G8YPuZ2IE
 jlyDUPDwM3WJU/73kMgBQQHdWDDfGXVQ9+AsSgwrJq+ISqD75xZ1g98PoaO+akx4N1S5
 TjC2qfVV7dtr9clYzL+R0vEsyG5R4YtuXdVVV4lcc+OnHy+wq+Fp+oQvxNpSCCt8Tr5Z
 ATtVJrY7I5p7CYa8HqHEwBfUb6TTuxICAQ4IsB1mfOSPGG5BWJYet0B2s6HzWJ7xnjJB
 fllboH1x672YqaBjLozbbsIev2AGse7RUwKpsU3Kf1MRUxBMHlxRN9KStyuPEVLzaATm
 SgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efW0R7xutPE11DBN9SEnqyt0zcFDSwQ/E5/CXYn94wc=;
 b=LQzdhTEgO4MsA+WPZmvnjPOpQw2URgPrgo367k0Nr/oR9GtB5GxrQ5KiVIGNOVGX7v
 1FXA12wkI1zbjUt6YJGcXKWuzwqsF0cyILbl1Dh8XoFtuY4p8tclsiFKK+iUsfwYSUbi
 xajgeGF4vJU3dz/+J0/FursxVGLfZ6q2ovwZee4fblA2SDTL/eZ0Mf4Quzp2UO2BT1ZZ
 vYJ7Rt/Gsfkhiv0/lc3XWhyqYMtDQP3FtcSzxMAe5UUrU5dQ+CSYrMZg6S1HxjBJEwIl
 ihnDpOy3VJ0+lCy+zBNemgwvdaSopbAYoxFFyoDAZm7J+kUNsnmm5yX0QUpfSGxoVkyE
 COrw==
X-Gm-Message-State: AOAM531cLRuffyarMqFbGvPCWMCNXYxh4JSPVHhlo+oZfte0bfw3EW73
 GRZyoHZiM2VjJJBwbbA/nM5Hj9/9qG0958XZAH8=
X-Google-Smtp-Source: ABdhPJxMpWibj/NiiDckZKIUVfWdqK2DbteamjvUT/Dj9Gzk+zF1ZnHWE70UXL5z3KO3CrN27HHdjwpoUKj/lzYf01U=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr25140695pff.73.1617014853376; Mon, 29
 Mar 2021 03:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Mar 2021 13:47:17 +0300
Message-ID: <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
Subject: Re: [PATCH Resend 0/6] Mediatek pinctrl patch on mt8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 sean.wang@kernel.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, jg_poxu@mediatek.com,
 biao.huang@mediatek.com, 
 hongzhou.yang@mediatek.com, erin.lo@mediatek.com, 
 Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com, 
 Sj Huang <sj.huang@mediatek.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_114735_200142_77F6E2B9 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, Mar 29, 2021 at 11:09 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This series includes 6 patches:
> 1.add pinctrl file on mt8195.
> 2.add pinctrl binding document on mt8195.
> 3.add pinctrl device node on mt8195.
> 4.add pinctrl driver on MT8195.
> 5.add pinctrl drive for I2C related pins on MT8195.
> 6.add pinctrl rsel setting on MT8195.

You submitted the same version of the series twice, but it confuses people.
Now you have to properly send the series only one time with the
correct version added and changelog explains the changes done between
the versions.


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
