Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D24AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPCiuedybcMb0gVPBCmqcMfLbp+P9TOh1akytGEyWLY=; b=uyvZ4LwKJD8hnH
	3DNIGYDqHD0au4Po+0GMjScIesxAchuZ5tOrgqdwXiIKNeOVaHqFtPYUO9avyWzWW6bOjZrRAIx38
	EEw7JkkR/RJz9akiNByOr7eb0y9NKk69t9ZGqbzu/5Gv1rTWk8in6Qs9zaqGrmCaAtYTL64X5z7ML
	oibzn4s+RhN3OsUt8IldjMqmIJfbfaoesqn8X1y9ASVa1aLf/lKi9dYcpRRDys66V64JGvQmMltoR
	adw0jKUM9+s8N7OGsafU0tkJ/KscmkbACRR0n6HNIEMeLTxr1mN3HwcosQHA2l4wcgS0/K2LUfKXk
	/A0p7bzaWa1oJ5P0b5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncooU-00HPO6-A7; Fri, 08 Apr 2022 13:38:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncon2-00HOMk-Oi; Fri, 08 Apr 2022 13:36:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AF90D1F471A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649424999;
 bh=mcsTuGw+kqSCbcjLj4LQCiC8TSeDD6UUMcJeBsddAOE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=VA2KDfkjEr8yx8pXPggNq5KeFFaZaf7BaqynZNYvOtJUAvixxHvqocVvPsHnrPiHg
 LkMuZl3Unqa6UT6dVS3uUvKxyJnCcY4c1z2h0wdgIBR3weAzYhTAawJa+Yyn7k7Y8e
 057zXg6ZxZLrmXdB+V5lw+sDFAk7N9jv9w/D61QSwmDG8TCtpOqlLyvdYyRwldXpgX
 2eN7ysWCfZ566OOHyFiD5MF8SVMDo7YJIVo3iYRt0/EvAOl+IIdCS0I40Ani/JNfhl
 Dxic2Ehde1YvzcoSPbcxJt0Jh4RBA/auKGShX22StvnZX6BsGFnyMrYnlPJ6ZQP2yt
 EpP4Zfw4CTpzA==
Message-ID: <68de368b-d39a-4e55-9ae9-67d6f0ac7705@collabora.com>
Date: Fri, 8 Apr 2022 15:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 03/15] cpufreq: mediatek: Cleanup variables and error
 handling in mtk_cpu_dvfs_info_init()
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-4-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063641_015679_A99F394F 
X-CRM114-Status: UNSURE (   5.36  )
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

Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> - Remove several unnecessary varaibles in mtk_cpu_dvfs_info_init().
> - Unify error message format and use dev_err_probe() if possible.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
