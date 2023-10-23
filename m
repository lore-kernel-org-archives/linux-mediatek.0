Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A443C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnDE9At8PSBAJmJDXGAvXA5JiMDY4s+lYc2+WJXXCNA=; b=vt9hiUzJ4YVDwSI+9rpJPcJDQ3
	u45h7k1+8uhXcFfRVM5aWRd63SKVzp6v1kkl/TtLzTxTsbSgIBJ/I3wmbAAgy8Wxvgdali5gnzq3R
	QsR9ZQB4T85mwf7v09AcdM8d2tOujRNw3wtuwGD7a3yhTdtD1SVjxEPLimbXW3YyYDhmQNTljC21N
	3PIbLrDXagE9nHMFvidRFQR07M0n6936kTUfeSMfAsTfJZNUxzGyJBUpCjbt3ZODU2JnBj13QMLyu
	Nv/FryiiXhC0DqIijh8CyTlhrUo6+NfDuRgfo82TQQRI9Qxq0wr07jH+vl3B2tHnTmV3FsVkpjHCN
	BLylbAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqkV-006pby-1Q;
	Mon, 23 Oct 2023 08:57:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk5-006pP1-04;
	Mon, 23 Oct 2023 08:56:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1881E66072AE;
	Mon, 23 Oct 2023 09:56:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698051415;
	bh=fXrIYiao92p4xph//uiSgSMTKeoj7373HkQQZccXFC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lsPTP4OmUpuvW0Mesnre8XUjMTVvQc09q13ulhcO4XoaSoI55G2Jgc1O6MBWGjoCA
	 rKMSYnKZ91kg/pISTRZb9zCSFyzXgKJNk80XopETsiCeY5CvD66SDT5O9N4Zvvwwr4
	 eW2elMJ401xyroOqM78DAuE/ZVu1WbuFKOiahLW+Hir2qrJ2pMl4xiNAkD5bTIauGU
	 /dtpzNSGVy6TU4bRveu4RNt5ulNImhQ9CccoahLSQRKZeiXk9RVZwa8zhoRfECB31m
	 0oFzVR1zUNiOsUAXFTB+XHkAdi06uPr85+vsvsAEVYEMjnkOYfqAgOKm0dRC2DDW9W
	 NPLwlrmS4ZkxA==
Message-ID: <a50a2a08-f2b9-4a6a-9a65-7398b208e7b3@collabora.com>
Date: Mon, 23 Oct 2023 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,3/7] media: mediatek: vcodec: Set the supported h265
 level for each platform
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
 <20231023030640.16393-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023030640.16393-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_015657_188957_74BC0021 
X-CRM114-Status: UNSURE (   6.94  )
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
> Set the maximum H265 codec level for each platform.
> The various mediatek platforms support different levels for decoding, the
> level of the codec limits among others the maximum resolution, bit rate
> and frame rate for the decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


