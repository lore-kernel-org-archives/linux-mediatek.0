Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65828C7EE31
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cxPPjWqLuUAp9zE66pkb4iNbDL4XjUNmuYOVuIS6rc=; b=rQ9RvbA0LBVuLcvCX2npsxV1GX
	2SpxJefGo+Z4SVGdupBQwjDf3TT6dzlev4zxou78oqe/cIggcPDGbPmOaikiCpigwQpjrPmznGn0w
	GX0y4/4bovRq1maJkn+2racFfqzmQGIm/csxD61xNLaMU4ySZixkY7qxhe9UvF9x8XTXk4Gv5g5RH
	g920Kc2wo+BeP/i0hxUEVd9Wqxg7IBha/vDeaZ3Nhg23rICkTR0CAYeqYGua0dNZnGcsNRp3Rtmpd
	AgOMTtGWE87d08HxZ25yGJe6rKJOoYO3c6GeegKD2Rdwm25iF1T3UtBG+zepQFyOyzZeY4WDuYRLe
	mpXnq11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q265H-00Fvu4-0D;
	Thu, 25 May 2023 08:12:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q265D-00FvrJ-0l;
	Thu, 25 May 2023 08:12:28 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14C126605835;
	Thu, 25 May 2023 09:12:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685002346;
	bh=U1OuA9KiKKzfHNwI0WOpa1d4Zr7n714CcEvD1zhZC6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DmGcEqdBZfRjNcCcg7vdJC4KvaOEXYsriTTxXv9PiB5qaeWLi3/Np6g8XCm/JnHnz
	 B7Om60vQzFU4ymuNaKOgC7ABYX3qUbI+jHxMiFGDkBdAPuK0sQEuWvtdh+9t1Wxbyg
	 VQV9iPQmzM8Tw57Imzm4oTdyRWBgOHymsnt3cB0RMOf6b7wDAVfiU8O+5xFi9dng/A
	 PgxGMIPjl+CWWl9RaJMptRFtv8+vD0EX+EHYqKrKBAOLEQcqmzb47tfDH4ckp/59oo
	 p/bgWhnWtjf/LSvKX7bGUa9DotB04pteK80SRG/gEAp3iZiLyhDCx7xgEAAlwOiMqG
	 DUbt2EcCgRAcA==
Message-ID: <9c160f44-c9ab-99a6-6ae6-ee4e0790b7f0@collabora.com>
Date: Thu, 25 May 2023 10:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4,3/4] media: mediatek: vcodec: move core context from
 device to each instance
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525014009.23345-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_011227_401406_8CF6F546 
X-CRM114-Status: UNSURE (   9.57  )
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

Il 25/05/23 03:40, Yunfei Dong ha scritto:
> There are so many lat buffer in core context list, some instances
> maybe be scheduled for a very long time. Moving the core context to
> each instance, it only be used to control lat buffer of each instance.
> And the core work queue of each instance is scheduled by system.
> 
> Fixes: 2cfca6c1bf80 ("media: mediatek: vcodec: move lat_buf to the top of core list")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



