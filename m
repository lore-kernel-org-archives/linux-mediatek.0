Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C81C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqQ/Q3+M8Wzmz5lQdic6HBxBKGEJSivtFgBizIKNhsw=; b=eXqknTdynfFF2GEvJbqvj23jBX
	XZiazvRxtRZaJDC2plYtYcOP07cDIaD+W/txcVBump0sZMzh42GVawHNmXgX/V/sT/oL8d8qBHKaA
	mfVFCxVk2cYhy48qocAxWBUfhrd+I4Csq8m5q3jBSXujRr0f3QAHmJkfoFcJROntlq8zYInc5NzRr
	IAbv6fzJTGqmx+r2iI0YFh/NIi2t3UPWYRL/nwEG7c7cVJ8jgWvksiJTkmf/QIcWO/IKf6jLBqDA9
	U6HnJLppj9BG4w+/XN47bERu0ya/ynoRvxEi53sSo84gqpED5pqL1mEpZ6dOVuMBvtBlHBCn5WlQH
	XRtkXqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdJ-0000000GVFI-3Um8;
	Fri, 09 Feb 2024 08:53:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdF-0000000GVDO-1Q3F;
	Fri, 09 Feb 2024 08:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707468792;
	bh=SCFizRO1mkhWZ9UsKwKydQaTwmYcQyyC5mBYpD3gCl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xzOQ1z0tw2tQcrlxq7shEkIqqOvvTDRmchYbfQO4bMS2m4ExGez6jjPPijlYIgamm
	 b5ZUmS1QpXQHzC0lwSspeY1XvrfxCPMkhm9Hpc1UkjKLvwuTclZ2Fa6Fky8No7SRdq
	 uAfUHcHLCSeoKJ16H9ADwguzsViPCuqLeKu7pS+ZI7cderQ8OIMxMb1PxLw6b/GiO1
	 vkTJWV3Fi2ZWzbHB4yqQOwyh1b4Fi2itADigVdOjZqT3xs6UzSrjzAM8saAmINWr+g
	 RFwmTX+H9eCaQgVLE0rFtM2lEorNgc+RQMJKfMm7s12pckYLPMJN7NOck3VCBBvaPi
	 yIjKSHkvKh7IQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3342637813FD;
	Fri,  9 Feb 2024 08:53:11 +0000 (UTC)
Message-ID: <c4bcd969-cd6f-4961-aac7-cd169da4bfeb@collabora.com>
Date: Fri, 9 Feb 2024 09:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240208215926.10085-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_005313_522596_7FFA95F3 
X-CRM114-Status: UNSURE (   7.37  )
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

Il 08/02/24 22:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Dropped "syscon" as it was incorrectly used
> 3. Adjusted nodename, "compatible" and "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


