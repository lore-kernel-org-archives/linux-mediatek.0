Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A458AC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C886101E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C886101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvCPZWqLw/JbIh6lO5CtB5juwCmtvW3ttHd8o6ysuTs=; b=cwbiN4CEOz+1/Z
	hR4u880cqNPmLghP+QqT4f+/DaYj2ye5eWgOJ0t7f8fsQ3EqoFsP//hJRsS4wPmSjEMe9dFKWXiPe
	XR6a9IQIpQOg5NjIJzwO9JBH0ycVUdU+84pn03w86ueAwiHW+l0CHaAsYCR6wNNcw6yj2wpvrrsI6
	TwLgGHQ9e8kfhqe+EKBvrRPq9rEUzCT1iHWv9bpNCCXllvtpwfqSazpKwYjxTROnuASx43wxXoola
	AdHBGDm4/iXnBhO8Kg6yfxY6AInZfiTCPuaWOUfXuysqyTo0ZTCbA78alyfm90noi67MjnYjovsjV
	YWTUtqqXVsZG0CwoS0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jeZ-00BabL-Uc; Tue, 06 Jul 2021 11:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0jRo-00BTZO-4Z
 for linux-mediatek@bombadil.infradead.org; Tue, 06 Jul 2021 11:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=gzozfKpf7150mPxp1Qoke/6QSxyEe3q/BbRiSbdTrbs=; b=VhaSFCnfFZDhH+WNJuSrFa7anT
 VyL/uo79SizkbVoo2IUQuylm7Y1pgnuIY8StfQ6kkkKC9oovgz0fim/olX6ZuYj5QXGjmXQpEmwYT
 SmV4hH8acZxAsSpzhJWALZsRGAC73AVnegmeG0GSBWTzuiZND7vwKK2HIxU4ppRwJJLhcS6+R9HSa
 PZ60e/ZJJ94sCcdxf8vZt1VKUlRFgBN9iAp582tMrR8Ogj+vCHJz2mIrRVK3+2VcGRtfe8YoA7xPN
 JJb/G9sBuwZypmTqzysBawQlu4x54JEgXLq6ZFuCSdEYbKwOdjsZ4ZTz4PYhLD9mgZDN/MGgK1FW1
 9UWHxT/Q==;
Received: from mout.gmx.net ([212.227.15.15])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0jRk-00F20I-Bo
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625571632;
 bh=nqG/g6YoDQ3Cr6IxntXpO3+qXORMb4BY7rzWo7WkW9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=haLyWBq6yDhdsV/Q8xdjm6fBgWn/t3ksynspjmENMTeuHGb5Uzwo5j4RPF5mHfNxS
 4au58c6cmTHlmIHRvOFUA2DF2oC6diDlxOmUw815274B0GEwkCEfDQ7CNP7oxfwcLF
 yUOrNteHuAfno2sJCoD+AHJEXY5Or3zO+j4+2S+s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.159] ([80.245.79.159]) by web-mail.gmx.net
 (3c-app-gmx-bs60.server.lan [172.19.170.144]) (via HTTP); Tue, 6 Jul 2021
 13:40:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Tue, 6 Jul 2021 13:40:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YOQ8ktv1MypezrEy@phenom.ffwll.local>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:yBMlpo5tuOYEw1oNXBnbTgKo35sOzSkMHe7TQ5KITpGJHZSzeG9nbJyWqN2crVp5Kun95
 iDAZMR3ksjB1FOOG7jTfcLf2PaLG1r6mMQMqkehqP2CmMQbypxlhiBAwNna1RC/fIrUGVfmmZYvc
 zEzmMQBMXJXAWobQC6V1eQpx59exnwB5OMMzFJ3N3QLLW/+hTgPs/UYWD7mtNztam/U08x6AIagq
 HCpD+dagdZSWrcnGhkqrnlsU4vBFCRZ6prJO7Hk+giFEg5QPyvXu1bgWzuwuty9dWNhsXRUoQI4y
 0E=
