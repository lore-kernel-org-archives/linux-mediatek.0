Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E941109E52F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrleg9vBvliQVWMBDUBH8lNbSBSo21hDzjvysYLLmsA=; b=k0bucZAlROJKZlICBM59AolrAP
	zG/2nGGngpemqGaLoXeIvMK4tOTJ+Xkiw8hJ3T7tjtNtHueJ+np1BtZZrSeZjwtzF2dG/rI/m5bTv
	jtmLMEB3HZtWCrV7L+hVPGiyQoaWUuFCXCcOze5tuNFDTnZivRilh7kyTe/Z0flgJcxki9cdiPH8Q
	ZO8nwu9bU+VtHmKKiBU4L9243gZdNgJd4m07JR9wdA61nALF9GYr0TWMTXnzdYRPIbUt/ByLcMjuw
	W9sH+SL9WdTsgbSbULmA+DPuexRXYtgmFrMt11PwQ0kkZr1IyIk4BxfY8y6wbUkIko3QlMAscRCRy
	J1ewOksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YVt-00000004Tnr-0z4y;
	Thu, 26 Mar 2026 00:23:53 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YVp-00000004Tmx-3EYP
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 00:23:52 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 806B8EC008E;
	Wed, 25 Mar 2026 20:23:48 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 20:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774484628;
	 x=1774571028; bh=qrleg9vBvliQVWMBDUBH8lNbSBSo21hDzjvysYLLmsA=; b=
	X5iGYnuZbAQyM0yfNsG13VvSK3hR2zgmwNn8bslY2Ray4byRPBjc2XHMEyr4nE/3
	wHOQ93rL2QJomaYwsIcYw7E937tXUm4vlICsaVktrzqnaO20tecdd1p9vSbox9YQ
	gL4AWgZvJhf2VR1Ih6c2aJODSpqvLVk7HTl/B7MA+NMqqU02D8rroXQqAfZOA44R
	jZ3x5hw0/Y4EwAy5Vpv268OYo0amMm4o8GF21Z8ABsV8M1TYNp0KyYpwRNHON8Ua
	4qmh/iD/ji3GaSgla1ylAjYxisuw3OVAtqd/CQjrfnBeT+hEIE8PVf8xxgyEnIeN
	ydP4Xa2eyGxiaB78ImLqvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774484628; x=
	1774571028; bh=qrleg9vBvliQVWMBDUBH8lNbSBSo21hDzjvysYLLmsA=; b=T
	xM80vX+BJW82pd2LBYrynxK571qUK9GThRmbZ/2DmDKT67dnJr9rHycIcGOKGWaf
	k6+J8XP+PLyUnXgyJqHJcSM3mywFe+plRZ/5IFPwGq9704t/NJlhKvXpZtcplneJ
	729dAch9Z3v2cdvb7iX34moyV8MoSve2Bn01xca6JsqIS6TloSP0LAsDKTo9rW+v
	N+GxKlH81e3m30t0gLPzHfo+/zR6MPG7x4TU+EwJ7jlOh70Ii7Wvprqi67lW9xK9
	GAuLgkHtsj4DoT9gp7rNzra+hFQURW2CFMM0Vo6rV93n37pqxbjLt1pEU/wCdvI5
	zQubnrd2czzdgJGjFSDHg==
X-ME-Sender: <xms:lHzEaT5IiXk7rs4jP5lmjMUfWmP60tD453qu6jg_5dU2AWjp3UdlZA>
    <xme:lHzEaTtKEk9gSwq1kEHzviqO_YhcAdmbF0HHQXfRuB7oO58r2XEHNq5ILJ9P55pkI
    UQlLSOmt3jX4zObWd3LlMuhvciEeJGZM663i7S4Ztfb6nnlLt1-IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpedtudejffejkeekteelueefvdejvdeuhfefteehkeevtddvleduteek
    leetvdelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprh
    gtphhtthhopehsvggrnhdrfigrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:lHzEaSiEzOmxJ5FHdidzeJPc3seH3ZwgRHxCqrXg-dgrVtc8uc654A>
    <xmx:lHzEaeeCRh7MYugIEmfVOZ-IyUHOOPCMsbmRwBCVD4q4J8QYCVKkbg>
    <xmx:lHzEadlZgMTsjVeb5sBh3G4beq7tfCz7k8C6gayF2pmz6ujPK6-Dbw>
    <xmx:lHzEafsdmBguEFUgrZSioE23DJSj3I_tJ2NltGas_1Ghw7eyrNN9Zg>
    <xmx:lHzEaYFCX30Y_xYOUSUdLbABtrbtltmkU6YDd3RQhux9927W1SqagXgY>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F98B1EA006B; Wed, 25 Mar 2026 20:23:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Sean Wang <sean.wang@kernel.org>
Date: Wed, 25 Mar 2026 18:22:52 -0600
Subject: Re: [PATCH 1/2] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
Cc: linux-bluetooth@vger.kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
In-Reply-To: CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com
References: 177272816248.352280.12453518046823439297@jetm.me 20260305162928.5E8F11EA006C@mailuser.phl.internal CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com
Message-Id: <20260326002348.4F98B1EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_172349_870995_38D7DFD3 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Sean,

On Fri, Mar 7, 2026 Sean Wang wrote:
> BT and WiFi use separate firmware.
> I'm not sure why those WiFi sections are included in the binary.
> Another concern is whether it is appropriate to upload the firmware
> used in Windows to the linux-firmware repository,
> The firmware files are probably intended for dedicated OEMs.

The section filtering remains in v2 since the binary from the ASUS
driver package does contain mixed BT+WiFi sections. The firmware
upload question is being tracked separately in linux-firmware
MR !946.

On that topic - would it be possible for MediaTek to provide a
proper BT firmware binary for linux-firmware, or to sign off on
the one extracted from the ASUS driver package? That would resolve
the firmware provenance concern. If a formal submission from
MediaTek is required, could you help coordinate that?

> This is common logic for the other mediatek chips. It only takes
> longer on the first power-on.

[...]

> If the firmware download is properly handled in
> btmtk_setup_firmware_79xx, we don't need the extra bit.

Understood. The BTMTK_FIRMWARE_LOADED flag and skip logic are
removed in v2. Firmware persistence is handled by the existing
framework as you suggested.

v2 is sent with these changes addressed.

Best,
Javier

