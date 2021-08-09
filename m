Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C65C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D759361055
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 07:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D759361055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WieqPXW4P6e4P5A1c4mTkS5fi0Y3c69C/Iwq6Q4wl3I=; b=BtHU45uC0kfzMqO7SZoDpNmHTj
	hQssdSeDSNZyZlyBTtAy1v++rFr+kziOlULWty3kGjE4yl7YzfRjoHVosETCKOkkNb+iHvhzHu9+N
	e8FJkxjPsWtdOYn22aKrJJvoBW2ZjHA6MmcRk0ZX01u+PuVN12E7UAUDzvXx1e31o2MXA+SsZri/H
	bcZ8FDQvt2ad8vRcEmjgYg8mSRZTFV0B+yjJMdN5bVzWDTGXUPF0Powdvwe4q0dwyOx/Nk++deqRL
	Ptyy20qbuEr1EvGdQsRB77LnHrsgg6lCi8wC5Am/uJvvH9gpKam4tppJsINMaeAkcqwiUSG0Idabl
	3cqNTXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCzwL-00HP5b-Fm; Mon, 09 Aug 2021 07:43:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCzw7-00HP2I-Ui; Mon, 09 Aug 2021 07:43:05 +0000
Received: from [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01] (unknown
 [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 99E751F42802;
 Mon,  9 Aug 2021 08:42:59 +0100 (BST)
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
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
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
 <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
 <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <171db357-0d8a-6676-32dd-7c506708375c@collabora.com>
Date: Mon, 9 Aug 2021 09:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_004304_151669_C8D360BB 
X-CRM114-Status: GOOD (  24.96  )
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

Hi,

On 09.08.21 05:23, Eizan Miyamoto wrote:
> Hi Dafna, thank you very much for spending time to review the patch,
> your time spent is very much appreciated.
> 
> On Thu, Aug 5, 2021 at 4:06 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>> +err_clk_prepare_enable:
>>> +     for (--i; i >= 0; i--) {
>>> +             if (IS_ERR(comp->clk[i]))
>>> +                     continue;
>>> +             clk_disable_unprepare(comp->clk[i]);
>>>        }
>>> +
>>> +     return status;
>>
>> There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
>> so you can just use it.
> 
> As per Enric's suggestion earlier in this email thread, are you OK
> with me making this change in a follow-up patch, particularly since
> the logic as it is was preserved from previous functionality?

sure,
I just give suggestions.
A follow-up patch would be nice.

> 
>>> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>>> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>>>    {
>>> -     struct device *dev = &mdp->pdev->dev;
>>>        struct mtk_mdp_comp *comp_node;
>>> +     int status;
>>> +     struct device *dev = &mdp->pdev->dev;
>>> +     int err;
>>>
>>> -     list_for_each_entry(comp_node, &mdp->comp_list, node)
>>> -             mtk_mdp_comp_clock_on(dev, comp_node);
>>> +     list_for_each_entry(comp_node, &mdp->comp_list, node) {
>>> +             err = mtk_mdp_comp_clock_on(dev, comp_node);
>>> +             if (err) {
>>> +                     status = err;
>>
>> You can get rid of the new var 'status' and just return ret in case of error
> 
> This seems like a nit (please let me know if you disagree), and it's
> also cleaned up in a follow-on patch in the series ("don't
> pm_run_time_get/put for master comp in clock_on"). Is making the
> change you are suggesting here something that should require uploading
> a new series version?

Hi, no, I am fine with it. No need for new version.


Thanks,
Dafna

> 
> Eizan
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
