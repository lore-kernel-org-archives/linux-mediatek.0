Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A111C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbDOobvd70CKbcqOOvieEmwkTkce/XS6bQXA0cPEEx8=; b=wM0tiUTF02jjaLHnVGHpRzgr97
	ko8CZrX+CCUoSxcXSnUsn7DSPhokSrrWi9U93onRxZ0WzAaP1kk9WZjrML1Ty9/FmnWVK35+9ocOz
	NmZmFutzOPSdCiYiuiW3qZvtCjKgyCXciveDK1cug/GeE6vwoCLS1Bt1jOpQBZlyW7XO/yRF8W0gf
	ic+HX2UhPFdoTgfkAGyswhJvCCBgJUvXA0qRHbfR6m8Ev9271q6cjq0IeVW5I2rX195wAsY4zl/2Q
	uQgvKHbTXNXQzii6KbyXK07OeLjnUhfGIi+Dsfv6PfnX5obGnZ251oTnQEARpCbYP5Nb+gKyQ0ZsL
	WLa6CHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDbe-00000002lGu-3hEF;
	Tue, 09 Apr 2024 15:41:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDbZ-00000002lDn-3ysI;
	Tue, 09 Apr 2024 15:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712677306;
	bh=hU8CbjeCVQ/KTmATBPDlklumAOoUvo7TYj2qC4NSoP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1IHAFPWRx25op5CE12Fp8/khLbdxEH5ppYWqP835pkW9TApEU6PaZcAT+8ph7Q3Y
	 6GZKGEexwxC+9uhcIEVi6y0rjoadJ0l9I55YWlQJ2E5EW+u6LHeqqANcbk9NzGBST+
	 uYsZjOx7nnCwRrtugObo0LxNuLYm76E4GypNsseL2Abimxf85gEY7LdzWU1oLEEWJE
	 lH8ZnMKT5SqWQ4sQuSLmZFhDYl/qaeijQrXFSnmRJ2VNTo/1/s60q93IzgoWlFkzRp
	 Lizj5nEys1ZJWgLbjoXX+bkonwn/rQ+uzMbPeZuDbGObjbHVK9kn7obaNzcUyuOY+H
	 b+HobMB7rhARQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97B2637813CA;
	Tue,  9 Apr 2024 15:41:44 +0000 (UTC)
Message-ID: <8600acf8-7b51-456b-8a81-4233cfd6f121@collabora.com>
Date: Tue, 9 Apr 2024 17:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chunkuang.hu@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
 <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_084150_382825_56DC3CA9 
X-CRM114-Status: GOOD (  15.18  )
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

Il 09/04/24 17:20, Dmitry Baryshkov ha scritto:
> On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
>> The display IPs in MediaTek SoCs support being interconnected with
>> different instances of DDP IPs (for example, merge0 or merge1) and/or
>> with different DDP IPs (for example, rdma can be connected with either
>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
>> ends with an actual display.
>>
>> The final display pipeline is effectively board specific, as it does
>> depend on the display that is attached to it, and eventually on the
>> sensors supported by the board (for example, Adaptive Ambient Light
>> would need an Ambient Light Sensor, otherwise it's pointless!), other
>> than the output type.
> 
> With the color and gamma being in play, should the configuration be
> board-driver or rather use-case driven with the driver being able to
> reroute some of the blocks at runtime?
> 

The driver can already set some blocks to "BYPASS MODE" at runtime, meaning
that those will work as simple pass-through, performing *no* processing at
all, so that's addressed from the very beginning.

This doesn't mean that a specific pipeline must always support the "DISP_GAMMA"
or the "DISP_CCOLOR" block(s) alone, or together, or in combination with another
specific block.

For any other question, clarification, etc, I'm here :-)

Cheers!

>>
>> Add support for OF graphs to most of the MediaTek DDP (display) bindings
>> to add flexibility to build custom hardware paths, hence enabling board
>> specific configuration of the display pipeline and allowing to finally
>> migrate away from using hardcoded paths.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 


