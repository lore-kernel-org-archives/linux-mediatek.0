Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0054DC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:38:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B866102A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B866102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkvzDWtZ+GKjRMGDlHP/pR1kBjD7ks4TGYJp5ewPfGE=; b=AwDic0Z23rOA+D
	TJvEEHfk3H8Ut8TRF5Rn4LFOutpVtgYbyH1KilKmRWYBeuSKEq+udVqYW11rHk6kl1U1US4F4fuc4
	rs36bENcJf7gaZrYdtbPNNoO+pKZEWxDx8jGh4DZxvys9zEmZ6agOArN8UCZaTU+ANdIrHhQ7SLMc
	Nv+0SvAN425dGiQT1K1qIRG3kOB3qlhx7xopLV8IZwI7UROpH15mllL9+fhnqh5M5EM6Yq+f4CGta
	FrlqkbhJki68EXekkS4JR6ExsRGKCqfu3Eh4FXSyBw/lUeE7yb/9IF5kFSd8dWfjRZKM0CLWkkQit
	RqWm8moCemG7YEq1iXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1nu4-001YuW-Ax; Fri, 09 Jul 2021 10:38:40 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1nu1-001Yrx-LR
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625827104;
 bh=dmnsbIWk0nset7dhBQ9h1s9ni+AQTT4cJf8My5/V3U0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f5WnjM+VaLylQA+8+GuXR7H8whZMW9Tth2ckqJdq2TXWnxDwCSwnE567o//z0d0Wd
 nHqdImvP1Ttc3LSg1tGPzBMg/jheZDZA1SWPGpsfU5zaQ6xs6sNT9rrQv1S04w0zU4
 xEl4kuYY62AjKgaLmt270S/dpdR4pFee94cDX4AA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 12:38:24 +0200
MIME-Version: 1.0
Message-ID: <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, chunkuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Fri, 9 Jul 2021 12:38:24 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:muffxs4aezILt2UyUlQ93ZSkDRulvqVdkx+j5agssMTXU875Oz1fv9Tz5iDhWeg2hjbH0
 Oye7YLDYcf8bJTz1b4Mjb7uuaoT3MSRq5wfNGatPq5goTj/ScVDQgSEoMD51RrO29pSyKmmbUYkH
 SAsQ5BRMA1VW6SXHxdzVNFrh+CRjugnh7YsHgmoYcPwUj69fIso0NpyE9Iv+jE5MsFSNwNWIu2ki
 JLLg0nC9oUUD1/Sa4zWUYdqh0AF4D8yU2g8WMZHQQj/sW5ZTKrtz1RYzLip534AEZ2shbixerJKt
 HA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:06RW9iJ3g3w=:9nyJxXy0IvK8vq2Hqz7VvN
 sGc89fXVi02zmNnxVJdKosLH7WbITc7S/qreaebnMgE5yKeSVJkpcdLX/epI+52liEWiEKY7S
 kSggzV3S5Verwuf7Vp4BmIf0MHjuj18YI/UzuP+xLorATgozgIDCbqGI19Opj6L2IPB0jLuoY
 CRkJ7FpZZYNcm6jixMJ42PPVn5UJdGnBVdYicGuPn7bH3WvUOzy/GM1xVqdXa6GW9qrQGkLti
 YFKoP7Tg/uYlH3Tfdfi+W0BKQco1A+Xn86V3a4O8dhzd5Di+QrYIixueV1kNABIqYm3lFauWt
 jgoxvYd50G5+vAA49KE4vghVAVmagku16EDe+Ya0ymNMbcfEMyNlbxjra9SVOfJEd2GHTRaCa
 U/6TmPRyLtVsThALy9eRthvJLmDENGzkr64Fdb1OLr3b7XU6cSW9fmo/DX5dkgoiyvBdPOk3B
 IN4ZOf8EMlHZXW5IKA+VtkKHwOjV6FG0oOqTbNebD8Y2JxzPMpA/5XcoEuyt404EnLa/zx+o1
 5CKCX6OPqrqxHLOtAbUqIiQXvrtyJaPTnNK5ReocJ8DW3Qh1tujpBoti2NEXhJfLGaVVBTwAa
 VyWjn6jgIrtjNq3OlwMhUdbQCFTEX/XHU+XcNHyUbVih1VIFmKyv7TlY03k0FWGPSeCebM2Ye
 hx2zd4Te4yhHjqExY0TJpD3MItuIUCdWpgqp2Lg0C31SjgoBTsuPlrEc8DJ2BJfHBJDSiUoQS
 pSwYsOe2GJtikn/K92rNoXOTtbbYFgpnvTzya89ZpmFNd1SyfTpB/QMeIt4Zh+lDB75LyMN8c
 V9rs2u8YXgLpe1IKwsqnTPje45N6bz9FH+0RRnSOZ0vD1tadrs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_033838_060224_0BFE840E 
X-CRM114-Status: GOOD (  12.85  )
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


> Gesendet: Freitag, 09. Juli 2021 um 12:24 Uhr
> Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> If this is the offending commit, could you try if the following patch
> fixes the issue for you?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.13-next/fixes&id=db39994e0bd852c6612a9709e63c09b98b161e00
>
> If not, and that patch is the offending commit, it probably means that
> the default routing table doesn't work for mt7623. Needs a specific
> soc table.

Hi Eric,

thanks for response, but it does not fix the issue for me. hdmi on mt7623 is DPI not DSI. There is already a mt7623 specific routing-table defined (one for DPI/HDMI and one for external=DSI/MIPI):

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mtk_drm_drv.c#L74

maybe it can be included or compared with the "default" route?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
