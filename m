Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CA7C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBE660F92
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCBE660F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9L78Y0ck5pIBQ2BGJn617pUDVop/+u/eH2w/m0AY698=; b=QlTMribEaBPeVc
	S2Xj8xe8yb22+J58S2zp5nSOKp+U3eDWJA0dTlVshjVYAjSYeU1tnKPNjuz2UlAfCZn9qb8CHe6EM
	mlpxYR39u08czqpZmlmPbR0a3TWSxgqZSiinVFrHiXpuEyUYM5EvcKEiqHtW4aMsZXTr3s9KdnAEb
	Jx3DTX42N9kXzIuC8JByjvb5my8x3N/NauNySNnpvnO4YNGWRHT7Zgmt4TAKV2rTY04h99jT9lXu7
	QBfxltV3Umqf+YOjoHnqubyZ2y/nbVdS6ROUnUWV0DlolOp+FBzkNFAJEzK03RgS2VAnAhoDEJv0g
	c0zl0BzKl09bQEs4bS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKZwH-00GTlF-Vv; Mon, 30 Aug 2021 05:34:34 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKZw2-00GTjL-8D; Mon, 30 Aug 2021 05:34:22 +0000
Received: by mail-io1-xd2f.google.com with SMTP id n24so18294237ion.10;
 Sun, 29 Aug 2021 22:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iatc6vajkY0MDwzapGj1skQWsvXeM4hcy36GIWGpEW4=;
 b=LVxShmhA8oScomf8RXUdPHgEs1CGooPT3O642dmOoyDC81k8HM76pDNJcuz7NGT53A
 2+H1qbu6agP0IjAjo4C9Iv6WFR2Ajw1yo5KwKBYQIer0OiVvFSvgGkdm/H7JPBQXnOHC
 GhrwsS6a6vd3/I2ADgN7NWlKls5FQlXzQkeKFb55TzRKsfrwlEJ0VP0QxOQCoMIeTuJZ
 xdFpOZ/Zl/XHxgm2rdjR6KJHEmlyCbUYC7vZDMn4V16MEoEY8LiYHxC1dXjaRwcft7Ir
 WqtIepeuZMCdgXCh+mYoNtt9uJ30okb770fO9vvF6kj4XU/wxYarH5IvJ0IY2r4Mk5Pq
 x71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iatc6vajkY0MDwzapGj1skQWsvXeM4hcy36GIWGpEW4=;
 b=Vk1X+nUmACo7Y/i7eLTDtVSsYOvuZ0jpTFR6r4LnOW5CY3ixlsb8DyFHkJLAcj+O+2
 3d0PtSplZHe3qikhhoW7M6dIxRHAmgpH/fzILXStNFY60q32zmgwFH43syMSt06Wfk+8
 nhmdoxWLyQo3jM08OhlZZQrHHC2HWDXb5VzkEYwOj54tsQBUMb5XqDa0Nry8O7rUi33q
 LehJ+8YWZ3A5GcISbPPyYBOz4lqpwkXHSDtNVra3gMNqP42Q9TI0kahP//VZL2zeVQXE
 8Z6a5HBn4q1jOb/oDaTuU8HeofHHbdl/PFgOM6ZsPivXGGiWXBId359pDGVUqQPFeZZF
 Pwsw==
X-Gm-Message-State: AOAM530vxqVp2jSGO4tSIXnX8FzF1mWoB60SHA3q4f7pPyliMcBhj+z/
 4GNgxDf6BMGGVwXqJS0kFYmQkDnwJ32yTGrFaN4=
X-Google-Smtp-Source: ABdhPJySdhgVn3pG/z4LQSgTkNKL789y+ndUcjN0DNkBlsvtkaFO+0/2QmBSSGQHgFOyjeI4JI8d79g04HUloAEYRdo=
X-Received: by 2002:a6b:fb03:: with SMTP id h3mr16892442iog.198.1630301653881; 
 Sun, 29 Aug 2021 22:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210825094120.5005-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825094120.5005-1-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 30 Aug 2021 00:34:03 -0500
Message-ID: <CABb+yY0rTZrM1J7mFbSf0Z5tdwjYsQ8Tff-DnVfxX8P4HRu01w@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add gce support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@google.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 nancy.lin@mediatek.com, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_223418_337289_FCF113B2 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, Aug 25, 2021 at 4:41 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Change in v6:
> - remove the unused define in GCE header file.
>
Please rebase the patches over other previous mtk patchset for mt8192.
https://git.linaro.org/landing-teams/working/fujitsu/integration.git/log/?h=mailbox-for-next

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
