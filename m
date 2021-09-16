Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 22:33:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50346113E
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 22:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D50346113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjIU7ZmplHHmrx47RnxLfxfgurKOKD1iTJrG3PaPH9o=; b=d6TI3/yYHdPTFa
	cG8bkmVWKaxcr9JTMrbPI5Fdlcv53pQIEyP74lB5LNGwOEXVhJBdESlXTwHXcGbRyOegMoAIKp1lf
	8iIlVSNCzJsxQ4gDc3GijIpx872pMjI5yJDU90VYFJUnp+OqeVeF3dfIdVuqg7I9m0n8XZ1Wnxks+
	ulN50PigBPgY8ef7M3NjDyzTui7aVBsHRl0P1LuuGBK5BFmP3YcxGM6mAjfXqyKG8tFnB/Vr2GY7T
	elvfrkjt5LER9qIirRg9/0piJApWTQQ/WXAijta35RrfuEQ/TDnK5/tQgDl4ItmNJzwB5KHLeZO/O
	a6lygyLNQRKnsXU9ukxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQzwO-00CWGZ-RA; Thu, 16 Sep 2021 22:33:12 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQzwC-00CWCY-U1
 for linux-mediatek@lists.infradead.org; Thu, 16 Sep 2021 22:33:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id p29so24526196lfa.11
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Sep 2021 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C2Pd9oQGhsIAALkBCdNNs3Jk3IqYwXgIkUsJNmKqGe4=;
 b=AFSoc9u3yI+qZzT607V2n1nfEHCXO38yJEtaibfgn8ZEFzLgedJN/Rop5q/SWjAqam
 NExNaUbhkeVgxA/JRNTOLd+QU79s8Y0aRXFaxaTY9UbFHBAAjtNlESlSl/L/dMqas/vG
 +prNUa2EEa2Ft6E1RlwGuxTVLZjNN8Stgh+JZr3AtjtKO62Q/XIs3iS6mNbSSQUw1eCz
 fgHlZx78TKrmNlK/BOZrlviCUFCG3Ip8T8nDqFbZB8w5r/F6h9uu89rWa+upbH3cJpcY
 0wlfA0GY9GgbLoNL4fllS6wGxeD06CTdJZ7HMLfPfpKeTyefnImaRTMjLjJsKql8PrUe
 YBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C2Pd9oQGhsIAALkBCdNNs3Jk3IqYwXgIkUsJNmKqGe4=;
 b=UqxLCNvvKerSSXJCGvivH8VjUDTDn4M3imaKKhJLti2sby/HRi9s6EzKuqPCF38tL6
 jT+RGIwOzMR1+Uod41dBdsgNiHXj6akfxqFToYICasYb+Sgich0KgVVQAQLQ0MV+kAZp
 ptN5xwGZle4G3fSrz25eK7AcN1wFOrZOsgSVCC+n/4rtYMpcGjexu9zOhL5Mgbzc0ezq
 Y+cZcx5pfDXl6ieTxvUO/kHCkqNK4BRLApL9/icEUs39oSh1BjCFKZdpva794Z+rMZPZ
 4EIyEEOxGG5GR1Za9ceTQORa7Na3hnFFktzKLn+CKUJScnbEw8Tzh2svS+xmISneweyW
 5gsQ==
X-Gm-Message-State: AOAM533osWPKz6oH7htF7YX87kSkeZVdPvx/1L31qRy5MMF3sQU6YOx2
 e3VLF57rOLJO/imOhB41AEKg9pIVMRNDtfFt2Ka7cA==
X-Google-Smtp-Source: ABdhPJyxqxvinOj8aMJiZNnMyx2DgvsDEllzpmCWgV30ksZxAhfVIZ1rNGoh75+UjjbXoIY477ApJn6fT4OHdj1weFc=
X-Received: by 2002:a2e:5758:: with SMTP id r24mr6861004ljd.432.1631831578894; 
 Thu, 16 Sep 2021 15:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210911071046.17349-1-zhiyong.tao@mediatek.com>
 <20210911071046.17349-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210911071046.17349-2-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Sep 2021 00:32:48 +0200
Message-ID: <CACRpkdYim-2xcKux+4M3JTwRuE7SgEH7d2HszPXO3Z=AKdHTrg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: mt8195: Add pm_ops
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_153301_039739_591BC08E 
X-CRM114-Status: UNSURE (   9.97  )
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

On Sat, Sep 11, 2021 at 9:10 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> Setting this up will configure wake from suspend properly,
> and wake only for the interrupts that are setup in wake_mask,
> not all interrupts.
>
> Fixes: 6cf5e9ef362af824de2e4e8afb78d74537f1e3db ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
