Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E6CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 20:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLCOUbyOSV9ezqsS/Y/iCR2LT+CchZHEZANinXmKWXs=; b=bULj8cmus9BydFQThvv7paq/l8
	rX8k78ajvm4YdwL4D1pddI8sp4174eTqRpmDPlkTOuqxOfik04MyMcKKBdae08QmS3hVr5pvoZjuW
	pqgpRmXwb0/02o5qbUwMnAu5ECW1XFxMjir3gAwQlD/5pKcyfx3MNKlLLVWk3LzddWUE5VEy8k6uV
	y7+TJJ6DBaZG8KtesdYERQcyB7a89DN1yOUfEvy5Zvb9a45WVdOax2ZWexX3q9zq2PERbXVrGtcco
	ONwgjfG2EMUgMe6AGYZCS9KLnI4wVovC2EoYlSe8GypKHpbNWDMrfQ3qSRoyhzo6Ds0MaBpm/EPr5
	/okOL89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Xxx-009N03-1m;
	Fri, 10 Nov 2023 20:18:57 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Xxu-009MzD-1S;
	Fri, 10 Nov 2023 20:18:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1Xxe-0008HJ-0s;
	Fri, 10 Nov 2023 20:18:38 +0000
Date: Fri, 10 Nov 2023 20:18:33 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Message-ID: <ZU6QGb_4kjw2katx@makrotopia.org>
References: <d7b72b3e-c8f4-4675-ae62-26f5ae576f0a@linaro.org>
 <ZU5A59KO8Y_Q97IG@makrotopia.org>
 <a56cfe76-ab03-4187-b6f1-04a5c3414e64@linaro.org>
 <ZU5DVNOmtyFwUTdC@makrotopia.org>
 <708046ae-a821-420c-959a-ab5cb712aa9e@linaro.org>
 <ZU5IcrjqQpwMopJC@makrotopia.org>
 <6576d4a6-31fa-4780-9a8a-5a1d1974836f@linaro.org>
 <bb0ed593-082b-4edd-9a1e-78cccf796677@linaro.org>
 <ZU5jU-T0m5QW4ZeF@makrotopia.org>
 <8846adad-9504-4ffd-b9c3-f5e78082d261@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8846adad-9504-4ffd-b9c3-f5e78082d261@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_121854_513385_0172591F 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, Nov 10, 2023 at 08:58:57PM +0100, Krzysztof Kozlowski wrote:
> I am repeating myself... but I don't know how to put it other way. I did
> not ask you to rewrite your driver. I asked to drop the change to
> bindings, because it is entirely pointless.
> 
> Drop this change, only this. No need to rewrite drivers, they stay the same.

Dropping this change (I'm assuming you are referring to the hunk adding
include/dt-bindings/reset/mt7988-resets.h) and also not adding that
header file using a seperate commit means that there won't be a header
defining the reset names.

The result would be having to numerically reference the specific
resets in the device tree.

This is, of course, possible, but I don't understand what the advantage
would be.

