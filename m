Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE65C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 14:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F1220738
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 14:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoZClcq2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI5v++3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F1220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iOgOGi0XOrDFuSF/9ZJYVj9deQrBEL+h/rxOLXzszI=; b=SoZClcq2VVBM618jqwQRIidKM
	a7WQKoik6lvsIUsNwqxX92P/BV+4Gv/AtE3QTMOGbW5+f3+Q1AhrNvJRaCt0OhBAe6xuCFmE3j03i
	yLFmgOvPFVsYxRa85NF4BpEw0apGaHhbb1BDXE41WLwypaJmhmBGsg2UH4Oz4hWiywIHVenIfOVnB
	xvScIM1YGm70JJcnoDoyHWMukNMqIMW+6VjVuw25fbogAubRzoW7jf2pE1drqIwVv2riTd1QY+S7n
	fTLyhSqgpev6+VLED9qZGdr2R1VJD9NAGf/BbtFglzHRt6lbohWDW3H5AZr/qe5b2qSTZxAWE1E3b
	9xLEtsfuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9Ek-00028k-Rx; Thu, 29 Oct 2020 14:49:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9Ei-00027r-G9; Thu, 29 Oct 2020 14:49:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id k125so610638wmf.0;
 Thu, 29 Oct 2020 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7LxGB+4TzxSwVyjXFI/dxQ/ots0EBgGdDrOnwPOGE50=;
 b=fI5v++3aJrQpBna2g71POK+3xT5hPm1jtuBc4x9ThYPVLzaN0VXW82bFNANs0sPxMT
 0dNv9+ucEb1qTo8b7TZItQFbMkMmXbSQvdL4z02kcIfUvzQqNahsMlOkKzJ+MJByLg2A
 uH5m6FSlyNFRCCT0+2Pkuvs0Tx9OE97Mntzk6tTPbBl/Kdf4C7Qm5Z3poNf9YETwlabv
 r5K2mn3KshSbZJJH7OWbjTTMifIcWz3l/rnvI1DfraelzxxSSN7UsipSWPWsrwuWCRet
 Gi74qF5sUsTZPcFb51Xy3HAt6s7JV2/2QAJlleJivMWjgbV4JmFSzy8yAmksY+DkEEWl
 nhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7LxGB+4TzxSwVyjXFI/dxQ/ots0EBgGdDrOnwPOGE50=;
 b=ZA8kcu8NPOUmfaJuVdLpGPteZHoLSymd3rbFjLzRjD+H+miBaaQVY2ff7k2ECcl+y7
 EBRG91IjKwvkzBdw287J4x116iAQ85bQe96WSzx7HLJObWfCRH249dgU+209o9q/fF+d
 lY+mrVylqxwot/K5XhjTMe2vfi871ri0c+tu9F0W6BKt2kKd+IBpAiPxuhTfYkQl0Aip
 a96zRuoNrfoETotkJfTtVL392M5zKsEjsTJFZPXGxn/Qi/yBVyoU6QPLuWIAajm3qHHD
 tec6h9bticqLg/TkDsT/Qqo+w0TqIjlB39i+c6EP5EVF9bMtPEpShZZGO46b1C9Dfaht
 WUew==
X-Gm-Message-State: AOAM532XhObGSe3KSosP+kQMOEzmi/gL3uyD7VdOsdJnHdsdF8ir6Zsl
 J8A9/5O+tN4R1OVsFZ7/nStuVeA5oTMCuQ==
X-Google-Smtp-Source: ABdhPJz1xOk6azYMfY85T03vlOEwaB8b531sFm7G47+zg/TrDlsfj79wbQgWg1vlYCn8rTU2SMAoYQ==
X-Received: by 2002:a1c:9cc1:: with SMTP id f184mr174039wme.5.1603982946602;
 Thu, 29 Oct 2020 07:49:06 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id l11sm4995833wro.89.2020.10.29.07.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:49:05 -0700 (PDT)
Subject: Re: [PATCH v3 05/16] soc: mediatek: pm_domains: Make bus protection
 generic
To: Fabien Parent <fparent@baylibre.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-6-enric.balletbo@collabora.com>
 <CAOwMV_xJez8WB=XjBSWfRmQ7x6265+2iJ+nLN4BR5YjoQzingQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <57c0aaf5-9650-a0ad-1cbe-8e89c2d9a669@gmail.com>
Date: Thu, 29 Oct 2020 15:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAOwMV_xJez8WB=XjBSWfRmQ7x6265+2iJ+nLN4BR5YjoQzingQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_104908_558329_35142750 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, weiyi.lu@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miles Chen <miles.chen@mediatek.com>, drinkcat@chromium.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Joerg Roedel <jroedel@suse.de>, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/10/2020 13:57, Fabien Parent wrote:
>> -               ret = mtk_infracfg_set_bus_protection(pd->infracfg,
>> -                                                     bpd[i].bus_prot_mask,
>> -                                                     bpd[i].bus_prot_reg_update);
> 
> [snip]
> 
>> -               ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
>> -                                                       bpd[i].bus_prot_mask,
>> -                                                       bpd[i].bus_prot_reg_update);
> 
> Since you got rid of all the dependencies to mtk-infracfg.c, maybe you
> can also remove the "depends on MTK_INFRACFG" in the Kconfig.
> 

We still need that file for the old driver.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
