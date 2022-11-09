Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IP5GuE55LXSPGOYJX6tyMHFgYaUe2wT0zbakn2aZiKA=; b=BGJkBNTUrnoVRRZpnxzKnI78Rt
	d/uaI1mggCPuRmh7il7PdyyfAdMsyIuTRVco8RbXH63I1h83i1RVuN56yZoQFtqqzTB1ctinXVMNg
	VxaHZIP82IF9rolcuijEWxE91m9L96tukPq7x7/Z6Tb1x3hdvh5+MvIe7CfBd3q0ZfdUK11Fpmxym
	5B6sJhgMzC85UVasOKBbfdFQ+2Yb0PJ3PZ2ljKe0oMvrAP67T09KnxLHzLOuX7lsTV2dBWE83OJZc
	X7SG2Yi6OVlwssLutKCXwwMSkz+rTFnIKLPBW4uyy3ZnOxCDxWUNlIityn0a1kaI7+ZZRnDAtVe2M
	k/K/NjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslWE-00DyXH-K0; Wed, 09 Nov 2022 13:53:30 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslW1-00DyOj-89; Wed, 09 Nov 2022 13:53:18 +0000
Received: by mail-oi1-x22e.google.com with SMTP id q186so6428427oia.9;
        Wed, 09 Nov 2022 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IP5GuE55LXSPGOYJX6tyMHFgYaUe2wT0zbakn2aZiKA=;
        b=IRoPyveQ9oFrAzTF3HHWGRj0bUrCS8UXLDCa9ddqKqECHwdlDrMOiKDSZFD12lTdMl
         XNBIQOgXzPdtgZPPrv9GafkLQB/QCIIiL+YPya0/Hp1NPKysiaBQGQjOfZI3/fws8WmO
         IC351Nj8xsn5UopowW+WN6XagzJpYeXF21UXhjDo9EsVVx2/tmOi23Yx33AbvliZBYWZ
         rjCm3e40+B0iBtSKK9mkxqcUkAjx9wi3fsP9JzExbAkKPOzS1PbKl5D01nmRmZqwArlf
         c4WRIWu9QxLRLeK41yi7GJb8h2BS48MGKMxNelapj/igM3ozt9vWWbfuoFaITTowNE3m
         D41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP5GuE55LXSPGOYJX6tyMHFgYaUe2wT0zbakn2aZiKA=;
        b=XGy8ujk3/IVqyS55D6Oo/rb+2bjCMn1xagVG0P7h0pugJtgKgMuM8Jq2tP2SdAWPSO
         twx8CKif/Gn0vosYabSW0YHZ+UR1XJGLLZFKd9VB7vNSnxgk3hqk1vwkrXDB9G33vfCe
         urRJRRuESG+LHhdrQqtD5Ily/dhj2dTaKLMJpKnKxJvvWfvMoFRi6wwUj1Pd0syDTuBc
         3Nq+9U++VsmGwUErmbxjsSdjiZQvHeSLVN2sGcJrjpaU9ZTi5Wt1ZHz9iSyj4jmMxH1P
         xzPzTI5smuEzj0wycOVrY9sBfHivQZJtbP8DRp80faTf+k7ZS+kWR+l7mqYQB1SOqDYl
         PcsQ==
X-Gm-Message-State: ACrzQf3kHb3WQZyRsbGKagnXrkddJ6DLuJ73z5Tbt774gYIK82eQ2kKA
	pIr8ri8So9Q2l1zc0N+n87A=
X-Google-Smtp-Source: AMsMyM7yhbw8cdCur7Z/B3HPRG1UyZ5Xhy0cQKinNow41q8SEdCpF9Q0zCPt1dXhUKXdFyWWSxduvw==
X-Received: by 2002:a05:6808:1b13:b0:35a:57ef:8388 with SMTP id bx19-20020a0568081b1300b0035a57ef8388mr16587593oib.195.1668001989314;
        Wed, 09 Nov 2022 05:53:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f15-20020a056870210f00b0013ae5246449sm6082480oae.22.2022.11.09.05.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 05:53:08 -0800 (PST)
Date: Wed, 9 Nov 2022 05:53:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 5/7] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Message-ID: <20221109135306.GA3538893@roeck-us.net>
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <20221108033209.22751-6-allen-kh.cheng@mediatek.com>
 <585a9cbb-4df4-1c06-ecfa-3b9442f1a5e2@gmail.com>
 <5758c2af-c2c5-dfbe-c7d8-036bbdaf71c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5758c2af-c2c5-dfbe-c7d8-036bbdaf71c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_055317_313500_7D10A380 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, Nov 09, 2022 at 10:04:09AM +0100, Krzysztof Kozlowski wrote:
> On 08/11/2022 11:50, Matthias Brugger wrote:
> > 
> > 
> > On 08/11/2022 04:32, Allen-KH Cheng wrote:
> >> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>
> >> Convert the MediaTek watchdog bindings to schema.
> >>
> >> The original binding only had 4 without a fallback but there is a reset
> >> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt",
> >> "mediatek,mt8188-wdt" and "mediatek,mt8195-wdt" Since there is no reset
> >> controller for the mt6589, we remove "mediatek,mt6589-wdt" as a
> >> fallback.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> >> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > As I'm put as the maintainer:
> > Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > Shall I take that through my tree or shall it go through the watchdog tree?
> > 
> 
> In general, bindings should go via subsystem trees (so watchdog), just
> like drivers. However this got Guenter's review tag, so usually it means
> also an ack... Dunno... :)

For watchdog patches, if I send a Reviewed-by: tag, I expect Wim to pick
up the patch through the watchdog tree. If I expect some other tree to
pick it up, I use Acked-by: and usually add a note saying that I assume
that the patch will be picked up by someone else.

I usually also add watchdog patches to my own watchdog-next tree as
reference for Wim. I already have several mediatek devicetree patches
queued there. Handling some of the patches through watchdog and others
through some other tree would create a mess. Please don't do that.

Guenter

