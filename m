Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E3DE77184
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=; b=AEtBKYhJhBipuSkX40qGenj7b3
	M9QdRZAiWjgbRP8YJYjpq3G3MIWwqBfnKJQ7HmUChrNQK7IP+Yt40ridInfDQw1xPrj+miBm7sIXX
	xIk9VvlLoMOnQLpwOdCNjZcDa4WjFF/VDagUFb7ulxtqyqhE1W7Ju07rfppSiMNVFZ1MDbhUdCI16
	ClyHRus0wkH3tr1DoRqbNLyce27lE1LgKn1EzeyXxaj+LwasGJMu/+gvpc9c357W++wvxMtw0WUPv
	4anaR1xeb109x0AcAdKGBefIqfTpv0t9xx0LO1u5UVDE4yekGzIy4mxKqM67yCNpxSEZ0Bq9hq4oz
	CKHNEGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWmJ-0000000DOeK-1oLU;
	Tue, 17 Dec 2024 12:34:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWmH-0000000DOdL-0vu0
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 12:34:18 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5378972e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Dec 2024 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734438856; x=1735043656; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
        b=juG3lPvI/cnDXvNFWSh4N18M7Ons/zX2cufj8yShD4FfPwMRVTNsJVPzY8qovB5IS7
         zmdWXaglhcW6M5/kodD5uQdlszP61fTfcvwgpG9RzvT5yQusbIHwjlOksX9gw7Qp/7q9
         DfbJdlwk2RQd5PF579tKwDAlWtPq82bqjcsGYvbS/ci+MLu7Dd4FPC1JH6QK/FCHk0e4
         RxYqr7Wm11oBlu7+s7bu/z6NhhH31qLihxTXK/xXtBF3FIUTyx3bAvIjVPyhsgcRFe/V
         haPwp5s9SnNfgkwD/q+XG1lj+GTW1KJCjAMSmhASilMz9cXV1OL+ng5zyRXRdnb1Kfq4
         Tklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734438856; x=1735043656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
        b=gRzO3s5ZIe8F2zI6Y4Xae9wisPH0ObMqlurKPMd85vYmU9Le4ZdcoyIBfTz1dBhWLT
         9sHoW9btzgJjJTLvoHp2W8koqSKEwP552qH6FZAtVoyMloYd07Fy+nHlyotzu8EeVp+v
         6sKqPLU4J2vAhoPnre7Mvs2I0FuQ049jgcH66t5JQTtMIcl6+NyY3LYuyxyN5lVDDMlL
         4j2FR0iXY0qie0WXkZBsUkD5jN8CKIsNOMcj9Gxg9WSW3DTI5Ic87UvzJa+E1pgqOZbq
         4kyQN8649LiiJ/nMVJNU4xKBOl8unqX//7AVNeFbqCnXRuoQu9KboyVJLQfz5uhWVr0A
         wVPA==
X-Forwarded-Encrypted: i=1; AJvYcCVfQ4boSzV0kXsyin12eYM+IA0tgFFHxmnaZ5ll02G2BIDZLsvO6BHWQ3mbAzV0DTU/BXFhmoP7g9cSPcBA0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdhiEPvkmwjPF3BODgqsk0aqjk9pQFwuaIan1CZbn0ypSYlsfz
	h1+rVwvS6vFIdPFFSNM33JETOCYTMnh8EBtxR/6gkH2woFES7Vo1PN7BF/3JZb8=
X-Gm-Gg: ASbGncsZnRVk1J8zvfbvtL7Uf1X4qhIW4NJsVRWHlA+Cu6zRDLqR3CNJCUKn10yT0Hw
	6MJ+KK7S98wgUiIWMo8KQH1g7s9qCCXnirv3CY0KwCP6uPcDQh6IHsI0MXxfea0DyetOFYclXLO
	QGC5Eo6dfzZUgtCXEel6I4Wpq3ABU740+g/pA3hRr/E9tnQCOWe8WCsPAHkV8DvO0k+fupTZLbW
	gvg6MllI5Ge3szWeHDEJEaC31z+3tyIMI0F6e3IYhrN1PHYc30qR4E/9cYPKggeNJjffO+zvd4+
	2o2m6lhdHz8fBh/SnCEKR+L6gvc/sqZbwi8h
X-Google-Smtp-Source: AGHT+IG64fF0VZRsJVb2QKgF7su3lKSHe/E+XJ0mDICTjJVwLxaJk7I7Yc82GJIWZQCARYb0bWVA7w==
X-Received: by 2002:a05:6512:3c8f:b0:540:1a33:ded8 with SMTP id 2adb3069b0e04-54090555550mr4911457e87.17.1734438855594;
        Tue, 17 Dec 2024 04:34:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20e64sm1119838e87.277.2024.12.17.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:34:14 -0800 (PST)
Date: Tue, 17 Dec 2024 14:34:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"jie.qiu@mediatek.com" <jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Jitao Shi =?utf-8?B?KOefs+iusOa2myk=?= <jitao.shi@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <fm5rbujzu5og25x3nnxnhabrf4mppyy4nakxrskqtug774llnm@j47ce2zz6xsx>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <803bc2bd802506635dfa9ea9b26a6ca40a7f4912.camel@mediatek.com>
 <e5788187-e894-4aab-a41e-a3d7a64762c6@collabora.com>
 <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_043417_268608_B2200319 
X-CRM114-Status: GOOD (  32.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2024 at 06:40:11AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-12-16 at 12:04 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > 
> > 
> > Il 16/12/24 09:57, CK Hu (胡俊光) ha scritto:
> > > Hi, Angelo:
> > > 
> > > On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
> > > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > > > 
> > > > 
> > > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > > including support for display modes up to 4k60 and for HDMI
> > > > Audio, as per the HDMI 2.0 spec.
> > > > 
> > > > HDCP and CEC functionalities are also supported by this hardware,
> > > > but are not included in this commit and that also poses a slight
> > > > difference between the V2 and V1 controllers in how they handle
> > > > Hotplug Detection (HPD).
> > > > 
> > > > While the v1 controller was using the CEC controller to check
> > > > HDMI cable connection and disconnection, in this driver the v2
> > > > one does not.
> > > > 
> > > > This is due to the fact that on parts with v2 designs, like the
> > > > MT8195 SoC, there is one CEC controller shared between the HDMI
> > > > Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> > > > adding support to use the CEC HW to wake up the HDMI controllers
> > > > it is necessary to have support for one TX, one RX *and* for both
> > > > at the same time.
> > > > 
> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +static int mtk_hdmi_v2_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                          struct drm_bridge_state *bridge_state,
> > > > +                                          struct drm_crtc_state *crtc_state,
> > > > +                                          struct drm_connector_state *conn_state)
> > > > +{
> > > 
> > > I would like v1 and v2 has the same behavior.
> > > Why v2 has atomic check but v1 has no?
> > > If this is better to have, add atomic check to v1, and this function would be common function.
> > > 
> > 
> > That's because v2 uses the new helpers, while v1 does not.
> > The v1 must be converted to the new helpers in order to use atomic_check() like v2.
> 
> I just find the description here, and I don't know why new helper need atomic_check().
> Would you provide more information how new helper need atomic_check()?

The HDMI helpers requires the driver to use
drm_atomic_helper_connector_hdmi_check() in order to maintain
HDMI-specific connector and CRTC state. Thus drivers using HDMI
Connector framework have to provide .atomic_check() callback which calls
the mentioned function.

> For example, the call stack to atomic_check(). (You could use dump_stack() to show it)

-- 
With best wishes
Dmitry

