Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA56C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 17:46:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C781F2078B
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 17:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFI9aSNp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bpkSb33S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Vwp8PzhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C781F2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPd5TkTb/CtG4IVDgnTd4UFkN2EODa6P3R4ofeXChvg=; b=RFI9aSNpn4O4bIsDg8Ex2c7m2a
	SNQkuHMNAGsS+5voQ6lDfyme3C/Jw2iOfBKewW4LqUBVXvYmcyos0ZA0hiLySnzQWOV+i0T5TfNZT
	WkgoSSJb0+0XXSIXW1fBjx1NO5NF/5FHct7WNp1RoVPrBuq8+Adrje2uxcTaG5/u3UnTBeAAJ2Kbs
	+2GdKRdqaeFjM7M1sm+IgfWH0+HEIOrVFqlg+T+cdqCcIiBnslyzC4tO8SsQIKy+4Y/kLq8pLtzCt
	nK9nE9KASOEMwwiVZLj7r2aMGJKCFxraGF9Vv00XOYUacakHFV8mEnZqUtcGO4JHTZJy1xqe5R75F
	cxwWx2oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k85gK-0004Iy-4B; Tue, 18 Aug 2020 17:45:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k85gJ-0004Im-B4
 for linux-mediatek@merlin.infradead.org; Tue, 18 Aug 2020 17:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=MuzodkzXFlQqlZOXkPhy7wbYV96XJcj5ljN9UAV22AI=; b=bpkSb33Sa2/BoV0CzN+lPMWIKA
 qEi+ZfvxFa9F1nWUcQay/JVCCw5M0RmiLLAJ2FRiK4YGD5T5sCyCuxrHqVpbeEhOhhMH6Y5RhHFBg
 a4flvjTgR3YWB80v4fwI38sykIqni4ZzPqpAd0MiwtDoutd71DqK5xbH0Zjw9IzOjYLhodNfA2rGW
 PbhF6Hlf6SvQ7mQeX6iayez9rrUtimedy/4nJ3nj6g3SL9sG/ngagZRgQjpec+UObiVRB5rPWw8Ey
 9PheQghQ3Ciczmq/37D8sbTaVQgo2ywpV0mBln1Hgue7QEFVeWuJM4hNr/mEklhKF8M7je4u2IP7D
 yk/8Hbgw==;
Received: from mout.gmx.net ([212.227.15.18])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k85gF-0006iE-LY
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 17:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597772742;
 bh=MuzodkzXFlQqlZOXkPhy7wbYV96XJcj5ljN9UAV22AI=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=Vwp8PzhV+f8vekFQeh5Tp0knoNs82z55QGjhZqtMcdwCJ5gZjkwvDE1Y56efHqrej
 m6ljQNhPV2makXelfYOymVY4TQim5MX+wMLeUwc8QL/T44nftQdOcJVXJdFqN+z3NH
 Zr9lgGEBKLrjfFLwi7ebxNnu7uUJyGizrX2ouohg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.53.43.192]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1kAvuv1BcY-00XdDL; Tue, 18
 Aug 2020 19:31:19 +0200
Date: Tue, 18 Aug 2020 19:31:01 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <a56f3029b913d31fbd27562b98d485e981815165.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <a56f3029b913d31fbd27562b98d485e981815165.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 3/7] net: dsa: mt7530: Extend device data
 ready for adding a new hardware
To: linux-mediatek@lists.infradead.org, Landen Chao <landen.chao@mediatek.com>,
 andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <883BB20A-48CD-4B73-9D2F-E5CC21DD2B70@public-files.de>
X-Provags-ID: V03:K1:RHA4uIrsqvBmFN2vJOdO4H+IjP89S5tlylzz2vL0VK7JvBRx6Zg
 D2a9/54EsigXuEOoaa6ykZRzsCqJxH8BVSzQlxQMcnlf1RdYxa8ovqah6R/3d2kzFK3PMky
 x/cq2s51kaoZ9F3ESokT3WIp815pypysw1/mAQehDEoopEiDUrN5JKceIjW34ySZTbyuEpz
 YTWXV/lC4Hk4rOBll4UJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hHhIxY4GH7U=:w6YBcpORh/mD/Zs1mS/Sbk
 mVvJD2oza68+X2NcvkvJNeT2Ra4tCSWF1ENtc8hgHjZ2y8T17zNYw4dYnIQ6Ol9ec3hqi2wRS
 QcSolSiIOdL8WF9001vCszOhYsdMMtHnoFPXtkJZMFPB8VKYoIIvjuWwrCP2v1EMW1VEPSrKN
 yMO/SDvxGv7wPQyuOgqZxch2KP26zldcsh0SXe/wTVxt8Pf87l8CgB56V9pIQblhI7ZsYMsZt
 jHwgEK5S4E+ipuMSW3QHvA6hrRAxUeMVQD4RYoHFSUC7M94qPL/4R7GPDFsYRfkSS4+Das26A
 loym3Igszu74PrMixDOQVDzRaJPOBzrmylfaOaQPNDSWx5wmYemDKb5ov7xJPh+d7fjcnxIVD
 00PxULPl9r/Ndqq+ENy4qFjwjxQM5qv3ilmTm5PbYNdajfP1V8+Aj9iUSDh/Z/a7DyO+OkNNw
 5q+r5ctsyOcRFS9gQOj81fo5d+7nEpMRsfONwuCOCHHHXENT35E21nHavcG6lYCceLa1f+jqr
 BS9biPafFanLOXPjE0MjuAKSpk3AXs1/nvlmfumO0QQHERbyyBhYCoarfjb6ihJupf3Qw3Kiu
 qh8PavsFglKLPQ1MMyd+/tjwQjmnoI2SFK9rDfILmUZJ/XbnW8DSdoCZahr8lptxv3HaT+mH5
 2zs6OUSRPPdAaBJqAEXvfujanvUc/FpRbiW/zO3KP4pIn/Gm0qYkYnGmuqGFfy0FXY0YtEN6/
 BcvE8GeSvihcEv2vS5wQfpgNegb4Bq1+EqCiQgNAnRgre4S4yLF7pvn3Sb+0RhPx9WL305+IP
 EMkf7efCnxD08wO4oFx6J60r6ZdH00dmOILZPPYXDAQotbKR+NW7jOl6DeMd2E4up6JE9UUh4
 ZuPni4dSb250jZ0SXxpHyfeYjL0NA5qFtQZJAuLSqSt/Jc3h8sdSMqimwusClgqFF+Ei1mqJ8
 9KEisAcXS4R6WBX48V/jzM+59F/jeSYipVUhElVzUMbPwtijAFdikZ2F97OpnWE5+5yNNVXI6
 AKr4aQJRzP5gTS6/QrMQXEuYPvHfLwD9g2NEVqW+g1seup+RsCdVHKO+cuIRLyaLtnT2cXqbN
 vzR3SzD8gV0UHDmdrBajyx8dVExNUFgrGD2BsccNQ4/DYftvKc1qXjOHbCPARnBt0UB1OnfIQ
 /Quvvq/6N2n/CutjSrxDeZeHYtmBfESB2xK0MPEHlWLhV6RvtXBe5zmgg0WfDbeIxnj+DbzJC
 o7vgL7zlDwD9g1FEW5/ayD2mXEzjhkhbSB2/VgA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_184552_102338_4CCA1AD3 
X-CRM114-Status: UNSURE (   5.28  )
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
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Just a little typo you've inherited from existing code

>+/* Setup TX circuit incluing relevant PAD and driving */

including

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
