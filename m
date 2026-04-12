Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AEFE937FD
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2026 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy3hhlwzu20rJFN2tuJlW97lY33vaDiPnXe0xqQOhSQ=; b=fl+9BCcck+iTwg0HtdLv75tpFu
	rgL7IxQnP5oeAREpYSgwFBPqSPN361a5FEPLuVzyiq8IvtCMFnep6fhx1P+ml25RuVtXbj/iNucWW
	AgfPNwFaAade2mup3ALiB/lysjJ/FAnvCdjI/UeHpwiqmEi1yfuGoFS6sYE5g6r3vcoG4OPgVvmJv
	qAO0YIjnAnW0a0zbQMuZaGndF1Nre1HO97YmauX6mUfnAktUl6ycriWEA0CrkQ4uTjV5cv6MCnBVi
	gLORfJpmacAxAJY2r9sTfAsDZ7gpn+jPBxvvMDrHQEDx9s1CBwc5MdJCls5UmxMcTjjhU9KB6j+lk
	LviIzosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0QI-0000000EdCx-3Vsi;
	Sun, 12 Apr 2026 19:24:46 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0QF-0000000EdCa-2p90
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Apr 2026 19:24:45 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776021876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy3hhlwzu20rJFN2tuJlW97lY33vaDiPnXe0xqQOhSQ=;
	b=pdbkd0MD/ZPOv2q7gy0vwIbn+SPzxhxnX8WgErYwxbyVXyh8pmkD5k/fsVyqPSPYg2dcCz
	qvMZXkhAxkg8zPTeQYXnEgS4RsgqdnL/vznfjFoJoJ0j8Gr+2mDk8uMFZhh/JY35WARTLa
	lqJXuoAQ4Z9Ot3NIa1CZQjMKC0SGhlA=
Date: Sun, 12 Apr 2026 19:24:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <ee4d27c8bf587a66953d8705ccbaecdffdc66d68@linux.dev>
TLS-Required: No
Subject: Re: [RFC net-next v5 0/3] Add RSS and LRO support
To: "Jakub Kicinski" <kuba@kernel.org>, "Frank Wunderlich"
 <frank-w@public-files.de>
Cc: linux@fw-web.de, nbd@nbd.name, sean.wang@mediatek.com,
 lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260412075402.2eda04d3@kernel.org>
References: <20251219151219.77115-1-linux@fw-web.de>
 <trinity-1304ecb5-9a3f-4e37-b2c6-bcd7f35c2921-1775995067670@trinity-msg-rest-gmx-gmx-live-579dcf886d-nkpds>
 <20260412075402.2eda04d3@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_122444_490624_A87CD010 
X-CRM114-Status: UNSURE (   5.39  )
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

Am 12. April 2026 um 16:54 schrieb "Jakub Kicinski" <kuba@kernel.org>:
>=20
>=20On Sun, 12 Apr 2026 11:57:47 +0000 Frank Wunderlich wrote:
>=20
>=20>=20
>=20> some time has passed without a single comment, so i just send a fri=
endly reminder ;)
> >=20
>=20You have a lot of people in the To:
> Could you clarify who you expect to action these patches?
> Patches are an RFC and I suppose ain't nobody got much comments?

Hi,

imho 11 people are in "To" is not much, but i was told that no comments c=
an mean
"OK so far" so i will send v6 soon rebased on current net-next.

regards Frank

