Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F22C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAVNLGim5wFcrilOkEuC/NOxcnAKTVYANQjEkiqMNuk=; b=oV8M2rsGxFhXPfpdn590Qm/ui9
	dF9HqHWmZFfZ51W+HAwrQ4oJ5r2qvAKfF89L747UZyZ6kajwOVcNbqJD07X5THiYgKAh5sNT/sGrK
	DYexfH+sRovxDCWDVYQBen5rRNwykGR+xNG5rIl8zoaJIylsx3/tdcfmColR7/X3R/CltGyON/JGy
	tqOsd2gP3cxD3HR+wPIl6W7H28A+Ix3VmDa2sRMMoT5exTSnCgiO2pCYY2QpSmXa0yW1ltJF2D3GY
	ZHRSK6/Vg6j1+C17xhMO4/o2qk2Dn8ChWvvqOSiYCNf1JeLcGQONpKTNolnQhrOUvt1JVjq1LcrHU
	cS66u08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoeM-002NJM-0F;
	Tue, 01 Aug 2023 12:38:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoeI-002NIX-2T;
	Tue, 01 Aug 2023 12:38:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5229E6607122;
	Tue,  1 Aug 2023 13:38:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690893528;
	bh=Bk+q0IviZB4Tcjk/qAmz5SKyCcwQz4wwuUuql3kc1JI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PinpC2hYqWzD0ckspYNgggeWeaJ0e3COeZOxWKiTY5rJaaW+AkVhZi6okWZFBsMXv
	 QqPwmWK49yRy+7iFsjdqDO+5r+Eb2T0Dqs9e9/BbnroAQX8iG90DboAb74yg/FJ2Yg
	 ojOkT5+2iTslacuSxcrj+UCNF5lthkaTSe8S/22Zqkk8euJwICX+8smmy59afuXlQ1
	 38N/RNctwGkm/u3MXTfy/VAaqO96EJEHBS/V1UhqXw8FAdmSCTjHgBZcqukTsbl2Sv
	 CzynL2EI6t9XdDcOduLBt4AhxOBk/yIqMFE1GdZPMdk74/I1w1is16cWhMcO0Naok+
	 Mw1dFNtzS77Dw==
Message-ID: <a37298af-a12f-0c49-113f-cda389d8232d@collabora.com>
Date: Tue, 1 Aug 2023 14:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Content-Language: en-US
To: Zhu Wang <wangzhu9@huawei.com>, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230801122834.89168-1-wangzhu9@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_053851_024179_C39526D0 
X-CRM114-Status: UNSURE (   7.99  )
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

Il 01/08/23 14:28, Zhu Wang ha scritto:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



