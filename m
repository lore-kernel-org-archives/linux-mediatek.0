Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4006C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF7mTJ9bHp7HZ07sGx5CbuFwTqaIx0usFrugu7lC4tA=; b=v+uBCdcgiYAdti
	rsTmZEnQwmldLzLgr0IztwYz7I1v0lDLaRwB3ob0dnTU7bnXRSnlAdNkEViO/MGZTnOdGLUhy/hec
	IYVazraNv5WXIcpa/M/o3AAwKOuBOEEwyX+jMjn7sT5A56bdcq65/n4wnNcG3VIyJnmcya0QAP94W
	3rh1lLy26mXhmQ0sNuctQg4xXK43ZXvncclpfJ2PyqydlDwbaCAUEO8Q5ETssejs8n7jE+njUO1Bi
	XBYu1bGjtesAmoV5+a9Eo1xpPv/nMA7iFkakSSkUiC/CknidmQZhzbuAmXPlaDdzk3eLI+UpIjCmp
	Gs3sYIbCc0LipSjW9muQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxUs-00E1NA-HS; Tue, 17 May 2022 13:44:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxKG-00DwXW-Pw; Tue, 17 May 2022 13:33:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 445A01F4405C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652794401;
 bh=cx1hTNJ0Ru+529Hy8oVuqWz9XxAPU7ZBoyO0Pt8qPnY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cP30jv+yJP/108pNL4W2mQ+sAYRgXswkGZm+3/iNe+X73PIRX0E8LuqN1Lzt548j1
 Jlw0Tp0c2hdO3qA+EoKnzWtq1WLnxtJWajUiBTsB+oWnN7yMpPgqj+mGdpJRRorq00
 /c/9Y9Jrvut5q1lOac7jY9Tcx5RAZ8f4bMiUO5ejqVpTuOyJWauB+h8oPHKFXbak2G
 +CWZB2RaV6oCm8ZLL/OGgP1IRPns/kuJAR9aEUhBUCO4Web8po/r3adDWi/xefeSLn
 ujGUlQrRolZl3y4vpmWT8QDhyS5LCJCi6gkxbpcDvdeNCUbwwB29PhtAtgnAcq0Sye
 esOP5a5u9UcUw==
Message-ID: <b06c93e0-5638-7a53-ccee-5c81a4ddc46b@collabora.com>
Date: Tue, 17 May 2022 15:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH -next] cpufreq: mediatek: fix error return code in
 mtk_cpu_dvfs_info_init()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Cc: rex-bc.chen@mediatek.com, jia-wei.chang@mediatek.com,
 khilman@baylibre.com, viresh.kumar@linaro.org
References: <20220517133450.2266243-1-yangyingliang@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220517133450.2266243-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_063325_082453_9C098FB8 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 17/05/22 15:34, Yang Yingliang ha scritto:
> If regulator_get_voltage() fails, it should return the error code in
> mtk_cpu_dvfs_info_init().
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
