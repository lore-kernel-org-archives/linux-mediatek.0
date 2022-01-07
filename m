Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlUQVYj31I7fYkwB/A8oQDgIWZmvWfE9xvDheU9vx3E=; b=sNY+OmspcN8cyc9ezKDUeD4ABI
	unC0mWwnJ3Ovl3K5CVm1m+q2mqDEu5PwjKa5uZFHTKPlb4LyIePyIiK3LDcQg2jLe1p2yKH+w+Rax
	yAkRCiyMdWhvM49c7xaTErq2YF54mE//UWmHpQCBP+EHFYkyCq1GNyA4hPyk22MHCjemn8pb3/1cc
	MZ/xGjQV4soD/SrNz7oRwzeGKBQA3qupz5JG3YzAlbNQHSyxgxLzTeHFbarZYo9jPvwEs0WyES5t6
	IOuNNIDk4km/+8qHlsWnwgXAEi7KDnQwuivSTtIcw+4qODI3qBfCaf+5kAfSakvrnF7JqXxL+vL8b
	wntqcPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qJx-004CvN-Vp; Fri, 07 Jan 2022 14:34:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qJP-004CaP-6T; Fri, 07 Jan 2022 14:33:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 70D191F4436E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641566025;
 bh=dwxI2Zt9X3CdVPZ4YhQ/FM1Ow749UR2LLeAOwFZludY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Mjke4fniYh1ZBmUlRn8HVJSQa8j9OJsXcVHDy2QJclG1iDw0e1INlkq5MC9sN6Fz2
 xScuVfwSm5ZhAr3jkE1uMKbZCMmdAjTQmWE7iux43kfnKV2Mu094x9LY/jw7X+blcw
 KH04C+ptKe0AvLHPCjqpXXmVuz+cdnFMNQimzUrA+o589TZDJuw9oks9bawevnEkFi
 XOVJkpLR1wTdjv4AsBwJ/Pl5H0Kk4FnNaBJtsYgNHmA1Red7WWbAZ2sEx3/qBptnPC
 ToUzoeCg0WT7ejziVMHCTf+SKenX7MTshY7MJvWktOAoLb0NaFBd/Ednfqr/pgThpF
 LelrKJrjkZDwg==
Subject: Re: [PATCH v21 2/8] arm64: dts: mt8183: add svs device information
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-3-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1d0afef1-47b2-4b36-9616-27d1df9ac113@collabora.com>
Date: Fri, 7 Jan 2022 15:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220107095200.4389-3-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_063347_438160_A9C9282A 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/01/22 10:51, Roger Lu ha scritto:
> Add compitable/reg/irq/clock/efuse setting in svs node.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
