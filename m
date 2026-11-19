Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE48606A33A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDLsPSbE;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kmw8J5xT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bhXIKOBgYo9ODFl0eTsalG7rKmJZwQdt2xRDgmvrRz0=; b=ZDLsPSbEFoY3hq
	N+lqcxVL9v8aCssXjT7LHjW6USKlCaAF/M1e1n3J3VHQgXoUrLenZxM75ZLrYCeySGuxABvxTdVF4
	gekUgAcxZ/OiY+GhGNCXok4t7t1dYEYVFekRIJeCBSFGEiBC2BwYollzezk04+TTaTotEQaF06nhx
	TwAJrIX1aOjEwr96QApLRxzjbYoI7AhAteeKHZzHqqBRpxCoQr4slF1VqbsZwLVQFy4/N6CuGoJWo
	6WmBSf8L6br493sxaXOT1QfJe1YG89haxC+Eipcimfl0WK6K2XJ42P6xnagg1wez/HnuGCkNUsriX
	Z8ifqc5MYqZL9q8FlqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Zh-0000000CmUB-2HgS;
	Thu, 19 Nov 2026 17:05:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Ze-0000000CmRd-2OFf
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 17:05:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3B0C91A171E;
	Thu, 19 Nov 2026 17:05:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7965FF9A;
	Thu, 19 Nov 2026 17:05:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F4F811BC0CE4;
	Thu, 19 Nov 2026 18:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795107920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bhXIKOBgYo9ODFl0eTsalG7rKmJZwQdt2xRDgmvrRz0=;
	b=kmw8J5xTFEWAkXsuC6V1moj0U48GOHQayLNiIdN6ht8G9jHDivJVuq1jOvkBaLW9WUdiC0
	eYd0efyL6q8H4Ur/JR0fwWTIrxGUZo4sOfgjSBtSlelTQn34Pv4MrMhsRjU41qSFXzuk4g
	MqtdM5sdbDY0W/ZLq4T93PtO9TpSD4lNI6D6e/YlucX8SepTuEel3UNq9evnUCOTIt1SV9
	SQCkYQ2GIxri1AfQtCZ0YHhtWHJQ49XCURGNXCdyLmrQN6LuqEAbG/L5Oyk2ds3HruIbvl
	Y1cjwNOeR+UD0sOI4MgPr/gHGRJCJZw/jfe1z4CZno253ZxQ+QTiygfTInDkGg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 18:05:07 +0100
Message-Id: <DMZCN8AD4WMD.2ZO1SYMI93O3M@bootlin.com>
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Cc: <luca.ceresoli@bootlin.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
 <treapking@chromium.org>, <wenst@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
To: "Daniel Golle" <daniel@makrotopia.org>, <Hermes.Wu@ite.com.tw>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org> <179251509978.78870.2485132679226608837.b4-review@b4> <179481904178.211952.8076269834336042526@makrotopia.org> <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw> <av8jL0W1vgdqPQhu@makrotopia.org>
In-Reply-To: <av8jL0W1vgdqPQhu@makrotopia.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090526_751266_0418E66B 
X-CRM114-Status: GOOD (  23.61  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Nov 19, 2026 at 5:26 PM CET, Daniel Golle wrote:
> On Wed, Nov 18, 2026 at 03:12:14AM +0000, Hermes.Wu@ite.com.tw wrote:
>> Hi Daniel, Luca,
>>
>> On Mon, Nov 16, 2026 at 08:56:18AM +0000, Daniel Golle wrote:
>> > On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
>> > > If you could share what that register is for, it would probably answ=
er some
>> > > of those questions.
>> >
>> > I don't have documentation for it either, and with ITE gone there is
>> > nobody left to ask.
>>
>> REG_AUDIO_INPUT_FREQ (0xBE) is a read-only input audio frequency
>> counter. The driver uses it to check whether the I2S BCLK is
>> present and changing, i.e. whether there is audio input.
>
> Great to see you are actually still around, and thank you for confirming
> that we can drop the register read there.
>
> I was afraid the bouncing emails of the former driver maintainers would
> indicate the driver has now been orphaned. It'd hence be great if you
> can enlist yourself in the MAINTAINERS file for that driver.
>
>> > As for the logging, I don't think it is worth an extra i2c read and a
>> > division in the enable path, so in v9 I'll drop the read and the
>> > print from it6505_enable_audio() instead of guarding the division.
>>
>> Fine with us, the value is only informational there.
>
> +1

Ah, great, thanks Hermes for the feedback and Daniel for the patience in
getting to the bottom of this!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

