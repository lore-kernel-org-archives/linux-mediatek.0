Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C6EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP3OCsh+GKQb41EQTRK5qGvwd0seXwl5+6VElxkWS0I=; b=gM8avfyDcf0H5/
	s7o6CjX8gmG0CO5kt+0tbLEjAx5a8KERgZ0sAjbIkVMng0Xc1s/VFvWoxcy7h0Y/+Z7P2TN+Fj84p
	m9McrW17XF7Uf3E2SQCtI4YU0Loq4ywdE1MRAoMJkarf5KxmTNO3PwpxBgFB79lb35bVNCN/ELXSU
	8LloiziJdz13lYT1ZUl/ta+2FgI030WmDmE2s7Y0FqkUcHI/sUru6FNnLM1ZQb0xyXEgtj2d73q7j
	lB8bCD4elWRR56b8MRtqWEa/yMvEy/N31+fH9yPuhQjOvsktl0ye+UIXsU/JevJOmye2pl7VBOBjD
	N0KrG2lZXVDb22ZxAR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpqK-007fiz-Uv; Mon, 11 Apr 2022 08:56:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpq5-007fdL-AH; Mon, 11 Apr 2022 08:56:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 89C741F42DB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649667356;
 bh=6eM5QaDtwIp81r/ywmhqNWM0S8ebBuPxIDRHQ0pR/n0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l83H0X/KHAtu0rwTlcbBW8wYWAVHPqo+kmkE4Q5qUSDrFD66vNkwLzl4ftYvooe+P
 Y21W0NK4vsVl9jetFQDoSUSIpvkAlY8YGMnCGnjaWSQTeDt5CcuCR7clPb+maI/NZR
 Swx2eQO2mprdEIWy5T3xXDwLgr2qlKXXJ8MOpUx9zcCHXG6cGkFlXI4IyVs8wvHE7Z
 1yv+DyaZcAAzzJItButc02SQ4NWOKoSBNxqmXo8kbKsiDLEWlFIOtSo0IEgV9yEhvQ
 0ZSy9rRYK1CjjeMjF/fA7IgnuY2z1Jsp29xFr0EUThJvh/BRn8xuXf4a53ioeMRDTS
 9/ocGOf2lI1hw==
Message-ID: <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
Date: Mon, 11 Apr 2022 10:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015601_615462_AC7565A6 
X-CRM114-Status: UNSURE (   7.31  )
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

Il 09/04/22 08:27, Christophe JAILLET ha scritto:
> 'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
> to free it explicitly in the remove function.
> 
> Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
