Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFABC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 15:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4193C610A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 15:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4193C610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Thx7gkl6EiETEbbDaGh3Y9QqiE0Yx8GX+2V03NqmYjk=; b=BpYGlZCrhgcIigbSwNvSINId2Q
	gFIZHjIRXP5dcwpEJkuCjF1mf1B1KEsmAmdO2+Ruo8Mn6QCAEBJqocU20XzcM7xdfMVMCa+zkgib9
	6x8MN0zBfmwWXyLf4QxPJWUuL3FUNT9Nkumo6e9tW9z+3DIay294fNst7JipohQyhcerunVJ5gGQq
	JpQyo6kI1K9+P8yUE4dFP2t3uIhxVUSP6q0TJd1ptUv529VD7moh8WDuvwrkNLiqS3EN5NqjHTHVC
	J1lDg21AH1cmy+Qhi0fFhYN9iRK3TCPV9/I98gWZ1YagGo72/C7cm0lvJYQwFYf8id/D7TxQ66DIV
	6GE8Rn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcrBF-001j1S-DM; Tue, 19 Oct 2021 15:37:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcrBD-001j02-3X; Tue, 19 Oct 2021 15:37:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3667939wme.1; 
 Tue, 19 Oct 2021 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=RgqbMViYrJvJfXSAuMuLBuTv0g/FzYQxy3+96xrZPS0=;
 b=YmeqlfO34935zN/p6151KhT5q8/n/UAZJ7siGtJq4Wl/hpIasVfuQruYC1O5ImJlHX
 aqTyJfrXXWKok6ZXNVafOeUcZsces60DF1b1Fs+hOmL1Nv5zNwq325bWiz0I6N737JpF
 540P2ri3nDh5djMD2XvSRWdtsbnQ5OQBrYQZmKjV1YnobBOYOOlO6f8R2vSPRn86TjVx
 Hf6qIxysua0PWBdSCNpOFQSYO/fU4AnVarw1LUW5s7RMhl7UesK76DPvZIdtoTBT1C7Y
 WL6frWqMP055Ji6qUrDRFDP/pv4z5heB/8V3lJ8TYGIAQLJvrNpZtTT4A4O8iJMKBfv4
 9a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RgqbMViYrJvJfXSAuMuLBuTv0g/FzYQxy3+96xrZPS0=;
 b=P8HT5VNYIWG3nmnPtphMixTuUWYh7GnOIL8nTUYFVondB5sRw85q9pViuH0S9+y+vz
 D4zOCi81HcApD/HmIpLssJDUJDU2y2IGcv74JT/ZaaZdCu6OVD0WLHgMIC8z7nvLJq6A
 WXfxDKYPVkskYIm8nhHr57TfjEiCNReLj/Af+G2i631pYXTQroPhEOIbmUTzlL8Z0oOZ
 Ly+0Ze5g679g+u0pbZTXDkdnFnJWX5nQHTaZ4xIlyLT2rD/DuP/RVSERG1J1xeRAQNNE
 K894cubWdh6ab3MJZKD83ZXypQDoPeFGAiBUYOmuIJTL7lgJT2AYatR3NGn99Mfn1txl
 Zp9w==
X-Gm-Message-State: AOAM532biAiUIS482cPvimbTyn70GraoTtOrCLFAgpOPkfd8RNTvhYa3
 Dk22oJZLNm5gzOCSH7bve2Q=
X-Google-Smtp-Source: ABdhPJyV3vN0PZ3kgNo2DYsqASVSMxXzcJdOA/Cy11dK5ItxP1hEcHr1ZXlKcn82BkT3iH0l73oVag==
X-Received: by 2002:adf:f902:: with SMTP id b2mr45955598wrr.265.1634657849077; 
 Tue, 19 Oct 2021 08:37:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4fc4:fae2:bc41:a808?
 ([2a02:908:1252:fb60:4fc4:fae2:bc41:a808])
 by smtp.gmail.com with ESMTPSA id l124sm2611704wml.8.2021.10.19.08.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:37:28 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
 <YW686sIZie4xRUQO@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
Date: Tue, 19 Oct 2021 17:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW686sIZie4xRUQO@phenom.ffwll.local>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_083731_215339_D555DDE4 
X-CRM114-Status: GOOD (  27.08  )
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



Am 19.10.21 um 14:41 schrieb Daniel Vetter:
> On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wrote:
>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>
>> Since there is no mandatory inspection for attachments in dma_buf_release.
>> There will be a case that dma_buf already released but attachment is still
>> in use, which can points to the dmabuf, and it maybe cause
>> some unexpected issues.
>>
>> With IOMMU, when this cases occurs, there will have IOMMU address
>> translation fault(s) followed by this warning,
>> I think it's useful for dma devices to debug issue.
>>
>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> This feels a lot like hand-rolling kobject debugging. If you want to do
> this then I think adding kobject debug support to
> dma_buf/dma_buf_attachment would be better than hand-rolling something
> bespoke here.

Well I would call that overkill.

>
> Also on the patch itself: You don't need the trylock. For correctly
> working code non one else can get at the dma-buf, so no locking needed to
> iterate through the attachment list. For incorrect code the kernel will be
> on fire pretty soon anyway, trying to do locking won't help :-) And
> without the trylock we can catch more bugs (e.g. if you also forgot to
> unlock and not just forgot to detach).

You also don't need the WARN(!list_empty...) because a few line below we 
already have a "WARN_ON(!list_empty(&dmabuf->attachments));".

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 511fe0d217a0..672404857d6a 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
>>   	 */
>>   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>>   
>> +	/* attachment check */
>> +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
>> +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
>> +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
>> +	    dmabuf->name, dmabuf->exp_name,
>> +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
>> +	    "Release dmabuf before detach all attachments, dump attach:\n")) {
>> +		int attach_cnt = 0;
>> +		dma_addr_t dma_addr;
>> +		struct dma_buf_attachment *attach_obj;
>> +		/* dump all attachment info */
>> +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
>> +			dma_addr = (dma_addr_t)0;
>> +			if (attach_obj->sgt)
>> +				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
>> +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
>> +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
>> +			attach_cnt++;
>> +		}
>> +		pr_err("Total %d devices attached\n\n", attach_cnt);
>> +		dma_resv_unlock(dmabuf->resv);
>> +	}
>> +
>>   	dmabuf->ops->release(dmabuf);
>>   
>>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>> -- 
>> 2.17.1
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
