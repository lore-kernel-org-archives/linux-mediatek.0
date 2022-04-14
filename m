Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cn8DF0kaKTfXTRqq6ci2xnZ8cojG6dqWmC1OlTsCNwA=; b=cnELJXAHO563lJ
	NBFB6uzLUFR0TMMJW7FdFS9e1i8hshQPTsBaLypuwYYcjzF9PoAAYDURP5FCjN+krbB+XZI9F6Il+
	UL9jLB9BitHOrMUrKCic7IP9p8H/sWRQd69WF3ahPR8d/VCE9MPpRAA5LqLgQnJ+kxA9/fNjkoHqd
	OV8cF6xZwc/dr2XKASbk6Wn6X3SgEP3VGvlpYQSIZYHnO5msVMj00HEw9JndNg8DXWnpBTFD1c9mu
	x5WZiIkqupHIvHzsee3eoDX5RK3Obu7+3dHPCotztwtxqFwUhZEgy6Q+YVtHgLP+S6e75bY2HrBTO
	rv/mb+Z0PFk60zELcrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neyDL-005PUn-5j; Thu, 14 Apr 2022 12:04:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ney97-005NDi-Qh; Thu, 14 Apr 2022 12:00:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 503611F479AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649937620;
 bh=SIfLgdnnm8Mr1pbjdeSXLKHkft4Qo/podTgV9ZDU6oA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zg5ZpRBctAbEWetGACqu7m5ZTuMBIP5UM9CW0mHjzxWc9yf6zxgri36QFRVRjFe8r
 q1k0qUq5I9KDxSWMh70FuxJ/Z7zG2Hfa7/zale0fdLVS7CAyUbwObk8mNvDyot53uP
 +IQOXs3VLcYC+43iXuXMkYMgW+NzpNj9pjZUgui/WWFR6F5aVi8cgDenBSd/G4lKAf
 8Tr1vm9ZVoqDRVNWvBXgv1KWwwVnHUPH+hXPS+mMC8X0/57TecA6wAfRmGCa+0jOrG
 CaTqlo5j2ZcT8SOi18q3e72PURRomPvUN+U+Jl3d+TpmmrHRmYk9M75ytNGAzxHgL/
 KJzCU9Xf5zMUA==
Message-ID: <98a1d6fa-c5d0-f1f2-ad85-f5246b368fb3@collabora.com>
Date: Thu, 14 Apr 2022 14:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] mt76: mt7921: make read-only array ppet16_ppet8_ru3_ru0
 static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220414095438.294980-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414095438.294980-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_050022_059393_5D06FB7F 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 14/04/22 11:54, Colin Ian King ha scritto:
> Don't populate the read-only array ppet16_ppet8_ru3_ru0 on the stack but
> instead make it static const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Tested OK (mt7921 on PCIe), and....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
