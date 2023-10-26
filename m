Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B519C25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+0Mr4Qw2FfbSng3Rkv4tw9nwtQ4ir/GVU/Frkaz6kk=; b=kq+kVI0SbU8ECBN7W07ctrBCuE
	g8ObwaiH57NxN0EU5TXYuusxocCwCMTfGufZmeHZTTzedOEm0ovv+WSiX8X5ckx01xU9zc+gKqgkW
	6t/MZUzUEIfVtYACfvQfW/5L28G+rXJG5Wh0MMWShikyAtjfdrsV8gdGEeccY8b+YhT/23cWKkhX8
	GEfoMUph6cm+4YkqNzvfp51i1iHxZbfWoD8fI+/HlJ9O8c1QYoRy6G2LqVkdVA8vCSFMTCu4Br7FV
	KzsGF5PO7VFN+8WN7HtbiDqzAzkDoMhGdeT7iatDO8CatDExHAfKAF07ReZCf9YuqFvePmAFOO4Zs
	04d+ckPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvw6b-00E0KF-21;
	Thu, 26 Oct 2023 08:52:41 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvw6T-00E0I5-21;
	Thu, 26 Oct 2023 08:52:34 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39Q7N5xj015496;
	Thu, 26 Oct 2023 03:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=u+0Mr4Qw2FfbSng
	3Rkv4tw9nwtQ4ir/GVU/Frkaz6kk=; b=C/PPWzDJqmE92NTm04Jfr68s6TJRYTy
	YHMnxp28/UPUlk2ji80fmVPNSxZ1HFyP7sad0xrWK4JmfP51TS9lI27sC4twteN1
	hxUMdmOs09i2KdstRHuMNRPQZOeFmtK2dfNtqyhZTNcMluWk/B3l8qjSyOe1QJ8l
	mbsVYCi3yuurMV+iePnRO15hxeero3BchpmBcL20G/nR60Qy62bZqdAgOqM9mS/F
	TdzlgdwfvGdi0c3H4NIM5LL+z3wcwZ0cGGWgwjCAbvRp0ESrIKWSi6k343ZpEsOQ
	ktyAlBSLg82nJw7HSZLb4iSrJlrJZaGYfwu4qREfzljYTOVKgc8O/2A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tvc1x8k3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 03:52:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 09:52:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 09:52:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 561632A1;
	Thu, 26 Oct 2023 08:52:17 +0000 (UTC)
Date: Thu, 26 Oct 2023 08:52:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Lars-Peter
 Clausen" <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [RFT PATCH 10/17] ASoC: codecs: wm8994: Handle component name
 prefix
Message-ID: <20231026085217.GZ103419@ediswmail.ad.cirrus.com>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Liu2MMO-3sh9BD2L_f1gB2kiZaetIdZS
X-Proofpoint-ORIG-GUID: Liu2MMO-3sh9BD2L_f1gB2kiZaetIdZS
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_015233_668143_E36A955D 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, Oct 23, 2023 at 11:54:21AM +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

