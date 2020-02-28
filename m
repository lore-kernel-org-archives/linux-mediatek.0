Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C09C3F2D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1671246BA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJK74XTn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="M893la1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1671246BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:
	From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnaAKWUuBTYa2gnmHe/gFY9Na3Ba+qJG5xxUOtyvubY=; b=CJK74XTn3Nq3dm
	6hyUkBi4ndgxEpdriBCpfallNuRqXXriJH9anOhof7RGhFb5l49rlmiWah5Zt50qXG2PviNLpq1D1
	Tb3msQCwoy++k8WDfWLHodmyJCi0rQIXkmBOkUXWT8MyJ6ZVo0NksjyNlbNl5wo62IHIvw4PkGbrC
	deQ5NmILxlZpxInSAv2zh/63HR76O4/CMOJAtqAFunGMUyYwKVZvUP+Ywo+1shp0h+vk0WFTbpsBA
	NyPHkQi++RNU+CdWvARbmUiAvqataXjK1U40NvyA52/Hh6WGaCruPn5A96NsY8gQkNArFR04NI3dq
	gHYhczqxsq/dCK26wJVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ibg-0004lW-BD; Fri, 28 Feb 2020 16:35:20 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ibS-0003Og-QB; Fri, 28 Feb 2020 16:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582907688;
 bh=YcG6r7F3VVt7DQsFNhV4JbQ/Bh6aKNh0DkfRxFndYAA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M893la1WZgDW7/xWaBckbU4Odje3StaE2YcrGjt7TLxyK3pbX/Ea23pa9tN/cHEH7
 joHd8VOqO6RSYD0a0SS6Ty3j2XCMW2ucMF+AzxWLxQmzVPStkZStnqrxLMH4lEZRAD
 CzydVU3Wqs7ndlgvC4LH1dlsW2OpHQHQinHzZuGU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.40.15] ([185.53.40.15]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Fri, 28 Feb 2020
 17:34:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-1aeda07b-567b-4a31-a709-36199975894b-1582907687950@3c-app-gmx-bap21>
From: "Frank Wunderlich" <frank-w@public-files.de>
To: "Bibby Hsieh" <bibby.hsieh@mediatek.com>
Subject: [BUG] [PATCH v5 3/7] drm/mediatek: update cursors by using async
 atomic update
Date: Fri, 28 Feb 2020 17:34:47 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20191210050526.4437-4-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
 <20191210050526.4437-4-bibby.hsieh@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2wHSXETBujv7ubTGIwZ5VrMFtJmoX/njL13MkH8s5eovSX+Y+sTe0+BByPkiM5mY2rzQm
 gKpnl5HTR1TX8ZwimXy747VbCYUysGQw+GdtehRIGT5il+WUm2aG81V2Bu0Dpft2U3SY51brmqYE
 H0JgZOtLaL0+tXa8kZMGxWwyoVLkjFO5i3HFnIccGF/d2ihL7iTlHuSy3H9axD1B76whc67PrgRz
 VBlEsXrblvHd0UmCQ6WWGJeRXN83aG2f7ScyhV9hAm1fz/xBSUnehkXcTmbnfvD6ndAjICp0ek9M
 Rc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:K7AD3qghSCg=:KDuvUtyqh0IxQhZ8dH9kvu
 UkMiaACx+8TarnVTvKLAKYfLysNr+9tfMvPZLRxVtUh1T0O1DBm4Rko4sdLxfCcUGMflBCrDF
 ciX4YIyA6kuUTwucfzx22ITRFECEbD2yoh1WgJbxUXd9NJYwXopioXyMMrwaM6xnYz/nLIr7o
 mUGZMog7Dou+NeR5Em4TB8BEgRtUTLT6+nfdjLNz4ShGizgdYRFKt+/vHZk/V1IW+aFci1vsg
 LHvupXQWPTqlYNA3JS0Km5lF3zWjBdUJIGrdIGympZEuHb5mAtd4vGX9XsCeZH3p1WjQ/MpQY
 4acYwTHnCUAyGf7pGu2tzR8WsBvTvBOIW4Q8I03JkR+4har3qSWjIcdqgk2ff+6RSbEXVjquZ
 C7mZBt3pEMeZjKM+Z1HkvLnv2XrRM8CB/s3gUG3quARYuumwpA7BH7F7fOTjduxgqWlhv3YVO
 mhEDvNNyn9mge3Vz9N5MalwRkGJ5FJFlPEG9tEBlGoHxehlLMAMYcXVl4oE5ffpiFOpSG15y4
 rm2LvOfG+tHze6Pl5a18bTr459tAbHXJYVUGnvmhov147zK1eBq3bFk9JHKV0fMl5up+E2is1
 +YOSmDnrCG2i9TqD76kwDIFdZnprjEY1f1rR8oEq2QgrAsYW0byi74bJRq34xclYgmkooSZsk
 eGfDPVeomp5G0jsWbOdU4oBMCEo7ol8LkDiWjXMdSbjZUOrU62FolI9j7z62bk/OQrp0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_083507_204701_EB4D8656 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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
Cc: drinkcat@chromium.org, Philipp Zabel <p.zabel@pengutronix.de>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

as talked to Bibby directly, this Patch seems to create a bug with touchscreens. Cursor is displayed on old position if changing its position. e.g. Cursor was on X1,Y1 and i touch to new position X2,Y2 the "click" is recognized on right position (i try to ), but cursor is displayed on X1,Y1

have made a small video and uploaded to my gdrive [1]...

here i use lightdm login manager and selecting the username/password-fields alternately. Focus follows, but cursor is always displayed on prior position

tried to revert this commit [2], but there are many depencies failing the revert, have not yet got all depending commits reverted

regards Frank

[1] https://drive.google.com/open?id=1Qy0tYnbO9zNGdjCWY18O-dMYbFuPrq_i
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=920fffcc891276a855cb3ce1e7361d2e9cb72581

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
