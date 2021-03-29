Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4181CC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:20:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54D061976
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54D061976
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2PyRS45sKgUCSoKuUKVdzP75xJNkn29qNFhHrFIcu0=; b=GymbgS4JAnPZtWjRTcs0Wj/r1
	3fwMzBnebn2ojzvIMIJDJz94ZU5apuTXA0WqKLAtW2JpzAkyWo3ZLUAGKnWlHGlhNhMiKdMDmGbLl
	J7YdOtrdjhTSkRtrBlWjXAbjkEx8TQpKWFOsC2Zp7ncRJb55xE9nkVRduTxnptrGcy5KsYrpB5i0A
	D/BeEECFg/mTdSBURBK3hBtNGuV4VXdfGn7tC7GE3V+J3VKUGf+kvVUsBnrfz8Eq01gNlIfDNM8hx
	fpIgi/iAu0tme+cW810yQxCmacWLBry/0uUyzqDoUu/uGolGlcnQ9SVhLSz0TJBnlnxWsN4+DIijb
	Sk423lh5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxRP-001Dxj-KA; Mon, 29 Mar 2021 19:20:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqAz-000caN-Da; Mon, 29 Mar 2021 11:35:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id s21so5862512pjq.1;
 Mon, 29 Mar 2021 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Umme6mEPlLLIx55BS0/fsIeUWDF0jAkw4yGXSPzrUwc=;
 b=brFXGjZHymZcp686J9d/6p2f8IT65PLY2NBImZxpbx5+mGPhPaKBwL+hAGI1XLqNWU
 nB3ac5y5ej+oc5dRA8Y0pIj6Ywpcib2ECoDJLC2AC7wvbvYdBNIXejmAQWr6M9vEYGlm
 XGemkv431JO08H5OPHM0pLE4OaLfs4vS+eaG3jYmizQU6Ek/eqe2fZMMPClEtpODUkxU
 ff8NLv9S+KzN+vVr8CMFY1AUwPHgth2vrZrwzcWkfiGTWmzyq3LduA5Vj+v22rldOWtm
 kZ2wm+it+9TY5ZZQqvWTiplmGjslQJu+WC6YXdO6sU+tlVwqHnkzGskt96p21B1W61QQ
 Nq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Umme6mEPlLLIx55BS0/fsIeUWDF0jAkw4yGXSPzrUwc=;
 b=N578A/IxQfkOfTHrAbj7yzl4jK549r3WSSlq2AsDKdiHDYpYekUSOQ2o/FiW8YqkRG
 9wKew+90jMk3zcbODwyRtvelUUmaLm4BJI6GkyBpNWOLIE6hxWuwZa4anId63vxG7iEq
 BtrEdGQi7UMvE5zvpMyDSifyZqoftSEJGXk+juyYDExGiNXOlcIIuN6E/uEzCW1DTCVW
 9B7dAY9T5JMWUETA2HR/QHw3eCTkKn+22dx/Md3wbnY5IRTdMcTE3nurgtKXJec+t2gw
 1JAkm40xkJE0Y+lvqytXgGUdMe6p532EShZmfvAOIU/USM5uvArU3BqKMvf9gVL0dPRi
 uidg==
X-Gm-Message-State: AOAM531JG5uIx2PJW31sUToMf655EX0Q0XtsqeAmYB2AoRx5VqoubSAu
 lgSBUsXtM3Vb+KPi+U3Ao13sCUdlKB16IkJvAgtLPiA4z88tbFdf
X-Google-Smtp-Source: ABdhPJw9Z3cD04cZW1D9XRH2rAhuFWVzadwm4hfCMZEGCTzN1BM+n77RrvvFbcEELGixncXb6MLAn2pEtP2QhPhPYic=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr28359551plb.21.1617017720012; Mon, 29
 Mar 2021 04:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Mar 2021 14:35:04 +0300
Message-ID: <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
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
X-CRM114-CacheID: sfid-20210329_123521_565618_FE6F0DF7 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, Mar 29, 2021 at 2:32 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This series includes 6 patches:
> 1.add pinctrl file on mt8195.
> 2.add pinctrl binding document on mt8195.
> 3.add pinctrl device node on mt8195.
> 4.add pinctrl driver on MT8195.
> 5.add pinctrl drive for I2C related pins on MT8195.
> 6.add pinctrl rsel setting on MT8195.

Patch series w/o version is de facto v1.
Dropping to v0 seems not right.
You missed changelog.

So, send v2 properly.

Material to study:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
