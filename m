Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK3fchLQMrFG536+vEwlHqXIXUS7zDm9VSK+j+0hld0=; b=Iiv0ppIx+Zm+9L
	arp+VjC7YTz9IRn6ZlCyAUgN6DV3PDKBWw8r9fG16nLOk/56VhjqMITxpmlyJTNkQq4otTg2quQnx
	bpHIsweSjwANwKU3eipkxhoNpnwwdQhGHBbJbLd0lSA1rFkqHVTkRy/tSWt05D1ivd60QHlRuDate
	BxKCrFGq/UuAq6Snn1rqcLtHOjWjwSO01SpyAMRCmS5nt71mZ/h+RzuaNopM/fC35eVG5qU6KfJvK
	d0nKCQYpjjmxZ+kqOVlmgYTzzpUkM4XeKq55mCUB9KIWwgyP3hAoGdHt0PiIiciAef5GPUjULo2fY
	NsJ12Vs+qPoBwgmQQa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUba-0094Wf-7x; Mon, 31 Jan 2022 11:12:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUbE-0094PE-J2; Mon, 31 Jan 2022 11:11:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3C1B71F4323B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643627515;
 bh=bih+YpN7Bu9FDncTaHYjpoZqdzNV5LPiHw6/cv1cfhQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hKRtf4cDoo1ygR4TE6AVz3KwgVq9I2wipi4rIcHIGgpe4sBTYjAxOsd2Kf7TyyOys
 tcCjMJOIJjFy9IwzerMUjdbmP1MW8aRsU1mwqccSQAZGK6MiYYTIVzUU62IJS2evjN
 v2ybCwImU3qGLqu44MtMpNG+od93c0ze1Jo0k/1WMx5nW1fjzNx4bBNE4dch9yN2in
 oGRNDJQQjPrfD61oTV/yKPQa7DwOXZzaLfqi9zaMpRFiXS7vY6pcD8Ge8UnXnJhO+p
 lLERwen3qfXz8zdm4FsGqmtK2XkAK6LBUbHVT0wKUOcY3i1JRCEjeN/hM8NjeMiXXt
 QKJ6fsA1asRpw==
Message-ID: <0846872b-03da-ee5d-6a9d-e6c9fa754191@collabora.com>
Date: Mon, 31 Jan 2022 12:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v22 5/7] soc: mediatek: SVS: add debug commands
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-6-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220127033956.24585-6-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_031156_879699_CFE84535 
X-CRM114-Status: GOOD (  15.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 27/01/22 04:39, Roger Lu ha scritto:
> The purpose of SVS is to help find the suitable voltages
> for DVFS. Therefore, if SVS bank voltages are concerned
> to be wrong, we can adjust SVS bank voltages by this patch.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>


Hello Roger,
I was thinking about what this patch is adding... and I have a few considerations.

It's nice to have a debugging mechanism to read the status and dump registers, as
that's very helpful when doing heavy debugging of the IP... but adding the
possibility to write a voltage offset may be very dangerous: think about the case
in which, either for misconfiguration, or for any other reason, the debugfs entry
that allows writing voffset becomes user-writable, or a user writes an impossibly
high voffset.
In case a very low (negative) voffset is entered, the platform would crash (denial
of service); if a very high voffset is entered, hardware damage may occur.

For this reason, there are two proposals:
1. If you want to keep the debugfs voffset write, please constrain the permissible
    voffset to an acceptable range that at least makes it unlikely to damage the HW;
    Moreover, since voffset write is a feature that would be used in very limited
    debugging cases, I think that this should be implemented over a build-time
    configuration barrier... something like CONFIG_MTK_SVS_DEBUG_ALLOW_WRITE, or
    similar;
2. Since it's very unlikely for someone to really play that much with a voltage
    offset during runtime, and since this looks like something very machine specific
    (perhaps addressing board-specific quirks?), I would suggest to add this as a
    device-tree parameter instead, such as "mediatek,svs-voffset", as it is indeed
    possible to specify both positive or negative values in DT.

I would prefer proposal 2, as it looks generally cleaner and way less risky.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
