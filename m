Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D606C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFaH8jeILa1siq5JxisItBv/JYtEeQmyVzVFX1Vw9e4=; b=DqHV/DPeTJDjvr
	bzurkRfhUeXUAIxl+nw/OQWvmHYpiRanxtv81xj2iL6WLAb8RfQDqvkVSZxNndKzv+eFSXoBndAoy
	zOpViwzHTYAYOWpt06NSOOVcJj2T1Olio3c7S+3T40MVh2wbMiSF3E1REDK6sPHAj+x0RiZsb5fle
	bDpS6pHsLKPiqigSmIdKwxX2Q7TVw69/mSkIiB7y0WGNn2s2ncml6bABL3k8TUm3H+uJ5yoIosGlA
	cnp8X/IRbRS76vFq5E+4Kt9W3jH8pZsg2o1rVcftG0u8NdoUGDUR9zxalYqvZBc4SMjSN+Gi489TF
	mXFJlR26QdW4ACfpvKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncose-00HRfy-LV; Fri, 08 Apr 2022 13:42:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconT-00HOgn-Ez; Fri, 08 Apr 2022 13:37:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3DEA71F471A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425026;
 bh=FGjuCWGQ9jUthcWsjwUcuDe1wUQb4jK/2mMR918IOWk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=gygc5Hyaix9uFuueIfXkfNoZ+isEvBff0k3gF/8MVaMiw/BGfQ9rX0Yo6nelONr+e
 o6AvqkNfuEuGN2+eaBCCVvtkxyBHY9cFOjwyp7yw9mSxBiCFZwC1cKbfITHQ75f9y/
 NUiYXJ9cMoNQhgZ8dPvGkotspoDIC4OmA/oDWO9pqQMeX32QL2+VntSrv3vNgFiL3i
 k8KyMa+1Ezu1pSkDa863VXrl5p4d3eFjNKV1pHWAHyneSDYgKDGS/hNGePdlAOC/1H
 vonMk+y7w5wTZ8PqBKDmdXaoYAu7WSgwB8RJR5sNC1jBhJlA4WujUscJqA+KI02wIl
 phcGPUHWrPkOw==
Message-ID: <5f788a8f-7092-19ca-8499-d3626c4a386d@collabora.com>
Date: Fri, 8 Apr 2022 15:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 12/15] cpufreq: mediatek: Use maximum voltage in init
 stage
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-13-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063707_865027_5D1D12AB 
X-CRM114-Status: UNSURE (   7.26  )
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

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Two or more clients may use the same regulator, and it could cause the
> issue of high-freqeuncy-low-voltage.
> To prevent this, we use maximum voltage in mtk_cpu_dvfs_info_init().
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Is this happening for proc-supply (proc_reg)?
...because it looks like it is, so you should send this commit separately
and with an appropriate Fixes: tag.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
