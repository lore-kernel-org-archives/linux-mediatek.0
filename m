Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omTsH3FOMHYEjGFD+gCcbVuy8C7mo2jGYyPptDLku+c=; b=3+xNi6W3hKImbj
	OrHSBeXDjoZqlMW+VuFLOgjXe4YNV6CQ1VOQ1sEETllH6vSDhmDzteia5yiTRTuZMZj8u41aNWx91
	NGuod4KGTVkvJPuHRZ0d7+DZDtFfpgo20RAeOWmBAaoCW7MpFndvJ/4aNFMwSzPF3PVTJbQ7ncN8r
	gzo2iIzrPI6gaLEA0tyV6B7gwCJjkXkIlQzPL8//DWJ5yWr58PRey+ne8tq2BLcgOud8D0Qf2R7wk
	PgOWB+fw0keCS3aHLof9r2FuZb8lc5yNzoArodZkyLqnfTOKi0mofoto+pmDcx+ElSGYh2QBldvmV
	0Wq2sfmuueHWk/zJ4Isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkROe-00BWBV-1K; Fri, 29 Apr 2022 14:15:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkROR-00BW8F-KX; Fri, 29 Apr 2022 14:14:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id k2so10981499wrd.5;
 Fri, 29 Apr 2022 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sQ5hx/1I80/ATcVuz87Z3HOb4p0v8DYlIUMYGZsRBdE=;
 b=RACFG9W4y1wv3p+zbZFhkum5n/4ZTluBZlNOC2uPxE0Xd8towmfqbrb5IXc31ssgnk
 hURf46bg864bZzE1QN9WXiUNh5h5qHURE/BUTuebAHu41AG+agtJW+16DuDKpkdg+5P9
 IHnSq0JJUXKj5wyWzjqbgeLzgvTFsRjxugejt3SYhJdzL4FwaAILDCbFi+B21LFTArNu
 zgPqevjBAYbJ8mK2+0HO9u6sxmLQIwc8byjWNJQ4t/DOUK6+9xWH5DP1oEt+ExN21Geu
 0I0sqOVtVQJ9FNre7yDi9DHFX+TGygCjduVm+MHQOeAsfgSwS+wj7mEU1U0SyJleEd+8
 NbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sQ5hx/1I80/ATcVuz87Z3HOb4p0v8DYlIUMYGZsRBdE=;
 b=5fg9Zy2E+6WG/8CNvk4HET4S5j3Rc+O4Gm4gtmf4STrFEOIY8Oq9kWYEIuR7MAm7jK
 3V7UcgnpD5WHZefrPPXQVr80vvdpyAtJmuB/csudzdLgqEvUB9dg2c86rCEQTjJjzImB
 zEqhD/2xTlcSSazXcqJwB7r3OaIjuvNmzkSr8iN84akc+fwZ4l4mk9pZqqoglPspHbsQ
 4yQSAKn0xizfbtWqy+MOb4zw+V9qUaJAIABkIqlEMxfylpuGVgWYs8hErdy0+ssTyw/E
 Un0gOk8vlwDmTFQC1nER32urzNpid/+nCWcDNs80yh1hvkpqr2Gdt7I9ITnh4Zm9ep9R
 KgRQ==
X-Gm-Message-State: AOAM5338n6c1nnYJu23ukcBEV74Lli9O0oMf5PI6zdfSeuNfS3gsRl7O
 +VLlkJis0sVAgostR1t6ipE=
X-Google-Smtp-Source: ABdhPJzfaiRae6b81cpv7KrZwqL2m0bvOQN+hU568QRVAx+NHzEwcPmDaHwUvwnLn2Ga2HrNJxJ7BQ==
X-Received: by 2002:a5d:53c1:0:b0:20a:db5d:2590 with SMTP id
 a1-20020a5d53c1000000b0020adb5d2590mr20417157wrw.411.1651241684047; 
 Fri, 29 Apr 2022 07:14:44 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 n2-20020a1ca402000000b003942429cd1esm917859wme.10.2022.04.29.07.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 07:14:43 -0700 (PDT)
Message-ID: <8eafa7d7-511d-bc05-ad1d-3542d17c073a@gmail.com>
Date: Fri, 29 Apr 2022 16:14:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt7622: specify the number of DMA requests
Content-Language: en-US
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, daniel@makrotopia.org
References: <20220429084225.298213-1-rsalvaterra@gmail.com>
 <91d8eb87-adf0-da62-0c7b-dbf94442f535@gmail.com>
 <CALjTZvYdvGrfjTWaP=LjX0UGJPJVxuF9RtgbneDwu7KCnSdtJg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CALjTZvYdvGrfjTWaP=LjX0UGJPJVxuF9RtgbneDwu7KCnSdtJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_071447_740015_6759B1DC 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Rui,

On 29/04/2022 15:05, Rui Salvaterra wrote:
> Hi, Matthias,
> 
> On Fri, 29 Apr 2022 at 12:57, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>> Applied, thanks!
> 
> Would this and the cache topology patch qualify as stable material?
> Intuitively, I'd say yes, but I'm not really sure.
> 

my understanding is that these fix some warning, but no real bug in the sense 
something does not work without them. So no I don't think they are stable material.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
