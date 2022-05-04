Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3QrGrjmBotUl/LmcE56JD+Nr/ZHrd+znzWFCz4XKPs=; b=j8dRx6vHTU0Iyl
	e+T2l0YBAVMNl0SUfLC6qxKfktseHoPqLdVxUQ+ppx+d+PgXH6DBgjWkKe5wun5Z/ZW/bCAmphMIJ
	E1ru1/aMcHPu29EQ+NQyaGc6yjTfT6RScMkeB95wRETwNKvrngUoxMpqK3SNdMmv7PjtkuoDykJTL
	8XMKxPUB2xI2+coMlzwAJqTndnNPdb8a609OpVTEvbjV6nmJ16VXDC852fig4ZbqkrCYCHiLf0eNa
	xwlc1jRMK1aWRR7hwa22DhRampQKlwjCYJbXSgLgnmatjCXWX/qvP88u4RxS5wObaYYE4OjxFwvDh
	7Yz7VYvPeAv8qsjr3e+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBgq-00A4VH-Jy; Wed, 04 May 2022 09:53:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBRD-009wAm-7C; Wed, 04 May 2022 09:36:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1B0EB1F44761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651657009;
 bh=7vMV83riab//ztpkWA1Ve1xv8JZ97Ulw/BxrBxOF+0A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bC9csRZGUw2FlsRfuX8zn7yt63zBFyHioHxzNj7l9WXIaPE9d4bzp2oVI44+enkKB
 9Y2GFiqtBuUApLk0WmANFpZB+oK8eXuXoUkMv1KoyVsZRaelXDc1YERglB8x8nk9Ya
 l3nm+8ejSfZdcfBQHcXpe0ISHb/hmvfDmjU7CBcmQGKViSCkyFp2mFSOECPHctmJfU
 2Zqckg2hxX5UBBjSXOD0HCnA5TG77QjFvGLlw29kmYBV2aBWifiF2dKaMzzVW0Bsv5
 FYc8EgKX5lcxoa0KPTiCgG4KdXs0S9gE63klnWO4fP4UKfvV832msTCeWqNEH7PQ/Y
 GG+bwiE6Z4mRA==
Message-ID: <276ef83c-c824-3874-c36e-4d422794d7dc@collabora.com>
Date: Wed, 4 May 2022 11:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: devapc: Add bindings for
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: neal.liu@mediatek.com, runyang.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220429065429.7957-1-rex-bc.chen@mediatek.com>
 <20220429065429.7957-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429065429.7957-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_023651_476185_2A01223F 
X-CRM114-Status: UNSURE (   6.78  )
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

Il 29/04/22 08:54, Rex-BC Chen ha scritto:
> Add the dt-binding to support MT8186 devapc.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
