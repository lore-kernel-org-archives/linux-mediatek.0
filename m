Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA2C83F17
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwJj2XW0Xtg7vWbGRjw0IzVQ1p4FfGBNG+AO9cOWVHY=; b=GkzszDrQ4IoG9+E2R55iUWUIFm
	kJEUJrY01xw9cwOfYnyiShTIrhMF6vhNOJ0+Cv+NTDQ3gdHmlfHbNBHLXvWpvrwO/QyPKqG+646Tb
	WJuyJDM3WH1mGkbebm33PrMaF0pQFAfh/gmmn8LLLfQ8h8jwPmRNUCTknhcewSg7xIn0Urp8mETZI
	/lA7IRaeTv7rZXG8/Lq4cyl7lFdnps3/ptqCd4Mo3aIOWmDEMXbFZRDoSkuSVxWSKVT8NpezAfZ1P
	7XCd7o8GdEA2QRrY85BJgdE4L6CmLLY1dLyvuq9fviDbpFOMZiUzt0ckDoCPirEUDbNMwvmJSUNWZ
	UfCp+ewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubd3W-00000004rGC-1YTk;
	Tue, 15 Jul 2025 10:38:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubd1I-00000004qwO-3eHM;
	Tue, 15 Jul 2025 10:36:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0df6f5758so919263866b.0;
        Tue, 15 Jul 2025 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752575779; x=1753180579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwJj2XW0Xtg7vWbGRjw0IzVQ1p4FfGBNG+AO9cOWVHY=;
        b=R5zQZB9017/A43fWZYlKfMkZjNqeWsYefliJgSIIO2Ms5FcwKeoldiYfTaJ+KlHNmi
         j7qbmxp73qIEX9JFVcBeyIrudHJya/92JYWyvYEQM1p7LHJON4apGKFbPtnSqkA8dQjE
         OKFIV/blEyCZvymJO7GoHBo3CSTPMqbx1MzMgHpkqq8A7lXVFqhxOYxxPYhQquoHyPw4
         qGsxpKGyN2jCQ8hPgKQid6EUotQ9TfFh+bWC9sasMlnx7EqvXaEAoxKCdEqoevDcf+4r
         5My9xf+ITX75aONcFoRybjR6K8f4BKjWEv03DcoWOgeMxm+nJ7KUAhRiJo9XZvZnjLEI
         6BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575779; x=1753180579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwJj2XW0Xtg7vWbGRjw0IzVQ1p4FfGBNG+AO9cOWVHY=;
        b=CqqnzTAfQp+ffKFOx7l1iVC7m818Sbhd/NPz2ZAkBmOizjgO+Qr4EIXd5VxDivriZY
         Gi8v57zhLsdDtqM52HOejzesN3kJmu4pl6yvkdvpBNJ/dFwldxS+VIohSuq203HE8og2
         rRNrVeuVhY6EYA/D9ckdDGVa4kTaEyOUnlrqm74rPgEqugv/2ma66fN+IK/xyczrITRX
         jAcXjV9JYaR5ESC6KWsjcU6l32dfMe4KpSPopMXQgrKOSRV4hegbPSJA6SpHsHttWmEM
         h2DkV3v4xVsFi+XldVyfNoz+JW3L3rQjsYH9d8n1L59YuSiyymZ4N7iHJ8IL0Fm2WsLl
         WDdw==
X-Forwarded-Encrypted: i=1; AJvYcCWLdR6qEwCiCtki+70wP+sOhGylFqwbSaP2CcWLFaJs6UEwo57+8KZaqTLXPxN+I1kjvQXI0mrkr6dOkAnJTJg=@lists.infradead.org, AJvYcCXNq7vpXLkF7/b9EIlEWKJvw1SAT5hoxFNGmtTSEjathKraNuxn7tBu7Ex9PAHdAyC7qorusbIdzIO/L0chRUiE@lists.infradead.org
X-Gm-Message-State: AOJu0YyubWBOsZj1vU1+kj7KqcxokaJ9Czp0gK+o3guOLhgMstyZ+r2s
	eyCqNyxWxDcRJBm6sqBI7EP/tJSi3t/CeZI8bDVIezGvPNbre/Rb3bxw
