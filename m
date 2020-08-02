Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4315DC433E1
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 08:23:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122FE20738
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 08:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIx1JBvC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="kiJdOqEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122FE20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGLT+DTRYMOzT6DKR6Zv5yMkzMKWWYMP0YGjxCYPLVU=; b=VIx1JBvCWsqtsXmtBD++v0Kfgv
	U6xjKsnxUWwJeHhts6rL8O1PaqUISaz2eYeogPoYLm6mRBM3FMpukIQSTJQelgx4E12z1F87KWrRO
	nKZzu0toanxi5j3uAE9Lg0mtDTi+1HbyrcIax5pfP9RKttb+har3lR63e613rSr7VLpCRXQryztOj
	WZcX6SvZikc6RZEmExE86XzA9SI70ILo0QiMf1bx6U6EHnIdlpnXof0dXsw4yzUyqeafTqttUZWty
	/G6AONp3MXJ5SVE5pIrlIW76Nc496uGdhnPzHu5Nj1urHe88pA6AX2eeocpHRLgtyEmlnHIRqnU7i
	NsmvSvoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k29HD-0000Wx-LZ; Sun, 02 Aug 2020 08:23:29 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k29H3-0000Vo-Ep; Sun, 02 Aug 2020 08:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596356596;
 bh=PQ2sPG5p324ifQb0YMxfDxK1lEkh9ilGDsno+DsEzaY=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=kiJdOqEiBJk1G9enZ+j1LIX176WabQ3QmjCS5xtWepy0wTBt30q8cxX4tT01he3er
 D+XJR7H2yhswYMmgH3OieXzgR2DrG6/VPQOTA6s3hp/saB3qzMxSQXUOft1Rgc2+Rp
 VoPHTbvcDOk2l6b5tUsaGoa58wXzPWumW3klLkPE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.148.8]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1k1Jq83J3N-001NND; Sun, 02
 Aug 2020 10:17:37 +0200
Date: Sun, 02 Aug 2020 10:17:31 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-5-frank-w@public-files.de>
 <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <3A3F5CA5-85C9-4CD8-9CF1-8A4411901C1F@public-files.de>
X-Provags-ID: V03:K1:8AbS/l2zu48Uj4jsqyhgwGVm2qyPBsdakcvG9Thdq1zFkKpd6dk
 Q+UyV2CGpURx6lo8b+g3oSAzIaRq035kzd53WFtueIzKa7TTeq2/F8fjxLQxthNongRZk7G
 lCUB+5sBqkTxYIswin6WMeOHvOhwzjqh2b4X67xBQt8Yy5oab6O/ULVnWl+a3ZdclD7Zq/G
 FY9RGUvvIIVzr45Av0ZJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uC1Rjn8KPV8=:i6APzHghHjWxnx6QsV1Iqg
 SH2J8BuaC2t9s2rXBCGMaQSIqwbVOsuF1pUU5W+3mP15cnsXngc2GiDqkUk16h7k/FfRXNLXU
 qwxWuIQmsSzsaRSHRG6BDlOFTvMnuqeGVhGvhBughlr4Xfkhy/i/+B9O1i5fkgXgI0R1g11L3
 nP2zOdi3nWHegnDmuuXg+Y53bZh0sHvQQKq2O9Rzg2WeddSC0pZpVHQDm3TZqlmphUXIKEaCa
 gkhxcsGjaGwjUzanOzl1PmV3ZfloGu1rtLZu1hD9LGRpR0y7pX7uvSzBjEJOb/Ts4Rk23YSLz
 RHl7TAhYHhWSOD8eYKDqx+dOomKaeTMmN3h3opNikgXXLJtgxsVxxPgs03O4IeMj1BQQoYcVO
 XAjlHM6SJzf/ZC1cCYq0JSwrfFSTGrHZ6zaiGD51yEzX7k1rYMZZSlqQ1/etYYqCP9P1es93L
 l3pNKRVyqvAmkverJDlOmoK0baKV8/Do4uVn398Li0bu211arN4c0NGyhGvx4skrvjjEc+DyF
 YzA1PAF0h4DhWchz2CUk+uxFlfbAwhDAzEnd1GDOxZae2HQpVxRVYM0B/k1j28GUUYRUBdoFn
 GaI/Zy0K+IKHkM5OWciKZ4jwfa6DWFrZmhvuk7yxU/3hCs4eBsDyZ4yOIjraeIoTL4drblkmZ
 yTOHr3BG3nlLBDxQg/NQwG4Uy7nWwop4GdjlAe8R+QcC5Mt/mNWf3D8kuayL9ebcMQe3QxHe6
 NLnhPJcaQ5B25m7C+Or+8hBKY++VfrqxkE4HQ/B34PBp2R8JFCX2uw/izi17mNjnTbLBV7ubu
 SPMbus9b9vf5YW3tn9EqoiUsO3Mq11lQi7Efi4aIl5uUyJHoZNeL9gllhfLeClYanbUDKfNAS
 y8GMbVu2zIRoJNXK4nQHtz7KabdsT1mxxhTiG67VmVIn5Zn3jt/dsMjtBmYS9rewE7HUfwEuH
 lbNsGRtK8mcPNX10RLvaMYmBoVc8/ywmJLjvj+sY+nKROObIiUYEHJPZZGUebfY1TciaDkxyw
 PHIv+Z90k+NUrwlapGPjiLgw8QjUGcjaENLgeLCOEbFCB18mia7TR1tIrfvCuvEbmYTmpsCTd
 yD16CCBD8ei6uu1ZbHSqkvylq9d9Yl+ERWYSuAaoCEUyNfrJornwcIcvTm3ZiGsq3APxX2Zc3
 U2K1NLHCdLqrclwvbPUBcziyaEkZMaVPzexv94CBCria31TF17b75iJ+I1WA6k/KsJ6/jKdGy
 H0OZ1BVMVofu+zJ5eTdJTnxnAYH+zCSPa3QykKA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_042317_783945_CC47B413 
X-CRM114-Status: UNSURE (   6.98  )
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
Reply-To: frank-w@public-files.de
Cc: Jitao Shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 2. August 2020 05:07:41 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:

>I would like more information of why do this patch. For example:
>
>For current mediatek dsi encoder, its possible crtc is fixed in crtc
>0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
>some SoC the possible crtc is not fixed in this case, so call
>mtk_drm_find_possible_crtc_by_comp() to find out the correct possible
>crtc.
sounds good (and you have much more knowledge about drm subsystem than i). I will take this for next version
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
