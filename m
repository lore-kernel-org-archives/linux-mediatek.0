Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CC8C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aES6a3OS2c4CKqUTrnxXQB0ATrFApT/0W3SOsIjOfVU=; b=viyTQ+5EopJvvs7EMZJIEKCnhM
	wHXLegiJSd1ltYcDz1yyORx0UgZwZQc+de2m2PwFVtuTjlZ9PYtZbSETKRYH2SIJFKOrAIQbQIkbG
	G15gZ7yGNGkn9iIAXcPUurEWTF8tXAQbg76AQVC0tz3dnfGP6irjJ87Z3DnkaXHy+gUIxqnB72ni5
	QROXD+THEntUTvGSOb3Yk+BYyab9Q2HKxpc3MarKFfV/KSYMLmMsfm7h4KNTEFkpnP3JnS1H9UTQQ
	UMYijhWhQKtAuGIkxBLLG/OsEBuiJla6ISbU+ob5QRAPrv6r3WCTJrNsENv/FyouS/2f0RZU88Uws
	hByZn8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmApg-00000008HGt-3ei1;
	Mon, 18 Mar 2024 11:07:08 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmApc-00000008HCX-0RlV;
	Mon, 18 Mar 2024 11:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=aES6a3OS2c4CKqUTrnxXQB0ATrFApT/0W3SOsIjOfVU=; b=OmNaC+rW3uAs2f
	QgoUHaCkWRJlDD3UxCGRpqFNur+6MhqA397ef+xMUh/UlBjgp4u5NrCu3qCzu3N5+OZ5y5ytCpQIj
	YDMSJ1Nu+YHON0k+sVJ+YXLP3N07tlwo8a+oIdq4/MLwtgAoyWIc0VwOyOf9k56J1FOSZafpl6sSj
	OdL/r3zyA4MPp875CrZD6u/RB6JBbrS56DDTdSBMJOfVlI6Dfi91pcKw88/u/xk35oRNy2Bt83i5w
	x7Is1hqNs7p4hSn82TcXZZWmyP2wgM8mzrWZ59Q5FD1fh0+bBtX2OX2BRLSedC/Nlzh5cTblbOhiJ
	Vgzj0tKZ7nccCyo5hIdw==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rmApV-0041NY-7Q; Mon, 18 Mar 2024 13:06:59 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rmApS-0004FG-48; Mon, 18 Mar 2024 13:06:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Mar 2024 13:06:54 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] spi: mt7621: allow GPIO chip select lines
In-Reply-To: <ff184df8-1917-456b-97c8-bc270987bd55@collabora.com>
References: <71533474-eb08-438c-b7ec-5f3277c195fc@sirena.org.uk>
 <20240316010302.20776-1-justin.swartz@risingedge.co.za>
 <ff184df8-1917-456b-97c8-bc270987bd55@collabora.com>
