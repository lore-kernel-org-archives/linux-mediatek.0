Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C05EC4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:04:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F73206F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqC5OlPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81F73206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wHn8p8mjYYSAm1Tk0hOfdZlti8uf3C5+cSWXOwHlZ/I=; b=eqC5OlPrvHANND+ywZ3xhnPFc
	aKJP0CCW/+BE1vDHRZEyY5t9a6AFhFqUMk+xZzFGfGt4nVVqSDi+rFN9G8Qe2hLDhBBcyBCvd+D31
	Lqbe0Uwp7PWQiDYGQoYfyctwxaHFGY5PaFvqTG9DkTsknZ9SpTgzJSIhERSzO5vl8+Louu0mcFZO/
	6aEvll3pjcC+uddBoU/e28dIjWxUT5vdsfRT2SYZob4CdrAZvIxo9Lov8JTB1ZJO3SJD8OJeJu9rw
	Bx/4xOohQhYAk9nlzMAim8dbCXcDvyiH+9M73Sw7Sb2IbGDKI7cXtecQvWLKTVcxwEvOjuljq0E6v
	eW5jFzmwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakYm-000499-EH; Thu, 05 Nov 2020 19:04:36 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakYj-00047x-PF; Thu, 05 Nov 2020 19:04:34 +0000
Received: by mail-ed1-f65.google.com with SMTP id p93so2671121edd.7;
 Thu, 05 Nov 2020 11:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zqyCE8j+KUun/fJoeSvUEUCu9rjigk9T/yqFJYAG6HE=;
 b=t9S+OyCsAGXsFjPLYCAFJ/tjYpvMKn/28ckRr1up8IWGdl3Ro2mN+TxSuxiPmpDYUY
 0TlpwGBxqH7mpKa3kbO031XQXQllF4fVrT7Lr8EBqCUZPmr8osCBQWoo7hrKX2oCwZHP
 BFOvaRXnqTzUPYbm4Tsyz/tzLJdiOZuQUcQe9jqpY4j7v3fbi7LxDBwuxKGHmAGuwT6H
 r5OCUsKK9yBa8IVuD9veRJPhL+YliKiFoPFUiXfiXXTF5VOVnOU0OZmRX3RBxKYoYGJO
 cYEG0ZcRISDGFZ5YCaLd2OcU9DlUbAolHmgSihMMnHo5eCdvbtntXmHXxyaNkyy2LRwE
 Gdvw==
X-Gm-Message-State: AOAM5316NkdjqsHFMV3j38ip5jMAWDyhNtg6ftpEHGGiDb8T835d3W0A
 ixg6Amcl1sq7+7ZhNK3MY3Q=
X-Google-Smtp-Source: ABdhPJz1Vs7KZFfoAlojBxrrmYqF0uUmNwhflz1BNcxZt0QGdXEDkjrc6x/XVjVsJtmzvIn+5lPqDw==
X-Received: by 2002:aa7:cb58:: with SMTP id w24mr4093038edt.35.1604603072260; 
 Thu, 05 Nov 2020 11:04:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id k23sm1490058ejo.108.2020.11.05.11.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:04:31 -0800 (PST)
Date: Thu, 5 Nov 2020 20:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 3/3] memory: mtk-smi: Add mt8192 support
Message-ID: <20201105190429.GC217610@kozik-lap>
References: <20201103054200.21386-1-yong.wu@mediatek.com>
 <20201103054200.21386-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103054200.21386-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_140433_831815_EB751E54 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 01:42:00PM +0800, Yong Wu wrote:
> Add mt8192 smi support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 19 +++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
