Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC86C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i00DCL7LArMdrcvWGazqRQUXotNFwoxDDFzCPluiP0Y=; b=by9ai9pRocsRdvVX38tQ7sqrNC
	OtJ+3bYnUIISKBQ1mcX/393n3bW9FXGm7LkOGWIXLmCWuGF5jfmX6WfAa9dVqq/5wmus8l6aTHT1K
	sDWtGqMINds3OMrOJqc5ZDZL8uNV62eBiujhDv3RN6bt1TNqjxvH7AK0zvpgihVXwHMyBTv6f2e+J
	YectXnuHCXbT0JgwyHnBaAPfSP1CqGY2P4Tb5BosPrYvy4u8tF2nqVxtyg/t0nrl0MjnPOTPSs60H
	+jbPttX95hFkws4nvU8hdzlhGGI05GyTJXpE3XJxXWD4WGvvjEps2NiBFL3IEXQOhldp3o90AIXa/
	Nb2CxWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL6i-00000009l9q-0qew;
	Thu, 17 Jul 2025 09:40:52 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKoW-00000009icO-1QNx;
	Thu, 17 Jul 2025 09:22:05 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo1174217a12.3;
        Thu, 17 Jul 2025 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752744123; x=1753348923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i00DCL7LArMdrcvWGazqRQUXotNFwoxDDFzCPluiP0Y=;
        b=RMzYbJy+CiYD7NPeDbBuNSh+DvmF1FgEztprYFUfJ1vZZRpJSMmCYTQIuuOZQtVf/Q
         KUnsuXuHfcUJ017VJMO4fHsbYfvrVoVKnbdRR2oWHvRwQYKqTQdgaSglmN5XUTozxe2S
         x/T4IzFzFwsVnL5k9vW2ywNDC9hf8FZgKSfjZ8YqD4sQyd12f6lzbQsXJmA9NuSCE40h
         BE0pG9j9qQ+juUb5W9CrOquopZYVaEjERV0R5Lg4gT4tvZfcLCFTYVPm/TTgR8x8cQB9
         WMkdQrfw84gCHi3N8x+T+oTPqJBFVqm4RhtdtQlYlJrPYsFfhgCIDawda58tY2L7Y0Ev
         CDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744123; x=1753348923;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i00DCL7LArMdrcvWGazqRQUXotNFwoxDDFzCPluiP0Y=;
        b=VuPsJt/3JAHn55Gb/gcjmxldxTfq/1CpP2yELj4LpLfNMoiLDgucnaagPACzSo32Ic
         b1r3W/CbsyZp4YWAC8cVWLREAZNTm0DLHDhOWw0u7i6KS67PC9iIu3vU0kUQ1jfkeMjO
         n/4AsiSQ2ZHlkdiD2x+fjfQaBvFR6oPF17Ki0uWXme+y7xbbh2oI/TK3b0vPjPjWIRvg
         LcDjInt3jOeVUfhezyMOjSkSdQtpDGmgl53Lp2+eq0HhkWAsuP4ogKedzvjAJGMmQIEx
         xz8SvNt1EvuBfNxGo5oheFjfyTKZgDK3ZncKNzXgz8Ul3OzkKwqO59URtjUloo0b4SAV
         fxGw==
X-Forwarded-Encrypted: i=1; AJvYcCUVSu9ZzLDFXu0GXJiburGIM4D9pNn9wDoioN10MGO5C1xW4QIWzidQrnNGP+gA7clqEYXs6b5N1zrIfS/IpsQ=@lists.infradead.org, AJvYcCVTJqpA66ZxdZI/G3Ezeaew4TdYFQAhI1irshHFvjXW+CE2KxAqIFBOkx1z0d4Q40Yzj9r7FRWBvsvc5Yfo6mnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKdKaFUjAAwRgIeKKr0kn6m+zdtamHPtSfRvO2m3pZMX40yco
	6f8AoUGk0UR7AApBzOYkfK4xXbPgaAEV1pBTfbIBtu7Hl+/1lOBaRfHS
