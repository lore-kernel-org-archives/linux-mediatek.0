Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD33CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWaG7KzNqBOisghHqfZXO5UsM1sVGe0wnnAolR3xfQU=; b=p+j/9G5mPgQAIMK9YPX/Ehd2NM
	4VL/f+yWowEzeGzLelJxSnnYBQZzVLCkeIOEoUsX1ICuRSiG6edqqCWhzuew0XEEvaocstgYYAdi8
	iLbwvjDZbw9KJGDfKBUI/I709QO4gy4thQZ6KqnXvdtGNLWC3e+oihtRF36i5rvhewUyWKVEgLVlH
	oBq4mXAZcKzytT70D2mQuMRe7uFM+urul66PFuByVODrS17zC9nFzGSVgToQ+t7fxGVUCGEUdkc+k
	jjYYC1z3bm0jlO9zBvkDuoduY76zBw15aVNgDyz3wcpG/mA/JwprOYPllSTlJNNQeNLr72Gj+c5wY
	3cqnJ0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcJJ-0000000Da6j-3vTt;
	Wed, 05 Nov 2025 12:08:21 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcJG-0000000Da68-3DCW
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 12:08:20 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id A3BA86063D;
	Wed,  5 Nov 2025 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762344493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWaG7KzNqBOisghHqfZXO5UsM1sVGe0wnnAolR3xfQU=;
	b=Sw0hy9GnUZWIUqpsmTkeh8AI27lUEPt0w/5Znx/WopK/ylizHlmWYw2kZIHIpmyzcIxpV3
	2PJwFiwm+wq8a8tmdEASbZ3xOsSQiKg0BN++tpSrngjSU3iuh20tQmNtFIhRRkMSzW4oQ/
	5+x5DeyDySOorh2AqvAt4yYQvfeRF5o=
Received: from ehlo.thunderbird.net (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id A28874003B;
	Wed,  5 Nov 2025 12:08:12 +0000 (UTC)
Date: Wed, 05 Nov 2025 13:08:12 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
Subject: =?US-ASCII?Q?Re=3A_i2c_issues_in_6=2E18_on_R4=2C_but_not_r?=
 =?US-ASCII?Q?4pro_=28both_mt7988_with_i2c-mux_on_i2c2=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aQs6O75BqOERMzPJ@ninjato>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de> <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro> <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro> <aQs6O75BqOERMzPJ@ninjato>
Message-ID: <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: f6e15a42-7f46-42a3-8df0-9f2dc5129f95
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_040819_012456_7282115C 
X-CRM114-Status: UNSURE (   8.93  )
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

Am 5=2E November 2025 12:51:23 MEZ schrieb Wolfram Sang <wsa+renesas@sang-e=
ngineering=2Ecom>:
>
>> > Maybe this option should be enabled by default or when the i2c-mux is
>> > selected?
>>=20
>> That's what we were discussing=2E At least a warning will now get print=
ed
>> to the logs when booting suggesting the above solution=2E
>
>FYI, all the commits leading to this breakage are reverted now=2E Sorry
>for your troubles!

Why? My issue was solved by adding GPIO_RESET=2E=2E=2E So it was fault on =
my side,sorry for bothering=2E

@angelo
yes it is a final board BPI-R4 v1=2E1=2E

Why sometimes it works i guess it is because uboot may previously initiali=
ze the device (and without reset working it may be stuck in wrong state)=2E
I'm not sure if my current flashed version had the i2c and i2cmux support,=
but i got it working on that board because of the connected eeprom (read ma=
c address via tlv_eeprom as macs do not have fixed macs via efuse afaik)=2E

Thanks for help so far=2E

regards Frank

