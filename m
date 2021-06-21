Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE33C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF1B610EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF1B610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVliR8I+yAS3VHSkGvJ1OBD3Y8uCDcPdxh9V/pAOtkg=; b=H5tqqi64GNuBV6
	be3J1fGMOJp7P9poiYNmmH1JE3Ur+GOf5hkhRMZLcro6wzYYiN3x/zQp+qWRGGOoxWLIStVZvWbOM
	NwR87TmENO3MSF+ToNYQ3GQjzi/l/ekZR1JA5S5kkHaoSWoLYdA3+hxQe/AQ65iYlQUEfn6mrHTPR
	pM/Wrjnx42wemJ/CdiqHneWcQd7fXA985asvi9rqtspTIcKwIBRC/DpCsdTI4bQo9316uCOff840B
	0XuYIHSDP7pf/bunUqiJxPJ2K5O4Z3yHHi4+ldVg8FcFr1vHhpJbeFJzIzBdLgKcIfTLMxo0pgPjl
	bplQqGEYwfmBtbSvZ61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDA7-002GYY-BD; Mon, 21 Jun 2021 06:11:59 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvD9s-002GUj-Lt
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 06:11:45 +0000
Received: by mail-il1-x12b.google.com with SMTP id i17so3772151ilj.11
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMOacCUVxIkKoB2CAKwTgiKnjRqpZaGysTfPqeXImQc=;
 b=lncX7f1GdteiNPCdRxtaRd1qBnCKLQE2b6yk+By0toNDvm+BdNVeB0/f+2sI5hzSmR
 02oghVxH6sT31iQvjKvhbnIHkNm9+RWHtTG0PBgBRRz1K8pLAd8ZPeHOSBC2IrWD9+/9
 6DEwRGtxVVUGlJ3slJcltzCctb83jTDddG1FKVp5eVvjgJLBN0Jha5aw1wixGcpvW9zt
 ZtlfnOhN3uSkhIMlJyOWieC7TFKx1a+5SLDoEf93hG69tD5S56K8AKRzv/Z6tr5Lq/7F
 nDcwcd8GmnoFrRx/BJ8X0W/RUvyPHqElrE2jvgLKuRmVsNQxldiq2d6TbdoKckVAYQ4S
 Onkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMOacCUVxIkKoB2CAKwTgiKnjRqpZaGysTfPqeXImQc=;
 b=JFtbntTpJuXWAkfcSwsk/akyR0bZYEtYqABVSRZMZWpNw1/S76FlQ85n8qMWXQbuoy
 jy4YdcYFUYQbRekOQXn+sMIUVe7Ts7eXgSvkjTYW1pbSvWiIDJAbx24f/dJ7CxSVoWQm
 b8JrnBdGVlAiJs2aTRUtrys0n4u+9QrXMXvhnS7WU6pGZksGzfIWffkMZS206NDcu25G
 pkyBrlri5/DM8TA1+iStnGDSYnRjp8JT/qjR7cdWq9mJ6YsfnSeWROEzpu5Qcp0QPdKc
 1jFQ2SRVRIEOPioKkom+SVkGMo+lUPeQEl34/XV+upWkrjGD+a7SV860JJbRr5kX8zd+
 4oDw==
X-Gm-Message-State: AOAM533h1VxhBB5nFht2IT47BMvUxoo8b3aykA1BAmkfQWns5LvLeM3g
 Wjx49WkyZnHTpLJPqJeunPDSRW3E7+gTn23yrR1yFQ==
X-Google-Smtp-Source: ABdhPJyBUx+kDh5PhVgm49aok5ViJo5axj804RUR4VXWG5zl53SfBNieGoNHqgkLRe36C71utxsarKSrRKqntMmTLfE=
X-Received: by 2002:a05:6e02:16c5:: with SMTP id
 5mr8911651ilx.72.1624255903713; 
 Sun, 20 Jun 2021 23:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 14:11:32 +0800
Message-ID: <CA+Px+wXWMRM_O7Y8h50DWoKfMapgMzuVppe7AaRPDiRdWDF06g@mail.gmail.com>
Subject: Re: [v1,0/3] watchdog: mt8195: add wdt support
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org, 
 rex-bc.chen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_231144_777319_F1DB4580 
X-CRM114-Status: UNSURE (   6.22  )
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

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> christine.zhu (3):
>   dt-binding: mt8195: update mtk-wdt document
>   dt-binding: mt8195: add toprgu reset-controller head file
>   watchdog: mt8195: add wdt support
Please provide some information in the cover letter to let people know
what the series fixes about.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
