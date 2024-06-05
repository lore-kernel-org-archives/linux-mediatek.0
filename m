Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B2C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnvLazfxcjGHdLm52pCA9KJWUCNk5vojBRQ6E4dPaSs=; b=oJk5YBHBbTefAARVJnT/Zq46dE
	3wk+6kp+q3qxJgyIVr72SDq2vhMrmE+pW9SWm6QfCjDy5UizDHoVC0ZexXFNCAcLeCVnAFZeIB2rV
	mjbSg7qBKZNrxbju4SyqMcjV19by33K3ZWHya2pog8N+DO0P7R2csJZKRecpXoEiQnFcprZS6Rp0K
	jlBYfKzEV22+tQOWQlAlL9Pa8n+VvONjP+S+pxyimaPU0FF61+K2yqx2hXetF+vqadm5Vs1Fdpmnu
	GOdX0qtw1rIU9+yU4CEzgRWhU0vfuqN5rcZJMYhSaDxeqOpxijxs4Z7LQkQlT/yI9jVIsVA9V3oyE
	A4s1VSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEooY-00000005iFr-1PP8;
	Wed, 05 Jun 2024 11:28:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEooS-00000005iF1-37HK;
	Wed, 05 Jun 2024 11:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717586895;
	bh=tTRbEUHErhXOb2ErgxeUWtY7iZL3LEzBhTNIwuNR+rg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AbIjBOWRiZsvWHdcvS38X5SrYgUa9pAtachgcKEpBPgiLf7iDsxFSdgo+1fk7U6R0
	 H6q4b0jc8zp4Jz5tDGI67d4650OGweZpgrsCbamETVPnh/4j2yxd6psQFGuV5IIIwX
	 7Isqsf6klqqmUj79JbuBuBYOiyTuyyZBoRgRcWrEIJF6675x8O8AqsR0BqnbiDVgEO
	 HW7zLBOQBRzM29IWEq9Fi0+nXrPS/K5GvRhzbKKm8LGsHOXXBHGTaHCTixDZ1b0xnw
	 tSmPviFuednkEn13/ra9QP3rVxCak0moX0374mM0FZ/8uQdepQSSo5cRPsJixQ9w5d
	 6+MLHe0iFYcRA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9FFD3781139;
	Wed,  5 Jun 2024 11:28:14 +0000 (UTC)
Message-ID: <48f9b777-9c3f-4306-972a-f615e323026b@collabora.com>
Date: Wed, 5 Jun 2024 13:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: serial: mediatek,uart: add MT7988
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240605085433.26513-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605085433.26513-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_042816_928310_1FC35148 
X-CRM114-Status: UNSURE (   5.52  )
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

Il 05/06/24 10:54, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add compatible string for serial on MT7988 SoC.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



