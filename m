Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FDAC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F/SAeQV+4saHVZgU95KvWZzA55jYwZyWASSvmQebgY=; b=TgtthhTVNJvSU5EKHb3oBKItQg
	JYsXCXltsjzTXSKizOAqHzM26uZWGOykYtVr9LkFpIQXVvym2gM4yXwIqJTdgJg6iFsgL2kbw+WnT
	LMlZm/OoDIRCSF3p+uVwgGUuqdPbdvgGRVaYh90RRdA6odKsmecHIB+lYdbWrj/1+Kv7+N8YbyCME
	xmVA07M8Oczc5qe2y9kl7CEs9L8ubbFWwyF3xiBa6SGlWr6LV9JODQtjrP6Nd4jnaQY+EwPT1aIHo
	YFKcOA8nJk5o/WefyB699p+aJbKiy437CUs3su4dGWX6ZKf6R/vU7T6oVjJbbHkwF1o9RWRGgt88p
	LSCRmnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oITT9-005SSf-7N; Mon, 01 Aug 2022 11:20:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oITO1-005Pie-Lr; Mon, 01 Aug 2022 11:15:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B79CB81025;
	Mon,  1 Aug 2022 11:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA93C433C1;
	Mon,  1 Aug 2022 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659352498;
	bh=KXxJvr1Gh3/rx3eZQfM+nY8zLaeraeH2urw35Feo3aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAmIhSAmT/Yj+g0jRrHQ0AYi3z0MwZKJFBZ16W8tayDl0DDBQ4i3Eli2jMg3muJ9W
	 kOPYyaYnZKUEYmjTwB3da0HIgyPXtmgbguC/A15r2+Vi+Zkl9eIOfnv3C79ilkDUwT
	 nZsLwr26jELYuJAPogoOykKQ2SHxomoYxc6QoVtKYMkm3y4w/Ls4rd09AHHkDMWIrj
	 VKa5X7AuTMQBhe2vmhRarM6NOt6iJoYmGu7ZvM17b/EYyfosE4GHKDjvG8ZQAfyWiJ
	 lrd01BE/IKWN0YmOs3ioUnIYPw5wR6vyINaoU0nyV11Pdouba61ZifETRzEUfRfSiX
	 hDEtFyqSAMR1w==
Date: Mon, 1 Aug 2022 12:14:47 +0100
From: Mark Brown <broonie@kernel.org>
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Message-ID: <Yue1pzPM2rSsL+oy@sirena.org.uk>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
 <YuJt9SF9Y2UsA4Jc@sirena.org.uk>
 <9a99a1e95179f3b55dd1236c41a8cd3d9b2ccf18.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4izAq3eOnqAvkCD4"
Content-Disposition: inline
In-Reply-To: <9a99a1e95179f3b55dd1236c41a8cd3d9b2ccf18.camel@mediatek.com>
X-Cookie: Dieters live life in the fasting lane.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_041501_933197_5C58111A 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, zhiyong tao <zhiyong.tao@mediatk.com>, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--4izAq3eOnqAvkCD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 01, 2022 at 11:23:03AM +0800, zhiyong.tao wrote:
> On Thu, 2022-07-28 at 12:07 +0100, Mark Brown wrote:
> > On Thu, Jul 28, 2022 at 02:27:49PM +0800, Zhiyong Tao wrote:

> > > +        properties:
> > > +          regulator-name:
> > > +            pattern:
> > > "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"

> > regulator-name should be free form text for the system integrator to
> > describe the use of the supply on their board, no constraints should
> > be
> > placed on it by the regulator.

> we put regulator-name here, we describe it by mt6366 datasheet.
> we think that it is the common attribute.
> So we place it here.

No, for the reasons above.

--4izAq3eOnqAvkCD4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLntaYACgkQJNaLcl1U
h9BMFwf/V6k/8nOfes43hLPGdpN6ZINY6B1Cwbn9fJblGgECALOg9OuoApuLUqQO
BHsYJ76aJ419c3VAopk2SDcGphOodZ6KwarX5304tqyy1titOAJY/zhWfMHtkz0D
Gsveg+yW7ju+8uGCC80LNUDvO4eaON599LzQQ4LE0aJe7vgWbCDOh1yyeTuTLeRw
0xS0R3vft3l6/9z1v3rhGKjZ32Uu2gmMKQW7eZCdanC43xE48pAzUTU4ITt7Tq42
8Jt9TUj0hc7qGxcCHG20JuJrWzLoBsi6eVzRiuxXAP8gzfmXe5sKT6mwmEBSD2Iv
uskW1mCgcC49078z385GQX3iXWGiZg==
=4Xta
-----END PGP SIGNATURE-----

--4izAq3eOnqAvkCD4--

