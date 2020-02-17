Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3D3C35242
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:55:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1042072C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DeoaDntZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="gxFKXkh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1042072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrEf8im66bZp+F/ZIlrADmhI0cLZTnLKyTAgxay9ZE4=; b=DeoaDntZP/s1Cn
	epsDZ6UnB4gm8mCYLdIU8Qh1xZccNjnDu0XBepK6hq832B0vUbPqilua3KEgOLpyqz7QzJCbA+6TV
	3crST5VNLDkHwjEqU0Nma1rUfEXiNdyMtbMe13Ejn786voD4XUD5kbl2euZJZ477J2dJaQhnjuYXp
	DVbrdDLJd28DhOMG1Diw7QD1Bq5GzPK/GkzsjAa2fk7+Jajc9nW0Lb2sWFIpfXuFBXHUj1lhPHgfa
	KqxKrpETv37PCBVWV8brhtxkpQMV3Oah5Jb2sydIDJeE7IMwRq3dC5PGQ/vjo1VHvrEEJXkx7Q0II
	mjr6l4ADIGwXkKXghTTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3XVM-0007W8-5b; Mon, 17 Feb 2020 03:55:32 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3XVJ-0007V0-Pt
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 03:55:31 +0000
Received: by mail-io1-xd41.google.com with SMTP id i11so3941624ioi.12
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2020 19:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MDRwOw0qxHT8lr0hMdZ3Qai+ub8w2eSiYOEUSVqxsao=;
 b=gxFKXkh2sDRFMwdMCiVPpZM94a7Wqh//+i/PPGKzGqg109MExjedklZrYzYfEB1dOn
 1RSy4HwVcYyZEyQT2/50sKFaxsQXYw/KUtPQSDP0SgMbgkHZYACNmTy3pk+RfjP8wJ8H
 vIQbzTSkumfZSiOX1QkrO62yBG89y3JCzRkpualHWXG0WOZs2WCVsNdPN/uMBuN1PInl
 oqcehkB6H/Yc1VLJ3pAYtnF9A9V2mJze/G9H/eo22rOrbk+WDlH62AIzov8o++KQFpd7
 KP75BTi8ZU1s49FOmVefZoWDFS4sgNo3WYKRPRPKOjsYYbG/apbzhJqjc7u5AOkSY0o2
 u4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MDRwOw0qxHT8lr0hMdZ3Qai+ub8w2eSiYOEUSVqxsao=;
 b=ufafK6Ahih7ugtUJuRi/znoQzLR3OLxrUzXsTGYZAW7QXuLC5airh2aXLXTYyYzbDA
 pjVmiTFvwSGouaFPbIPMCe5uy6DZj7plcTQJ5yX9+ytfbkVvZODxE4Ew/X1nniHSYuRn
 K24Jw1zkqg5bAI6QA7DpnmUhfSZCFYOVzcWWnOh3Ew/a/g9m9xkFGY2MSXGcikbBrOo1
 qamzEymQB0cxN8XWBJ8sYTpK1z/P6yI7QIckxaEkdwxpIRjNlEIud3DGmX6fQ3siM1L6
 ZcmB02PqDshXQtSJODLcbITvoJDnB7bz9n3bUbqm5Sb9uPxZLrL22VzCNmIXHTk9QvjK
 u9Gg==
X-Gm-Message-State: APjAAAUyaYWYciYaQGQfaqux5k++oXqhkZh8HrcrsUofZA6izyXHhrnV
 AAKgcHiGCCmUFuFrLmu8M3cWGiRwCewWWTAADHvT5w==
X-Google-Smtp-Source: APXvYqzvM4FCMTrCi0v8wV4k9sbQWYIUffnsL+Kp3MW2/ZQ6XXOz2og41iziG0mONHGsGItgPmiMVNuzIdWL8NvO3J8=
X-Received: by 2002:a02:2101:: with SMTP id e1mr11084540jaa.29.1581911728799; 
 Sun, 16 Feb 2020 19:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20200217031653.52345-1-tzungbi@google.com>
 <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581911058.12629.1.camel@mtksdaap41>
In-Reply-To: <1581911058.12629.1.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:55:17 +0800
Message-ID: <CA+Px+wWRn1-t2fd+bD-PGRVjyLaAHqm1wF3W3T_GMUh0GXkA_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: fix race condition for HDMI jack
 status reporting
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_195529_869463_ED13CBF3 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 11:44 AM CK Hu <ck.hu@mediatek.com> wrote:
> On Mon, 2020-02-17 at 11:16 +0800, Tzung-Bi Shih wrote:
> > Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
>
> This patch looks good to me, but please merge this patch with the patch
> it fix.

5d3c64477392 ("drm/mediatek: support HDMI jack status reporting") has
applied to ASoC for-next branch.  This is a fixup patch.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
