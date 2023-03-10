Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD67C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCdRibI4eKxug6N9XvMuRBA2LYRX8EaV0GxChygtro8=; b=AtKvgT3eTdvgMm4yjYrwEpqXMs
	jE3BpFUBpkQFnJweNLZNFQG6bN4cTtwtKIpZV60SCMZJfwSy/AkTKV0gGgS++TrHqhH6yJ5/SzZHe
	Wrwi5ClnhFtuPahA3rdC5VRuRJCVR3xSfqgctCsK3ZL0g8+u7F86Zu6v+0DhAOQAqcgxcp1pNPHZt
	4+SlwnANkxecBNMgrqsQYQPyRSuVmLtfbXkQLmX+v+f4VDFAM2YiWV41lPCk17hyelvLKncnPQH7M
	3jRVrwO1asqDuBVuNphgrTqzaiuQ/O1wOALl0CpoeeztG1fsO2DRlFQ+PdIl3AHi26K66pbzn+df4
	67OaNsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxR-00DseR-VF; Fri, 10 Mar 2023 09:22:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxK-00DsYn-At
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 09:22:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86DD7660305A;
	Fri, 10 Mar 2023 09:22:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678440146;
	bh=lrUTsUQ1bGCKU2xjx3ibtjUOoaBH8yYte1h4Ese0+o0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjJ1bY5Rcn3B1NFnomFraoDbrnO/vXImycmr4kfkFyhH1RncnfVhqWsqB0K+4oKF3
	 gZNIQcyHUkLw5nnE4yXeuXHnxWy+JT2j8b+IExQHskAHOy6giHm3dWZy4LhpqKZdkd
	 CKzM0lFRYPRFXmr0OuvKc6Tnq55TgVndOEtnHTjG4qURa0IKaCSF0lMZD9aEFsW/qA
	 POgbzHFFL74OOG8ji6Z0Dx8FsbsYTio4cwRXs9d7R5nfxq6CDR/1UM643GIYZLHUX+
	 5Jih0jINQJv2BQxLwMctMFTic/Rcr+cTBZ6xri6lsx0J9djAtWCBRHt4cuEna3XJcF
	 PkFoNxeRGCQXQ==
Message-ID: <310be4d9-57b2-8a74-8c21-54b258936bcb@collabora.com>
Date: Fri, 10 Mar 2023 10:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/3] drm/mediatek: Enable AR30 and BA30 overlays on
 MT8195
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 daniel@ffwll.ch, daniel@fooishbar.org
References: <20230309210416.1167020-1-greenjustin@chromium.org>
 <20230309210416.1167020-4-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210416.1167020-4-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_012230_631526_CD9B8B78 
X-CRM114-Status: UNSURE (   8.17  )
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

Il 09/03/23 22:04, Justin Green ha scritto:
> Modify the overlay driver data for MT8195 to enable bit depth control and
> enable support for AR30 and BA30 framebuffer formats. This patch in
> combination with the previous two patches in the series will allow MT8195
> devices to scanout AR30 and BA30 framebuffers.
> 
> Tested using "modetest -P" on an MT8195 device. The test pattern displays
> correctly for both AR30 and BA30 formats.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



