Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A2C77B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiGL0nw3SPTN1i6NTadmIruBbC6lrzzz9tE3a5FFbUI=; b=srBMJviLe8BoAt9zm3MbIYDSBH
	qoibx9l/7XdC6UqQqeHPUAXdHpktgJy/rBjv+OqY+h/OAzTvyTw0iFwuUNI7Y+Lpgl2ckpIkICNO8
	QX/O+jHLvWT4X2m0RX2fK72+l/8h3pcyALa/DoNHMGThQLKWBHBxDjr9ow4SSl9MmuetmeWdmp19Q
	X/lrqr2fD85A8GDvx27tU+5aILrFBEmC4FHuBEswLaKB1aSEzGrGx/mEKMOumTt1MJ1flF64D2tJk
	b50b9Nh3s66r7o5c1MeqXuPxGhMttI7mQDSmX/J/KaoSuY512seyRPX7xX/22/d/iYOjHau3GDq9P
	RQzTLFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poiH9-001auz-1r;
	Tue, 18 Apr 2023 10:09:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poiH4-001atf-2s;
	Tue, 18 Apr 2023 10:09:24 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C84E86603207;
	Tue, 18 Apr 2023 11:09:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681812561;
	bh=M02j6J00DW4BHPxDoeFFjdunyDui7f39d9NcSUm8Ib0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jOXXUIEYMbEDjlnmc0t56ObEdygXOBIUDBtRtUUPmg7SKEIzjWE9al6/nZqOWddHz
	 nXSEcXq2KC7QAu4UwMxBDFkVw+Sb958AX/NFjsRjsB9vvUb/BDBCEQr9gIj6t5BUnR
	 O3n+ssPFpMns37Q2Re5dc8nabd7PkLJmJOQHJnx8mTTUj2R71DNFE8mc5ksVD1ASmR
	 +PRZW5QjaYV+55Dbm9Yu777ey3G8zbt09UTnkhFmBGe51Nnx/z5lHQRMKKV6jt6bud
	 UEUvD/RzALElyuJ7AOd/WYbEAXd+TXMs+JN5kgBnJ87zc2IgH2qATUxM4NUPR+rw4n
	 zpJC5VPFUiwkg==
Message-ID: <9bfd1641-3f58-ca6e-1e80-13acea834ea5@collabora.com>
Date: Tue, 18 Apr 2023 12:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] soc: mdediatek: devapc: use
 devm_platform_ioremap_resource() instead of of_iomap()
Content-Language: en-US
To: zhengkang huang <zkhuang@hust.edu.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230414092113.64514-1-zkhuang@hust.edu.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230414092113.64514-1-zkhuang@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_030923_052598_2E86FB44 
X-CRM114-Status: UNSURE (   9.20  )
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

Il 14/04/23 11:21, zhengkang huang ha scritto:
> In mtk_devapc_probe(), if of_iomap succeeds and any following error occurs,
> it needs to deallocate the resource.
> 
> Fix this by repalcing of_iomap with devm_platform_ioremap_resource, which
> automatically self-manages the resource. This can avoid modifying error
> handling code.
> 
> Signed-off-by: zhengkang huang <zkhuang@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

You haven't tested this patch on any MediaTek SoC, have you?

This will break devapc.

Regards,
Angelo



