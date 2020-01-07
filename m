Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450CAC33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 10:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 153C62077B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 10:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kyou/ZW2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8e5zkbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 153C62077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDsJPxuEcz/WROt5yp+tHeknCHo8NB+C8NI+Qpayabs=; b=Kyou/ZW25v2NNQ
	smkAtv0JY7YY1SwYam5H/cYEr0wQFi3HTKAnoG95X8tqG+nff/7pJWo6UncE7YqVS+J1SxRxTUJGi
	TXGzbWsncWIKcrYzb6hjdPnHx/ULk9IVAV4nvSj+691OleyWBJVPhae0l0jul7pIuFSulHbKwmI+j
	9TWB6G0eXfAtp9STank+TeVudFgcAPilyqM9kic35Vzl1oLqt0XaGmbfe3bQzt33l5afsTlj689Fm
	Hsl4s1FWPX4lKzMddelh99mbuj9GdqlicVxgzcTOTdxRJ0slOIQTwycwCfEGZVsMCM6eoB3RyRs0z
	x4wlpaa/NLkkGB7ykeNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iomIR-00007c-QZ; Tue, 07 Jan 2020 10:41:11 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iomIP-00007E-Bm
 for linux-mediatek@lists.infradead.org; Tue, 07 Jan 2020 10:41:10 +0000
Received: by mail-lj1-x243.google.com with SMTP id h23so54208364ljc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2020 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
 b=S8e5zkbAC4vGQyN2oQss8+zjnBiH2/1Oxd7//7o3rqWykwynawOBgCdO/acAzcuB5s
 mODoPHD8qcw1L3hjquQCkC0OrsKrcB77niLT521ZG6XitmsVfXMynWJ0GV5sUyh27+6c
 F5sa19WSHj3ogwD0IBzDD5qOUnOnWfXQhXVbCRpjMxcv40IymAx9IzzcIdDW78P3BMOI
 F6NvHOluAoPtlerKGz/DgXzJFBDujqnWB7hghFmAiTw91WKVMfFytwqCY4iPZ7wFzFsa
 INUIQKDoVJaPbk4IKdzkl3uWNrGDY013KPqlTmEjB5IbTXAtPRNjwCgsI97dA8rZ8Mmx
 4vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
 b=GiYemgiu0HXN+CCk1PxmMVle+tDBlZxJxB7eYBx6Xjy4F6WVTLSfNbzec574ovPp2t
 d1C5QNe7B3fsEuc7JQeZI4QO4XQlBBGWF/7108CTgZyYFyOCl/qSiQuKRdsMLGVkfgXf
 P+3YYKLGCY+a/OhFkhU/1A7448okOXc9SN+aTLxRq/jB7hh+g0dokR+D+a1OLw3AE6Qy
 Hx7bWjLDQFgEHQCRwzVtK3KMvWf2xnRfBs4A/S2xeIV8rhyjyZSz+ZVv26kiSbRW0jlV
 sGDO1SBDTPpWdrcENhFcd3DapQRI+LPV8xxPw9IUFAv9+ryq/GOLiur2UVO0YLVGwgrv
 aDkA==
X-Gm-Message-State: APjAAAUMjkrzZGdmqz+xcflbWCMi1telFOrGCzneb0pXso/K3tbfc8sG
 WEWQDOrfQIByxFG/kW3yjs42hHomrRKgIlP1I68pfg==
X-Google-Smtp-Source: APXvYqzPw/Qdx+sCdiOeNl65OnuQtCOolmEVElFYMMkBD7EgYjlKsv9P3YvfyZW4sD2cny18hKjAeDvhBrKHQUlYRoE=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr25961364ljm.251.1578393667915; 
 Tue, 07 Jan 2020 02:41:07 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 11:40:57 +0100
Message-ID: <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To: Light Hsieh <light.hsieh@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_024109_441588_A7A81A2B 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2019 at 2:41 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Refine mtk_pinconf_set()/mtk_pinconf_get() for backward compatibility to
> previous MediaTek's bias-pull usage.
> In PINCTRL_MTK that use pinctrl-mtk-common.c, bias-pull setting for pins
> with 2 pull resistors can be specified as value for bias-pull-up and
> bias-pull-down. For example:
>     bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
>
> On the other hand, PINCTRL_MTK_PARIS use customized properties
> "mediatek,pull-up-adv" and "mediatek,pull-down-adv" to specify bias-pull
> setting for pins with 2 pull resistors.
> This introduce in-compatibility in device tree and increase porting
> effort to MediaTek's customer that had already used PINCTRL_MTK version.
> Besides, if customers are not aware of this change and still write devicetree
> for PINCTRL_MTK version, they may encounter runtime failure with pinctrl and
> spent time to debug.
>
> This patch adds backward compatible to previous MediaTek's bias-pull usage
> so that Mediatek's customer need not use a new devicetree property name.
> The rationale is that: changing driver implementation had better leave
> interface unchanged.

Are these devicetree bindings upstream, or are these bindings never
submitted for inclusion in the official device tree bindings?

I don't really want to encourage out-of-tree non-canonical device
tree experiments.

On the other hand I want running code.

I suppose if there is a solid use case for backwards compatibility
that also affect independent developers (such as people just
hacking around with these devices) then we could add it.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
