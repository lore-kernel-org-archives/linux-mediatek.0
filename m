Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F7CC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1D8610A6
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1D8610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZVw6aaabmcB6b+tUF1u84p4UB0kWGPiFK8ai73ax7o=; b=tjRoyd5X2OfoUN
	jaVOBxtKGbxCHtigfNC2Yp950ACuR/G1LFZIzEBWnbd+U870tNdHnsORsOspXqt3VKgtURjQrs6MX
	dw0iy3/69mLlQZX26yO0353Kwj3Vf3TU3+PnyTnj3S8ie1jt8cK89f4k15/g3qnK4eqDLD4xheAwC
	EhAYRgEg0t4wlbjvhL/55w40loDEmzoCELjSAK349t/8BZuOEckieh8SXTZaPVtYSuRmY5PfxE5Cq
	cVP5cdAS1Hekeke7LKlhwyX8ORLo53ZIXq6CL3Z+bhTNRt04ZkVDHpFUZBPaCcPT6aOEuEhy24Y5j
	x6iAWrQO17x1fDnT3VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1nLD-001ROV-SO; Fri, 09 Jul 2021 10:02:39 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1nLA-001RLX-6a
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625824929;
 bh=XFj6g3GV+RpeHb2OO2l5lG3AsAUjp5do6o9LF+YSJck=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GC0FDUcYNGJwlr6QcOQJU73N1T6ojetjTuhIyeaPB0nJ419Nt+4Lk4b/IZq4eo6zG
 a0sRcIjvuVPQE0k+udQcYWRwOoCDFx78g+ICWOZLdLE8eh7LbNfR85LQVdv+v9unaF
 4+XKKuCZycAijDJ38RFR0sFpuA2rQQTnW7J5TRFo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 12:02:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>, CK Hu <ck.hu@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Collabora Kernel ML <kernel@collabora.com>,
 chunkuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Fri, 9 Jul 2021 12:02:09 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xfGWEfj3g2j1ZQn2NIauZvVMn1yO+K6vlibdeSVOTRhT2GVkS1R6Wb4ajLYwj6+RE4MRo
 qg1BazB20yE/8qutYi/n/Kz0lJNPQm8PPZrsgHowL6LPhJyZKlNagxEy1ApWTrGbZH8fiUodnTAq
 aRIbXJw5b1lut73GYFIgrYXRghtB83zEz3vw/EeKXYBkXmB+kr72JQyeF6Nv7xRBi1HXnxFP2Uyp
 0sr38CC/D+eQFc3pvuVgMjXyNmqTZrtnRvgAQFL9n20dMjL9F7lv3M6VfLMJZL9l5kadgrT0T1G2
 rY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTgX9metJl0=:fP1Z66hDxQ+R06m+siar7S
 Gxi4wGlQm9OgVAcj4hfLiS8+B8lW1bjE3NY7oVppsaNGSAaxh3mdERIV4rA9GLaN+O3ebBbKR
 XKaQ+cjD4sm42CImorom7urZ6inzad7xq2qqi9mjQxGWunQir9tkNUbN0gd1kjF9SQf3Q7Yfo
 t7QXqR7zDDdtmnCTTMvBqv6heNTu9W02gZNOKIa2CefT8qc/HxP+4von4gRLYb2bILGV7I7Fu
 xR/vVP5EpylPhWCrq6PrBkRpYHuMFWCVnfA9+/qi6CShbXhJGUM8YVUHYeI+Mwml4GthsSlCY
 YdGudpSDlLXmjuUGkB+/490PYK9zz0RfQfn2W7USJ2s+FRFUZZhYoC0a4vn3Ok7xH8osvUoCN
 tQ3m63EmKgaFJJNCPvrKXYZtEpGXG0KhWHBQunngBYPWwBBNmr7FBE4MgGfUqcDELinV8CyLb
 fBUrx5ZP+wA1PXKz/5MVdsw4nVoE4kZORe+3Ea2N4WyJ7g9nqlUfiYsU93Ru22KhHVd1eROK/
 BJKB47Ae99bAdq/xNJC26RkEVZFV8IFcUqcYVGmqp2CwNlGKe7GUnQY1I4C7Mf/k+baXpFgSr
 tjzu55ZNPnGcV6ok/iNdvGmkEy9G3d1509X+9HSRhCxhvTcqtKA74SuMWO8SfB5NsFI5rtRMG
 l6BxXKrqMo9FnKU5Tyq08zy1lRsK+7mxiBXy8+AWvnGEbal+mVL1/ev5WlE6avbk+yvo0yD4O
 A/UpNzAFPGbhdTWRVQDNjKP+BFSfKqvRykFHUrS98aOAfzych5UfyudEfphP9OXhXhvroYp+Q
 y+VQ2aeY0iaEHtOVZHDmn0j2JnnjDFtc7WSyTkVBXW++OpYlZ0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_030236_563522_C8C37A44 
X-CRM114-Status: UNSURE (   6.97  )
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

i've found it :)

hdmi-problem is caused by

commit 440147639ac79f699a4eb9811d0bc39d3cc815f4
Author: CK Hu <ck.hu@mediatek.com>
Date:   Wed Mar 17 19:17:10 2021 +0100

    soc: mediatek: mmsys: Use an array for setting the routing registers

but i cannot revert it alone, but after reverting all mmsys-patches hdmi works (ovl irq-handler called)

$ git logone v5.12..v5.13-rc1 -- drivers/ | grep 'mtk\|mediatek' | grep mmsys
060f7875bd23 2021-04-05 soc: mediatek: mmsys: Add support for MT8167 SoC
1ff1270fca33 2021-03-30 soc: mediatek: mmsys: Add mt8183 mmsys routing table
440147639ac7 2021-03-17 soc: mediatek: mmsys: Use an array for setting the routing registers
ce15e7faa2fc 2021-03-17 soc: mediatek: mmsys: Create struct mtk_mmsys to store context data

git revert 060f7875bd23 1ff1270fca33 440147639ac7 ce15e7faa2fc

and after reapplying them one-by-one it stops working on commit above (440147639ac7)

@Dafna can you confirm it solves your issue too?

btw. watchdog issue is caused by

commit bbece05c0d3a96817483e0b249ad1e302ba95117
watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem

have already contacted author

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
