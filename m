Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87007C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:57:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F154F61931
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F154F61931
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JrrVNG3zeAjY6TjIVotGWnU86fo8bX1lrtaXA4p68D4=; b=Iik++QUCC4/CZDNGE3nM5At43
	40o6hiplNviBAHTFSR0goTu8daOZkmtCwsG0UyHQ1JxeLO6oFnfcWtKi5j2LcWx6xuSP1bjZKVYQQ
	vwg/p8KUtyicPuXb9xeRs+WlK2OZJjX7gv4+NNxb0ctMK+C7pfhN2jJZ5MyZJcsc5PBmOOKGMsmeS
	kkt+rw44Gb0L7nDHDYg/UdlunGBMR0/htbHJhghOKAVoKtiU63sOnkkkPI9cfsPviJRC/5RrZOIiq
	PmZUZbjNCGMnOm5otjP9bNlIkMF59e3qq9xAF2OUdHGQXOfj3/HBzv+aU+hJYNuoTukRQClZPWMxS
	BHZMTkr5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGNN-00BCtG-If; Mon, 22 Mar 2021 08:57:29 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGN3-00BCqn-RO; Mon, 22 Mar 2021 08:57:15 +0000
Received: by mail-lj1-x22e.google.com with SMTP id a1so20072078ljp.2;
 Mon, 22 Mar 2021 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RABOW3vLVSon7z+xmw1AN4LsWgRUfXSREm0MZvyOp+I=;
 b=uV6+VtLxkVleYOErjwhJ5y6R+uh1cg+P97eZ8ERs43LvVp1a8SqmKFZ+gN0nfJc0UK
 y/6EY61Q9K1E5nlnYl0di/a/zhZqCTdV/X/EYI4IUhlWMW44a6aDlrhXUOJg2rnGGUp1
 OuQI4r0pqDXLYIzomIhuvzUnonSuC/Lc6L2rPXZcSqH1EOTn2b/X4v33mBvuBSwsVln/
 l33ydwoYJ3xAgQwHqYy8jZVyT65idAyHvbl/vFmAw3/6H3ZQlxDTuUacvrnB94lhq+jG
 DlH/zfXT8xtv8pJBSCUcUTLBMFvJmCT3ym7DybSnbPZW8EJF8z3fOpulcexvGEYzmt9/
 Lz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RABOW3vLVSon7z+xmw1AN4LsWgRUfXSREm0MZvyOp+I=;
 b=oYZ2UmprbcyKnUIKzts6xMP/czfr1UErZjvNsuAPALRy1D0VXCe6ubA+LB8KGJIRew
 VQOPANRe8T0WTn8qlnYZ+u6YUVIBwcdJQ2OpIvahJL+vmjRoSocsE5s7JSRSCBlbqUYu
 7ZDPOHKPJvHi7esy0PrKHkiBPWyZp5DVXwBtbTvAXWQjZWVk9wI+OrA3Il3ded4mGF5B
 d3FEUKGKYcPXkMYJNJp3BTm5rP8pslWKxnLEfIhDsaX143/eggykx6Yxh0EpcRYTm9bq
 HcgQnqNPGAtvqIno5t3xSf/722q21t131EZMmjBFJrMQ3iKYmyTL4U7fXmia7AssW/EM
 3mmw==
X-Gm-Message-State: AOAM5307AXvTSYjGYfGCPRRJmYmOk/fkGN2DSN69d2lwKg7Od4nLnKuO
 uxYVUzaUMjDdxj2/c5zD6Bs=
X-Google-Smtp-Source: ABdhPJy0T5rI4v4i/DWJYPXbO/RLuo0lOwhPUhWCMlZCVeRpkurmIMC/GJRMw+xJXkrg6C7lgCcafw==
X-Received: by 2002:a2e:5315:: with SMTP id h21mr8697762ljb.299.1616403429065; 
 Mon, 22 Mar 2021 01:57:09 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.3])
 by smtp.gmail.com with ESMTPSA id 68sm1494178lfd.9.2021.03.22.01.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 01:57:08 -0700 (PDT)
Subject: Re: [PATCH 10/13] usb: mtu3: support ip-sleep wakeup for MT8183
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-10-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <47c8e339-114c-9693-222b-173e54bf298e@gmail.com>
Date: Mon, 22 Mar 2021 11:57:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616382832-28450-10-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_085711_436643_7E1A8BB7 
X-CRM114-Status: UNSURE (   6.34  )
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

Same comments as to the patch #6.

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
