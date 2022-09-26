Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA820C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrDNk+PBen0ziAz+bxagvtYVgbyKCb+DZ3LEyeDnhAw=; b=wUPz54hXqvk9sj/Tcx+LzsO4/O
	+fkLnfgLB0KnwOYdQUsP0WRVAGIrlk8AYfBddQhHvczMupGzKrGrOJQxl0zweEmZpue3wenhQCKQ1
	dn7xAQTI2XIeWyb3scCJBokngzl4fHp9j6NRD3b4cVqDah2/hyuGWbe8hcz2d2HB6Ulqj1bfGZtI4
	O0RWxIh8rdXovP7+GQ+NM1XI5oeywEkVpetKNblXnMay3jbbMgdWCjWU6oGi5wcqZatZ24ObN+bhh
	kXPX+AvWiUIlrgij77DPQdQFoaoGPIttKDV96SeD/KmVnRLug3RnB5HxrGwtN3xO0ZJLyBFlbPExZ
	lJzB6A7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock0M-003Q4b-Tf; Mon, 26 Sep 2022 09:02:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock06-003Pwt-9p; Mon, 26 Sep 2022 09:02:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A5BD6602250;
	Mon, 26 Sep 2022 10:02:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664182924;
	bh=O7yTnbCSwacpaQ7u5yBgx5B/jmbp1mTfJETSiq+UOYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATTN9DAsyeHNWcZnAVzis6nDAa02EMavwqvugwQL+yZVmbWzTvxZJwWLJVPkUi7B9
	 HT81YB0fUYlbhWhi1gMeYYBXA6wT6U154/FzXaqTKgRxPg9HwPOZ8a2yFPFRIj84O5
	 JMryFlUHa5tXN1j1WAKR2Q/lesgQlNhrgZHB5lHx8HM0ozsKS+YUqjbl0PqyM3pcNr
	 1HvqYx1f91T/nZRBXh0K6nzCQgt1E/anQibrn1Cf2pC8NSmjOOz1Xu1djdtTr9Mc9N
	 4+j2mIcuDggl8g3OV9bF7PvepZ0XwAW6tmbfHugyB+oogNo/Y8Mz6YNqKYt+KUMDY3
	 BidlPkPi9PtUw==
Message-ID: <11a141b8-510f-57cb-01aa-6508e58fa5ef@collabora.com>
Date: Mon, 26 Sep 2022 11:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10,2/3] drm: mediatek: Adjust the dpi output format to
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <1663927104-15506-1-git-send-email-xinlei.lee@mediatek.com>
 <1663927104-15506-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663927104-15506-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_020206_512547_44905E60 
X-CRM114-Status: UNSURE (   6.55  )
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

Il 23/09/22 11:58, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