X-UI-Out-Filterresults: notjunk:1;V03:K0:tYmr9KS/Xi4=:y+LSVYu6FHQ3Uj/c1nBL+0
 i8gmTBwUqt5qT7+JHRE7g48bjKq4nN7bmgyoCGu2qai3m8b3eMdWYicjKYAXUJhTVdkOjZMzF
 n/XVeOQYbf6Xi4shHYCpKoeQicTBip0oU/vvdgOBj+qRNvhM+F7DqVsjVGmbzD1VCjUdRikjg
 EFa2Gbz4JoqVTO5U/xSXUdsVZZF46QHLYJVHQSAGVpyDaBNdLBLe+jkwrbXJfpSV07ZRtatvp
 FHcCc3XwHAHDROi7lmggHYN89uMUGLRF/D5YlHOrpNHXWMgWGmLAAhxvwbDkchS+XNxKZoha+
 IET89GuVOzwf/w61ak2Ldq1SkLOHo54xjBHg6qWSbw5pBEgfjjZncfCs7teotZy2Ie/zjO5M/
 AxZb8glCxYn2KxXf48PwExuqTrV321lL7ClIJoLblTodnxy/Cw27RSXwgcJViDnDOLXO880Uu
 m5pGw16Cf16PNxN0VYELg1NBxmxZN7BYKGoaiFYLHfstql7RSKPCHFo+YJB30Daw5d3u6Vsu5
 ZZj4XMmoWZ7KlA4jJFOnzTBPCPnL7TELmT4/hRuUBUDC8zN2AosOHR0lmDQvvK8ccFvRCgM/U
 IPEdkHcdURy8GpKiNNk6z+X9Y2aF4FkRIY5lYNFsfWeMOhyQyQ9wDESeTXyZmFucY5O4NN9ZY
 TK20+pICP6TubkS/8F8B7Pq7S1i7P7GK2Rs4WLf2RWAoXMcv//VEsauGJg+3dMQ8iQ+jnlEmk
 svZDS2u8DSRVlFaRmPADBcMuB0o/CAbo0KgzxFyvRgdARMIdIFdFrG1CWOzzRmGY/i/t7TGMQ
 wGaGG+c7MnRvi/4L+6MWwstbuvttKHjplmetsHuLFydHMUKqL4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_124100_530510_8F494013 
X-CRM114-Status: GOOD (  29.73  )
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

Hi Daniel

> Gesendet: Dienstag, 06. Juli 2021 um 13:20 Uhr
> Von: "Daniel Vetter" <daniel@ffwll.ch>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, "Matthias Brugger" <matthias.bgg@gmail.com>
> Betreff: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
>
> On Tue, Jul 06, 2021 at 11:54:39AM +0200, Frank Wunderlich wrote:
> > Hi,
> >
> > i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> >
> > after some research i noticed that it is working till
> >
> > commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> > Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Date:   Tue Mar 30 13:09:02 2021 +0200
> >
> >     drm/mediatek: Don't support hdmi connector creation
> >
> >
> > which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches
> >
> > dmesg shows the following:
> >
> > [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
> > p_ovl_component_ops)
> > [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
> > sp_rdma_component_ops)
> > [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
> > isp_color_component_ops)
> > [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
> > sp_rdma_component_ops)
> > [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
> > _component_ops)
> > [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
> > ponent 9 is disabled or missing
> > ....
> > [   38.403957] Console: switching to colour frame buffer device 160x64
> > [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
> > tc-0] commit wait timed out
> > [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
> > 32:HDMI-A-1] commit wait timed out
> > [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
> > lane-0] commit wait timed out
> > [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
> > still a pending event
> > [   69.106385] ------------[ cut here ]------------
> > [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
> > 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> > [   69.106414] [CRTC:41:crtc-0] vblank wait timed out
> >
> > so i guess the breaking commit may be this:
> >
> > $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> > b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> >
> > in drivers/gpu/drm/drm_atomic{,_helper}.c
> >
> > but i cannot confirm it because my git bisect does strange things (after
> > defining 5.13 as bad and the 2e4773915223 as good, second step is before
> > the good commit till the end, last steps are 5.11...). sorry, i'm still
> > new to bisect.
>
> drm history runs in parallel with the main tree, so occasionally the
> version that's reported as baseline is confusing and older than what you
> might expect. Just trust git bisect, it's doing the right thing, and make
> sure you test exactly the kernel you're supposed to test. Compiling with
> CONFIG_LOCALVERSION_AUTO helps a lot to make sure you're really booting
> into the right sha1.

my build-script adds sha1 to filename (for tftp-usage) and kernelinfo (uname -a)

> > the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based
> > on this...but the fix was not included in 5.12-rc2 (only after
> > 5.12.0...got it by merging 5.12.14)
>
> Yeah that can also happen because of all the non-linear trees involved in
> linux development.

how to find the real breaking commit?

> > maybe you can help me?
>
> So now I'm confused, you're talking about a fix, or is it still broken in
> latest upstream?
> -Daniel

it is still broken, as i did not found the root cause...only a guess based on errors in dmesg...git bisect points me afair to mt76 wifi-driver which is completely unrelated...as i said, the fix i defined as "last good" was no more there after 2nd bisect step.

The fix i set as last good was fixing 5.12 issue (handling connector/creating bridge without it), but 5.13 has a new one (atomic timeout,drivers/gpu/drm/drm_atomic{,_helper}.c) which i cannot trace to the breaking commit.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
