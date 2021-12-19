Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC08AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxkYBAqGzBPirBSMQm8ZeAyCXkn1NLwtd9STIN9/YG8=; b=QjeKbynUX001Ts
	kc1IvJmO1gn7BhErOPStb3+gpYse6EKMIurpFUwYdCNWQ/9yzp0tTgFNpVipBCo4l0aAEXF8T86yg
	wtHYgyycdalZbiS++bzxkL5RS81RFE6xImkNj3bFgtUNpaert60PEHZ1kvKtmjI/gXX/Q4kWYy3b7
	zSEootXY6J8i3MbXVKSg8LoIs4OgFkYc2EPvwoxqcgVYXeAi55JX/QMrNeOyt9mz3dNcplfx6JWKr
	RqDWfexJgbDnZX2LVjAsySwVPawMSanBUyxv7Vn5OOj+JuVfz0duvXRWsp3IJAq47EdiQn2GAWsfW
	IQSmcOtWFIK7qkqO3uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mytDM-00FfXQ-BR; Sun, 19 Dec 2021 10:14:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mytD8-00FfV8-V3; Sun, 19 Dec 2021 10:14:36 +0000
Received: by mail-lj1-x231.google.com with SMTP id b19so10874340ljr.12;
 Sun, 19 Dec 2021 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hKGb9w8KG5b73eiq1K1JTU4pcyHL51jKG9VctVhGJnk=;
 b=f+V0CkkhnztRfIT54g00ZqQAvSLl+KO47996Tdp/Xbuyp/BONbEN3cUVfOPuFaJ7KZ
 A/fPHKlM3X6cBGT84cxhGyZzyiUqF8HEnlsJf1zX+kfG/mwF1pU72FFqtMTt6+pWaHEX
 gPEhgcmuPqwrusKFv7FErNaiV6tv8Z++YdmFP0zbJBHFr7Ym6/hJFcNzRPc0zfkDpP1h
 yLC6rvgTLv+1qNnFCckatJavDMIa6+WWz6JAaYUUKMf9m9bp+s315BlSd0lSb0rn0MH9
 bA/QqiOLzIR+MvBhwijqjcQy9n/05vmG11m3WknjOxBTALlcZCKMzb+0EzI+iFGdQf6p
 V8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hKGb9w8KG5b73eiq1K1JTU4pcyHL51jKG9VctVhGJnk=;
 b=dWQ1qp5sNux6DhXu9kmQ2nEfHsRgtZvPiFHSz8lNYxHijvFrsUrfIRDgLXHtbN7thk
 V7DyYe2VndOtHgGhYgcupzf8YAwd5z2x3FgWqNCpbN2VrPxDkNyzL62PS7oCx6s5uZ7o
 ScKQh86ac/mseHHgT1tPG0DHANQ6KdiJ5yI7j/XMOfbWB++22ztqR314HKSxemXRsZ/Y
 +xZaZ/KifL4NoE2UkEwXQmHTAhwVcKsz37Y0M5UC6XFTA+26I49HMEHPq7Z69MiosreC
 ZOJwrMqtPQR0VQWQtGDCk1HjBA9igMAp6IReJyFLGShFgKDuCH1osDF/UM8sV82n/K9r
 Cchw==
X-Gm-Message-State: AOAM531im7/PHWVJFjqKL07OHy1OYsMS6H2bMiosOZD63KzT/vCZHJjG
 OnLMZOEJUGLxbnywJJ8UWg0=
X-Google-Smtp-Source: ABdhPJw2YSsSu09c3sO8K26eMzGbJwXH2EBNbCGZHGfeNhI3hKtXngb2r9yWYq4379t6U+LBk27HEQ==
X-Received: by 2002:a2e:9703:: with SMTP id r3mr9953312lji.422.1639908870993; 
 Sun, 19 Dec 2021 02:14:30 -0800 (PST)
Received: from [192.168.1.100] ([178.176.77.193])
 by smtp.gmail.com with ESMTPSA id h17sm2009168lfv.62.2021.12.19.02.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 02:14:30 -0800 (PST)
Message-ID: <64b9453a-84c5-8d41-26d5-698d1ae9d473@gmail.com>
Date: Sun, 19 Dec 2021 13:14:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] usb: mtu3: fix list_head check warning
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 stable@vger.kernel.org, Yuwen Ng <yuwen.ng@mediatek.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
 <20211218095749.6250-3-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
In-Reply-To: <20211218095749.6250-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_021435_079495_E2DA9F88 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18.12.2021 12:57, Chunfeng Yun wrote:

> This is caused by uninitialization of list_head.

    Again, there's no such word as "uninitialization" (even if it existed, it 
wouldn't mean what you wanted to say); please replace by "not initializing".

> BUG: KASAN: use-after-free in __list_del_entry_valid+0x34/0xe4
> 
> Call trace:
> dump_backtrace+0x0/0x298
> show_stack+0x24/0x34
> dump_stack+0x130/0x1a8
> print_address_description+0x88/0x56c
> __kasan_report+0x1b8/0x2a0
> kasan_report+0x14/0x20
> __asan_load8+0x9c/0xa0
> __list_del_entry_valid+0x34/0xe4
> mtu3_req_complete+0x4c/0x300 [mtu3]
> mtu3_gadget_stop+0x168/0x448 [mtu3]
> usb_gadget_unregister_driver+0x204/0x3a0
> unregister_gadget_item+0x44/0xa4
> 
> Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
> Cc: stable@vger.kernel.org
> Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
