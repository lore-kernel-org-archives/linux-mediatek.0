Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpvIJdJ4pKV5nCXhEcY6qnsQguk4xZrt+DcG1CrGW3U=; b=wgfq2P4lRuU643Y6zWLeGU6IOB
	KaEBBAB/pdmPi+Si822hpPYf1iJByUZlI14Y3S+4YoXSe8FBXieno0yAWMY/EQ9E8mbU1Wh9zlQPr
	LY91xABADukvAK5GKRnWs4dnVDX4/2jny6Odw4ijgpLJlD4E15/cD+lj80ySTlxJz9Y9leE2O/Ybp
	a2detrIb7lHdoVKqDZ6sYE6tH2OZPC9mWz+F0e7jcKStCvdMJ8nnRJLRMFbM+AGPXhWfy0px01Li5
	lLoro+I3rUpLX7IMX+sOHzkLgPvM3sMv2qvKlYPp4y7HgSfBocoR+9Fz2bGqOebmyHVMygr39cqcg
	bBbeqabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZBF-003c2x-Ju; Fri, 28 Jan 2022 21:53:17 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZAr-003bye-BV; Fri, 28 Jan 2022 21:52:55 +0000
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de
 [188.106.17.11])
 by pokefinder.org (Postfix) with ESMTPSA id 9106F2C00F2;
 Fri, 28 Jan 2022 22:46:03 +0100 (CET)
Date: Fri, 28 Jan 2022 22:46:03 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
Subject: Re: [v2 0/2] add i2c support for mt8186
Message-ID: <YfRkG7KdAMD7FiuY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220125110413.18988-1-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_135253_578370_8D13017C 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: multipart/mixed; boundary="===============1742787124244697797=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1742787124244697797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sHAE60AwDaFT+Vqy"
Content-Disposition: inline


--sHAE60AwDaFT+Vqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2022 at 07:04:11PM +0800, Kewei Xu wrote:
> V1:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal with apdma.

A description of what has changed in v2 would have been helpful. Please
add it next time.


--sHAE60AwDaFT+Vqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZBsACgkQFA3kzBSg
Kbbf4g/7BQVdLzkvxnFsEfe5rqHggfv5NbODVx9dkMCR7vfI5dH+1Y70TaLqY8vN
dAT78k9YEjqCkrjSyINiBE1b6uSb8a2dG/TATE9eEh4hrYr+wvNpQvXkksMsvkc/
zXtJjBiTz2+WJKunQrsLy9gZ1mQCWRZRgm9HV5VgFB/LZUPzFzCVc+T8Dxc5Z4vB
D00whWHSvwf+jMDeVn1fT2g58/AqvctlHx4yIfWwSeXfqLjRzVs/RKTvlgcChbqs
1cz/vobVqop/n7znN1pneVZ3EPOcfVHsgU8jCCSiayipfcZ06lkuHU0O83oMSB+c
t4/6yCoicHkxiq68WFOHm2OjvXWi1NIxmgFNBKViM8NfOHnvIxRNis0p1YthE81V
RWIwcH3FbGSD4DapnqZ3Qbyfhsmg3TzezSAdsRHglN6rOcLdHKBe+fsjwh84rYA+
19nIPRxIbaahod8uqCUkyy5o/NXXUl2v5BsQb0QzMmiHAi+PkjW/Tv5fUVpVGgVK
h7fdYd0pCxLIo9eO6Al1aOGetWnYhM+X6fZr1VgYxx0KnOmcSyfTuZml5HNmrRiV
u7LgP4kO8FXJdDWlmBpXLJkzFaEZiEqiMun84ndf5WYaK6TjcK7hQDCvJfI0dIcI
NXbi7iFb7pR+KTsI/eSmxR5buFVX22EthbAUiOfaSBRctl0atQo=
=Fbzb
-----END PGP SIGNATURE-----

--sHAE60AwDaFT+Vqy--


--===============1742787124244697797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1742787124244697797==--

