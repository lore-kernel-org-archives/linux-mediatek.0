Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2961DC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:46:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7974422248
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJZKqdW/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COyIxDdu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7974422248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F5551wSB47vRh6mCNjuBvqykjXIJiO1lMCrWeQrgxHk=; b=oJZKqdW/o/oyYWNZny0Jgh1Bb
	XE3r6/nyY992iRdKZ1yz4JA/qdKbeTvz3mvhI7TtmZf0iOFE3l+MUCvzFv8/UpS8E1I3LP6sE7goJ
	035RmE2Iu4Ur9710yZcO5UgexvaqKOwSqbSkyhlrbdZD+QSYnKQ4DIxcivWM+aKxzeftE7WD6R5gO
	9dQimI1UnNQQNz2Oq75LizWBefmVjAE+9jRs1rpmr6O7OWjGXwAQtC78Q9arOmrlE6o4mtICMwtvT
	HEF1PzsSsTfyDnd2yJQEguDGvt4q/H978tri9Dn/vuNV2And8BigELzO6v7gW1ObhXH6S89pIn+hh
	3KGZzIqDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZOz-0005xn-0E; Fri, 27 Nov 2020 08:46:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZOo-0005wk-EL; Fri, 27 Nov 2020 08:46:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id d3so1310870wmb.4;
 Fri, 27 Nov 2020 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dteSsltsDU7xAS3rAuXjux0r1sR5UkBdeacC7b6kchY=;
 b=COyIxDdugmKMcB43JOkCzjpRaHtZoJu7EYxxlLRQwh4JEGiSJ4h9uJF6Sva64iKi62
 SxmHtJYmsmGfXrZGQ84Sq1jVY4f0t1BPKVwQYFpa8/IbK1pKg2TYu/kyLKUkrCO14RDU
 a0vi6L9bCs+BhJh6N31uXzFumqaik6gXg6acKCvUrAEQ6lPYsfMTv/i9D7K9j4Fwtc9a
 xRQvXan7+TefaxvzVxB/z8L4Hs29f/9DUlESQRrU/RSn+/Y4ZGixXYqKr+4/eZABRfNN
 xmiJBpfaa3EiWAWrKS/SlUkNygwHWmHeZyXpfmAM/kvxHCdKIYobC1fZgI/Vr5jBotS6
 sTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dteSsltsDU7xAS3rAuXjux0r1sR5UkBdeacC7b6kchY=;
 b=KPkvmlBfPdK8sAkA0LbTYNXdN1jIhFsrXr4NqQnjjrGOk0ma74jY7GWsanyAUu65Uq
 r9DU6AeDwE1IwBkKphlwFhcuGAaqS0/XdXVA3g3Tg7xUlDllMr5TlIMQ6su6v6aG6Egl
 gBVp/OrCDV1XXyB5zSNHC5JSc1UCnYtgtlbE+F4N2JOCP2EkhfkfcQE8c7tgquJovBnj
 +h6sGKcMGcYnYijretboAnzKvl14mCB1tWp7z+D4U6fsOLzzkN4A7Z5mqOYRxLD+ZlK3
 Q2N/MXbXvsR33K7bkSVJ5F6Zbm7/LTx0X5lP233LQybF9VEHfsCc2SzSHP+kvhjlZpA7
 rTeQ==
X-Gm-Message-State: AOAM532oXub1BWc5oP5nno8yBkrRNQ6JNEbdc5nL+zqJ2KBha8PWOjli
 HItehlfVNffgeBGUIEc13/k=
X-Google-Smtp-Source: ABdhPJxYqiJaw43WZKooJ2W4WZivbk/XwYkCOjkMwWPpnfYalcHw8FEoQ3XLx8Tv55clh2xygtpScg==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr7851464wmk.0.1606466797131;
 Fri, 27 Nov 2020 00:46:37 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d17sm12870714wro.62.2020.11.27.00.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 00:46:36 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: dma: mtk-apdma: add bindings for MT8516
 SOC
To: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>
References: <20201015123315.334919-1-fparent@baylibre.com>
 <20201019211634.GA3616126@bogus>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4e7974e6-fd47-f1e6-9bf4-bd9762033c2d@gmail.com>
Date: Fri, 27 Nov 2020 09:46:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201019211634.GA3616126@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_034644_295924_66268C1B 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Vinod,

On 19/10/2020 23:16, Rob Herring wrote:
> On Thu, 15 Oct 2020 14:33:14 +0200, Fabien Parent wrote:
>> Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Will you take this patch through your tree or do you prefer that I take it.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
