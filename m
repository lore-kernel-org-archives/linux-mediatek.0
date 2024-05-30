Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BC7C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5xCJKQ4ugEjWsoL7YroP9b14wp/Gl8VnioYQ/OGksw=; b=vLgcAB3TeWI+yBt2Z4wJ5+/hTZ
	8obSq0x2yEngHZF/6SDNTq9OKFiTehXZAUm2mGxSuEZhGEWrsOiLt5X8f1CEa1WSOxJZCiGs/PMHZ
	0SqKr7YDl3pXuWNteRjPzyWz2jwyutsfyID9lxfoAQ6JmKzBHEXhNK4Sw+LCQqeBSiR2Ifsk/3WT5
	GPSuAw7Kq4e3Ijx2HQVLiyimty81ejdVAAONgHHnzL2AT6xQhB+2pcU08FM7kuDQliZWNushgkdtM
	zHPZVCWl5+NtpNtPCcKYlPZ/Kq/9FpnL5yLgONT3gIsW9zoogYwZg/VDDGtXYyVLcGOSrgSzJ2vOL
	SBMwFAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgCl-00000007RYj-3ceC;
	Thu, 30 May 2024 13:52:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgCi-00000007RWF-09lv
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 13:52:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-35dcd34a69bso232619f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717077145; x=1717681945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5xCJKQ4ugEjWsoL7YroP9b14wp/Gl8VnioYQ/OGksw=;
        b=Ue+iKt2GI/Lbcba/QO7NsAH2oH9Dreex3ajwC4WTB+K38wFDe4onhQe+VLD91BjpNS
         tXwzQWSl4xobCK5bZXobNQhGf7ZRZ6xQ0BHMJCsJFQQ88s1puUJONJ25OLEh3iIvWaH8
         aB+uIt2MBKnExqr+xi6vSZTenBROQuSGYowyF+VwflReZkoyX9ukK5enoQgnSH7TsoeX
         GIuAp+vvnw7QpT+ELH6Et3jU68iFPeiR+eyQNJ1BsnUM7dsdKViq+zoB/OLwDXWDb/fu
         S3ijolbbrhTyFFcZZ7BYiyQZ9mJdn/hfFVSdAjFQyrHkoAXTG8HM0X6J9nk88HRejm1+
         RX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077145; x=1717681945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5xCJKQ4ugEjWsoL7YroP9b14wp/Gl8VnioYQ/OGksw=;
        b=vFPYDJ2xntSoALx+btQRvTy0E3wSq3oHVtASMkxjEqFDa+FacKJ35hf6d2yRgsFNAF
         l8nR/+e8iTWrNJ4ETceVJTg2OFbu8WdUzo37roaJnSpaG8HQwECPmYVjw3KoEkpQGHDu
         rmQ51mZULubr0Z4VlRF1Uk6MseAWiHj1BCDKC1eqNl9TXqJq5AihiyFYNdYh1LRlUjBl
         YiuyK0OYj6LQlgALsIzCj5UZGFYQ6gcAK/q4/6a0XlGd/t1Pvr+ihFpK9mTF5hHCsGFt
         kRPv93+esEqnVqEI33TqmBYWgLCYSR68P1UDIwqg+fWnUBvKFtk/+5SeVB+jDoYH6jcF
         iKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfeSjxYZVxioV74ccjaVCaTZYhPIAOLnxMXYcHPnt3hIHR6GJV/RWuavRtBobEdrSHthb00hEPHunRE6dlish8pbXlD69pwIxDjqimGqgq7Mnu
X-Gm-Message-State: AOJu0YzIrGJL1A4lftdMsOBpyktHOBgtuaDovlR7RsftQUT874Y6qi4R
	gxZhXGZuZqjkQ468dbYXgyG+YIWlOGs0U7+tgv3AoKSUpKE3GLQ67KPR9HiDRmw=
X-Google-Smtp-Source: AGHT+IFc1suDxNrUDOh2i/f0r05vdv6ugqX8mGy8cQBMw1VGOc/OpcHdjJLyHRt+fpRtRE8s9RTS+g==
X-Received: by 2002:adf:fed1:0:b0:354:f815:8b85 with SMTP id ffacd0b85a97d-35dc02bd8c2mr1521286f8f.67.1717077144893;
        Thu, 30 May 2024 06:52:24 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dbdb6f34fsm2471094f8f.73.2024.05.30.06.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:52:23 -0700 (PDT)
Message-ID: <27d42cbd-5985-4b05-80cc-59ab21b3435d@baylibre.com>
Date: Thu, 30 May 2024 15:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Add a module description where missing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: quic_jjohnson@quicinc.com, mturquette@baylibre.com,
 matthias.bgg@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_065228_233551_1006E1CD 
X-CRM114-Status: UNSURE (   5.43  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>


On 28/05/2024 14:13, AngeloGioacchino Del Regno wrote:
> Add a MODULE_DESCRIPTION() on all drivers that miss it to avoid
> modpost warnings.

-- 
Regards,
Alexandre

