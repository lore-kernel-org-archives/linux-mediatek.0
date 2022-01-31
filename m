Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03380C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCGFsl2SvC3+w3V2B1RlkqPEwVmi+mtag1g4P1P0QpA=; b=rRoNwL+sNF3k1s
	7+1J8sGM/1A08Q8k8X/y0WMWcmcKpybRncnoy/Zl3ZztDeMHZZhEKeujwAWohOkAA6eJ8QWi3LOBY
	+s556XYKNZXzxvy0eKkDPHO0YMEEWkZPia6IuJibJV2SlE67uA7aWGIDhKcfC7v/wYVoXlnRxBcBA
	SaYsDz5O3oNUoOzsm/yJxWjBnAokEhZe1olwVCN/Wfy3UC3k3xv2XOXQn0X6fETbnlbRsMmvdzxmv
	UtLnm0VetyaBr41QAm6gTnyhyQ8XI/NwlrOSOG1ONfj6zYn/PJzcFb4df3CILJu7HwSFMBifGN8Ty
	E3HqHhO5Vwfe17HTgOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUAy-008vrl-A1; Mon, 31 Jan 2022 10:44:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUAm-008voD-Kr; Mon, 31 Jan 2022 10:44:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 33D791F4311D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643625875;
 bh=8kwBiHu+rozMfTRk8eG2eaRsAY8jmwscyixrLHkGQZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eyB/p5HuyuwZUaLJdj2jW28sbi2CAuEJI1owJGs6WD+nZtWScfTBwOfCDsm2fAvw0
 PF2MUfVbHJTahO+mbSluTxWNCDCo59mFfBlJQiue7n85pXSPlWhgQCLMD0TY3zIQcY
 THkKQNVdBRgsPj77qZhcWMTCn/jCpOtjCUulRpV5Qm1V/eE7fVz6nDyzK2WqoWrP/0
 Oj8s8cFTTOybXRYS/CLNDbW+JtUGyZk3qBMQqaV+k8LySI2mWUKJdfu42tHsZPIEkG
 2KxhGlGmXOS+4GEJ5HIh82h62L3l9zsBiPzGAulvuPRnSZLXAlKr1/TzrpibxjjFb6
 phEgAtFz7ZApg==
Message-ID: <98696462-3648-24f7-6034-7864a3793ce4@collabora.com>
Date: Mon, 31 Jan 2022 11:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v22 4/7] soc: mediatek: SVS: add monitor mode
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
 <20220127033956.24585-5-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220127033956.24585-5-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_024436_845669_DDC5378E 
X-CRM114-Status: UNSURE (   6.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 27/01/22 04:39, Roger Lu ha scritto:
> SVS monitor mode is based on different thermal temperature
> to provide suitable SVS bank voltages.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
