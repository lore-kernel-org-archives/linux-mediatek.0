Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F6C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksMCYIBHNZNub63ZeKJL8QNyraoe5dSl+GQKnuAmBng=; b=kCmFbf+OReSC1P9eXyyj/hwQ7f
	h+UQXEBEIwxUov3lrDOwbS/Q048/gV36F1tAW1j0x1pRgIWU0/4FnSf2LgmuMp1rSo+7t27O9pTDx
	sR04nINxaSUY0GOPzrm0c4r03gd1wO/+3D0b5MwW2Ki0yiUwghKimOmFu96i8Zjt5A8Vsc2GtX67T
	cEUrQwJsyFI3Bey9ovJU2UdQOsXusycw86R4i75epVwPJCtk2iYBo11R9wsSe2jYCPCCJaMQ9j9/E
	pDGmmBe/NFfx0j5kA9H8jYXnxdeGtTu23KV8jkzVuhxjYgbLSs/cO95+3YOhjcG5V0kD/5kmQQUyy
	404Y4ciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk6-006pQl-2Z;
	Mon, 23 Oct 2023 08:56:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk1-006pNX-38;
	Mon, 23 Oct 2023 08:56:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9473366071F8;
	Mon, 23 Oct 2023 09:56:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698051411;
	bh=clZyRu30rpVtkfwwry2/X03KJDHSjbrHEcDVqVykg5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZSxAV6UDlF769MyKYIpVLajGb3lqWfQorc6aWBVW2HIYzKX52hOEbtk39DL7I2WvO
	 e8Y6fsNPX03XrwPYTBSSOtDdDTDgA/ro8R5gG++kp8v29gRmbJElZaahb2dN9PMbm6
	 BKK8eyNfhP8+KTh0p3kUq9BQmoync1nXao8++XfMnyF8XOxgaDm9FIRBi5ic9f7Pqv
	 3nJoNDX3+UqvqTAOASfTpEb09OvyZ9RNZAMgeb/fh1vaRK1aMrZTkYUWLDE4neLvcn
	 ccmHsL4NStBuX2PzcqsOgyWVVOZJ6i6/Y+rrc1CqHqJc0oE6RBPyHvtbPBeFDz3y3r
	 G2fR5sGbKJ98w==
Message-ID: <4e510655-aee4-4417-9211-90fb4327b345@collabora.com>
Date: Mon, 23 Oct 2023 10:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,5/7] media: mediatek: vcodec: Set the supported h265
 profile for each platform
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
 <20231023030640.16393-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023030640.16393-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_015654_162278_DCD2C699 
X-CRM114-Status: UNSURE (   6.19  )
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

Il 23/10/23 05:06, Yunfei Dong ha scritto:
> Set the maximum H265 codec profile for each platform.
> The various mediatek platforms support different profiles for decoding,
> the profile of the codec limits the capabilities for decoding.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


