Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF022C83F34
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuQuLev07eyWeKHWKCNdTOJWBDIr2mJkHs95ZW2/jJQ=; b=LZJ9ONu0jGWzgr03uRbVbgRvSM
	n8xTQkkbQJCsMhbm1GuNUvbkVwd5yM8Hj0ACKgemf9ENkjkbFbD7np27RsEUCAycGzs83czyrc8ev
	4EZucvMINyU8Kp7crGQnRPHqo+Lf7PBy7bQApV65Ga70xYA/CD85zcw+L6u+/0JL1HbuFcKQiIAVQ
	Qpg6t423u4Wav7DEHKZ13cIyoIDkED9PCbfHd3Kc58jmmGWWVYMJwmXUR+XW7xYTj+ChY2z0U4Keb
	/MXGzNj+jI3Sl6SFe4K6BxErET+hj3CUqalFXLbeY/eC5aymmeFFyCjQOyNirqDqFGSL2jta0QNeU
	NFiP8sOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4K-00000009kMM-1QSR;
	Thu, 17 Jul 2025 09:38:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKia-00000009hl8-3wWy;
	Thu, 17 Jul 2025 09:15:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so1148982a12.3;
        Thu, 17 Jul 2025 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752743755; x=1753348555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuQuLev07eyWeKHWKCNdTOJWBDIr2mJkHs95ZW2/jJQ=;
        b=LTMNQrIYtcb0Kwyt7REMPwjeCxZygms5S4NiOXv+OsnFrsfUvXV9MF1TJ+20X9YFGG
         YqLGY48Xgenu+/rzbI5S5Fo7KthZR6bav59xPZkf1ms+/xknNP+lTH90bG58LVYOPSUb
         kMNb1gJNvN+++aYDK0AjCODtguzrR7pf9+90i+va1vC838EFVXeWwrehScptMyCoVAXT
         BxMuSWYdCuka70BFAYuAa6VqknyJIUApNt15Hxlc5ScuckTLJ4+AI8eXyEpxepfnA6MU
         kXaL5aiiWh/H4tWYeq6h26B+m0nd1y13jRx2ONIAQ3kCmo4ielXk2vuLv5JXASgi1TA8
         c6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752743755; x=1753348555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuQuLev07eyWeKHWKCNdTOJWBDIr2mJkHs95ZW2/jJQ=;
        b=JfBbX/5uIgMlugM137D+Zn/tN27enneA2Qg6WafpV+s4Hmsqn8grxgSstdNk6anBT/
         hIC2+Gv/0lInTLOP6ntGUEja1UApqHXGrfH4MQGeKwb6NxikIM1C4XkZLmmZIw1pT6IV
         VI5oagWbhvV4VymKUoU0Z7V6LmOxFGkZL7UdefWSQ9iQhSaaiClVHm/r4i7p7oKL28Vh
         7qA7O572q3B7J4R5w9t0YEAdJQGrDDIkkBjVn4vFhVJ2KbEyws2hTRSHGm+agY3B0C1s
         iQ4hNE61Yvg8Ulr9GKkWeaFoRozoIBiLqHC5G405taih7RQjZJJdBVCio70x56dS1ao7
         Qh0w==
X-Forwarded-Encrypted: i=1; AJvYcCU9/jZsMDf+vCW2mDXEZsXFUWOzE4/T62uyVfpXgY9FUSAvEg+FiQAeoZB9OPefaO3Fcf2fUYT5HwsWFlBxJHI=@lists.infradead.org, AJvYcCXMCRGJtnvBQmKVi8HoCpfWscvbMkUwg03yTvmJC2WLgVGLSDkOBhigJOjN/Q2kOopsMK/Aau3pXn3j27/A9MTl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5qfvMkCiPRO2Kl0tX1jkJF3+osnfj49UGa9g+La5aAZpmJ4S3
	8VusOAHu3bl7mrFLyKnbj6yDc7wvXAfZzFcCsawOGTog8mMb9kG1nV8S
X-Gm-Gg: ASbGncsoI7DFIDRM0e8cZ4IuQLnMaamZQ2Rs58IPKiRlx4/Z4pgdBeOb/G4XtzRhMum
	1C0fgE6T6snWsjFjbTTM29Il2Fkh7fgQL+lNFDjiy7Hu97Y/MXWQ1e3bSeAgUbmIvG616Pp7v3l
	grtz3cw+Fp/tvEC5RQR9sFhmPn9O/6pYV/TUmm3SjrurZ1+4nTPBwNx+zhK+u2wykZq+5Wc0uaY
	NKXnG/aaHX+JXznp5L/Z6KO3Q7C7/Gtug3KhNzOjhAFFQLlUcDE8zH/5lYcN7JU+1Pr3vlRcpwx
	oaSWb++GajfscH0h8S4nIiFq7AiADuyfKW7ls7fVjvu2yZu+cY3DtUocmzf4obXmFSr3Qy1i2X1
	d6Ru4v9t2H4xGIm0naCCwG1byqTtGSLJHS4I=
X-Google-Smtp-Source: AGHT+IEBp5fKU5jFwU7T/e+ghWZTAi9JtfLyT40aPkuCdbIfMXgA11Q2utS7ZVnD76C8XR+vIqhT6w==
X-Received: by 2002:a17:907:c290:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9c9ba50a9mr629028466b.59.1752743754656;
        Thu, 17 Jul 2025 02:15:54 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:72cc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611f7365c7bsm8194693a12.62.2025.07.17.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:15:53 -0700 (PDT)
Message-ID: <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Date: Thu, 17 Jul 2025 10:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMK2JA4rGNMRMqQbZtJVEP8b_QPLXzoKNeVgQFzAmdv3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_021556_987538_A376A9AF 
X-CRM114-Status: GOOD (  11.40  )
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

On 7/16/25 20:41, Mina Almasry wrote:
...>> I will kill __netmem_get_pp() as you and I prefer.  However,
>> __netmem_get_pp() users e.i. libeth_xdp_return_va() and
>> libeth_xdp_tx_fill_buf() should be altered.  I will modify the code like:
>>
>> as is: __netmem_get_pp(netmem)
>> to be: __netmem_nmdesc(netmem)->pp
>>
>> Is it okay with you?
>>
> 
> When Pavel and I were saying 'remove __netmem_get_pp', I think we
> meant to remove the entire concept of unsafe netmem -> page
> conversions. I think we both don't like them. From this perspective,
> __netmem_nmdesc(netmem)->pp is just as bad as __netmem_get_pp(netmem).

Yes. It'd great to have all of them gone. IMHO it's much better
to let the caller do the casting so at least it's explicit and
assumptions are not hidden. E.g. instead of

pp = __netmem_nmdesc(netmem)->pp;

It'd be

struct page *page = __netmem_to_page(netmem);

page_to_nmdesc(page)->pp;
// or page_get_pp(page), or whatever the helper is

That might be easier as well.

-- 
Pavel Begunkov


