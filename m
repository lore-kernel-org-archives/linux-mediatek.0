Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FF4C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 23:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyLYtQEocJut+YbQMppatVpiZoEfM4IEva+yQLKoQgY=; b=yX7Icyx1URkQSSHyfLsm/wyGVi
	lgz03FFzVhmq9j3JtLmoS1XY/AB+jCDKpmUaq5X7e5jGzE4K4UEuEayqrfirKOwMFZLNQwC+K1Aby
	Y3pj7lx/7DpuZrvB/FPz+SuuOQbOeJV7SgOm6wwBPxMTbIkZjS5cWEQUeqhYJ66U7AAlzLMkNjWD3
	ZsRJ4p58JSw5QVaEK8l5nNSKoWNbiEWqQJu6xS9aA6DehyObwIPkByeBegoU3Pz2FLXsGagAxFBLq
	4ry8QTs6Z5UFx8pmX7qcgVjCmGbDsDSDVuO5Im/ugHiyszpeE26pj21WeGID1aEucZXEpn3Wo7Dl1
	5iiHsTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49F5-00FYAy-0k;
	Tue, 30 May 2023 23:59:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49F1-00FY9l-1l;
	Tue, 30 May 2023 23:59:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-256712e2be3so2721434a91.2;
        Tue, 30 May 2023 16:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685491140; x=1688083140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AyLYtQEocJut+YbQMppatVpiZoEfM4IEva+yQLKoQgY=;
        b=hBmsZAs91gEUB5tqtPMCNyVe0Cearix2tq8FMyxsSJ/iJjzsD+rF6x8Dtt+0uaX0jL
         Di0pCBh/qQzAPB1n5bx4DPimUUOntZU0QNwtSyVw9KAhhnU/klW72AeDCEvlv9r73cyC
         5wY1fKcI+0II1HWpvW098W//nGI01QR576Y5ANGGQyJ5ke2nBWHesu9L075lnd2GGArA
         rd8d9Yt2dzax7gJlqqh+YtCv83phfb/CNqICsRLj+8XVnjhdXblNaRfTharPp9Sl4fRv
         Xz38F0ihHNreaaC6z8qMbYnGIcwgji17iFIdIjn5HQ/x376USsLE+63sFsrZt8wi+RMd
         NkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685491140; x=1688083140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyLYtQEocJut+YbQMppatVpiZoEfM4IEva+yQLKoQgY=;
        b=km6H+4/qQ2VFGCBlL/KhLvVB8OhlU27Hmep/PYkLf7KzuMR3NWyRPH464I2K0wy+dj
         QavGT51X0KuVU/kAACKfKyP91UHLUQSJId1tQAdycHHgSrNCbbSSeaRpdNhByubjwnDY
         UkM7y5Xuyaf9Kx7zfx3/3D0VKvTOb/QG9pEiK6BlwyfCqlIImdjeEq6zNqQJmSkZYrl+
         WScY87/PYXZyHk3gSmbPBMtQuQrjdaojdGPqsjvHLCc9qKeRworWHfG4ICP5FAOIZOkU
         K0E8na5xgwOU+JE07UuDck8Pd1JltmAdbCE8kXyDBvvKdGiv+BdqoghLTw+UIdqFuYLb
         7NIg==
X-Gm-Message-State: AC+VfDxdtaz2aAH5paravSwSYKhB9QAUkju8Stde5Ga1wkznRmT840A9
	LGR+2pOHa9ns+Gbw2yPQt9k=
X-Google-Smtp-Source: ACHHUZ47Zm9YzAl5ayUCbwcJFjkaPyyE2BXWmp5Z67ZX1jS+IzwK+7QsB4Y22Dg5j1HRICKm3Dk6Gw==
X-Received: by 2002:a17:90a:9f96:b0:255:5d65:3a86 with SMTP id o22-20020a17090a9f9600b002555d653a86mr4036130pjp.8.1685491140437;
        Tue, 30 May 2023 16:59:00 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902989100b001a245b49731sm7112444plp.128.2023.05.30.16.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 16:59:00 -0700 (PDT)
Message-ID: <4cf3b389-fd01-d8ce-0dc4-369efbeb8d6e@gmail.com>
Date: Tue, 30 May 2023 16:58:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/3] scsi: ufs: ufs-mediatek: Add MCQ support for MTK
 platform
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
 cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-4-powen.kao@mediatek.com>
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <20230530023227.16653-4-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165903_588631_15AE7A0D 
X-CRM114-Status: UNSURE (   9.68  )
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

On 5/29/23 19:32, Po-Wen Kao wrote:
> Changes
> - Implement vops and setup irq
> - Fix pm flow under mcq mode

Please use the regular style for patch descriptions and use full 
sentences instead of a bullet list.

Thanks,

Bart.

