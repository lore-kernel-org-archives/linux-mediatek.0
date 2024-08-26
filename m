Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943A3C5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQulIFQ3MSaYELsasLXuNGLySXXrhci4b3aPunJJ4Vc=; b=J0gdbrYnRoAp1Gcoo0f3PtnImp
	+gTlfqytQtrfV3itlSr3BoONYUmc6a7Eg1EI0cGrOwSuf3tAZic5qXqKVRbR3NkLmjdATai9fQTEX
	QmoOMrZj8U7NHwWqjpyRsDPhNZAviiPGUaMIscNUWiCUi6re5KVQk7QFF4L59tXVdAZl2bydYOr9K
	BwLJ6SGY67rRuD6PC8cVGvSraUDkII42E7y7vsUv6khI1GkSrSa3Pka6F7TjDrDu9+yJO1BvDTdbt
	iqIVSZ7eohDMhUPXV6YRnnZHqduEHbYQjFHFJ08JqOQ+2Y6uwJVZKsui98f0ORDUDL6KRkbgMGwZj
	YkDHO22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWQ5-00000006n7Y-2vBR;
	Mon, 26 Aug 2024 09:53:54 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWOZ-00000006mfW-2m4N;
	Mon, 26 Aug 2024 09:52:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D811C0003;
	Mon, 26 Aug 2024 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQulIFQ3MSaYELsasLXuNGLySXXrhci4b3aPunJJ4Vc=;
	b=EODnI/Hqi2gf0HbwFYGycKIX5kvmTtlkTXDO4Ou41WtUREytRJW+uzyzbbje/qpzCVBu79
	fSZNUNx2Pxbz8rCB1K+3cs0Z8CNQ6fLkHIwW5Bf6JR/H+u0kujeYra4gUVJGr+fZL4LuHr
	dFci05mgwwLcdxWD/Qzu8SeLe/SSFqSkzp30cRWgijaUwcA6Z1Qe0BrxDoge9GG6wuyzFj
	yQiNVtFwqBXdgnAeUce96v1BjYId0+uglxNfMH0LbemPRVBVRY17gS0V5iTNfRUltLRJu5
	r1jGtikL/0Eu0CG3oeVC7zp0fWlE96seULFGTb96CUMnB+71d1pjwhU6ZMy6kg==
Date: Mon, 26 Aug 2024 11:52:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
 <khilman@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <kees@kernel.org>, <gustavoars@kernel.org>, <linux@treblig.org>,
 <robh@kernel.org>, <u.kleine-koenig@pengutronix.de>,
 <erick.archer@gmx.com>, <christophe.jaillet@wanadoo.fr>,
 <val@packett.cool>, <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240826115213.389acaef@xps-13>
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_025219_907419_979E1654 
X-CRM114-Status: UNSURE (   5.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jinjie,

ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:

> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.

Why is this a resend ? Did I miss a previous iteration?

Thanks,
Miqu=C3=A8l

