Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BpF1dBZybqSKBMRYRxOgp0Y6MxyGJPd7Qd+/WV3uqU=; b=vKvCkn2gHF+1ke
	sx3XwKqW2iCFzA6yR/V+oZHN/+OPoOUHDaHxHn6eo1b6rutV6RakKdCoNBY3PBGtFAfUtU8I3wqcu
	BeXli14lTkB1rFPPldbdqHWdRjODxdvaSbp/ShTSc04XYWxgNBXO/hJehlZsNTtA+4s+50HOUpv4q
	g9jFL/TGMf8VOUjrLvzOz9rgJQ8XuBAPYgKncp3QSeEWA8uWXp2OjYtyOCTGRnTK2UQdDSv3ULmxR
	O2r1cZuN1bLQZQ+zLq9A9VYEAg1csc73C3bjnCBKscSIY7I0ZZYcCnm3KetrlY1U0T62VuYcfb5FW
	WvUJoJdXy8pkFdc9Zy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxNGc-00Gl89-3C; Wed, 15 Dec 2021 05:55:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxNGZ-00Gl6N-LU
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 05:55:52 +0000
Received: by mail-pf1-x431.google.com with SMTP id u80so19745682pfc.9
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Dec 2021 21:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=or349biYLFpL+w0ZA3FfJe1BgIFAwbYkc2y2ZXxAeHw=;
 b=kDowek4cSSKDkV4UGyJuXyqi5JIWAReO4OxHgYeFCA2HgFjEt1CmeiAM/M29ggFdWg
 zDA/vFKSK9uddEPsw6wgIXwmAHpCHwIGsC3J/1ibKr0pCY02/gmpC/7BEgpLr/c4ATlC
 L3nLg9A3lMltpboAcgF5Vbiohm/XRqfAc6EERoIOQoo/W0TrNgmv4Sgo3e6xJjP+J/19
 4hBUComVDTtx8ThzXRwuIHX16u61zSn3cVAorIsKN+qBdjiiNhlbPIqoOlNh/vYW33HJ
 9LaKqv8Cfwn8Hk4NM7gRBQU/s3wspmVc7BIW1GQm67V9cop79vBDzKcQPPSZmi3etjlo
 An/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=or349biYLFpL+w0ZA3FfJe1BgIFAwbYkc2y2ZXxAeHw=;
 b=1cwHrDA1F6K3ymwjPp8ZblN44rQsRjA5q4uhbLaqbLi49gk/ZWqK+PocrG+BIaIJrG
 r9vRTsp9yVLWxY5FI/X6gObEU9sax0LwiEMuu1E1Hpm5+pcgX2QCyfn1ZotTCfjLAt/k
 tt2bWYeupMQhB3HGLI4TVQwrUHm9UCSxe9bBkpw9H7/otKoC8nzIKmP0f2SlrN0ETGgK
 9f8YVBCq3AcsOKAgZrVAyRl7bKqtKtaXnDLFvWhcvPO8NXA8NmJOMYtyTg9UiaO7xrLA
 qXBU8WNrkHJKT8KVHlMhq5qjkfEpcom2UAgfkIlcPxjo2r/fxzMXX6/T4LzYf4fj3P1F
 VYYg==
X-Gm-Message-State: AOAM530lVL2k+5JA62tGYnrK0yPSCf0II+7khrMOP/cQHVS5RI4TCNRa
 6FbDutMNR2TdWCyXcPGWOikHXA==
X-Google-Smtp-Source: ABdhPJxJk9jvjtHfRNmilmy4wTT3wZeaD4iKsJSZSfKzYHurbYvLQ7MyZFm9b5pPFVNOYSjjm5goIA==
X-Received: by 2002:a63:102:: with SMTP id 2mr6802124pgb.311.1639547750606;
 Tue, 14 Dec 2021 21:55:50 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:754d:1c44:62a9:6d30])
 by smtp.gmail.com with ESMTPSA id k22sm1015260pfu.72.2021.12.14.21.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 21:55:50 -0800 (PST)
Date: Wed, 15 Dec 2021 13:55:47 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mtk-vcodec: potential dereference of null
 pointer
Message-ID: <YbmDY9PbQUlHgyPF@google.com>
References: <20211215052157.94172-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215052157.94172-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_215551_730398_1261981E 
X-CRM114-Status: UNSURE (   7.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 15, 2021 at 01:21:57PM +0800, Jiasheng Jiang wrote:
> The return value of devm_kzalloc() needs to be checked.
> To avoid use of null pointer in case of thefailure of alloc.
> 
> Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

With a nit:
s/thefailure/the failure/

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
