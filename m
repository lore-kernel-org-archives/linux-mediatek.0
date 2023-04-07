Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F14C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5LyKuZllq6yvjm88MKxfy1W+Qb9ePsyfbWf7WYRswA=; b=aiep+08wdYpsLSPFNYJwwGJL27
	oW5sHrmmZj0UwC1Q3dKvy/xalj/uC2wFBL64JKQyfZEMuBlmqviORSHoWXTvW5Daf6VrTEoWF2l24
	hj11e5WVQ973P8UBglHIM+mCnZV+NxylgiySa934vB2fVhM3g4ICrpkBhOmLgPM1kBc+3MymoWKDn
	CO9IyHEL58Tqfo7eNn51Zo4tEpYau+E2yBtg7UhNvvyjtq+pR8m8d0HDcMs4HN7fMbA7EqK9/2xw8
	7hZ59xr+PPaKkThiKUzI3I4PXjQOeAizCRTCP1+JsUIHhPvI0VWLPzLpHm2oI64bPyekIIJfOv3XG
	+BZJxTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pki2g-009aow-1g;
	Fri, 07 Apr 2023 09:05:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pki2c-009amr-29;
	Fri, 07 Apr 2023 09:05:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CCA7666031CF;
	Fri,  7 Apr 2023 10:05:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680858353;
	bh=laCsmRgchMhCg4Gn7heh1gDxcLUQM5vkkYCEL4cE2rY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABIEL/tKYEU2m+l4zbFSd1n9OYNlKBMdE0FOGDMbxRL8xlNqqDpCNIuAFcFNbZGWH
	 E0VWwR3JX5Z4L3oCQGLyIR0jO66vQmvnR3km0sagMukXaP1Bd4Vz5IHSvhlHi5L9iV
	 hR2k7gviX75gtxbVUNbyYkUA6MZVU1aJ8AEKzFk6NjBtYGiG6O3UXnured/F5VIwoJ
	 qAfvBvsMXgqaWhgrgC22SA96/a8TzaM8s40+pJMfaXElOb/l4Eom9w3mZ+WQRJknCz
	 +yzyooP97k30It4qotA3VhGtJf6gj9RapGXE97ZD/MdYVaGgpsBTxqlf7TGP3HS6pY
	 27Ak9I7lkmZYg==
Message-ID: <15befa07-7f17-23b0-9141-a7ae8ee70c71@collabora.com>
Date: Fri, 7 Apr 2023 11:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020554_884373_24B34406 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 07/04/23 08:24, Chunfeng Yun ha scritto:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


