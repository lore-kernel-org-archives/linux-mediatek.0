Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64150109192F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 23:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPJ6Lyfn7yPn7UuxN3CPtATH7ID+bUNGaaGcyG0DoZw=; b=bk8q8m0z+yNvgVgGbgBrY3EKGK
	GVFIN55QBrz4dA+G8HqaOrZP7l7nSvEzhnPPGVctddM3NbaozIGXDpcGlAP0G+81+MTbB+oYVgWO/
	FBXuOtBv5W23hRlUpSaLMUwh8PhPTwTOWZ5vrAODL69kcwJA/w1J5VW7Us61U74BpEe8PF21ajV0K
	9e+MzeO1dJJzvPva6CuIyiMpJ+/BKivLQoZyH8HBL1dgiXd9ngcszl9o5bjiOlPX69vt8rYUVX5bZ
	SRSdt8L3IkUcy0Qr7rCSnripfAA1AndZpLCvVaM/Fo6yY0JOJsfUl7lrNR48LBkcVcEjYxvJATDeJ
	uQhgFcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Mfb-0000000BmrT-1wxu;
	Thu, 19 Mar 2026 23:20:51 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3MfZ-0000000Bmr7-0O3o
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 23:20:50 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 9C73D1D00211;
	Thu, 19 Mar 2026 19:20:47 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 19:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773962447;
	 x=1774048847; bh=bPJ6Lyfn7yPn7UuxN3CPtATH7ID+bUNGaaGcyG0DoZw=; b=
	EptwHYR4QaamRWF0cBFOUqX7GlTJjobjA8QT0AIDLXEa0HpcJ3aCq+0QtNNIkj6w
	30KzMj4o4zUl4EaMHqFtmear2zcjV2WfMQXQhPYr4h2M7Xlg3k6V8qH/PsC3XCT1
	8VO6xdmHyrq6NjhiRqcsKbXCb+8NIo4MjkKGoPTCaA/taJNbbu91XOFnP9eu+KYF
	oyCYL8bltkahlLXT434oWsEaRul9sFYx9+i2ACG9vIT2HtWqvwnR4j6NqvK7yViC
	OFNsV+bZz4gfNPr0qZY4RAgWmoNFSJy7guEQ8U0XJSYvEZx0P+Ukmec0H+zsEJmv
	JQ3rjhjP7zkI9widKAMhaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773962447; x=
	1774048847; bh=bPJ6Lyfn7yPn7UuxN3CPtATH7ID+bUNGaaGcyG0DoZw=; b=M
	nY8U9pMcRw5ZyYEmLY/SmoJVIqAZC5OYZ/YPQNwfn15Thl/v7K+lL+1LxrI3gUMu
	3Bz90tl0hEBAo+CCX85WraWFs4moRzbLN7EqW8yytSu7YpiqXO2PYeoKxLIjPZ/d
	xPGP7GfD9oBX3aK1KvRLzkDJcqg+5OFUO8VbY3uqt9Zo6ZBCCWXEIEoZXQsREUpq
	cLWjVCAbZfaAD70OwzIhWTjp2Vnq0h3xYh4RNsIDRJsNfdQcfIU0cQvrUOb6I8WU
	rwCoj4TvblDCT/nweyzBcX85FQEG6fkvI0xjH2r0XKMjQPkfgod5MtQ0IrgvRLE8
	XmKdjg1nk4igKpzeuFVSw==
