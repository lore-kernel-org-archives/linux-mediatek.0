Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D537C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mR05keK3ynmmM3Zq8e1jTLmPIijO9N8YT0CgtjDOhxA=; b=eNnuwVkqYAwmgR
	5FvmrDBe0fGTUmgzrIek7deSYf+jNbyenjlG2r0tbgc+buY9hIaQMu32yp0e4JVI9I5/9VVj24qBD
	i/UllLO8m0WalKD+tOxs3gxgFRewHEGiVew++naXtgz2ArNAuYZ0RHCcg+9yOkmRERgZaFMf86J+L
	HYAQ6JCrUcppcMDA18rJagH7NWjRehfl74EvDVTROt/CYHUB24jtfK594ffxu4MLKxhFQXjauh3J8
	kPYXOTA2fiFDo3kyM+vhhzPcx61eFjcni8Diu3Soj8eb5J8JmmPdi8NmaZQ/WsNUOJ4IsOAkMYcez
	Ulbz+rMp2tYmTlhs8h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUMQ-003iaT-88; Mon, 30 Jan 2023 13:38:14 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUL1-003iNz-W3; Mon, 30 Jan 2023 13:36:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675085789; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z/3GlH9NZCV6SjobVyTG8J8Jj6q7mv68y7HRhCxtLVGW6uEC14x8zdIrbiRbAqzGLO+azLs/c7vdgHrhQlvsMj9ZKA2oWRLqCF9BkZKhPhIpoBsQFXL2MuyFdTvJoHY2mwJGOJQi1ozYEsPBjyDE6fU1NykkHZZEETLhrrtx3ng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675085789; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=mR05keK3ynmmM3Zq8e1jTLmPIijO9N8YT0CgtjDOhxA=; 
	b=XqIc/B806pk+XcJ1c+QgG/xPpOrdQw4ln4D8ruVT3cdG41ZeZn5RVwst8iGl8iEZg+ODQmbZTglEKACoMQm4bZz4wU4YXxNZLgNaMPfBkjBhQbPq5SG+KrSoZY+UsqvyGkvFAY2/uaLGDJof8JP1rYGJndjWQIc6mLDMD7snC0M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675085789;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mR05keK3ynmmM3Zq8e1jTLmPIijO9N8YT0CgtjDOhxA=;
	b=UoyHXt1wr4aZ4sUr5SSIZnPQLXJ2mpDdbW5vU5u6hBEItvIE1WWIu3XrYOV7K0xQ
	HZYz/ycz/AU00AApVPODjLlnCyteKAi6z80IO4x4sv5pl0usK+r8vgWnBfspPzbLT9T
	rUes/WG/NjdWObGTx1i/U84g5hBfMPqDiJ7g1R24=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675085787600658.2593333343776; Mon, 30 Jan 2023 05:36:27 -0800 (PST)
Message-ID: <883798d8-f7d9-eadc-1343-7d241741ff67@arinc9.com>
Date: Mon, 30 Jan 2023 16:36:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: mtk-pmic-keys: Ignore power button if pressed before driver loads
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_053648_089120_D7DBF9B9 
X-CRM114-Status: UNSURE (   8.54  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org, erkin.bozoglu@xeront.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

The power button on my Bananapi BPI-R2 (MT7623NI SoC, mt6323-keys) is 
shorted, so the device automatically boots when there's power. This 
causes the device to reboot when KEYBOARD_MTK_PMIC is loaded because the 
driver sees the power button being pressed.

I was wondering if it's possible to change the driver in a way that 
doesn't break in this situation. Maybe don't do anything if the first 
state of the the power button the driver sees is being pressed, and if 
the state doesn't change.

To address an edge case, if the power button was being pressed before 
the driver loads, look for if it's ever released. Only after then start 
working as usual.

Looking forward to hearing your thoughts.
Arınç

