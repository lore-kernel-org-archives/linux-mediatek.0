Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0DAC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZuX6j3cdxIhMhThZF4SA/JP650rHG1NpIR8AQERkuI=; b=rY52ix/qbykQ01Gwqhkw4EE28F
	xUTjBtNi4UmbKDI8UXI5mpNdUih9lzFEC0FfD4p9ET/COuUbrGoUIKSnIQtkQN9Xo83IqBtWiW7N9
	HxeCQyiKpuquOqm5+1GGnPbMxeRbOvys44Ui2ISH64v5IOzY1atzPjePEIkXYyl3SEe1szDeovsh2
	ez2SQ83GxuiSaxNvEayTmiz7w4KjTPymrsY0YgdKfIfCPPnraUkLGaOzIww7EQ0W68884liMcrSVW
	1KwTVOUaaPI5TrORdHnWNI8e8Vp9Yi7yvFekJfyPFt1gnza/Ug0HFokgUyrsyPRbzUIap+DJGMNQs
	gDSJQlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtqo-00Gvu4-18;
	Wed, 20 Dec 2023 10:30:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtqe-00Gvqe-28;
	Wed, 20 Dec 2023 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703068242;
	bh=YVVXuKIyCnfmhYXofbFSKAEHH88LRfArJsiXeVCEWNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iutGlf2JvAvI5tVVVndsYew77bFzOFFdE/2AR6qxWDoYBTasTm6YgFnIt47BQjVyb
	 VRw33XHBUX0FpfjdeFfOONOHc46/R2nVBaqTHOwxLh/sSjNX8jJFo6LOE5fQmaiM1j
	 qE0QYB36fk5x1SP8y90AmXkhUiP2y4wIUV4cJT4w+86RzLYQuDF2WM7P5GHvHu2Ypm
	 vmxlcXzlQbZdLh+aNs3Sxccc9+8+EAeeLSPjHEmeBt+vImHjYkURfH2y+Po0ZzuTbS
	 V4Fi6eFt/Phin10GrvHur3UJ7n768NcKuXsm81bnRKYyX1ZpN8IuHKZ2A+woDU46jI
	 DUu5pK6SPjsiw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0906B3781FC9;
	Wed, 20 Dec 2023 10:30:40 +0000 (UTC)
Message-ID: <9ebfe163-c86a-4aca-8f60-179a218821b4@collabora.com>
Date: Wed, 20 Dec 2023 11:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: xhci-mtk: fix a short packet issue of gen1
 isoc-in transfer
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, stable@vger.kernel.org
References: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
 <20231220025842.7082-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220025842.7082-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_023044_847145_3F6D2FAC 
X-CRM114-Status: UNSURE (   8.55  )
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

Il 20/12/23 03:58, Chunfeng Yun ha scritto:
> For Gen1 isoc-in transfer, host still send out unexpected ACK after device
> finish the burst with a short packet, this will cause an exception on the
> connected device, such as, a usb 4k camera.
> It can be fixed by setting rxfifo depth less than 4k bytes, prefer to use
> 3k here, the side-effect is that may cause performance drop about 10%,
> including bulk transfer.
> 
> Fixes: 926d60ae64a6 ("usb: xhci-mtk: modify the SOF/ITP interval for mt8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



