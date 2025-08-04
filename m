Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E03C87FCB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em+ot/5F7i0z19ruCoIikWEuU6nSyDSRHZONGRNm3Cs=; b=je/bhbDaJ2Jl0zSdCUEPE5YP40
	ZXuuveeaFtpwT+z1yivY1XbRFdoMkPxl31AtN6gVMkE2t/DX2WyTftaai5reUKfc6DhZOreRErIeq
	Tre9j26CFja4bC8bl7XUYgmi5BOMtEHW3oBFriPmNWoGiQgeY/OiZphdH8n4ReUsifkwdOMUb7e5I
	HGFqQsORwdGRPRo32BD+pmU8Nfakd2tiQWJYF+2RkHQer9Y25XwC8OyRwjNyoTju90X8t8Q3c3HE1
	Tilc6BvxZdzg6fjX1c/BOPZ5MMMgEsx+RVS/CxSI7U9JHu2H6JniAtfNYcptdrLa6Irh7tjIYKQUt
	bgl65/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSg-0000000A4ff-13Ae;
	Mon, 04 Aug 2025 09:26:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqtE-0000000A03O-1P8k;
	Mon, 04 Aug 2025 08:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297390;
	bh=wWy+JFHn9TTrt/BnNBPzBV4qBir5M7cDuw4hMnmgdGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2KSrEKZXvkSw6awxmikCOT2fCqLzPNHtiawXMhKdCpw0utM0XPQbFAmkoT8LbEqh
	 XkfeeeOOPMg+VajPj4Uhv2vgoE2QTjw5o+oTgiUWF1q4opT/woI+AFXRiO8pck+UUM
	 Q3MX1x78Eu87ZTaa+a/Bjbv5zAgzGfbahiC+vNquyjYFW1crkQixRMaSZX6Qw3yySh
	 QrJhOmKCUccDqeoEWIcxv0Jr9MFd8boo61zhA5IAsD/o8lLf0WZDmMliMFy+IrPevj
	 GJxX6wAiKV4lr4SkDMqhFbm112t/2sjtKREDK8zXYVy5+Q9faZO7Dk+RlbtCVHx7dl
	 Z5z2Sw88h35fA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5515A17E0B8C;
	Mon,  4 Aug 2025 10:49:50 +0200 (CEST)
Message-ID: <8585fd8c-80d9-4551-862d-79b11defde0d@collabora.com>
Date: Mon, 4 Aug 2025 10:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pwm: mediatek: Introduce and use a few more
 register defines
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-12-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-12-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014952_555400_75C53A82 
X-CRM114-Status: UNSURE (   6.36  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> Instead of using a magic constant for bound checking, derive the numbers
> from appropriate register defines.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Awesome.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


