Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4225CCA47E
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aptbc4q7+7U1LSab+uWoKx6lhdPmrkpBWiuKzV6CxCQ=; b=zh9SqGzBMExJAE
	TmyynSIqf69+DmUHrcpihtiG8Hhpy4bSyM4NuRGQKJn/Q8DlZzqogdMZ3X81uuyKUlUUDQSwnOrtz
	Kzp8/K1rJqHX1h7w9ATylkQc3H2UwCyx12ndCzteVD6YBiJ2K/lkW7ncy5RKGDr1Rcw56Ql1XJnHg
	NI6XIj4a1levRyDtYgoKwQrmM7Eyh/MkaPvarXRwZfgbzPnXP67tM5TGw2boNfLajJ5KlMU0n/QAf
	wr7cNhOjRbkVufPTXjy1NWJp57myGp66mmBazHjAsUQmEHFIl8p+DF+8RKsNF5skfNmhSd/RNF+GC
	d+hYMeE/UUc/TBOTZOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv3C-00D59h-28; Wed, 08 Jun 2022 12:44:42 +0000
Received: from m1391.mail.163.com ([220.181.13.91])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv30-00D537-CC; Wed, 08 Jun 2022 12:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Dq0bS
	elIzZ22NuE87EUd0dop6A9eeIPopScc/d7rQTQ=; b=ZspoWU8jR9+7HXQct0QBs
	dptHVznXWEcY9qJbZYp324BRQ/dD799Rl/2qJyJY8I7FTS7/0ow96xSJwviK4U2M
	PCgJCMbRpzAMbzt3Vk7A1lvXHeYATa/qz/bfbTetlQcY9p2hWhTmQmPgopLPccnD
	b1IaupGu9o33Wx0bxDQEMQ=
Received: from chen45464546$163.com ( [171.221.147.121] ) by
 ajax-webmail-wmsvr91 (Coremail) ; Wed, 8 Jun 2022 20:43:31 +0800 (CST)
X-Originating-IP: [171.221.147.121]
Date: Wed, 8 Jun 2022 20:43:31 +0800 (CST)
From: "Chen Lin" <chen45464546@163.com>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexander.duyck@gmail.com
Subject: Re:Re: [PATCH v4] net: ethernet: mtk_eth_soc: fix misuse of mem
 alloc interface netdev[napi]_alloc_frag
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <20220607161413.655dd63f@kernel.org>
References: <20220606143437.25397f08@kernel.org>
 <1654558751-3702-1-git-send-email-chen45464546@163.com>
 <20220607161413.655dd63f@kernel.org>
MIME-Version: 1.0
Message-ID: <55c80848.c37d.18143576bc9.Coremail.chen45464546@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: W8GowAAXiRZzmaBihyYzAA--.48365W
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/1tbiXQ8ZnlWBn8-3zQABsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_054430_777759_F51AD4DE 
X-CRM114-Status: UNSURE (   7.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

At 2022-06-08 07:14:13, "Jakub Kicinski" <kuba@kernel.org> wrote:
>On Tue,  7 Jun 2022 07:39:11 +0800 Chen Lin wrote:
>> +static inline void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)
>
>No need for inline, compiler will inline this anyway.
>
>> +{
>> +	void *data;
>
>unsigned long data; then you can move the cast from the long line to
>the return statement, saving us from the strange indentation.
>
>> +	data = (void *)__get_free_pages(gfp_mask |
>> +			  __GFP_COMP | __GFP_NOWARN,
>> +			  get_order(mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH)));
>> +
>> +	return data;
>> +}

I'll do it like below :
+static void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)
+{
+       unsigned long data;
+       unsigned int size = mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH);
+
+       data = __get_free_pages(gfp_mask | __GFP_COMP | __GFP_NOWARN,
+                               get_order(size));
+
+       return (void *)data;
+}

Through analysis of the ASM code from objdump, I confirmed that 
the inline is not necessary. Thanks for your tips.

Also, I confirmed that create a new local variable 'size'
will not affect the generation of a constant 'order' parameter at compile time.


ASM code of calling 'mtk_max_lro_buf_alloc':

'mtk_max_lro_buf_alloc' inlined and 'order'(w1) is a constant 0x2
0000000000004530 <mtk_napi_rx>:
...
4a98:       52854400        mov     w0, #0x2a20                     // #10784
4a9c:       52800041        mov     w1, #0x2                        // #2
4aa0:       72a00080        movk    w0, #0x4, lsl #16
4aa4:       94000000        bl      0 <__get_free_pages>
4aa8:       f90033e0        str     x0, [sp, #96]

0000000000000730 <mtk_rx_alloc>:
...
7fc:       2a1703e0        mov     w0, w23
800:       52800041        mov     w1, #0x2                        // #2
804:       7140047f        cmp     w3, #0x1, lsl #12
808:       54fffe49        b.ls    7d0 <mtk_rx_alloc+0xa0>  // b.plast
80c:       94000000        bl      0 <__get_free_pages>

The compiler is smart. 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
