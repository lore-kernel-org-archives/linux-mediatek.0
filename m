Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A7CCFA02
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Nov 2025 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCdxwgvfLLmISGJYvdvJUkKzM2T1HKuVbOCvYfSZJ8Q=; b=QZg4n1D7ZjU60PGLx394zKm6vO
	BafXCgu7g2Hp53voqitODUPBIALoeveT9twQLyLlB0ABUdXyT0YzjIf9wtdZX0JVl0me9RVfo1cC5
	HvIffhXS8Foy7SJunFgwllKItxiNP5mC5oCQeXUDAWFCtuRB2K8INh/rcPZuHGFF44lN/nZWVBpOc
	jv/GasITAwDeQQky9CxIZ3uFujQQJFfFUYs5ZHVQADIMnickilgZ63NVq4L7OuL+UzZu2eVk7bUOn
	jCfSzg/43EQJ70ZrdqmIDfMrTSKYA3RfQPh2rOyYq8FP2x6/RkQB+Wtl08FXAwB+xghs8gp6tS1zS
	StzondqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcNP-00000008iVp-1gh9;
	Sun, 02 Nov 2025 18:00:27 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcNL-00000008iVR-0lU8
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Nov 2025 18:00:25 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 00BD86010F;
	Sun,  2 Nov 2025 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762106420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCdxwgvfLLmISGJYvdvJUkKzM2T1HKuVbOCvYfSZJ8Q=;
	b=NF9BT8BswEY19Ex/H9Jh2/o1Sv3oXdMuBqMZygyeQUNEeWKx9BjaSwJURPKTs5V4dvWKCv
	IXJAHz0e08ACesdV7SweQB1xBGFYUIoqTaLtwYmR0a2idG6xxvbwfBZI0ir4ouggJbC1IW
	7j3wMnPcPUpLTz+0adgkxrH/YbhXfWI=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 60E9F1005EC;
	Sun,  2 Nov 2025 18:00:19 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 19:00:19 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org, Andi
 Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, Wojciech
 Siudy <wojciech.siudy@nokia.com>, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
In-Reply-To: <aQdSVcazPQl-shR6@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
Message-ID: <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: f37694be-ee31-4dbf-ac46-b50d472b364f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_100023_472125_EB790A9F 
X-CRM114-Status: UNSURE (   9.08  )
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

Am 2025-11-02 13:45, schrieb Wolfram Sang:
> Can you try enabling CONFIG_RESET_GPIO please? It is probably that this
> driver is missing. The core relies on that driver for the fallback the
> above patch makes use of. Sadly, I couldn't convince the reset
> maintainers of a way to automatically select the driver for existing
> users :(

Thanks for pointing to this and indeed i had not enabled this. This is 
my fault and not
from reset maintainers as i have my own defconfig. Tested and my mux 
works now again.

Maybe this option should be enabled by default or when the i2c-mux is 
selected?

When moving from specific to a generic aproach (which makes sense) imho 
it should be
mentioned in commit description which option needed instead :)

btw. the Authors Email seems not working, got

<wojciech.siudy@nokia.com>: host
     nokia-com.mail.protection.outlook.com[52.101.73.24] said: 550 5.4.1
     Recipient address rejected: Access denied.

or maybe its inbox has a whitelist from which domains he can receive 
mails and my
domain is not added to it.

regards Frank

