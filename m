Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364CEC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:28:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D892A60C3E
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D892A60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YoK3s1EW7ZS63p/7tS8RD9AudqfTOSt492X1UbQOOU0=; b=FRjTCOBd/aCYvY
	cHVH1MzOUNtRk3Cqguni1vFWypvsiH7ehbEKFOpGwnY5xI0pg1vNcOXs6KIYqWm9JRIXCoCZ0NLpe
	Y1+Rqoyethu08SV2ZVK9u7yCi+JwJrGtea1gIDllHsArhGqTMrrTBNtNA/PFLGfoJPIs/FDZQT7o/
	oW7RtTDhofpqkGbkY2OGguJrT+ytiMvjoiz1qk45CHir5yKLYvcbp0yRRG3lrUJOiW6dIugCggTeA
	9c9GHEK6dKtlwzGjqiL49tfsM+m6B32iq2SnTv9QixWAFxfN/9/C9ei2So0CURsnf51Bk0aNwgHd/
	wdYNszJWP9IgUe8m2mXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaUL-00EEMe-Ea; Mon, 03 May 2021 15:28:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaT0-00EE6y-37
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 15:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=EI6bZyecXV+D4mAvyW1zNE2tx9yP9EY1VWyGEKOhGs4=; b=xlkjrfLY9f8I3YRfmAzxDNeBIs
 4sOcM+Glzg6gfrLTYCF5DPWWBRjwz4SSP5NrM1JxF+sD3iBLP4D3CJyzRXHAyRUyGgi4FULHa9pDn
 UaUDrPubiFo3jjpjaPwN2L99tVcqve5p6CCCW3ZWBBkrVtMUM8yC2TJ3Ohcrz8X0APHvaE7fE2ss5
 Jn5C0nLET4fKZ8yUAzyxkxDOwZvTjDoiWB2UJAUYJnLbdVwREeQTknIIviFDQmX/8UjkF5hTGaP+Z
 w2xwIe05sW7nERWo7CZJl14gnYWgmWG/T7XUwcWLL1CgrKd9GF1Jq/2v/r1iSoMBhYmgckhL8PyQg
 ngmx1BhQ==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSv-003Av7-6a
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 15:26:36 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 g7-20020a9d5f870000b02902a5831ad705so5375867oti.10
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:cc;
 bh=EI6bZyecXV+D4mAvyW1zNE2tx9yP9EY1VWyGEKOhGs4=;
 b=qeuOlliDGX/UXrFBQRGA+wZpGmrZ3HwhDOaBcLLbNorJFBQ4hQ9Q/6PhUtBuNeS8Aj
 au6pVFpGyoJApuOoR9hMvcsM3O/ekucc0pvsmba0X3h/ETYu8raP259toJ+B9EQmVv3U
 noQ0uvWbA3AQWM/Qk9dBt9TfYB86MQgd8kz3agg/3D5fZKr6N1NOHdVpSHKhVHkpQlbO
 GeOcTWWtTFUZMM+V3A3Em2sAhxFybQCvJI/ak4a4jeiX+fIB3AtFhVdTWrFtg63tw3xd
 QOgP2+GbpbYXfLlNvbH5jOyPPPAz8hsNULBRqJWfisA+Pml5+1NmzEMm7R5HvdDBlBGU
 Wc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:cc;
 bh=EI6bZyecXV+D4mAvyW1zNE2tx9yP9EY1VWyGEKOhGs4=;
 b=lTjWk0L9v26XSIgESE2UyzewBTzrhtlFf5bTv/KcBlLQUi1kYsltS4kWO8dNyancLe
 HPZ0Ah2d/XgSjDFfgE9GwNlHui0h8lPfp6WLnutdeT4YUVjpg48rnZLw3LbMsaNCtTHW
 y4MzVkxhMXLNICeHjNQvNNE0Ymz88+EUMqH4l82wlR9mg3xM6zmj6htDL2euCUx3aJnP
 /nkqpo4EA6wMdBEC42w9N0M+F9OZJfMNppVadgzSZ08X+faAfeGV+qxfma3X8tNKOT/7
 PjgP0HvKtuEibKw3dbRoe2T2ST2fOWoEldeU7vqv7x+x6/XSWyZwy0B2T6LSnjl9nROD
 h3tQ==
X-Gm-Message-State: AOAM531NvcBic78mhjEDpVghfZ6dJYFJuiDtTLG/N2k7Fm6Q2GzuCExu
 V8nMtNqLCczZOwxLKI9M+4FLnhow0zNEG5HTWqXKnQ==
MIME-Version: 1.0
X-Received: by 2002:a9d:2f24:: with SMTP id h33mt13304201otb.128.1620055591994; 
 Mon, 03 May 2021 08:26:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 08:26:31 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 3 May 2021 08:26:31 -0700
Message-ID: <CABnWg9scYTkZ242STBop4yXNKsEzgd1gsGoZQzvrurL5nYhUQw@mail.gmail.com>
Subject: [PATCH 3/4] dmaengine: mediatek: use GFP_NOWAIT instead of GFP_ATOMIC
 in prep_dma
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_082633_263459_CCCD83E4 
X-CRM114-Status: UNSURE (   4.86  )
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

As recommended by the doc in:
Documentation/drivers-api/dmaengine/provider.rst

Use GFP_NOWAIT to not deplete the emergency pool.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c
b/drivers/dma/mediatek/mtk-uart-apdma.c
index 249cabddb7ee..4711bec04b98 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -349,7 +349,7 @@ static struct dma_async_tx_descriptor
*mtk_uart_apdma_prep_slave_sg
 		return NULL;

 	/* Now allocate and setup the descriptor */
-	d = kzalloc(sizeof(*d), GFP_ATOMIC);
+	d = kzalloc(sizeof(*d), GFP_NOWAIT);
 	if (!d)
 		return NULL;

-- 
2.26.3

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
