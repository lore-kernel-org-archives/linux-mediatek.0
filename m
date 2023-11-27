Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358A2C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/QuZySFquClyUZrQJgv8cSRnLgGNnUBKw6R0N8ml+U=; b=aFKBQbi/CO5SWJCJh1lmC2n73F
	VVtmxUI/ST9NbOiG4Cy8kVXFd3z5s7jJdpQJmQ+4KZKxtwkhDaurVOi6Ph6AIwI+fS62+04JgagnT
	lmB6SzZeg0Mix0bl+KNJ1BuQgAZBB7VCGo20YTKfZwLqoQyrSsy9tJXEDN+ocbbzeqBmoieLQRwT4
	GJ0aPbmuArZ2cGqglf83tVuZhRCpHQGcPXoaU6xHZXHzMW9HeBXoqPYwRGMnplM7dPnM6JXa/3pE6
	UbfwUFZdw/YcwmYlgAwMJDtMAremV2iuALPCmjmodtUjOVlWLxtrHhq1vCGAx4zGd6akpMkoBWvwh
	NqncExnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cua-002jYx-2Y;
	Mon, 27 Nov 2023 14:48:36 +0000
Received: from mail-40140.protonmail.ch ([185.70.40.140])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cuW-002jX5-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 14:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701096506; x=1701355706;
	bh=D/QuZySFquClyUZrQJgv8cSRnLgGNnUBKw6R0N8ml+U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mHotoFtdZMlM86rf05GjVS1hIQHVGY+QJJ+vZsRtNxlQMSVF6bRHUQs78ePz/GSpj
	 MYvHi9oLhJY/cpGRXenwuB8oFtKcgId3R94o7KuiShWIZSoWa3soKNwyWMu0GEpx7o
	 V8KRmAFJTBk6ZmRYIAfEtRFgnCh7VvB9IKBC6P9cSSpk/QR75H+snlm7ZzDmjHDzfy
	 RoJwaOBBFIyB8J2ukHKpKQRo9OANqZpgHm3Fipl9/HKbYVyI9cuKjPCv2z5OdP8Ffy
	 fq7qu4peIO7trxACKzIOROwltpmnM7X8kGGa/RZY2Yq0VGh2Jpxom0XxnVScrDFFIC
	 k1UxmCaEo7dig==
Date: Mon, 27 Nov 2023 14:48:08 +0000
To: Jakub Kicinski <kuba@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [BUG] wireless: mt7601u: probe failed with error -110
Message-ID: <TW5Bad4rqn0eV1xH7glJEAQsf333rfPxAYZJ9hMIkaGJrAbMihh-AefdxZx0LtYiK5UUavBSBgOt9x75YgCyPR0cflycw5mNjGqsb7qPebk=@protonmail.com>
In-Reply-To: <20231126142634.3a100e2c@kernel.org>
References: <Bnwq2et4CBU1_MS8X3rFeejMDmKf2dr_BNq60IzBcGKbjTxHG1CjJ0zB_wZjn8_iLJsi7fCx6_Eh01ozYBqPA-cEZXMZE_X98E0b7yotXCg=@protonmail.com> <20231126142634.3a100e2c@kernel.org>
Feedback-ID: 27475468:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_064832_469971_22EE85D1 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi,

On Sunday, November 26th, 2023 at 23:26, Jakub Kicinski <kuba@kernel.org> w=
rote:

> Does it work with the vendor driver? The upstream driver is just
> a rewrite of the vendor driver, I don't know much about the device
> internals.
>=20

I remember I tried the device with the vendor driver [1] (which is not comp=
atible with mainline) and it should work in that case. I noticed there is a=
 datasheet somewhere out around, BTW I've also found information here [2] a=
nd here [3] about the driver and devices shipping this chip under several b=
rands.

> Maybe Lorenzo or Felix have some ideas.
Indeed, I dared to fw and cc them in order to join this discussion.

Regards,

Cristian.

[1] https://www.mediatek.com/products/broadband-wifi/mt7601u
[2] http://en.techinfodepot.shoutwiki.com/wiki/Mt7601u
[3] http://en.techinfodepot.shoutwiki.com/wiki/MediaTek_MT7601U

