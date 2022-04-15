Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F22C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmqhhLin9Xg9w5VYfScs9QU/UAWGppu7uTNNJUf1g7w=; b=p3L1B0wIZbdWIt
	SSPjxtsl8EWK3H+nbcVTJkka6xwTRd7tQNLesEbbBxl604puix9jQTfj7fmr0k20LOaU4IBpwIBtC
	vxVihhrUISrdZUtd4n5ehFbpemSp724VsGNxus+5lxl4sOsfy/8VNPEA77X/J7Y1NGj8nEYfChGsl
	Mve3LmGI4kuz+MsoZPJvmojUcOeyzy0avTRhydB1JMqovVc9SDPlsZtI/8pq75ZtMpA4ZEGLXgRfl
	ZY7oWQwNzAdcsS20iay/eFY5pSb9pGjOtygihaSmyslp9OHT7m/pE3j6ZfMEoR2FjplKa64eHWHze
	o42KtpFyLQ4SvhVhDocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfKzw-009wNZ-Nx; Fri, 15 Apr 2022 12:24:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKza-009wGW-Cc; Fri, 15 Apr 2022 12:24:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B2CBA1F47DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025438;
 bh=aNUKZRqzWwuRZBD1tLkU4cEBLexGxURzllQ3UN6Q9gA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qieib9C620ulPkn9RIaxxXXGF49cv69L6yVDjRiQpNHO4tQoF75xKxpM/bxv+MRdc
 AS+5mudJXju3cjkfN/EgKVXP7MMgbwvygGE+4uIc48d4+0+rOduZWFULRjV+vC4QAk
 zNRua3AIQ9E4O8LqCegItEtEzEeF2uU+qPfKhAP+FmPDrmP/g7vhAHMkdUgNlxNfGF
 lLwfMpdUPgWCUPEPW2Q6Cn3PebgSYyvoxQjpNQUs45qNSDYXa89HWJEGjYCWHtnnUw
 Evijst0eiTLPiCtC0Kl4kamg/j53uARs+e2baQIRwjK/Mik3W8Rfp0cSUt0wU9rSqm
 CGEux1jTi4eUg==
Message-ID: <04718ddd-424f-72bb-3fa8-df23b996c022@collabora.com>
Date: Fri, 15 Apr 2022 14:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 14/15] arm64: dts: mediatek: Add MediaTek CCI node for
 MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-15-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-15-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052402_690258_F885AD18 
X-CRM114-Status: UNSURE (   6.17  )
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
> Add MediaTek CCI devfreq node for MT8183.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
