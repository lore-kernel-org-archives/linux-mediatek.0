Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DDFC25B77
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 02:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8LXtNuPs1T0FwCJ4tyBd0pKUOD1CJ/nDtHY2O0VUkQ=; b=W1M3SgxMLvnBpn
	2h/0XQWOnFQD1YgefyWh5Wnw+I0AVBrtFZSZoh1gQlCUGge4hvO4/zfSYUFzdh50JmxJA4/3mmhLK
	h5i0M9BK7EhvhX3k3dAU6pNbDBMBQ2a0u+MJeoQ78+wV7eAHZso/qWqwfQmqP0XSTf1e3xxb+SMmX
	GKy6sKsS2H+PvqoBTsNPdgtOA2vu720nxlQZamIic8DKNAhPir4FLko4ygxxAW4ZojHrWhA512V9q
	sKkiEysr+G4fAAI46BqjyMVyi1M9G0QwXoZsowHGI+RXWOYsoBmv/UzfwSG8dho4yH+z5tmfMK5GH
	5gz9YP0XLba8h2T4W8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7nAX-00000006c2q-030x;
	Fri, 17 May 2024 02:18:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7nAT-00000006c1Q-1CEx;
	Fri, 17 May 2024 02:17:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B1C40006;
	Fri, 17 May 2024 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1715912270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8LXtNuPs1T0FwCJ4tyBd0pKUOD1CJ/nDtHY2O0VUkQ=;
	b=KY2G/WYp0/vwq1jpNBxeQSt4VnFzz7zuDt2pCo9g9M55oqo9ueszQZenZhwt1QnS1BthhX
	WzN5s4b0QFc95b++3a2N/xq4777R7kavfVVgm7zSzYTmM6PeSgzmH4OrYiwCkeBfLb5DB2
	Yy4tczx7NwWpeNPJzjZSmctS3SlC+C3KPTkoq7X7ukxcQJq4Fo+ULQ3L3/Gehgcuf1RxDN
	U1QIur2aZ8UM1202wL3hk36BNclrXsf7Dyjj7nNWjDHohDC7T50qiOWlIkRrypqn/a+8OJ
	Gy2Vi9cLxCsjTLBwfVyG6gq0UR2LKfZOzKpaDfsbBxHQbEynZwwDYTiiNqVV0Q==
Message-ID: <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
Date: Fri, 17 May 2024 05:17:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240516204847.171029-1-linux@fw-web.de>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240516204847.171029-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_191757_561649_B723089D 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/05/2024 23:48, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> After commit 868ff5f4944a
> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
> the mt7531 switch on Bananapi-R64 was not detected.
> 
> mt7530-mdio mdio-bus:00: reset timeout
> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
> 
> Fix this by adding phy address in devicetree.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

I don't like the mention of the Linux kernel driver on the patch log. What
you're fixing is the incorrect description of the switch's PHY address on
the DTS file. Whether or not any driver from any project is actually
reading it from the DTS file is irrelevant to this patch. That said, I
already have a patch series I've been meaning to send the next version of
that already addresses this. Please wait for that.

Arınç