Message-ID: <f068eab7d873b9cdfae41b5413ebdbb8@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.17)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/rOJCKbX9miqwerxCr/aRDPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIss2oH4Yjh6Q4paNNh70vrmKlRYN8+ZW0XX0AH/7tz8mRXWrF
 hJyjzh57IgdFI86qE2zvVTW9GHsmX5lEgZyi8RqOqcNSPSnc4M/XfNJWJDtOUWMR3Oz/N19DDfqg
 //ykQCB4rUl3suKct8rEwEjtlMaQ3Kqc4IaO53NS7XmlLOmnyX004TPenHFXEu+U7r0UWmuNA8WT
 ybi1JN85FSnfKaZl5e9CnNR0t//S8nh6vX9JR7tTkgtGxbJXMnaWeORi/IOL8hFK8UwSRsjj826v
 xIvoo9siXVea4yN8+JzC4p2qtoJeAaAIM5zNlwLSz7WsotxMDYRAzuCR0I/uZN17IfdXFZsEUcDk
 8TfE1VxuxGc2M4JzCc//R6Wyn0xEa4/gbKRUuwP9TxU53J++//mag2wVXO50BuTihrUiUr+Ne0YD
 3ddZG295JphtZpms9X0aBNANCxNWMmHXUTEMGGbKThOghFKJuzFdJ78lk25pCKnYrhUnk1aI/tYo
 PYfrgLItviC2z3vIzjh1mXBwO7cA3LYE//971/IPrjStHq+sLtv6f48W6vJ1YXzwg/yHdBoe6D9l
 C5HcnR5sMHCtNqaTmXQ4BkBE3IhMX1f/+suluw5k87r8vepAOoS2eUqUWS3rIOs6OFebJBWcGqKs
 Jc1xjt6Txl9yx/3BhqO3m5yd2tj74O4hBSz/kkmPgL+fgIguflsMx6vatUpjecZPSp26CgsDSXR1
 fPypOcxCjKydCywowm3Us7sd7s2fkLXUoQJ04q/WKvSWBPzknbkTJiNN9rwBJkpKiGGp8ai4iv7H
 Q04RFZ4oobg8BBg3Jq+ntzj0FowsI0DXck/yx+ZVYiqsOvAPPsA1Nn6T/CCq0ZTp7nHbYJHXR97j
 NGQqQSATsgnFexc/Dnd/+IKrbpnIVB7kSlFfEoXm0/FPF8PR0w363llwyMFXKarlqLFqhfrB0GFR
 NCI72pnwdS+UMZgGNjw2gmyaDtrWPzIOQpV3d9KAZvFEy4yZs8FnQMzvojpIo6wEKULl9qYjJqeC
 CacQRjWWfmKrLjRFuOfsv9pIlKVsvXNK4117w0+Iu7iq/3ilwajFT6Qh9VybPYnXpWlnmHX0yg==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_040704_277102_8A5603C0 
X-CRM114-Status: GOOD (  13.44  )
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

On 2024-03-18 12:16, AngeloGioacchino Del Regno wrote:
> Il 16/03/24 02:03, Justin Swartz ha scritto:
>> Extract a magic number, from mt7621_spi_probe(), used to
>> declare the number of chip select lines (which co-incides
>> with the native chip select count of 2) to a macro.
>> 
>> Use the newly defined MT7621_NATIVE_CS_COUNT macro to
>> instead populate both the spi_controller's max_native_cs
>> and num_chipselect members.
>> 
>> Declare that the spi_controller should use_gpio_descriptors
>> if present in the device properties (such as those declared
>> in the cs-gpio property of a "ralink,mt7621-spi" compatible
>> device-tree node) so that the SPI core will recalculcate
>> num_chipselect to account for the GPIO descriptors that
>> it should have populated in the cs_gpiod array member.
>> 
>> Remove the assignment of mt7621_spi_transfer_one_message()
>> to the spi_controller's transfer_one_message hook.
>> 
>> Refactor the mt7621_spi_transfer_one_message() logic into
>> mt7621_spi_prepare_message() and mt7621_spi_transfer_one()
>> and assign both to the spi_controller's prepare_message
>> and transfer_one hooks respectively.
>> 
>> Migrate the call mt7621_spi_transfer_one_message() made to
>> mt7621_spi_flush() just before chip select deactivation,
>> to the end of mt7621_spi_write_half_duplex() to ensure
>> that any pending data is shifted out of MOSI before the SPI
>> core deactivates the chip select line.
>> 
>> As chip select activation is now taken care of by the SPI
>> core, due to the use of the transfer_one hook instead of
>> transfer_one_message, the calls to mt7621_spi_set_cs()
>> from mt7621_spi_transfer_one_message() have fallen away.
>> 
>> And although the SPI core will handle activation for GPIO
>> chip select lines behind the scenes, it requires a callback
>> to allow the driver to perform controller-specific
>> operations to control its native chip select lines.
>> 
>> Rename mt7621_spi_set_cs() to mt7621_spi_set_native_cs()
>> and make sure that it takes into account the activation
>> polarity of the chip select line it's acting upon, as the
>> passed enable parameter represents the desired line level
>> and not the desired activation state, and then assign
>> mt7621_set_cs() to the spi_controller's set_cs hook.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> 
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>

Thank you very much for the review.

