Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E8AC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:17:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E4F61006
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E4F61006
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIgiuG/pkFuZEniXSrg1ewF2DUQQQz0t8Kwpg3EayP4=; b=JBV5cn1Ctw3VWc
	m3KgQPka+kQc9QEfWf9qyQV7pLrLw0Nmf0h1IyTlpF+tuop0+ET0fTzAZSQKhIBG8kP7nvaVK5a3U
	zVc5EzNlzguvfb9utIRuL1ScZmDky16RdOFqAPt/oqAy3oQHgygtTdvIHcJmw6erCc1R2DB4COT06
	9aGBtZYsFYnli9+6+PS7Ac9/cA0bKip2N3XGJWtkjjOvTfHW7PqDGPER8SMXFkxajJBSndFnBWcXa
	l6oC3hmCA3+jqEA2U3tOPgRL0x5mH6VMBkKAPc6Wg1KSPRpo1XxJpaCFFDc3vmLcPSrqCUqpRpcpj
	VX94C/HAkuXN0xs15jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2t0C-006vRo-CB; Mon, 12 Jul 2021 10:17:28 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2szI-006un1-Eh
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 10:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626084986;
 bh=JMgyay+YyzCR7cAHs9mF7PoljaYXpFKpYzGhoYj6ySs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VhcRPh+pWcIwNyTRpK869kGnKlHaHs1zgcOOMtUU+RbGPtMdqWeDI+iUzC/MRJKc5
 ydz6Lwo6eJ+4858zCjs59wycBV+ytm7Fj4ae+WW5Yf3KBnwW0gceaR1++xL9EJ53DO
 yTXKVNMiRSwB9nKr0vQdLPt6oWKv2mu3uj1sFRxQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.139] ([157.180.225.139]) by web-mail.gmx.net
 (3c-app-gmx-bs28.server.lan [172.19.170.80]) (via HTTP); Mon, 12 Jul 2021
 10:11:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-2d1b055a-73b0-4a15-9677-08fd13fd486d-1626077468706@3c-app-gmx-bs28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Collabora Kernel ML <kernel@collabora.com>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Mon, 12 Jul 2021 10:11:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_-yi5NP_U-m==ZHeBNC9-6NrjUacKWdmmgVXZjH+sFZKw@mail.gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
 <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
 <trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43>
 <CAAOTY_-yi5NP_U-m==ZHeBNC9-6NrjUacKWdmmgVXZjH+sFZKw@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xkpAQRS+6hCibb8IREI/4+UQBOmHX66bpR+hfwPP9SZMr+UzKW47NfS8x+VrAsKc4Ee5V
 sIYOpYqt00E6MnbGXUEbYNR8D1Zb5iXk3A7u8WZJxQaLQ31WsFcV65jqxqMbdmZNGIfmfFO2knQR
 l33LYvxaOw+3bw1BE5fAQxl9rCVJmr4U+W6DpVwcBAG2f/Akxl9QpPBlUyVlzcaHtsxieRTPn3fC
 tcir/G8tjeb1Ouz7HEKFPXmzNL/L/CAHcd/CaMK/0iElTmacIp7HFjyzhPQ7VPPGdPB5toqPtgjP
 J8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pq3V20Lib4k=:Is93qU8I0RybEBO8tUVnqn
 nDaL0K/++9xCLy/7LxO2hK66bUOe6bfxtsRfBJR1l43bot71MdFsSzMhVsnsRDw+0L1vwFXMR
 WjhKdmXX1cntpXTbCdPBJjbsqtbAw/+h5/BCsacSqPERzBvh318r5BfyIZa2R1pu1VlTpTTt9
 EW9lGArgtzJ1hgM0IqmJ4SHgKUiWsh2QrbI57S9RpckPFg88u8MWa/Fb+eJ7UtWD1uLbtX/n/
 sK3/HQ0OTPMlx9MgJVuJZPkYbGDsPjSDTSYMjrhF8fNWlZcvADewHXAMyTRy3Y/ncj1uFJCpt
 xLursTYxREK0Bncyw9vZsCbCPJsxpYxDu4vK/1Pzy6N24INRc7n4V0sDZpmF9hkw46hagG6DJ
 HS0K6c0dZkzd/BX9GHoYi6oSDzy4bX8hEiTfK8RWHih6Zym0s0wTMToeiIb/UlF/ZzJqFzHVx
 rUV48qMh9DyZR/txo2Q9NspVJxcE6CvyWxW6dm6gq5adAR2FhKoWWEtYe8o7893HMGUsI2X+H
 dqMyYoU2WOyHfLO+e5A1kLG3x7FTgoVZOvPpfuwhAxcwGY0qi1dJj/ix3KABkdHzPDlzpm1gV
 7Fe17xdkfqY8xDyEal1wZbjmojN6+EBQ9QkTsZfSJFQoUJS8f5o39salki3QIHAJcnSU44Kom
 xYZ2SLOXNKodxuqwAXZweyxga9auHOgtMNUDkMKa/g/1ufFqW60P0rLFQnTDi5wmRZWp69Jla
 0hRnxvYzp17EkORp85yzpxDS46cBRU28syOiVEhEf7TFo+rhjMR5t3ssuMWhVzMpD3V3333Lr
 4TmjY4w5KRFa3r0Dv0gEjiWogcAc2FJIiF3Np2XTXiKNsZodiA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_031632_852301_448E8833 
X-CRM114-Status: UNSURE (   9.49  )
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

Hi,

HDMI is broken again in 5.14-rc1 (of course i have applied my patch [1])

now i've got a NULL pointer dereference

[   21.883641] PC is at mtk_dpi_bridge_atomic_check+0x38/0x78
[   21.889158] LR is at drm_atomic_bridge_chain_check+0x150/0x30c

"dpi" is  not set correctly in mtk_dpi_bridge_atomic_check

this function is new since

commit ec8747c52434b69cea2b18068e72f051e23d3839
    drm/mediatek: dpi: Add bus format negotiation

i do not see where bridge->driver_private is set, but in other function it is solved like this:

bridge_to_dpi(bridge)

this fixes the NULL-pointer dereference, and system starts to xserver, but i do not see fbcon...it looks like drm is now initialized later (~ at login prompt on serial console). i stopped lightdm and still do not see loginprompt on hdmi, so it looks like fbcon is broken

send out fix for NULL issue, but fbcon ist still unclear...but i see this in dmesg:

dmesg | grep -i fbcon
[    0.000000] Kernel command line: root=/dev/mmcblk0p2 rw rootwait earlyprintk console=ttyS0,115200 video=1280x1024 console=tty1 fbcon=map:0
[    0.000000] Unknown command line parameters: fbcon=map:0
[    7.040167]     fbcon=map:0

and no framebuffer/fb0 in dmesg

regards Frank

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210710132431.265985-1-linux@fw-web.de/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
