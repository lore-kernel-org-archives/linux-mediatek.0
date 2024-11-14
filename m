Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7A9D65C6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OH9/4HlDaH8lphFjmagoAFBCB6BaR0aalSI5sNapn8=; b=Qz4Hd2dkUW7tCexwpylTsIWtfD
	RK3X9dcZNDxsavkG7SwArKSt0zVGUYNyokFrc5Jnz5ND+8jL0qOFp3QD32YT0m7ency/lEaWuhbVB
	aAex1qdOKZjGBMrpeOzpX48bwmq1IB+8EP+7WRH038hpub575Z1ZH5+jn+IgJB1/q+gpeQ2j7j0MJ
	8ZOOOFsAxtM9QN4i6OxUqTGdlMT0oUWTwyooQSHu76dTJOf3L2XmffIjItq5znOEB7aGqkayTEVMX
	uarsplfLYUktJcHxEJr63yoV5Yl+58luoJwpisIMHj6NtkWTLxIT0ruLaUddhVnaw8TIohqvdss1v
	cbBOplvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXhM-00000009f7p-3sjq;
	Thu, 14 Nov 2024 11:07:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWsb-00000009UvE-0zif;
	Thu, 14 Nov 2024 10:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579311;
	bh=nKvB9pDqz/xoRqE3G6i3ohCmrTQ0WvPw1A1TR8q+06M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LulJ83MdgPmpqTGQT8+lBAfJP7Fi6lnzWcz2zdgynLjJgbbilq0r2EfEg/SCGFYSa
	 ynD7eTAmyXlk6YTG+Gkb3Z7bUwtvjq46GS1KMdwwegyupVKFyqT1Rj5crD0Vmnp/cA
	 uITN7nHc6dRW7mrDdsTXGcop5V82coy6AP/NK601hYIXzU/V6SsUPnlm5mWx/5Ri8n
	 M9M/kk1KaSgrvBBX/eSR6yn9hq2kfn0DHk8iBqO5COIbyE22NgcV+oV+GOvz+p2m5U
	 JEWuvu3DX/BlKdIB6jdwSKNtU6w3WhKpJ2Mn6Kxq9u3yaUO6TKLaGlpXmHzeVCGKyY
	 sfkeapwdgz5vg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2308317E35DC;
	Thu, 14 Nov 2024 11:15:11 +0100 (CET)
Message-ID: <1b73bfbf-e97a-495e-b0af-5273abec5ca5@collabora.com>
Date: Thu, 14 Nov 2024 11:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: mediatek: vcodec: support extended h264
 decode
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
 <20241108034019.20064-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108034019.20064-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_021513_527809_66BE44DB 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/11/24 04:40, Yunfei Dong ha scritto:
> The address end of working buffer can't be calculated directly with buffer
> size in kernel for some special architecture. Adding new extend vsi_ex to
> calculate the address end in firmware.
> Adding capability to separate extend and non extend driver for different
> platform.
> At last, hardware can parse the syntax to get nal information in firmware
> for extend architecture, needn't to parse it again in kernel.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



