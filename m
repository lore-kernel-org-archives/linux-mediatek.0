Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6371AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256F660720
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 256F660720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeZXiFdw5qz2LVB8VRdHzJYqfAZSre2DkwcnyPORK34=; b=bBA4jZ33jon8RY7gSPRCuejfBI
	qV+8ObVhinAEVUHRsWp8Yibc7DrpPHzp6SbbqKQZ0eQfVos2v+iB9vND3WqGRyWv+52ftWtpDUVSX
	k3YAuHM3KZN4hOp0oAUfBJ4n8fh5gBmaruO6f6Nkd5yXVomX1Zssact15S+Yf25O1HfSMSzqscwyu
	aQsbaPLX9EAlXn6lWOwLELVR+epm1YDLdGGI/bYfnN08m33N1qlrJuzaOkIGFGN7zdSUZTYcWpSlE
	JVeMZr8cHMREBxM2yhB/62JmOj8pN3tMAOYeZHOyqIlcWQ4dy2Nig1OcM1iTGKm22mJAeyQeg0hS5
	z4pD1bvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD06X-00HQW9-HQ; Mon, 09 Aug 2021 07:53:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD06K-00HQU9-Ic; Mon, 09 Aug 2021 07:53:37 +0000
Received: from [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01] (unknown
 [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC7831F4223F;
 Mon,  9 Aug 2021 08:53:34 +0100 (BST)
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
To: Eizan Miyamoto <eizan@google.com>
Cc: linux-kernel@vger.kernel.org, wenst@chromium.org,
 houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com>
 <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
Date: Mon, 9 Aug 2021 09:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_005336_798107_9D42D087 
X-CRM114-Status: GOOD (  24.71  )
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



On 09.08.21 05:23, Eizan Miyamoto wrote:
> Hi Dafna,
> 
> On Thu, Aug 5, 2021 at 4:40 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>> +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>>
>> This function can be static
> 
> If it's all the same to you, are you okay for me to make this change either:
> - If upstream requests changes be made to this series, I will include
> this suggestion
> - If the series is accepted as-is, I will make a follow-up patch
> 
> This is to reduce workload on reviewers having to re-ack changes for
> (what I hope you agree is) a nit.

I think you can keep the review-by tag of the reviewers since this is just a nit.
So sending a new version won't need a re-ack from the reviewers.

You can send it also as a separate patch. I don't care too much.

> 
> If you don't agree, I will happily oblige and make the change and
> upload a new version of the series.
> 
>>>        for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>>>                comp->clk[i] = of_clk_get(node, i);
>>
>> that iteration can be replaced with clk_bulk_get
> 
> As per Enric's suggestion in response to "propagate errors from
> clock_on" in this series, are you okay for me to make the change in a
> follow-up patch?

yes,

Thanks,
Dafna

> 
> Thanks again for your review,
> 
> Eizan
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
