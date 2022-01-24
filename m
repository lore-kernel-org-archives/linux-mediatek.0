Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVhgb/pygdek+01BrTyt8TnsmFzgpNeQxRnjKvEytwA=; b=NzaeBwP80qTqlDLJMtaanl5Juc
	t3j03oeQduxbyHocDaT7kwHxrV+tuXYQ1H3nmh5V8kQxa9fbhB/KShkQXLcv9O7uK+QN24XkzfK9v
	gxQKOrudIRFRL3FE/Frk/giponMHg4yuhhDs5cDObzzqYJoU1oBZHouVMURTs/WvERPSlYrAWhfFd
	ZhMaLvCStfaSflfwB6xwxcZK3QJbqwjUNojj/uZTLFwoyCI/3nUCJ8jHQj4WHJpw9oZVpTEeCni9Y
	fiF9lOe8uEuufmo1ozsp/Z9aGNNJyT3Y9tOsEKGB0ceVPQFlud0AFrkmTEeleOBLyNmYsNZHQHccw
	90lj0EMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvcU-002my9-HV; Mon, 24 Jan 2022 09:26:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvcH-002mu7-Hp; Mon, 24 Jan 2022 09:26:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 679C51F4331D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643016381;
 bh=QKdfQZOdmYZJNu5RLWnu+T/Ig0eAu7tkYNWvSAxrBts=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CWLx9uGiQ9qmn3+wTYnZ8fnLYrAVsfuclNxMso2wH/ogXuiYbl/Yd5zNkXlhOg5fT
 Z6d7EreNWMpdktOBbkSCNcDzgHZusFAZrtXb1EecMAa58pv+YHUM9B3MZGpNYIkg36
 yACj2xPrGdnoe4xEow6BG+KtfT89CADGMbU+NUydmfFzv97QR15J5i1ONzZrxUAdjG
 RmLmfI2FSUz7kSJYHlZmpfuUNgJ7B5X1k68YVglOL+2zfRmNBcluqCqzKvZQw02e2m
 Lp4NqyCaIJDmD4+Bx8jmbsEKsnM6SYRx8vdH/yCfHlIB5/12LwjoeDETGF3hUDIEhq
 gPE4tIC9b4LWA==
Subject: Re: [PATCH][next] usb: xhci-mtk: Use struct_size() helper in
 create_sch_ep()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20220120015546.GA75917@embeddedor>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1e41c2fe-38b2-e7db-ec71-cab1abb708f3@collabora.com>
Date: Mon, 24 Jan 2022 10:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220120015546.GA75917@embeddedor>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_012625_826541_E9787E44 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/01/22 02:55, Gustavo A. R. Silva ha scritto:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/usb/host/xhci-mtk-sch.c:265:20: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/160
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
