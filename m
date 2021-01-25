Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C435C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF7922583
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF7922583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pM375DRNnY9E5EaOBt4GR1uTqeG1VafllgEIMoGzysg=; b=iqXaqjXRzVq2zRifXsv+ADAh/
	3ZUenHGm+lRocbYJTdYZEpTEp2d0gIbgcmtf7xQYdDuxG+QA0eyxRyaxE7gcNPWutH2QNZ0mR8wQ1
	I9SWSWdv37rdp17TdxaNamyf7IU1XVRNYhYaTIw3ygXCscK7PAE3AdkYztl7bRufhG2V8bpUJW5nr
	GPKCb/uBZzMwqb4wJKL4iUvGm5w/NDfHCFB6CFy5Om1UQQXTyNQx4kI/xouMctoXQwvSK9zkKfLtr
	3iR5wtVH+LlbUZVaiTthhLeYbdmg2gWmwdZrBTW2ZpqrSE+HO/bFhVKQcr3UxitRnqUQdVMu+RBx+
	Mv4Ub0Hlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41gG-00059J-Ft; Mon, 25 Jan 2021 13:13:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41gD-00057l-Nm
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 13:13:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id o10so17604137lfl.13
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 05:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkjGH+G3sbPs0AwBpKTZTNMo6PAnhVg3Vk9O+oPBcYo=;
 b=Jh7/FEpR91Kn0N8agvzoZbDt8Vo0Re5umfDss3QUmF1BVvSaj9lIq8UbWi6u8L58yZ
 DZA92Cn7qbWCqYz+j1NHBTG9c95BbJLfjZbNc+pHZqcNlBjqsl2f930JkVnnekbroya/
 Pan4OWOrhztzpXYSMxzPpkCTRDLqxWFcnqDGUIyMiYCLgt+7Sf2HKwR6WGphRoXg+IY7
 NioWkdeZjyDA17yR1tK0y8Ze1vyNNDByrWKrewGm+9VSIHFtkyCC+5uIrIwx/gNTBdKf
 4bYbf3cNy0fKzaUDFkIO1IUc3smoFFfFAop5sisWtetjF7iKYE4KGd/KvXhrF/aGLwoS
 3R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkjGH+G3sbPs0AwBpKTZTNMo6PAnhVg3Vk9O+oPBcYo=;
 b=QwBeeJ4seS2RKstp3Pp+i7bGQlq9rf+kWGqly+edE0InloCKaUOcepSwsUB0IHYiGG
 mdOOau7kiPkq58M9fEisMB2QTDRFQe0TYg7Qxko10ruBNw+i9rMs3JSd6s6w+X72e2Rw
 VjTzpMSp+cvrIoyn6hZcXsYp4kQm8ecmwjzEmbQQWnE95N/GTlNhJWvaz+Em8L3MBcKP
 sckLrjbZDp3GlxPc2mRQKp9VVm8nfJo07FyVubUKqGhGxdsdrBeERqJ2dus2P9BuAVE2
 4m9aYz1TIm49UIuuwXRMIr9/l5YKrZRZNxWOGgr3KDAgQXzF9qIsHMnMShN7SG0aSTYB
 CI+A==
X-Gm-Message-State: AOAM533hRtRQ1/lVjnf451JyWMU0htQbddcSnuF2aYSsciDPeyq73FXE
 vX2iBX0+wlTaFr1SdNPcirxoLB5dqm3/j1ClUCiZ4A==
X-Google-Smtp-Source: ABdhPJxb7i93hzji/0XqwZuGFblpA4aj5dMHr9srYEFMDhw8118iclkxarMinp3+461hMdPJxmB4BxSJZ/B8GxjDcRU=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr250905lfp.586.1611580395894;
 Mon, 25 Jan 2021 05:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20210125044322.6280-1-dqfext@gmail.com>
 <20210125044322.6280-2-dqfext@gmail.com>
In-Reply-To: <20210125044322.6280-2-dqfext@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jan 2021 14:13:05 +0100
Message-ID: <CACRpkdag3P7yGVmzkcdi8zw=3WJFNDDTQDOWujBB54YgFZJ22g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_081317_786219_BDBB5B2A 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 5:43 AM DENG Qingfang <dqfext@gmail.com> wrote:

> Add device tree binding to support MT7530 GPIO controller.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
