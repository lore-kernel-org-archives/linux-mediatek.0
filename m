Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9241FC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:25:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BBBA206A5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/yzaIEr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUrPGKMi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BBBA206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2CqzDUEz74sn86M1PEvYYHEfcVPHWURNJlu/d8vHW8=; b=q/yzaIErpB1jH/+gHEIdOd9en
	VpPxnOsBjeppvwB91pTmTDONdfLfNf0n7e4ka2qxLuhlMPqqQ8qOgkYavWwPwO46NxdJvmu080S/e
	A24u26pw1UPEQnsug2t5MZoUx0LAybbgKKbvA5Fmmcdd1C19oA1EGfFH0D80/L02cHOqAXCA77v7Q
	uHEaqsnKtyFHR6afXXzwfsyB+hj8oC9WLaH1v1OgBkRXotXYLPnWCs9MBaYnwiyA75O6FbY3tqkvT
	9ZwAoUFIKh8ccxBd4mwRWE2GyssaqGjwZXfvmWhdTZJ52s77utU90F+JBVytuNwGZ/MME0NwIGeiE
	AGrwqCubA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHJH-0005d0-2h; Fri, 02 Oct 2020 09:25:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHJE-0005c8-OO; Fri, 02 Oct 2020 09:25:01 +0000
Received: by mail-wr1-x444.google.com with SMTP id w5so983301wrp.8;
 Fri, 02 Oct 2020 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YE4BkDw7pw/Lfvi3q3uojYvMQTaYWdQVRY5SQ6Mi1Ao=;
 b=mUrPGKMiUAmjG+PhqFAmc9z0VK3qPvIJBYwvDOoslO4rjp7rgCOuTMR/6cSXC7Li2c
 XTZeIgpQS8b/qiWYQckr1/Mzy4LxKyBkCxqFFk3FTGWV/hqfFEDyJl6nPUR0A4CGg8Th
 hNEOcXPFRNjGa9U7+8erdb9mGnP9wfycSKV6d+RoDYVSe91Qh0hsunWjRnXFegduip28
 OMCNwUNJaLccxPXKhXWSnECceEWQLxrGn7xe/27PiedplhUtO1nfAQegAUQ1aNVFG/Nu
 WJ8FKGe6m2LQBV6Gm+7+ThrFokVI3PRv59psUeytbdvl8hQLGBWzBSSpkqMUoVNldj2O
 Y1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YE4BkDw7pw/Lfvi3q3uojYvMQTaYWdQVRY5SQ6Mi1Ao=;
 b=Sum1+sLaKuBYucv+ycexZa5Os3QDDWpvzJGyEdj4CMuZJ7+y8or+/IAhXIOB2JS+BD
 t2Ie+ifPCAVyAlbHHN6+zNUo3ykmFsHj1MyV7jUAxQXQ1eoyajmFhI3lhreAr4lJUFdA
 W4/vlRp0x13HwcFfpU5x+gLkrxwq8ny7E3cYTxg71xZWYYSi4l1tQ78/A3fJeLZreecV
 eYaD3/2j3Qm35pjdlVwQfnjIEEN6MLokVopc+M4V+/wR/x6SLgdkK7QLDL81cYSfVWrg
 Uaah7f2N2xc3z4f8kpp8dvVwzdaLFz9rAcF1P+Bj5THt9dNPxMTkJ+PCHRXm3CdoJ2Wf
 b/FQ==
X-Gm-Message-State: AOAM5321UokB+slRg+gkdC2KlF20mNP0t1yMi2QVUhPCLbg6aOi/+Kd+
 sL3JBQt5VPgMv7Seq419SdCF1LVoLKYb3w==
X-Google-Smtp-Source: ABdhPJwNA4+A7fKCkNGZHL+rhL+nYYhSFgvaLDQ4qJT9xTAGZYLUGRJDL/bSHZlFrrEHdRU6xOvXtQ==
X-Received: by 2002:a5d:5512:: with SMTP id b18mr2069353wrv.229.1601630699671; 
 Fri, 02 Oct 2020 02:24:59 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id v9sm1187338wrv.35.2020.10.02.02.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:24:59 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] soc: mediatek: pm-domains: Add extra sram control
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-8-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <564daa4c-c8be-7743-a2e2-a29013b17049@gmail.com>
Date: Fri, 2 Oct 2020 11:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001160154.3587848-8-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_052500_825128_1C83A063 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/10/2020 18:01, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> For some power domains like vpu_core on MT8183 whose sram need to do clock
> and internal isolation while power on/off sram. We add a cap
> "MTK_SCPD_SRAM_ISO" to judge if we need to do the extra sram isolation
> control or not.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Nit, split readl(ctl_addr) | pd->data->sram_pdn_bits in two lines.

Nit: si was done in 2/12 :)

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