X-ME-Sender: <xms:z4S8aYDMSyak7F72ds5pBV30zlhPe89XjAqvUGXiqOdEv3ximihRfQ>
    <xme:z4S8aVXmj8ksKa_vesdGmHf8KXYJPBy57TzCUvMkSo4suIZfMB_5p4R36kOZpiP8W
    bwcEUAq7O1PlzwM1stq7IC-sAS4WoYhj3YgYAd8oFM19ciyKB6pCF_x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpeektdffveejhfeffeevgfefhffhuedvvdfgfffhieetleefvefgfeek
    tedvffffgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhmvgdp
    nhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhuih
    iirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluhgv
    thhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:z4S8aRoLbIB86xOUchVrPgnbHyOYABS0b5iEC_oG8uItdgmbssfXWQ>
    <xmx:z4S8afFjiNb-yTUG2lhv4DmDyX-tJJJPmyRZZxgDgeyW-4fsKz_OTw>
    <xmx:z4S8aRsn9ImPVSAhLoohRepPUPFs6zFX98HYlAs8jc1MtxzFefTdew>
    <xmx:z4S8aRXPJ6o3yMDUsE-j_EUKTIVSzpvBCAsxRZcETvP0vX27gEUQDw>
    <xmx:z4S8aTvanKQl1XiweKSpUrG5WWlhlhbo5VuW7QF07AMG0i2EJhLGQKk3>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E361D1EA006B; Thu, 19 Mar 2026 19:20:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Sean Wang <sean.wang@kernel.org>
Date: Thu, 19 Mar 2026 17:18:10 -0600
Subject: Re: [PATCH 1/2] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
Cc: linux-bluetooth@vger.kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
In-Reply-To: CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com
References: 177272816248.352280.12453518046823439297@jetm.me 20260305162928.5E8F11EA006C@mailuser.phl.internal CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com
Message-Id: <20260319232046.E361D1EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_162049_203426_8B679CC3 
X-CRM114-Status: GOOD (  16.21  )
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

Thank you for the review. I have a few questions before
preparing v2.

On Fri, Mar 7, 2026 Sean Wang wrote:
> BT and WiFi use separate firmware.
> I'm not sure why those WiFi sections are included in the binary.
> Another concern is whether it is appropriate to upload the firmware
> used in Windows to the linux-firmware repository,
> The firmware files are probably intended for dedicated OEMs.

Understood. The BT firmware we have came from an ASUS Windows
driver package because no official Linux firmware exists yet
for MT6639.

Regarding the section filtering: the MT6639 is a combo chip,
and the firmware binary we have contains 9 sections - some BT,
some not. Without filtering on (dlmodecrctype & 0xff) == 0x01,
the chip hangs irreversibly during download. I'd argue the
driver should handle mixed-section firmware correctly regardless
of source, since combo chip firmware may inherently contain
sections for multiple subsystems. But if MediaTek provides a
clean BT-only binary, the filtering becomes a no-op and can
be dropped.

Three questions:

1. Is MediaTek planning to release official MT6639/MT7927 BT
   firmware for linux-firmware? A clean BT-only binary would
   simplify the driver code.

2. The WiFi side has the same firmware dependency. The WiFi
   series I sent to linux-wireless [1] uses
   WIFI_MT6639_PATCH_MCU_2_1_hdr.bin and
   WIFI_RAM_CODE_MT6639_2_1.bin under mediatek/mt6639/. Is
   there a plan for official WiFi firmware submission, and
   would the path be mediatek/mt6639/ or something else
   (e.g. mediatek/mt7927/)?

3. Luiz requires a MediaTek engineer Signed-off-by on the
   btmtk patch confirming the changes work as intended. Would
   you be able to review and sign off on v2, or point me to
   the right person at MediaTek for BT driver changes?

I plan to decouple the driver patches from firmware
availability - the btmtk/btusb changes are valid independent
of which firmware binary ends up in linux-firmware. The
linux-firmware MR !946 can track separately.

> This is common logic for the other mediatek chips. It only takes
> longer on the first power-on.

> If the firmware download is properly handled in
> btmtk_setup_firmware_79xx, we don't need the extra bit.

Got it. I'll drop the BTMTK_FIRMWARE_LOADED flag in v2 and
let btmtk_setup_firmware_79xx handle persistence the same way
it does for other chips.

[1] https://lore.kernel.org/linux-wireless/20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me/

Best,
Javier

