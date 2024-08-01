Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36958C3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGmbCTTyJfl8jONxUOr24fYOn3MUXGyLo7vCr8zkvS4=; b=LGUN0sU+Qgwdg8Mg9AvwHZxSh1
	UA1rCGzB8C8ywadCPhRzXaMbfIkRNrEc93F5CvEpB2HK1YX9fHwTRoxF7W7g7FTq2jw+NJ7MTAmMK
	HJ9MTqGSw3yWzCdEUC2D+NnNwpVZ8uZ8FLUtMeR8qfMxRSVRJVHFjgq9L6L7ocoJxFnhXQhQSE4Yf
	lNAnF0XVmsFRCa9dmoeCJa9rCWRVfYLlbK4S/+u80bUw7FK5SzdFzSkJq00gEz8E8obrVy+SQVMC6
	I/RW3srYcu++rpJt+FxPm/SogGx54CnMNLnipfb+2C+K1tHJUkjExjZYMQ9IKdhnesv6IUmJ2g0GJ
	BYsSPKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQxx-00000004IoY-3rCv;
	Thu, 01 Aug 2024 08:15:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQxV-00000004IjH-1Uym;
	Thu, 01 Aug 2024 08:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UGmbCTTyJfl8jONxUOr24fYOn3MUXGyLo7vCr8zkvS4=; b=JtTBTJkzjuSfLnGfdCJoZYPEka
	g3EdSBnj/jMS9Af7jI6K2tvJIT9EVE7XnuH+S8xNPrhtms4nKCeRQbNt1buEvRuQSzAYYszio8JhU
	N75qd88HVcfh5ERxa9tkJH9KFWOonVcsinnXe/Xgygby79HpsxHEihG0mOgijqdxJvvZSY1qW7q4v
	n3skbkubEeEtdh5/VpuHYKXkkHUXLJPYaUSxep3b1e5U6h07iETJugnV9m4TsUsmvxbY4BoXIJZQP
	LtJKd3CCWujxqOF8RM61ic3lo+Hgu7wgmzqHcGeVzRjW+OfIgUch4QUUmAuSieR6zydxzoRTcgrOV
	0NvhgqSQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQxR-00000005OwJ-1EpF;
	Thu, 01 Aug 2024 08:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500081;
	bh=UifA/xUfuBeMroDvmUo6h0V3Cmjxc25gWtbwKwbHEhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndZqa7aBvgclabACijMRdZqSfK9fa0KW0pMSVN6ezMa8u+ODZT3GFE90p8+wKZbfC
	 3mTtbYYhN0UNWaJYbIxUml7wdLvw62JPgzuG+vw+uMXRWodM6QTa/xF+y8yup4Tpgr
	 7DB8XWYOBwP6xu0jL71SJk2QyUqzft9RuV2ltzMVFnWXYj7rMBh/L4pavDSzXvi1yo
	 gnhWqgWGAWmWbIlcvsDMM8TvvDWapaUj7ShJnyTdWDhhVX0LCPtHpblsPz0OdGZCzd
	 GziXDabKX+Ed4PkbsuM1YMaMz6YVI5KivC+qCL8cmXUx96sU1b9kppQJECwAjBcrAv
	 cr/n4W0mT1pMA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A283D3782209;
	Thu,  1 Aug 2024 08:14:40 +0000 (UTC)
Message-ID: <607b2b34-cc3e-4f75-8a2f-4a0990afc758@collabora.com>
Date: Thu, 1 Aug 2024 10:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
 <20240613093357.583-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_091445_584011_F583D2DE 
X-CRM114-Status: UNSURE (   5.73  )
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

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_h264_req_multi_if.c.
> Leading to kernel crash when fb is NULL.
> 
> Fixes: 397edc703a10 ("media: mediatek: vcodec: add h264 decoder")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


