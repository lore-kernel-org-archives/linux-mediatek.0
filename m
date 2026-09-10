Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7296C88E42
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA+HQ5cVuGnAsNwITlBP5v8yxV3h58RQ0N9LcuQH/WQ=; b=D70FnUj+ozArDXjF3sSlamFXLF
	9opFxJ1E8F5qITwo8ddyx9/1QToFVx6iYJIEWsSSwywIEVzxClFeqhBrYO86sf4ozxop8FAzuD5F/
	SOs/o41UjU2NTnT0AedTWYky//Jk9iByEe03WyB4WEvkSRemYqxmqsOJ3Jfstztp3g8su1IrxdY05
	iShvhmqo8HDqM08q+Jcooo5mTeNl0Jitn29H2O5em5uFE5WYs5lLzugfHixy6Rh22AW2nMGqT0ujp
	no3jSOkaT1kYPkT0L8cJ6S8l0bj7IrWTDAtWZU7h7+jIa4R8MD+wyu5nqxkxc8UbIYiVT78ukZ/VI
	ysuOc3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6w-0000000DtJW-3C4Q;
	Thu, 10 Sep 2026 09:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6p-0000000DtFq-35vY;
	Thu, 10 Sep 2026 09:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RA+HQ5cVuGnAsNwITlBP5v8yxV3h58RQ0N9LcuQH/WQ=; b=LwSgYSLv76LaOVDivk62q10wRA
	neuiOCYyxJw9+VgUTjVPJhZWyIId73C+fP5ZHxJq+c5D7xumeUhKMm1IYS1/cRKDX/T2vplN+XR16
	HFW/tZ11JZSNyi/yQQc42UTg3xDroUCvaz/wRrAnFm23/WOJ+dqUwwWjkRorUxNp4Kjg2Zu6Kn/Ci
	XqJYrJqEavyG2MdWZkcZ4CFJe3js7SNVTOysSMKq8FD9J2vRTbAOEgSc1Y8hy6XPbpnev19fHCHeF
	a8HF/jusKxI6TWvLJkOBvnD/9VObH7ZUISPezDMAszbia0FcXOp+r+uD6yqB8qog5o9ZRwI4+IrS0
	9Y+tRr3A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4b6m-00000002GSb-44fY;
	Thu, 10 Sep 2026 09:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032615;
	bh=MR7cV9v/+BXaRRCe2zaoNuFnkVlS9yo4lu21g6pm574=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XoYegSwi4OMl9NFkCFe5E/9YntLWhyOUWpYNfFRulHj/RTYCJNAwjrD5vWy47YlQW
	 mLfCcHE1g6+0K1zSNY6EUvY4OZYOpKpT6uDSzB7+7ot/8B/O9woVRQkys1lFVqdDEW
	 mN+Jiie7yayhCmco1qVbw7LAiWDuEP47jt8pt7Hp+W5iyuis+66EX8HZtdfNjS7TRQ
	 My1JywDzlVr6x72UDWgkbYH5021FSwSUXIL4HynLLIktofPiQz+2yPDoxIaOHOedmk
	 AABC3XfUQQB3qScCuBuExqL7QMru1c94UkStEQOaIz/+t7IHkzC3uIcGbe7ms2Zwxr
	 tTThbWTCV6tZQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0059317E0945;
	Thu, 10 Sep 2026 11:30:14 +0200 (CEST)
Message-ID: <69c41994-e021-4542-9633-6a9e5e55593b@collabora.com>
Date: Thu, 10 Sep 2026 11:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: watchdog: mediatek: Add MT8127
To: zkh@mailbox.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, zkh1@proton.me,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_103017_123192_226A130D 
X-CRM114-Status: UNSURE (   6.55  )
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

On 9/9/26 21:38, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


