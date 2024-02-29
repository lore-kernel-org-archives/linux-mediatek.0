Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A380C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YtiBd2LSB06AwOHaUeGaoTZv5dyC95eto5oEJCBxbY=; b=3n1Zyf5M1Tef3gO7H1YmvNzlkd
	bBs6YMSuyRYzj1x5901gwjnJjK68Yo3agrmFkbcql7PEuEH7G/oG0wgeRC2F6RtyGt7YApr2UoO8z
	z2nWtQEkZWpaMa3OHmYa1hV+xuchXBqXhiT5lj4DqS0H2mZCIJMJP7DI5c1wzznX0WwS7SHGTt5PG
	5eue5QlkHaffylNbH6jml0sSMA3k+qkGdvkrg9ArTKrQvXje2BWDio2Pwzw6p89WyV9RBHi2hP6iM
	jEWWGD1LpKdXObiXJwStAvh9t1Cg1lx3O/QZ1ciXcc/xyh6zjS/NUSJhepBVy498SmxnktLycF3Xn
	WQt9jsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnqu-0000000FIjO-3Xt3;
	Thu, 29 Feb 2024 21:22:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnqo-0000000FIhZ-3WtF;
	Thu, 29 Feb 2024 21:22:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7767660004;
	Thu, 29 Feb 2024 21:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709241712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YtiBd2LSB06AwOHaUeGaoTZv5dyC95eto5oEJCBxbY=;
	b=Lqeq0OgFbcfhGFB2S+WinpRSPBLz9Us20KdYIRpoJGmIBjz3eK+FMOxC+gthGCoE/fFKvo
	OQE0wr0yRemEBGvnSVa658owIYZ0pe9ywQfi7ORgwwhDj9ITjnO1BwxKkWdO6yU7QFGT9L
	LkhlOxl1eORcgj0yian/UzmLtdZxU427AOaSa1+NWr77yF7bFZ3IZHLwe5DnQkaorxSPeG
	V+G18F59FywqjtxZl2QRAFjd+FiFNZkGsLo4Ka9Ap+2JSew8lo5QNRvtaPKZguhX/fVw+6
	DSQscCIhw6+QDc2aLG3s4d9i6+EDFtPgHknBwHeEjfb9R24e95c/RhGPZJCYng==
Date: Thu, 29 Feb 2024 22:21:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Message-ID: <170924169920.1873482.11406048934982757536.b4-ty@bootlin.com>
References: <20240122124949.29577-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122124949.29577-1-zajec5@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_132159_029761_8493BAEF 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, 22 Jan 2024 13:49:49 +0100, Rafał Miłecki wrote:
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include and adjusted "reg" in example
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: convert MT2717 RTC to the json-schema
      https://git.kernel.org/abelloni/c/e8c0498505b0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

