Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EDC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n4nAtxofFCq2P3UZ+SALa3xoGJpGVVdMIEgKp1giQY=; b=jyh2IJGffRBeTu5vbRinz+5Jr8
	QHCT6UuNnURPUPBObHNI4dkZDNYL0P/Zt52I3qDK8aTbrNvutdsYo0J1SbVFFDNCFMcJSsH3Nut2S
	LnR4uKJFSbduZUasxl/vAsbq9ilzmoR4uVxfHHEccJ7iKqfTblbaKEQX3iQ/k5tANqW3VpULHHJbH
	Lz6eOozc41BFWHZAz/s1DBKRMpFNsCtzgfINW/j33SmWq5k6wptJqueK+9M/KP0XGU3tOl2D08j5l
	xXih11ZMZaOa4qGluyk9BshRVK3uIhZEu9v/09Ml2rKTyIb4x7ZtJPzH9ff2T+CemzZ8dqWauhY0M
	rybVmLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqISv-00D1yZ-0P; Wed, 02 Nov 2022 18:27:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIRN-00D0mb-7O; Wed, 02 Nov 2022 18:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F3CE61B30;
	Wed,  2 Nov 2022 18:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36BEC433D7;
	Wed,  2 Nov 2022 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667413575;
	bh=0OnF8htTtPrhW90XoJmnZ9HiTpzXeY8j4Qxh7eEPkcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J5jL15/ZggiB//3835TMN3jw4jGvTN1hbV83U0GggX7zajZoFFU3MaXHAncNCHZNP
	 uYCl/DjFc3ueFj3RhLeg5yKAiHyZAIXA7kwOf4DeHEeJOoYgI8Pk9hAb9IJEfJq2r7
	 96HucyLcPfdqfGCGYrBjouQ6xrquHVYLpnSPMOBKyhYSVyx9llOSWj/61PZn484DTW
	 VSwYiS+w8J4+5jVBCFdF20YcJwJrEN/WGwnEL0YhdYZ7c/gA0XmMzo5I4y4+ni3Bt6
	 oJCoxJYW3+gTkcq70+PQoTDVQd23r279Ag2a+vHYnlnTTM6j3lkcfbyGBEkpFzNuH2
	 Clg5RWQwjeWfQ==
Received: by mail-lf1-f50.google.com with SMTP id d25so29168839lfb.7;
        Wed, 02 Nov 2022 11:26:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf2QgRa01eCXJejRHCPtormjn5V7lMsFHVJ5SG+lOonBvlymGMmg
	/ai6Pu2/kPNGb/C5qzbznO5fWWBBOEf0lr64Jg==
X-Google-Smtp-Source: AMsMyM7kjGNrP3+8CtQwqjr4zosxnOmrv8yYX7CqgC43OsFofOIvtBA61DXFtaoqkMCrosPPhD7KyRmyDY2H7UVJfF0=
X-Received: by 2002:a19:f24b:0:b0:4ab:cd12:d282 with SMTP id
 d11-20020a19f24b000000b004abcd12d282mr10160512lfk.74.1667413573707; Wed, 02
 Nov 2022 11:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
 <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
In-Reply-To: <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 2 Nov 2022 13:26:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKBtgXYFqkMmUxp6W0S45KxecVo+Qp261b2-7L7bOJDAw@mail.gmail.com>
Message-ID: <CAL_JsqKBtgXYFqkMmUxp6W0S45KxecVo+Qp261b2-7L7bOJDAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible string
 for MT7986 SoC
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_112617_377220_A7747E01 
X-CRM114-Status: GOOD (  13.49  )
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

On Mon, Oct 31, 2022 at 6:08 PM Daniel Golle <daniel@makrotopia.org> wrote:
>
> Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
> found in MT7981 and MT7986 SoCs.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)

Resending as the reply headers got lost...

Acked-by: Rob Herring <robh@kernel.org>

