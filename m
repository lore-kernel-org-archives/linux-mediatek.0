Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D88C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KWmkkG1UCDpsLVZHzRpPIm8GqEePstQSq3TTMsO7aE=; b=x4KDJ6jjjDEtQM
	SHrMAx1DU6ixSd1Je/BFTviouGQVWbOYeAoAUBNOc/50gp8rDXSRQEJ1FiEW3Sg6WJZqrAthgBDGB
	974+mEQ9MiwKWrhcbJfay1iozavH9dYi02h+nUR4FP8ikdNwSZFvAPMruA/iGXinY98gnhY55pnQx
	l6odwgVsuP4waHl9+6TXyArq3zFe3wCrIkJnHKKnUo8X0lOVxLxTtHfX24z6Odm2kEJkocuD6cK9b
	uIm7Jwr49FPOlmegP3bPCDnIcNvinu73OPEC60Gi9l2ckDieviPpVl4s2XIzDR/QMD1es/CY5Gf0u
	7gsSQ5DWsg3fHyaJolww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2g5-006bBL-4o; Thu, 28 Apr 2022 11:51:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2ft-006b6k-FY; Thu, 28 Apr 2022 11:51:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id r13so9054952ejd.5;
 Thu, 28 Apr 2022 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=egD9TWiQgZ00ABqrlpVUqX07Bqzo15fCup+voob9j6g=;
 b=WL1Az0l4M71t6wH3bpologdHI+2TTcuoscgjnsBJKMEICZric1CBnR4C+iqFz40wp2
 WduxOA3DY68wKKncU5lIgYNo3SNSThAyo7vsLzBPYwn90G7eAkr+t2XUGZAoEIvL3XXl
 ONaIN7YHpPSW3nloam1m74lWGBzKVTCkfJ7C7Vzfs89uM5mllkCSsiNClcUaos4lvRtS
 288uNt0JBuhVd9u4Wc70I6n9QqasFOhbZbGnut7fp6kl34H0ZJwMLWrpcF9Of1kHY2eF
 CDcaFvF98+zajvfK2GhQf5AR+uNasFZ0WElVRW1r7LER7Viun70c9lwZbOjsnUIKowOK
 9Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egD9TWiQgZ00ABqrlpVUqX07Bqzo15fCup+voob9j6g=;
 b=6j1P4UDYq4526umfI+MnjQ8tP0y2m4j/49NQapXpye6ArKUTLad/VmzusTlOoo9C+b
 WS1taXBPeRQhan2ZQfAbZgom8DFaQnqiRzr3Doe1DkspZCluJDmxRJyGLp4Z3kElH0DX
 pneVXgT48PGWFn7fE3AFzCnNI/g/K6siVl4CUymK7ilm8s9k7qEcmpMLBwB4KsVciDPe
 qvpooGtIhyGHzl6Xj0NGCtNmf8RImCxHErMEsG0l1QAKHoMn8uRfTBd33neWEnnoK1N9
 G/yTVJhlbGJLIvioSph/qTBH0uyBTXL7pU0x3zlAM3jPr4wWxUGMJ5X9OV3e08NDWZqB
 BfmA==
X-Gm-Message-State: AOAM530fDbK4yzeIamPgdr658UG+cxucdQWfquu4n5dmuLsKwjPP+Nyc
 ntoIUdxd0nEZD4RxXGMfYEfVDGpGobAz2xOtbro+6qYRcaI=
X-Google-Smtp-Source: ABdhPJz7sphZYsAcSHkuYWOXutg/BiHeCdlfJ7IswfBYScK2TZOjRTZA+jBvaIFK4z2tXF9uaATwhh/UhZCbUQlMNqY=
X-Received: by 2002:a17:906:c147:b0:6df:f047:1677 with SMTP id
 dp7-20020a170906c14700b006dff0471677mr30824800ejc.4.1651146664432; Thu, 28
 Apr 2022 04:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
 <1651138365-17362-5-git-send-email-u0084500@gmail.com>
In-Reply-To: <1651138365-17362-5-git-send-email-u0084500@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Thu, 28 Apr 2022 14:50:53 +0300
Message-ID: <CANhJrGN8avK7mehqVDHVCjBzoG3RU4CykHEaFdQqt40_LjSh1A@mail.gmail.com>
Subject: Re: [PATCH 4/4] leds: flash: mt6360: Add mt6360 isnk channel hardwre
 breath mode support
To: cy_huang <u0084500@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 ChiYuan Huang <cy_huang@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_045109_624785_7A430D98 
X-CRM114-Status: GOOD (  12.70  )
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

Hi ChiYuan!

On Thu, Apr 28, 2022 at 1:03 PM cy_huang <u0084500@gmail.com> wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add mt6360 isnk channel hardware breath mode support.
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>
> +static int mt6360_gen_breath_reg_config(struct led_pattern *pattern, u32 len,
> +                                       u8 *vals, int val_len)
> +{
> +       static const struct linear_range tranges[MT6360_ILED_RANGE_MAX] = {
> +               { 125, 0, 15, 250 }, /* tr/f12 and ton, unit: millisecond */
> +               { 250, 0, 15, 500 }, /* toff, unit: millisecond */
> +       };

It's nice to see you are using the linear_ranges helpers here! Just a
minor remark - do you think you could use field names in linear_ranges
initializations? That would make it less likely the driver breaks if
someone changes the struct linear_range definition. Eg, use something
like:

static const struct linear_range tranges[MT6360_ILED_RANGE_MAX] = {
        /* tr/f12 and ton, unit: millisecond */
        { .min = 125, .min_sel = 0, .max_sel = 15, .step = 250 },
        /* toff, unit: millisecond */
        { .min = 250, .min_sel = 0, .max_sel = 15, .step = 500 },
};

Do you think that would work?

Best Regards
-- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
