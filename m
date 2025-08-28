Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22EBCA0FF2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw1P48Rw9airUIZAlX8WPmdMSK7aVKwW+bhgC+9irms=; b=q4qGf0mwA9Iqq7/qrlbPCayEA+
	aOIHtSWt4TfkfDFh+S/CkxhUkFlUS6dJnaBZl/8/nM+ZK2RJNVsUMjlJdCuH/Y4TqOPiOJgTQJQgl
	jPxxVaKTNfhBYLYs2AEyCFuI9uiyaSzmOjgYFYTriyOPSPvkumZnYeKc2WyFvDpiuNFrnTJK3y6wp
	Rp7stD9eQBLWlGTln6X7ysv3KxEH0Aw3venSAT2u6AEjb/dH74a6s9bKb/XtVIubWMrflGTkkNVhG
	rcxYZh8lM4ug3ALjpUhhNLtLMdnL/dhsKJEyl4eSciLmMN0a6oUJM3bZo6psjmYt9byfobBxo+PNJ
	SQ/TTPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urW6F-00000000QqN-2Xlx;
	Thu, 28 Aug 2025 06:27:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urW6D-00000000Qpd-0Ffm
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 06:27:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso2151966b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756362423; x=1756967223; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rw1P48Rw9airUIZAlX8WPmdMSK7aVKwW+bhgC+9irms=;
        b=kCEtY/Jx0Eus+i5o/qlSyv+2QPUatVTlTZ0TGB2QFadZqJ+Ivy0vLoGavvA9C+xN0h
         ruO/HP6jChozxlD2ZlxtH6uMieVjIhnZValZOh0YncrbA6tsg5w49RNO4lLAVk+nYr7Y
         OQMVAFXK3gENxYmPjhS+F8I7+/H0wjLxqRKJIzUVpGOMNOp+/eQZ4XHv+l+46P2THhsk
         ksj3KiMHBUWy4HZ324iI0iM0ytonKKrZEnk/li7qkS+ag+/Sa5XoXdZZrbpzMs/C/Cb3
         vSzn8H4I56aQKE6DyX5UCH/MRxYzmdkLkYbLoT7++JJOMySL2Wi2hCAQwuxIVEmz/4hY
         Z+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756362423; x=1756967223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rw1P48Rw9airUIZAlX8WPmdMSK7aVKwW+bhgC+9irms=;
        b=Q1w2O88KP/UDVeySy4YVTXMD6QcPB9Q6uVYoqVcempz0v7jJACUqOlv7Xgq4LL9u9p
         AB15n4kJoMgrzLs9Yyv125iBdnkUNLDTwY661/EuPoNGXtlO8/+n8JdqWpCRLdr3o3KC
         a3C+R7/gnJwvQzAKE0TH/PDMjtkZ+e89XJbAShYGexQEU0q9tYEGiGRw77FLqUygMda+
         MDlKAgN/+bH4B43Xn4EF3idhAkGiDVAbMC7W/DFdzDLkjnbqty3BxcrKZV/FY1bZWWhv
         kNJDRCDaIfuWv8AV1KbNWSRmaI6RdzXH0DLrRw1A27uC2S41qdfNovSfA61tYDA40gBh
         /fWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2pBgVik8jHVmLdfwLe3Gazq4D7aZ+NnkOrHv53Wrti+5kX9tMQGZLMJxVPT+LZ15TYJfR81gJmKoyBAaHJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysK49CkosRMK8o5a2bFQmcq15HvEsn5SSh6s2UCC5CaVggUJls
	Fv5+1AsczXcCfjxjRp4BIURo3aE4W4Zcc064vlrKVZluYFidSfwx/rFc/bWlpY4qUEcxBJiIp0t
	f77BBG4N0VmooMqwlNkVb/QqO5qXkHTM=
X-Gm-Gg: ASbGncvYXaLDmqoCrD8NIMhzg8h29qek9E4ytPLlC4sEl19FcZ9I2aNlNzF1WRXHJ2W
	ey3+YsHcpv9rlwc8vFhuDJMihGl0jX75tF3TMP8t02V/gZUIaTXDK9IQ8wxbbN1Vy37vEXVGGaT
	242nZA+kjhZz8qOQgLR1B76QSnHMdl6VbG9M1Bs1RB7xEojnvV06hAHfM/kPMTXblB9/TGUH7nL
	2BXkd16FP0nynTi
X-Google-Smtp-Source: AGHT+IHllcdWIIyE/tgfPoEMaupjgVRkzKVjdIUnd/uLbIt7Xuq/3mz/DvL95F4OMvojqNdXHzV5gHpDUDZi1keN1KE=
X-Received: by 2002:a17:907:7f8e:b0:af9:5a60:3319 with SMTP id
 a640c23a62f3a-afe2902ee2bmr2188427166b.19.1756362422867; Wed, 27 Aug 2025
 23:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250825150948.2998-1-chunkuang.hu@kernel.org>
In-Reply-To: <20250825150948.2998-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 Aug 2025 16:26:50 +1000
X-Gm-Features: Ac12FXzArv6j2S3_biYutaI-lCZofq_ZLCSqVSZm8jbnf5oqhY51MlmSIypDoP0
Message-ID: <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250825
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Ma Ke <make24@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_232705_100253_8F3A6CA6 
X-CRM114-Status: UNSURE (   8.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Louis-Alexis Eyraud (2):
>       drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
>       drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Hey,

^^^ this patch is missing a S-o-b line from the committer, please fix.

Thanks,
Dave.

>
> Ma Ke (1):
>       drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
>  4 files changed, 26 insertions(+), 12 deletions(-)

