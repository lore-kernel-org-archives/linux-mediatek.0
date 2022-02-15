Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A07C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4UuV6s6xRYMTFJKa88sNgP5/mK0cfRTXj4umZuDTWM=; b=QcFOsgtoXlRX1Q
	kA6+LFMrztOcmlgNQpNDUDKEvC4Eka0iMMn7gaaZVc9sP1J5lDJ8vWURrsVWit92y8ShPHqHYXGrh
	0AgQtw9ClH7vF4c2BuC1fFl+F8wpdOnAn14x42pP23TmxQmsYUi/lyWDcPMzaGeIGMf4FfOJTWajC
	4OD7pGp/Zhg976tPqvn/0VbwHlYIk70Q9B1TbHKKgD8m2NDiYVehVtkYcbbIpZE82B/4RgDw86Fpr
	dCEaPo68/y0up0hs/+PMMa3q9zemHhiucauWMotjQ/5syU1XrXLPqsHxVhhxNG5bcLcQ5wqQN9IA7
	R+Rveb0aLgu9Hmd3wAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuKx-0024fu-J0; Tue, 15 Feb 2022 09:41:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuKt-0024d9-QT
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 09:41:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 399F71F424E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644918083;
 bh=yq8iJBJC4x3GV++oabST32A8rclogMDfHMgxC/dI6Yk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bJPM+pbQ2xVrL8VVd8LmIbEPyp0Lpi/YQCkn68h72V1EcuKipsmZsB+E4h2GLgPnR
 F1pnpIK5gYzRDOsVv8RUB8tC7BdroPQ0Hlro8BdXYxX4KjHnq3V06s+D51yp09xsCU
 vXR4BUZKXCojHE8TUc+w2nXHJRE1ku174kHK6TMkBgONYMuZW0GF1z0AKBUNZzs7mg
 NrlEMtfjzC2prSETr+0GKJtYOJ6tiPCk8tR+84W/nem1LRGuAILxr4V7L65ecbiaHE
 mMLIhUi9o4X7hog9f5OWjIqQKZ7B5m06IHyZIFWA1Z9HME2mjt6Ilkpu0dPLQuyCe/
 S2W2AEDvnf7Lg==
Message-ID: <15a24b12-e296-9d4e-211f-55553ac8f7da@collabora.com>
Date: Tue, 15 Feb 2022 10:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Content-Language: en-US
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
 dafna3@gmail.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hverkuil@xs4all.nl
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_014128_037227_016F2764 
X-CRM114-Status: GOOD (  11.92  )
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

Il 20/09/21 19:04, Dafna Hirschfeld ha scritto:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensures the copy of a multiple of 8 size by calling
> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I acknowledge that this patch is getting very old and stale, but after some
testing on MT8173, we were able to verify that it is essential for MediaTek MDP
functionality, along with some other patches.

Without this one, it won't work.

Keeping this in mind, I would propose to get this one picked before it gets
completely stale and requiring a rewrite.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
