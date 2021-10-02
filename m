Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D5961AAD
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79D5961AAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp3u+UpbBNFAl3RTiAn9k3WDSZNQSOG5eXaxLnF7Spo=; b=JwlrZXpUKgwcTBcIw4e0c7PAgr
	JsyvKm8VbsfB5iOj1Odt5ERWlJZ0BuN9FgmTrWpJEFSYluWYlWfqJBk+E0H0Rt48iQWvpMecH7KXt
	bEthJOHI24o8ec6uMKF1R03unL71iZGnKdlNZMJSSsQFMiMYygfg217fBN7+8SkSYCyX4nmmA+VsY
	KX0Hq08qbkYpiHUEjRFhOuj42nILOxq8Kjt51uOxSws9t9W98BeIRCKkj0blqqOxSVMxDLgOXg6ev
	+BYsTDc0c/pqfdCj5qtf+VjJZWWulHVsZqnCyoGJ08rdLK9Kdg+J1CzYjHeAKyDIs34NxIEVnPERO
	cnJQlQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYeU-001qKK-Kr; Sat, 02 Oct 2021 06:37:42 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYeH-001qGV-O4; Sat, 02 Oct 2021 06:37:31 +0000
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
 by pokefinder.org (Postfix) with ESMTPSA id 0370B2C01D8;
 Sat,  2 Oct 2021 08:37:28 +0200 (CEST)
Date: Sat, 2 Oct 2021 08:37:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 3/7] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <YVf+KCztQI9XrdEq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-4-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210917101416.20760-4-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_233729_959516_5F687472 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: multipart/mixed; boundary="===============0924582683456130861=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0924582683456130861==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WnN6qXzV7lU+Tq+i"
Content-Disposition: inline


--WnN6qXzV7lU+Tq+i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -837,6 +839,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	return 0;
>  }

> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +	dev_err(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
> +		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
> +		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));

I think this is too verbose and should be a debugging only patch not
really suited for upstream. But if you like it this way, then keep
the verbosity. However, dev_err is too strong, this really needs to be
dev_dbg. Timeouts can happen on an I2C bus, think about an EEPROM in a
long erase cycle while you want to read it. Perfectly normal.


>  	if (ret == 0) {
> -		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		i2c_dump_register(i2c);

Needs to stay dev_dbg as well.


--WnN6qXzV7lU+Tq+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/igACgkQFA3kzBSg
Kbbp2hAAglx55ZKyMUuZ9OqPQ9uAScg0Tf3qeup5IFLV3AR2uLSpW3ONvZT7aCZv
E2rZ4gZl/mLdRmeMBRsWIOSbanA1bjG0ddCTOMnuPhYrGo9Rv5qVW7CUfBRp3cMj
rt590cr0/Jqbn3TyrM9N7/baathuJDpoTS1RlOC3t0BtivDWmaPghBR3MKUryNmp
lqCbNEpOwG3Xrd69O4oNFCo/Pox862cyaAdMEBJfoJvk8O31fHkVbtGuhnN4Vh1N
Z3NXYvISdxon71h0XvwTkzs5oX2PpV3oR1oBXUdAv+mWsk9ti9uxQorOcmyL1x7B
HWQaBYyl+gpyHFElcYlM4h3TTUw3I/WzWBHwba5mjKl5fRD4EPBKhwoBdWYccQn9
3nbmlOkEdhylMQBjI8pd0kpoAvegpHbtHfeGSo1/hyOi66UdX1kIA65emq+kaHjJ
cCsjzGQE6QCm3GJ607qA1IIJaoCkqUvwrFTMy6VW0i/A9dMPtHiaN1spbFo8JyG1
wDiWziHNaiqage6Xo2jgevrqmfp+wV7JwcxR+JJHs6nTApYCzsfB3iaqupL9adBu
7fcNnGENR6oTSiaP8P55IaC/wHhqfZHcKDky02SqnOXQVfZvf4A7U5rQgTV7dL9y
XbS16Zxl+/jIZyQi9Ys9cuj3HzoZnzVzkDwGT5M2rk45kvhUljI=
=PiQy
-----END PGP SIGNATURE-----

--WnN6qXzV7lU+Tq+i--


--===============0924582683456130861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0924582683456130861==--

