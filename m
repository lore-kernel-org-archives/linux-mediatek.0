Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axxgM1ZCxddubOQK6Oci7BHUGR/d+QQ04gxl7mhEmnU=; b=r7RCWCFIxZFX0j
	g5ct5FxH7KFBRe81miKKWSMZ+IJaQUnEZ1El2+fTfG+bHVFls+H0n8QmFhqcU0WV7qR+EgHYvlm92
	cxXTmGR1JpXVMkcIClIgsa4S0QbKHJaSQC6ESYTaSpdc4LEna7BciE/oZ9XlnPHhgCEUyYYd8FoLs
	zTnNxizhwvylCdrK3BcxcQbel8ULWHzw1v4+03ybiY0VRpMgj32szVbbqWpx+FbWDGnjN78FjjuOL
	I2S49KXru8SM6mPsiQdif0c3vue2JycUjlPgpNgel0an8g/5nxGYu/lvotYff+95lym/PfYgg27zl
	9EafnAZBvXnbquHxVIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL2D-009y1t-VY; Fri, 15 Apr 2022 12:26:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzy-009wNx-Ik; Fri, 15 Apr 2022 12:24:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9831E1F47DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025465;
 bh=s4Bfc3vrcD2T0WYxJ76SNhqPUBIGNz+PJdoRpaLN6Tg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n82Q0K8Vf+iYCTg4GG0i5JptP4VtesIC57w2/j7ZQqoLHpD1u4FguecjW19Vpw4+9
 t6DBL/zuNYy2th5Wvn9rSoGlnYyYPiNBiIT5PjBMzGOS/8fQLM0uWC8QYhLefNASks
 xJcOcoLd3lilAtzqm6daKPxsiMp8bYjHlrrMvRsAimLaT0x4E7HvDrNPRH0tH3ny74
 fTot0wRCmenB8FkEgr+DNDE0uInNIEH4fQNNwFzpBLXl6juviap7AKy+Gz0NoOdKfa
 k6yean7cowUataqk3I7BpM+LkNF4HNVK/NSKsn/qq3Tkvo7DQO6Atmq42niAO+Zqui
 3WrpxB0is0VVA==
Message-ID: <e2d137df-c7e2-fd09-c40a-7d4a31789b40@collabora.com>
Date: Fri, 15 Apr 2022 14:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 03/15] cpufreq: mediatek: Replace old_* with pre_*
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
 <20220415055916.28350-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052426_779609_46CE0718 
X-CRM114-Status: UNSURE (   5.29  )
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
> To make driver more readable, replace old_* with pre_*.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
