Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB01EECDFA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/pjUimprXAN5aGuHop15W9q66+usPs8I5yURjMHny8=; b=MRtx6mGuIPNtvCW8TiOx7/56Rq
	gYnqSD0ffeDCf/yXkC/2LP6QM3zmoqFEzql5iEuKzrIMM8DLdDjPtFTYz5u/ctPLwnaujIoG/mfqg
	xTkOWlicwuJAyAI8vyTqZwe+ZdYEqDCPKRtTMnIUwCYhEqAS0C7j5rEG8+dajCIJvDEw1ppb5xKsr
	D75FnyHBjn4uRSQByxtM2hcMLJ8L9FQrp4+W4SHEQ3hij7mRUgPfAWrUj1a+THxR3+CFK5kLQk4wD
	mmiy5xKdOx5uzhKGbdq/gdHdH7+kGCARrJjB5bETanldEbU+SacXtlFBTFfP8ZA3Eml1ORegCr8XY
	ZSdzKOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIBI-0050Y5-31; Tue, 25 Oct 2022 11:33:16 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIB6-0050Wp-Ld; Tue, 25 Oct 2022 11:33:06 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id EF5E141BCA;
	Tue, 25 Oct 2022 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666697579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/pjUimprXAN5aGuHop15W9q66+usPs8I5yURjMHny8=;
	b=pKnBbJgB7C26LzjLyROErl6S/TeGybPxmxQYDff76htpo5Ihk2iqRV/iOnLfVJO9PyjFwO
	mlSIdEpGaFQivp/0IVoNFDEfgXq06ccpEWl89NwmRcAtFWIr2QWBI70nOA/y6exqnoOCNy
	z/MOv8TECpFBK5ICX15P2onIYpZ+Q1g=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox4.masterlogin.de (Postfix) with ESMTPA id 2F75F80098;
	Tue, 25 Oct 2022 11:32:58 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 Oct 2022 13:32:58 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam
 Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: mt7622: drop r_smpl property from mmc
 node
In-Reply-To: <2bc75b20-9469-e7e3-24e3-cc80ab9b8a8e@collabora.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-6-linux@fw-web.de>
 <2bc75b20-9469-e7e3-24e3-cc80ab9b8a8e@collabora.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <842341a170221d072b188e1e919865c8@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: b3f94e45-d4d2-47a5-9be4-8caefd74f635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_043304_934588_B6F1AF3F 
X-CRM114-Status: UNSURE (   5.76  )
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

Am 2022-10-25 12:52, schrieb AngeloGioacchino Del Regno:
> Il 25/10/22 09:42, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> This property is not defined in binding and driver.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Fixes tag please.

as 2 boards were touched (i guess r64 was copy from rfb), i have 2 
commits found
adding this property.

Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")

regards Frank

