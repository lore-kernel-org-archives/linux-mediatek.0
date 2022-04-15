Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7B7C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gI6UOf4PKAPgteUPes9YVvhORQdKZT78XXnpFnpQHQ=; b=spCivr27m7nUPl
	ABkPv3SQ522vc0+xA2lW+JDQcqUO6Mx1r2ztG1j5lYexHIj7L7fo1RkuqUNUamaLoEQHoqpqWhVgJ
	R6WAshlTsmeX05ooxDJhZREPla5xLu7Kt6IGxRxdzf9iBaHJKjdb4I+xAFC5XiXeGq7wdNvY37h9o
	+8uy8GAsIWEhvGz5NrynK/YyUQzdoQc3gEb6hx60boWZGNLfWu91Kqtport9pZ0VC2f15W92IyMlR
	Si5/QXw2y5b+ZMWw29kjQUEsaM2SokF5zLFcFZkCXnAURevAHr0TkpBMElQJJGgg65FmgrpdtKA58
	OjNg8sjfnyvuXXJrTIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL14-009x5B-H4; Fri, 15 Apr 2022 12:25:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzr-009wLg-Pc; Fri, 15 Apr 2022 12:24:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AFB501F47DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025458;
 bh=73ucGu/y9Fj2jgks6l90mU2E2Kbo6O9LHhb+jGSfg4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V91+vG3gf8C7ASUV3EFyUt6oMRQ2HlwZkXvGanr2aqYIb9/swBt4qAtm7LpvTKldX
 pHrWJDwVAYlq+uFQXGjis4beVW5nKu0E2FekXFo35ZbVa2ffk3XrXYCwYBUgPqYSGq
 6JYIscL7jDmQ6ao7Cke/OfRsTvPpwuv50j9lu8MDdHdbMYRpmtXeXG87Wjbx+GaydI
 tAyX1N4SHeZx1dMlADkDpLxR0j8t+UrHrS0oHCUuSW4C7OjyLfneFHS0rKnZXtW3k6
 nmhWbfjSEBD0oSWTFLC6yFUeqXy4T88n5p9fxoZzs6pTmQ7HxaexbYm6iYM/ckKK9e
 eXNtZeyBUSBVA==
Message-ID: <f478224a-d854-7900-6489-dd5aabdf7846@collabora.com>
Date: Fri, 15 Apr 2022 14:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 06/15] cpufreq: mediatek: Move voltage limits to
 platform data
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-7-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052420_030346_B55FA8BA 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Voltages and shifts are defined as macros originally.
> There are different requirements of these values for each MediaTek SoCs.
> Therefore, we add the platform data and move these values into it.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
