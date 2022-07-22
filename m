Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90435C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxCLqvmkn824vefY0GRiYJkOCWMSW28cIGQZ4S2q3m4=; b=U/g9BB5df/P+ysnkDfz4wJdelQ
	lFkTr8bKG4oJDkbAcJ7RQdYlEDEeOnScLt0oYGo+8e+a8GibPaDqFbLhVZwZdO+kZpavc8uHf3Cq6
	no+tQX8jXuQjowZVWWYc2B/6DJSRwXBmd2e3DGey/q4E9tpIKKjCAahEvI1bJUkD/Qfz9W9DNYJXu
	p9iKA+loIFu1epgumarDY5wGEvtMOomKH0O0nXEmG6yxLWSb/W/AUvJBR87o0PRo2sNVfBZ1JL6Fh
	B2ORk1eRdL26xi4gQ1acEeor/bsimog56NR50OQz0G2JGwqiUYVtu0lyqtlJ9Z+veLUotA+FQLBBx
	X4HeneJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnQS-000keN-2F; Fri, 22 Jul 2022 07:50:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnQ7-000kVK-PU; Fri, 22 Jul 2022 07:50:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 971036601AC2;
	Fri, 22 Jul 2022 08:49:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658476196;
	bh=L0C5dvEr/RkYRGnpjcljVrAKsJa3g8/PO5veSu0LgNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npgRR9VVKtAfsBvI39YOQFCKFmAoEa5/NyacF/k5U/StwMGORpZaGpal84zS+F1sV
	 yciKKW292eWKgZJPCgeDU6ocDXrY2eRo+BYDjI0+mvxbZC0vxmLg8Jlzc/FmDNC8IB
	 K3pNbWcNm35ITOPd2rHObb/WX2etWWGSJLfTEYxM98s9XWF2tv5TAad3tY6aM+uLU5
	 VBzuzQgAT22fsj0b+g3GrBDIAeKOLlgV0XSNpMJyF/H7NAJ9ETHKLWrlwrtFpgIryH
	 heVF5DT115pxw984dgDXyVQfosgPHKqDv2x/rz4GEqnb0lw0rSwrXtnul70jGd/AVu
	 4Cm5ufXrGE7zw==
Message-ID: <61229d99-d64f-163a-b385-f7f9e4fef0cb@collabora.com>
Date: Fri, 22 Jul 2022 09:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [3/3] watchdog: mediatek: mt8188: add wdt support
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220722072316.582-1-Runyang.Chen@mediatek.com>
 <20220722072316.582-4-Runyang.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220722072316.582-4-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_004959_987423_F8D6D353 
X-CRM114-Status: UNSURE (   7.11  )
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

Il 22/07/22 09:23, Runyang Chen ha scritto:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Support MT8188 watchdog device.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


