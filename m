Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24603C49EA6
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 18:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C574F61C39
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 18:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C574F61C39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGLDUek1sfd5l8TAhdrpUMUjhFONUMrRnFKx7LC3NSc=; b=E7YDVsTnzO0du2
	NAG2J0RxqmgBULcrTVMANL/I2+KRqSmEnUJikZwkbGKMuvCZcic2jUXnHlJgQAQOnW5bO5y4dePvl
	J/hmSL4TJCrSbV49oc2iT0CAM5/6pxMoi6+MLFFDTSeTeRqg6QNb/ILs3zDGIFMfcMteyqhio0Hqy
	FUUuG22i0me1UQQ3H5xgpQLKH8T51pKipw+LYu7E/8kXAVLrCrzN6cENv99lMRbxY1Q4TaulMs1XP
	GKdcqIShF/4PuyM25ppn7dgEYGcIwyKS7z6cdk5EU+GBBhx4EcOcOqbUEO02VoNY//2QqG2lALpmc
	T11WK0XOYlxrQB11NoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxDOo-004c6M-OH; Sat, 26 Jun 2021 18:51:26 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxDOl-004c2h-Gh; Sat, 26 Jun 2021 18:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624733477;
 bh=q1xyXqBOrhwD5gZND37RRmGI/O0LWaj0MVp1LAHNDn4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Mgf4HCEPC2amyyZA8SAZA+owAP7kR03d/YNLRZCF4xtJLUy/6GF562LSku22Ah0d4
 WHtS7nnM6PP8vCqgABgpLqHJvJ6olnn98XOsR0SwQPLAm+vTc+0dFCl+VUEvNSnFS2
 Dh40HDZIe1LS1bUvtU1PAsdBCrQQtqlquyGaOCgw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([83.52.228.41]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MTAFh-1loedI3rVn-00Ua6O; Sat, 26
 Jun 2021 16:30:36 +0200
Date: Sat, 26 Jun 2021 16:30:10 +0200
From: John Wood <john.wood@gmx.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: John Wood <john.wood@gmx.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt76/mt7915: Fix unsigned compared against zero
Message-ID: <20210626143010.GA2936@ubuntu>
References: <20210612143505.7637-1-john.wood@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210612143505.7637-1-john.wood@gmx.com>
X-Provags-ID: V03:K1:tQ2f+TzIa4cFuYvRr3c0vPwUbF+5UbFFSq+mpcgXQdaJ2U//YOI
 QOyCOm+E6AURnA+9aCQ31jRi8UiTJl8lE1yyJjyZhckYBRACLhoKYME+3IQn9CCh+ek0WVH
 NSTlQAUrpM90MAeFRndo8hdW8bXh5pS2UXh0CXaE64VlrKCvoj8a9XhB1MAVT1h70Bl8p1R
 Va3BYV6ljtqROkiyeT9IQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G+XPmoc1gy8=:mNd39FICAcDs3IizxN1RZX
 vqBVLyVaLTs3NR6InwD1mJHum2YFZzOqd/x5uuTgqV+3xgFauRjn8yvL0gPFLrbCLgc/uec4W
 a67KdyBSplaykGCY5a4ad2PrF/ehQpb4WNPykUGrErgRz3JYvraEKcIWMAiRqkUmyGMR3bmRN
 J2k9dYjnqckBDhS0nDkybpnaUp2GB0mFZjVuKyxuo8c4weQRY6OZUFmctcEi/WsWOaREx7/cA
 AIVJuds+cCHc4oA2HQF1HlpzWUUZBnAD+HKH5oqcLboIwr0I8G/QT0DkLnlYDSfRFDnI5NBvY
 P5XEHJFfmHFHovYA8ooSBUYvgINN4lU+fjVDm7Vz4s/gSysA77Azr+XYtBXPh9VFvQD8vcOVb
 05+M68kJW+Yeiv/pYVkgGLRMMadFhUWg2+zk/xaDZZNftbiPSxnh93oH1gPAaXw3oh0ciZGF1
 yqRfOIugErhSk9j2XCoE5s3vCychgTonIXD3AyNLP5zUgaQXhDoFa7cKbIXLTvkvb2n7HS9WK
 cWh8aU/fihso/YtZpN6Wl9lqtUlwpL4mHTzlZwEkab5F4jjwR1kx4ybA+8K4x/iY2kTjyGXb5
 P7z1PbkWcehKK1WAv558d4ljWZaaCaFDYS09DoQDb2kiSCh8T3vkPYO4A2PFzUXS232X2u0mC
 jBAmrEWriTHsO3rhi7cMMZV0KbXqnv0ujraMHSs1+S6j39XOHs/jETPszdeN7K0zNqak/OfG5
 JE7l6wXDiJPvkSfOW424l7ybgSVtFFHc0HCCoOg/FF9CBzEV0d3D/xUcQYKplImwK5c7WgQoX
 x2HqufVUSF1fq9wPvRhVB/O1nVjmkB4cy7v3VhMwFVD5uzWcQSxp5MJQ8hmjtD5fbRdtSVpmW
 mCnMvbfsMzoBECtDaYkfIMGnM0aYY+qop1VjeUDeqd0PihWew5wmcjkBaCORimsfU8psHNYKT
 9IMtN+46HwzuliOzNppStAjt1qp17+akHWRPzTAEGAm2u6BlkmPGdQ9kYi6aqwtgnmvAMammD
 KtpyeqKCSufj2Vf3SSRziZ7SZoCvIdv456Flq6LqTGVzb9QF1qnp7wGlRBxzViTxw4HDH6saP
 GWBiZ2A6TzNvMKM129nJq38b6CdjBIoNu4T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_115123_940322_3FB4D648 
X-CRM114-Status: GOOD (  11.89  )
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

On Sat, Jun 12, 2021 at 04:35:05PM +0200, John Wood wrote:
> The mt7915_dpd_freq_idx() function can return a negative value but this
> value is assigned to an unsigned variable named idx. Then, the code
> tests if this variable is less than zero. This can never happen with an
> unsigned type.
>
> So, change the idx type to a signed one.
>
> Addresses-Coverity-ID: 1484753 ("Unsigned compared against 0")
> Fixes: 495184ac91bb8 ("mt76: mt7915: add support for applying pre-calibration data")

Has anyone had time to review this patch?. Any comment on this?

Thanks,
John Wood

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
