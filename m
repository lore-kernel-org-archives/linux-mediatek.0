Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C22EC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEa60NHeXvskySeV7DtL6K9TgP4xK66HPrzVUsN3rPU=; b=RcDX+53Eoh91NBulKgxh0pDmhq
	TwlqEqDSXVxxKkSIyS1wDid8lTCsvXguCDKMDR6ZM3cspxoE5jGi0jivLIPhDWFq9z2HUYqs4/ctH
	S/Gyjx0uxjAC5pw6tNWO5en5CpEhGhIInh1dg2AY/p9AGi+sD+RIvhDqRCfoybF+ygjD+FYz2iPAm
	opxwEY6qwRTGCckyndhes5oY9BUZh6R3tbfDkxtRyr4xcWYWfKMpOSG7VOMXkJq9RFyjoxqxN7WjF
	AXkp5bd3T2UX7GxTkpJti74941U0ezTtFa7q1ETnEe9IQStLL7Rb2LSXbLf61wvqi0hlJX6EzBeTp
	ZrYfOyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obH2k-00DyKP-0q; Thu, 22 Sep 2022 07:54:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obH2Z-00DyHJ-2x; Thu, 22 Sep 2022 07:54:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 58F346602047;
	Thu, 22 Sep 2022 08:54:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663833273;
	bh=vzBoo+BDHqv1ompRIGMzCZyj3Bp/VrrSbEkMBtsWZ70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QNYZcI1v2qBpuIORsyI3eJYR434HyCM9M1XhhOtmcjEwZJpp5NjvDUUdty/nwt6mU
	 RQ9cU/luRd5HBspeWOyykanScv+RhwuP8C2TeMqfrOVfuSwOWhKb6xbJfc/aUjms+c
	 6ASGz+zmVpOXnpq0YOvOSOLAr+NDp+VKpTRItRewdtlMjQx/4Ecsmw4sVhEn9A5du+
	 lWujgholLtWEMyyrQRtx/OFED468W+9paGv1IqcMJtjjiwJQcNMMze4zTMcAw19H50
	 72F/neB2p1YW46LQ/CIt7u/6DCoM6v4GYAXoNjHGGcVCuPNwoOTYO3N5896xUCFJ7t
	 OI74fTpOUnJuA==
Message-ID: <449c88db-9da1-d7c4-520c-37730bbc04b7@collabora.com>
Date: Thu, 22 Sep 2022 09:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7,3/3] drm: mediatek: Add mt8186 dpi compatible to
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <1663831764-18169-1-git-send-email-xinlei.lee@mediatek.com>
 <1663831764-18169-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663831764-18169-4-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_005435_285448_10FE1148 
X-CRM114-Status: UNSURE (   7.45  )
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

Il 22/09/22 09:29, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use edge_cfg_in_mmsys in mt8186.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Please fix the commit title.

drm: mediatek: Add mt8186 dpi compatibles and platform data

