Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008A8C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 18:35:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF82233EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 18:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF82233EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=glKQZ1PMafgptud66SEGBDETPGsibWCz25VH6kIPBjk=; b=rydXhZEP0eQG1kwtnqguzv6yF
	bXfReDMl+AySfrlJEBXPE2YrT8NovPzkJ+lBAeVeFvRGestLe384UYLFP9Z306tKkox8/pe6oIhg6
	jNUIRYf+Z/huuo6KDW/C/6TJQqooWO9UqctjnyI1DJ8ckLUjreQ2JetR8/IsqEjHnSsk3Ids/lmUZ
	kmcU4JHfGOE+Tb7Z8Haxqu6IugH3YXC3DLC6+lxbTvUoMmtwlb2yBCC3qkHW1e+7S4vcfJzLPW7x/
	tp7ivKHsgy7wZEhQDQPqn8rP5uQhBVJbDavrDNGzyT6t+xl3gl7y5Bbw0cT8bKSD5+sgb0WvY0kh+
	YD2l76Evg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpbeL-0002dQ-J3; Wed, 16 Dec 2020 18:35:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpbeH-0002bs-FP; Wed, 16 Dec 2020 18:35:42 +0000
Received: by mail-ej1-x634.google.com with SMTP id w1so29538503ejf.11;
 Wed, 16 Dec 2020 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2bDH/Hol0H2oHf/Yy3g6/HrXyqHXNmIJk03IBlf6dA=;
 b=ruJ7UmwDaf1pgP+nog1BinyUL0Id2q9FFmQZAYWRO0BzfsP6yBb4jRLW23HrDtURw6
 XRqwa9mvxETQIfCFrmJ6ZDL4F/lwQf9eaQagjGmOhiF9iG7V3vFoP6LqSC6Mg8zXK2fW
 OgPNaORyQGTFj+qTHC/FDy+wQ+MrrDiDtCnu13UuxPmnr1bmSXODmOWDlJY+0guEnkSm
 yBEKFUeqLf2TTEgBSqroN2/i3nVf2HHw4uD6p7lKRvAYKPrV+3y2blyc9EsGf7l6zdEz
 cnHhLNg05rpedHAgP0dWTRhm3GbLDmqGmaukknDr3JeV6mnf56WcojRV7EyLDxIVQ0f3
 tlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2bDH/Hol0H2oHf/Yy3g6/HrXyqHXNmIJk03IBlf6dA=;
 b=qpCjEIUx+gB9xeRlbebc98JEyPOi8THCRP3H8RTfA+sMC48d2Wi4tRlYFVTOvwBTfu
 0aOvpf3FOoBr5mYaOuZqhOQyDSP2gdK0GhC9/rfJBdwV0UlnTp6ZkQ/rdPh3C0pBoDkn
 OH4Z443i+oy/mLQj7urntIcnqVvi9cdPen5PYVEBKaYLWvPMoD42PhPXxZC2mXdypBmR
 EdGJRvI0StG4rQp7Fb7jm5NObF7HOoxE9Iq8mZguy2Yy8FP/m64DRbCNiiq36ux9aV5U
 EbHkOAVBFKBePBVPmILSk6cyccUOhZz1yE4nKM2xwbofpBrSuGNXeq8qjRQeyECOUOjI
 4q6w==
X-Gm-Message-State: AOAM533uMtTsw4x5eZXYBtB07TsKR4Tc9I+hktomgxmEqqRta3zHk8rW
 YEZugU9OeukORTgqmNwmnQdGQQCAb/1nBjS4am8=
X-Google-Smtp-Source: ABdhPJwJorgowRP1Ej+Yh/emGfpY3PCwFgLOuCERmNcG8RW/aPrBJ/ZsgMiAwxwMp8IbhO1yk7JtRd/oNlBt7/s2Kkw=
X-Received: by 2002:a17:906:ce2b:: with SMTP id
 sd11mr32928366ejb.334.1608143739911; 
 Wed, 16 Dec 2020 10:35:39 -0800 (PST)
MIME-Version: 1.0
References: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
In-Reply-To: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
From: Mathieu Tournier <mathieutournier@gmail.com>
Date: Wed, 16 Dec 2020 19:47:19 +0100
Message-ID: <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: add it6505 driver
To: "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_133541_528580_4F6F2793 
X-CRM114-Status: UNSURE (   5.97  )
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
Cc: "Kenneth.Hung@ite.com.tw" <Kenneth.Hung@ite.com.tw>,
 "jitao.shi@mediatek.com" <jitao.shi@mediatek.com>,
 "Jau-Chih.Tseng@ite.com.tw" <Jau-Chih.Tseng@ite.com.tw>,
 "airlied@linux.ie" <airlied@linux.ie>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "hermes.wu@ite.com.tw" <hermes.wu@ite.com.tw>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "yllin@google.com" <yllin@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen.

As it6505 is compatible with DisplayPort 1.1a,
Should DPI_PIXEL_CLK_MAX be 165 000 instead of 95 000 khz ?
This would permit 1080p support, as it may be supported.

Mathieu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
