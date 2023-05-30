Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCABC7EE29
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zERFAMZitFO/9wADuelNW96UhVTlhr+3lIT5j3ipL18=; b=UPCMy6UHdUJB7j8Z5/2Ba7WEdY
	WUxY6a9O6ynVKbP3RoGxnY7STM5CRCpc0QLF93DyVinR37w0tCdHYbr3Ntv8MODOmwuxHuEEYvPL6
	VcMnrPy3788CdLq0CoM6FOglpff7WPlF8wbNUjua66c/pfG9sbG1OaPcBUwEZxkeMzXeReu5mpxnd
	KXG2IZM9h1B/a1kyrzDkoU68/nKQ4/WJKEYDyPZVSJonWR4KUNUew7lO3T0n9N6RjJefRV2AjThUz
	PmBTZzgrnHbixO7uIRTgU0qrF0pIEUXL53ztzJEp0gc03LQ9ogSZV8Ez7dgZw3m/YrrmFb651ndT6
	8LVMEXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wF3-00DIrQ-1A;
	Tue, 30 May 2023 10:06:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wEp-00DIii-1M;
	Tue, 30 May 2023 10:06:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 562346606E76;
	Tue, 30 May 2023 11:05:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685441158;
	bh=KHiRYUOpyRFGmSroNyC9pEEG4SP4vKghXMYN6bkDTnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IiM7C//lNBIq9f1NANrZ6B3JJzTrjfluDjZl8s+t+OnZleyoXmFQK9GjwgWjUd7fh
	 Qhfa/aKb5puO3WEoHCCurZ2EoK5iJ6WdZpWx2hTsblqtgMazJxGM6WPAvhM3oLAWt/
	 x+BladDOwvDb4fhxCUZMk24qg+a7nnbuv6r6BCnerxAFmUqXtz0Zs7zejjbA90v9P/
	 YGqHbBgpvADAQRESuEfH5IkdEobWAybtQDlq2AKLT2uZpl7dtH+ve48kQILE5NbYgq
	 h6aR68HJ65OOqUuualBNTStQnvYvWoLbiDfQR+p+x+NzLs1vME4cFtx/RSdLruVtGf
	 EiNfKAIyGSKeA==
Message-ID: <486334dd-2cb9-d884-9979-ceb45cb7e1db@collabora.com>
Date: Tue, 30 May 2023 12:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5,3/8] media: mediatek: vcodec: Add a debugfs file to get
 different useful information
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
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
 <20230525021219.23638-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525021219.23638-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_030559_587499_75DADD3C 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 25/05/23 04:12, Yunfei Dong ha scritto:
> In oder to get each instance information according to test command, adding
> one file node "vdec".
> 
> Can use echo command to set different string value as 'echo -picinfo > vdec'.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


