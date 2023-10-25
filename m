Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A65DC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTaL6HJh/KcNARwsOX7O8uVlMjxZTa3ShYLlPA/+9M4=; b=1IB/iLr7b0Szwf
	VVfByZ8p3+3ItL2Ci2Jm26UrmEjKr1iV8CFyQ5hLkJlT+VSxTko5z5qr3EQUSAkpWbSUVthjgnN9/
	6SJwjJ5I89u90zQsGwRn2oY0gbziIswdTbgrlue8ehoSfuWo46fJhd9SIgT1LE/KJ+JXRZpCkIwRL
	VxCklA++t0O68FosU7SCvokJ3qiWLplpoHUyoP222HYq+m8JRA6tBs0yoduPcQ4d02c+Wa4ypWWCq
	wbWfZeBh0X4Tzxod0JobQFhYxXkOQTY8s5ZjVlsrZWcqn8o0YA5Pdz1T1WxXYa1atgoDTm61eGHlR
	H26mvUH8nUbI+kTYZ4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd0A-00CJ1N-0o;
	Wed, 25 Oct 2023 12:28:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd05-00CJ0X-33;
	Wed, 25 Oct 2023 12:28:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E21C866057B6;
	Wed, 25 Oct 2023 13:28:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698236919;
	bh=gPu5UO/dDesJd0vNYgX/o5DUmSc+x9DabufbUTnvVmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CF0u5Kr3b4aMruI4Jj65mOHt0c5Z+sjObOUfXD6Bx7L960gfSfMrnb1jqYbDVRZ1T
	 DwpfN9UWTZKZYzUhWKumxgPO2eKzc6uSTyl67mp73gdr7gSdpqyExUOq0zCWsh/pYq
	 nsPNrq44kXf0jv8+8RARtOyBEekB8dOSH3/4OPuxtbpLgHWh9E5QJJQNinutndWPuR
	 d3OtIR0ZUd6MeKjvB0qyzpttCzGx5P63NRgUpDGecKKZLN4VCNndoLbhe3/GJQkwNw
	 NnBtueWHL9UpYfNvEO4RZOCDfT6aAID6V04LWOHsrkwQ5AJaK6m901lLSLa1Ff7IK6
	 UemZ1pfRxwE+w==
Message-ID: <9dbcc12a-1729-43bb-88f3-c3d8b71acd94@collabora.com>
Date: Wed, 25 Oct 2023 14:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: dts: mt7986: define 3W max power to both
 SFP on BPI-R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230820153135.42588-1-linux@fw-web.de>
 <20230820153135.42588-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230820153135.42588-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_052842_134380_BF71C90E 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/08/23 17:31, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> All SFP power supplies are connected to the system VDD33 which is 3v3/8A.
> Set 3A per SFP slot to allow SFPs work which need more power than the
> default 1W.
> 
> Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