X-Gm-Gg: ASbGncswG1T7uUa0SUTeXNT1chhj0EbKUi25xyg2jabbfwoQ+mNIymKuPG8TIsU1OC/
	4YmXZzVMGpcTowq6RmCqxDOpEdpY/ez3tLVclnrV5MQR0dltX+sKln41zjiVmKL/t4G0hYpGD0Q
	pxX9UKPY7/L1M8t4GOKU3jsGyGOtPHL94/IpLII679BuQ2s0NE8YJuxCJyx2e/whI4AW965tm6z
	e/3EfL9exTIRPZc0usKmAtmc0uEr3ae32GoTP30VV5GosyHXE+xMzld2QY3uE47wBJSNQLwY2hh
	tMjh2rlDzelJj68aXMZvJEb8cP5UqqpMHgZ/W0MWsL91aGkX4MnhMFCFt04BRqot8wpLSufrBlY
	wJB1CrO6/bgFVUiNI0o6PeUChg415JU5Z9M+nOB3iwp9KwQ==
X-Google-Smtp-Source: AGHT+IEm/CZVfnHKhdEovv47xnxQCwkLFXlL7R6Fz8Q/9sjCF0i+Wwcn8Nmka6MicAHPOBghKdtX1Q==
X-Received: by 2002:a17:907:3e9c:b0:ae3:c968:370 with SMTP id a640c23a62f3a-ae9ce1e8c11mr471633566b.59.1752744122539;
        Thu, 17 Jul 2025 02:22:02 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:72cc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2a0sm1338371766b.67.2025.07.17.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:22:01 -0700 (PDT)
Message-ID: <325c6297-b47f-43ad-8d2f-276cf70f3d57@gmail.com>
Date: Thu, 17 Jul 2025 10:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
From: Pavel Begunkov <asml.silence@gmail.com>
To: Mina Almasry <almasrymina@google.com>, Byungchul Park <byungchul@sk.com>,
 "Lobakin, Aleksander" <aleksander.lobakin@intel.com>
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
 angelogioacchino.delregno@collabora.com, horms@kernel.org, m-malladi@ti.com,
 krzysztof.kozlowski@linaro.org, matthias.schiffer@ew.tq-group.com,
 robh@kernel.org, imx@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250714120047.35901-1-byungchul@sk.com>
 <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
 <CAHS8izNh7aCJOb1WKTx7CXNDPv_UBqFyq2XEHHhqHH=5JPmJCQ@mail.gmail.com>
 <20250715013626.GA49874@system.software.com>
 <CAHS8izNgfrN-MimH1uv349AqNudvQJoeOsyHpoBT_QokF3Zv=w@mail.gmail.com>
 <20250716045124.GB12760@system.software.com>
 <CAHS8izMK2JA4rGNMRMqQbZtJVEP8b_QPLXzoKNeVgQFzAmdv3g@mail.gmail.com>
 <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Content-Language: en-US
In-Reply-To: <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_022204_379699_892512BA 
X-CRM114-Status: GOOD (  12.87  )
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

On 7/17/25 10:17, Pavel Begunkov wrote:
> On 7/16/25 20:41, Mina Almasry wrote:
> ...>> I will kill __netmem_get_pp() as you and I prefer.  However,
>>> __netmem_get_pp() users e.i. libeth_xdp_return_va() and
>>> libeth_xdp_tx_fill_buf() should be altered.  I will modify the code like:
>>>
>>> as is: __netmem_get_pp(netmem)
>>> to be: __netmem_nmdesc(netmem)->pp
>>>
>>> Is it okay with you?
>>>
>>
>> When Pavel and I were saying 'remove __netmem_get_pp', I think we
>> meant to remove the entire concept of unsafe netmem -> page
>> conversions. I think we both don't like them. From this perspective,
>> __netmem_nmdesc(netmem)->pp is just as bad as __netmem_get_pp(netmem).
> 
> Yes. It'd great to have all of them gone. IMHO it's much better
> to let the caller do the casting so at least it's explicit and
> assumptions are not hidden. E.g. instead of
> 
> pp = __netmem_nmdesc(netmem)->pp;
> 
> It'd be
> 
> struct page *page = __netmem_to_page(netmem);
> 
> page_to_nmdesc(page)->pp;
> // or page_get_pp(page), or whatever the helper is
> 
> That might be easier as well.

FWIW, no need to respin a v12 for that

-- 
Pavel Begunkov


