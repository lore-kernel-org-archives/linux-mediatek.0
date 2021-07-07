Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD73C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 16:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FB661CC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 16:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15FB661CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/5tHw2qhsCGOgxZZu8xEW/VAnihAOH7Gors5hrU4gw=; b=e59CAGaswPppjI
	WWj+lqspyXGvNIgtRm7+MxsLKT23oEvTVjsPcUSB2tenjctyJTJxgwowKlITXxdATlXHsxakoL+p2
	pHEHj5BgnvNRxsZMzWQHQRoDbg0GkCWfzyUke6ZNW3MK8pqNX6q8ftbuNwDpGxSlX5arxVNCQ+2XW
	VOJgebud5MrIP8hv6crOCkVyQVCtTtFdounG9Wf5FazW6oRmplqd6JHiuUiNeMZCruBfAvErFP+VG
	1HKcCiO7A9+pOYTt6uxarXxvs2CWg8KslGxcRZk/XcBkBC9uPZ09nDI94IG2z7rbPLmohPC1wLQ0g
	x604nW5pylLPThfbrmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1AUt-00FIDE-Cl; Wed, 07 Jul 2021 16:34:03 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1AUq-00FICd-Gx
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 16:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625675624;
 bh=8mAyWsKkiUfu+lXYr++kx/mC3UJs7bAlIX5p6N4REPI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LPYTM9Dd/3dCYDHW/jprIrAnNwJ/l4Ssq7IV4sBuXwRUV0Q33XJLnwHvhUNHKK4ty
 cAparBBemS6SfZpFiXuW1jYlYcz8Xrpi8Mdb6tT8b1fJRekxaUHGKjznFlhQe5ITCY
 9Tf0jJJVHMIJK1A8luOIQMLUI9mPqOBq+IoAHLn8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.74.52] ([80.245.74.52]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Wed, 7 Jul 2021
 18:33:44 +0200
MIME-Version: 1.0
Message-ID: <trinity-367176f1-e245-430c-9dd8-cfde43635714-1625675624216@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Wed, 7 Jul 2021 18:33:44 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY__5H_0QfDs5RZ5eq193f1tTLJ3D6D+jyPA5nW_xtSrt6g@mail.gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
 <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
 <CAAOTY__5H_0QfDs5RZ5eq193f1tTLJ3D6D+jyPA5nW_xtSrt6g@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Xl9I5gidymKofQQvCNU8bnJD8rC6N4iGEajW/yAm23Z2qh+FEutrr5F9hst8O+r+0Ee+E
 s/k4dtdUUXaM9JuxaPdYZBkvNDhp+6nJrk/L37F/bQwFPLXQ3AIc47DNQMXfMeZKc1hp8SKAO9r4
 APhgJNXZJD7dQdmNlf10YcnbL3Apll/5CPMKjv+vEEfFiisSsJTYaLo4b4s4BKbp2elm4bYnIFjl
 iL3z3QjxSb6yatxafYZnqSvIQfRjZGlkcNIiM8/nCJz1GxbsKMhoX8jA3qM43kR+Tnjl88BPX5kf
 l8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:qv8yzQgidVI=:SbKaRf15yNX99OLDfXErbm
 oWoWpnK4VsyLofHoALZFGn9u1nnEo9NEp7/YKeqGJkeOrqrL+n8sLwDYG7WgjUUzeodBYxkhR
 Ke90ZO/3aezUybpG00+N37ZN+kNraV+bu7tisDZObOBhaqBj0KT2ci0KS6wDPPE3ux1l7PdoL
 cfzvnxPdP6RL42t4nVmAlLarn5UrH6t7OBLJCOkv1askK9IcDvJ0K1esc3zQw3oLTs+dwwPjd
 ipC7+khIwxXTDgbhp4O4bFHmWX/16yoakE2gJjs7JdWpNdPAmQWdeY6nNzmzPgbdM+/Y8uu/1
 oRZnO94cp4E0fXfMU9zxGQiLBGmAe2Sthl/PBeoU0C90kZ9RpBNw/EWSZsG/IRwAaADy6JWyW
 jMXKQ+U3Go4cu16LD5FZ9QvY5ESBfejz+PwcNhVDOAd6ZLXdTfZQXwnhUXYP78u4sfrX1nhdd
 yXfcVDf6HGjC8Otpsx2AH/IUsIeGwJpQpDr9S2rj2rCdAHUMNJOt5q6Hh+TjJgKkotojPbWkQ
 Rk+FwllwQS9OlagStjVE3AFPh+120bEaOVzxhKp111+JaYaA76wBoi+lryNHhYM/oFLD6xkq5
 LaCF9qECcGZ+wo5Z7X3AQrnJhAGyqbXt7aSb9uvx13FgXGpJHnhBEMWpeV7VwtiDVPa945OO7
 q99knB22KYwc2Xoalr/17eiNthD9DRxoDvJP9DNAZ2M7C76Qt7Y6Tz87p2HNOg+Lo9Z05ykiH
 rfPi9pbgPq8P+GBaID/mHj09/N1t9hQyh0sLkGZUeLttYTlgE02bnviu8kln/NS00mRj396ol
 LnT9A13u3GcoUWqNPh5u42cT/rpE397Qlm5a+ySNyP5Fth8sbw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_093400_938752_F6949E55 
X-CRM114-Status: GOOD (  12.67  )
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

> Gesendet: Mittwoch, 07. Juli 2021 um 17:03 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> I think you have done many experiment [1] and you bisect between
> 2e4773915223 (good) and be18cd1fcae2 (bad), and you are confused by
> merge commit.
> You may refer to [2] and it may help you to understand git bisect.

thanks for confirming the strange behaviour is caused by merge-commit. that was i'm thinking about...if the merge-commit is not in actual bisect "tree" then all commits linked to it disappear. basicly i understand bisect (binary search - checkout a commit by splitting commits in 2 halfes and then splitting the bad half again and again till only 1 commit is detected).

Imho the simplest solution may be flatten the tree (at least from good..HEAD) by rebasing, right?

tried simple rebasing (from 5.12-rc2 sha1 ~17823 commits), but failed somewhere in usb-subsystem ;(

i guess this happens if changes made in mergecommit...also tried with --rebase-merges and --preserve-merges but all do not make the history complete flat without conflicts

set the merge itself as good is not a solution, as there are many merges and in one is the breaking commit

other examples in your link do not change current history, only give tips for merging without these merge-commits

i have git v2.25.1

btw. i have done many more experiments as public visible, reverting commits that may break (many i can't revert as they have depencies-code changed in same block after the commit to be reverted - e.g.) by reading commit-message, and adding some debug-messages in the drm_atomic_helper.c (drm_atomic_helper_wait_for_vblanks,drm_atomic_helper_wait_for_flip_done where the WARN() is done), but i have not yet nailed down the issue

> [1] http://forum.banana-pi.org/t/bpi-r2-hdmi-4k-tv-fail/12307/4
> [2] https://stackoverflow.com/questions/17267816/git-bisect-with-merged-commits


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
