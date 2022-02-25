Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJtoncUnCY/RwanZeY3YoML9Kl7E9jWChe7gEwTnMAM=; b=C/SmnXW+zWL0tV
	oT0HMijhk7Q/npE5+NMEzAxh0N8Xvdjdn11XbzIyWToPYRdS+kdJnZF1X+pyyuvgJNl/nBv7FyuPy
	Jcp3b4HFXzRWTJ3Ef8x/yrpjQUrP3tK5rR2AhVG28rtygC08qBxGYti1qaNbSpkWeN5UWlwDFiLAh
	ID7i/EFlC+Zmav7l6z+gN5J4KXjzJcQjquu39Grjp9UfqEGn1fFYroOgK6jAsA1jL0m7utlY69Mc/
	//181GXe52OR4fXiV3ldNnxYF6h8pvttTLu+yTzBszPQQyj6mPv5uPoxhSpLkBK77d9G6sYPF9fX5
	kwhW557ed/iKpJKXl3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWqN-0048sx-Sf; Fri, 25 Feb 2022 09:24:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWpX-0048Vq-0h; Fri, 25 Feb 2022 09:24:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B946F1F45AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781041;
 bh=9dKGsZm/HS8cwWk9puFZXvMkfTgYG8TOAGRHzWQr4sE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=eQ7wEDmUulTkYY0E+lt4sz4qcx1EJR30VNwSoXxAGJ16JtN+yP+HyVzidZcgTu8NA
 7vmjhHrGWRukbvQuxY7uqfY2lBbM7SK9Qbqx7bvWnGbWZtC9K24GyyPvMn9g8PEcAO
 8BzxNxjZbEkTBGnfNyn/9Q0aJnG7hW+RqgvJqtsdOSkhLa/+Nsqfo8iT8ZAKMLUiPF
 k/o7/m08Es2GpcxNgRXxppybyA7pIRFwxZfhjaEOpgEvmJIW6uxK5r/xFfh4u7zZK3
 pyQiMkRDGtXCw78SrDrwhR/aXzHd4WC3ND+EaK+YxQsIOHzbKmwbvIX7MkwwaAxuqW
 e4RYcGncXZfEQ==
Message-ID: <ac154b67-054a-0b4a-389d-0a60d9a49e0e@collabora.com>
Date: Fri, 25 Feb 2022 10:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7, 04/15] media: mtk-vcodec: Read max resolution from
 dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-5-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220223034008.15781-5-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_012403_239634_BC5E9A40 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 23/02/22 04:39, Yunfei Dong ha scritto:
> Supported max resolution for different platforms are not the same: 2K
> or 4K, getting it according to dec_capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
