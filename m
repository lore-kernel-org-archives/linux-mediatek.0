Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F2AE7716B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubIcwCWLfh5jAo1KxZIG7JzLEnZi0df0BVgjukgv6Gg=; b=EZuwiZEeh7rLy3
	KFUHBo34QvWoSz1EKn2QUoEHMZ8tO5aNApS7V+1s3Fs/VJVX1cAT+wvoj/dRCxVykF0uqtUnnXaMm
	iLAIqCBShHEHkWrahUyV7EDbk1ElzvkQrNlGUhQ8FVVR/JSfhvviIUvZOlLWFVQNqMR28Ox/hccr+
	OODC1DNeOSymq+CUDSyP5eK4tvT64kc14Q3LWj4Pdk5lBZ0l56Ls7KJ4IiIysYJXS6jLxzq4CBSqV
	D3k/kMg74LchnCwHJsRgkL4WEpFsLmbbOm+c+nNuyziqFwXV6SI2dWuxPj9vymeQE8J+xMCf3zKIa
	A54UhVrZwdLZ4zpNRvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInar-0000000COJg-3j3w;
	Wed, 04 Dec 2024 11:30:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInZo-0000000CO6l-3qio;
	Wed, 04 Dec 2024 11:29:54 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 77F8D5FAAF;
	Wed,  4 Dec 2024 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733311790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubIcwCWLfh5jAo1KxZIG7JzLEnZi0df0BVgjukgv6Gg=;
	b=GY+diCdhgkW/ExfA+Aj33mqmvLDQt6Ee1ZKpB5nHvp0ERna9nlzNRb4cNUoB2irPMQbpP/
	H0QsdiSMcaD+nPfx1XxaKPMMU6DE/ebuQXTdPzNn8D2rkR7869fDQrcDCV3JKr4KEHkMk0
	PiBdUYsTMxJbbrfbcFWbn3ntV3wxVRM=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id E0E1C80238;
	Wed,  4 Dec 2024 11:29:49 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 12:29:49 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: mt7988: enable ssusb1 on
 bpi-r4
In-Reply-To: <79ac6523-b002-4e10-95ac-3df378f4f3f5@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-18-linux@fw-web.de>
 <79ac6523-b002-4e10-95ac-3df378f4f3f5@collabora.com>
Message-ID: <3ab54dacf32dac008ff88855abb53415@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: ac671c49-9199-4ecf-97de-f969a38c05e9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_032953_123468_76FE797A 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2024-12-03 10:40, schrieb AngeloGioacchino Del Regno:
> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Enable front-usb on Bananapi R4 board.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

thanks, but i noticed, that the controllers in dtsi are not disabled 
like in my final dtsi. Imho controllers should be disabled by default 
and only enabled when used on board. Should i add disabling in this 
patch too?

and i noticed that usb phys have to be added to get working usb. Here 
for ssusb1 a tphy is used where i now have prepared patch so i can add 
it in next version (reusing mt7986 compatible). ssusb0 uses a different 
phy (xsphy) which needs a bit more work before (driver and binding 
change).

regards Frank