X-Gm-Gg: ASbGncuZS8Hyp4SE7yYnlrDT4FjieSlBbT2s1fJjvSrBgqTCisVGN8jisQUCJFprctb
	g5qzMwtCfe0epVp2t5fG8rXcjxrRVAY8bjGVA+16V+UfsiI6HSGNB1GxhZ3Okc09LsSrMdCxLA5
	lIE2KbKQZwNlYOKvVvhNrj2d2RySul0DN8j915Bue7a4yeGHB7Ohj+xtM+x3dU6nQJfFePC5XG5
	l0TMpkeqiDA2NAWq5PQs5hg+M9007TuMLBxtLGz//mMyeA/iyoyF58IR4puOlEHNcPiYiYjnHF3
	Y+2n4JE2olfQHGFS9Ht31hcC/MoAw4qYGB0ar5raBBSoLGmlkO4vrQ/cnwajd2oLwV2gopXf4hP
	Up/u7VbK4x90yB5YhnPxcWj3vfg3Xge3OmS7WoupV6Uy/Lg==
X-Google-Smtp-Source: AGHT+IGaK5G3wNkKd0FQXTFLEb3wcMNGQ8G+9vcipY4gHF5O0bM0XfRnvGt5TQBO6UmtOz1kGEnKVw==
X-Received: by 2002:a17:907:930c:b0:ae6:a8c1:c633 with SMTP id a640c23a62f3a-ae6fc1fae79mr1633481566b.34.1752575779007;
        Tue, 15 Jul 2025 03:36:19 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:a4c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dedd3sm976790966b.150.2025.07.15.03.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:36:18 -0700 (PDT)
Message-ID: <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
Date: Tue, 15 Jul 2025 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Mina Almasry <almasrymina@google.com>, Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, toke@redhat.com,
 david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, vishal.moola@gmail.com, hannes@cmpxchg.org,
 ziy@nvidia.com, jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, sgoutham@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com,
 tariqt@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, saeedm@nvidia.com,
 leon@kernel.org, mbloch@nvidia.com, danishanwar@ti.com, rogerq@kernel.org,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, aleksander.lobakin@intel.com,
 horms@kernel.org, m-malladi@ti.com, krzysztof.kozlowski@linaro.org,
 matthias.schiffer@ew.tq-group.com, robh@kernel.org, imx@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250714120047.35901-1-byungchul@sk.com>
 <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_033620_973036_F22367FF 
X-CRM114-Status: GOOD (  25.65  )
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

On 7/14/25 20:37, Mina Almasry wrote:
> On Mon, Jul 14, 2025 at 5:01 AM Byungchul Park <byungchul@sk.com> wrote:
...>> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *page)
>> +{
>> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
>> +
>> +       /* XXX: How to extract netmem_desc from page must be changed,
>> +        * once netmem_desc no longer overlays on page and will be
>> +        * allocated through slab.
>> +        */
>> +       return (struct netmem_desc *)page;
>> +}
>> +
> 
> Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> which does not check that the page is the correct type. The
> DEBUG_NET... is not good enough.
> 
> You don't need to add a generic helper here. There is only one call
> site. Open code this in the callsite. The one callsite is marked as
> unsafe, only called by code that knows that the netmem is specifically
> a pp page. Open code this in the unsafe callsite, instead of creating
> a generic looking unsafe helper and not even documenting it's unsafe.
> 
>>   /**
>>    * __netmem_get_pp - unsafely get pointer to the &page_pool backing @netmem
>>    * @netmem: netmem reference to get the pointer from
>> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
>>    */
>>   static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
>>   {
>> -       return __netmem_to_page(netmem)->pp;
>> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
>>   }
> 
> This makes me very sad. Casting from netmem -> page -> nmdesc...

The function is not used, and I don't think the series adds any
new users? It can be killed then. It's a horrible function anyway,
would be much better to have a variant taking struct page * if
necessary.

> Instead, we should be able to go from netmem directly to nmdesc. I
> would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> it return netmem_desc instead of net_iov. Then use it here.

Glad you liked the diff I suggested :) In either case, seems
like it's not strictly necessary for this iteration as
__netmem_get_pp() should be killed, and the rest of patches work
directly with pages.

  
> We could have an unsafe version of netmem_to_nmdesc which converts the
> netmem to netmem_desc without clearing the lsb and mark it unsafe.
> 

-- 
Pavel Begunkov


