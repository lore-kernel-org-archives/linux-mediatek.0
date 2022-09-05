Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA4EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0n04ujEUjx7UGkPmfvD+1dER4WUMtiOaLVZJLRMxAk=; b=zBUil/8jFCMDChuC3scl7DvF6E
	jqz54vwMg8FPSLBj+KNwMmTZgHeTFgJq/hxvWB00mVQf88uQo8rUX9/OS1ErZb36vNic39fVWvWqK
	M58FLodyG94L5DWKYkBidNg0b5PbsahTPmJETtiHMftCte76V3lrBMO45ovFDl5D54f81OWUytagR
	q/EdTPZ/W7fHwDIeLbk2nYvA0bEvklaFl29KJeN4ljiwK8YGjh8et/mw99dpqJpbn2z3W0VJOsDq4
	nHnt9LNU/vX+nIkg0GGeXDTk/QkP3bcRw6gxRd5SwioHwT93ooTy4OscHcedqeY7MtTTj5OeAMPkN
	1Vt3y59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCuw-004IPS-5w; Mon, 05 Sep 2022 14:17:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0S-000vM7-Qz; Mon, 05 Sep 2022 11:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C0n04ujEUjx7UGkPmfvD+1dER4WUMtiOaLVZJLRMxAk=; b=Xk3BMidR6abFgTkzB29smKHvAu
	N6ldl54HYNx8zBjM7aHywO9ZwKcBoLfnlwwKIa+ZoYWK9phzjf7pljwKHBu8B2EKaWn5ZwxbYX4oO
	tle2oTA4LfAjJN7yqkLg4XezeronIJk5xXSdNqAj141gx4T2PcAR7H1iU5pi/nTsjmV/DQQbdGgDM
	lexRxM8gHls88YnHszCkmquefI6pd6QUTbv0TclEyAIPTdZ5YX8fXpA++nJ5G8hgNN230J6og18CC
	eyjmOQs8qkYwN2HJmtQ/h5Zw1a44SnmgF6nkdIP7L1uxpEhKiCGZSnU9JBholJSU4Zd7spboBk7ze
	UvGh+hrw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9jv-009Y5c-Ra; Mon, 05 Sep 2022 10:54:08 +0000
Received: from [192.168.2.145] (unknown [109.252.119.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 481FC6601EE3;
	Mon,  5 Sep 2022 11:53:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662375223;
	bh=tUTd2m3nR6U01woQKAodDrlaOuHhF5+x2TW8FD72guk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QDVKaBW+A1Hwo04iGcKbPUC1E2zUzzl+LF//Tj5x3fJdHDPLj2xM1R6GFnViVR1Gt
	 cRv/C2z76XL5CAWqmwjvdtvHYFRRLxdwQKylPWDhkWIK3KRWz0xsckY1698E1Cn76e
	 CKro+FXClUE06ko1BHN7mbOjuDN4Bk2zC7yU0YrY4WmPjFRqjJhxfbZHGfWYKN0XQR
	 jSg6GHzW2x2FdpZHDGGuo+uU2HIO8itcP7y4fIKs54UhTa/a8JH8GvkRhZULqap4Ex
	 KGIyQKIXamGfvLvR8ji2pvqiz2MFxJyzNvDe64dde6dh5+2iFEZix3Pksg0gDzvuHe
	 JWk33/t/bjyJw==
Message-ID: <80985882-c46f-cfb1-b077-a92866536678@collabora.com>
Date: Mon, 5 Sep 2022 13:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Osipenko <digetx@gmail.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, p.zabel@pengutronix.de,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 deller@gmx.de, airlied@linux.ie
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_115404_031793_0CD36FD8 
X-CRM114-Status: GOOD (  11.18  )
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

On 9/4/22 15:59, Dmitry Osipenko wrote:
> 01.09.2022 07:41, Bo-Chen Chen пишет:
>> This patch is separated from v10 which is including dp driver, phy driver
>> and dpintf driver. This series is only contained the DisplayPort driver.
>>
>> This series can be tested using 5.19-rc2 kernel and I test it in MT8195
>> Tomato Chromebook. Modetest these modes:
> 
> Applied to drm-misc-next, thanks!

Hello Chun-Kuang Hu,

Angelo told me today that you wanted to pick up the MTK driver patches
and I applied them all to the drm-misc instead just of the "video/hdmi"
patch. The series was fully reviewed and tested, so I had no doubts when
applied all the patches.

The applied patches can't be reverted, so if you have more changes
prepared for the MTK driver, then please rebase them on top of the
latest drm-misc-next.

Apologizes for this confusion. Please let us know if we can help you.

-- 
Best regards,
Dmitry

